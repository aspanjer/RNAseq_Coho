#!/usr/bin/env bash
set -e
set -u
set -o pipefail
    
#This script takes raw fastq files from multiple sequencing lanes and combines them based 
#on common barcode identifiers. It then takes these files and renames them based on a 
#lookup table with sample names corresponding to their respective barcodes. For my data 
#the lookup table needed to be reverse complemented so that it matched the correct file
#names. The script includes a section to do this.  I want all concatenated files to go 
#to a new directory as well. 

files=$(ls | grep ".fastq.txt$" | wc -l)

if [ $files -eq 8 ]

then

#First concatenate files based on a common barcode sequence. two files for each based on 
#read direction.
for file in *_*.1.fastq.txt
do [[ -e ${file%_*}.1.fastq.txt ]] && continue || cat ${file%_*}_*.1.fastq.txt > ${file%_*}.1.fastq.txt
done

for file in *_*.2.fastq.txt
do [[ -e ${file%_*}.2.fastq.txt ]] && continue || cat ${file%_*}_*.2.fastq.txt > ${file%_*}.2.fastq.txt
done

#remove the original files
rm *_*.1.fastq.txt
rm *_*.2.fastq.txt

#reverse complement the barcode sequences in the lookup table provided by the sequencing
#facility
awk '{print $1}' lookup.txt | tr "[ATGCatgcNn]" "[TACGtacgNn]" | rev > rev_comp.txt
paste lookup.txt rev_comp.txt | awk -v OFS='\t' '{print $3,$2}' > lookup_rev.txt

#Rename the files with the appropriate sample names from the lookup table
for FILE in *.1.fastq.txt
 do
    OLD=$(basename "$FILE" .1.fastq.txt) 
    NEW=$(awk -v "OLD=$OLD" '$1==OLD {print $2}' lookup_rev.txt)
    echo $OLD
    echo $NEW
    mv "$OLD.1.fastq.txt" "$NEW.1.fastq.txt"
done

for FILE in *.2.fastq.txt
 do
    OLD=$(basename "$FILE" .2.fastq.txt)
    NEW=$(awk -v "OLD=$OLD" '$1==OLD {print $2}' lookup_rev.txt)
    echo $OLD
    echo $NEW
    mv "$OLD.2.fastq.txt" "$NEW.2.fastq.txt"
done

else 
	echo "Wrong number of files"
fi


