

# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800


# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
#library( ggplot2 );
# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
#library( scales );


# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0002376","immune system process", 0.625,-0.207, 4.667, 5.493,-3.0339,0.990,0.000),
c("GO:0006636","unsaturated fatty acid biosynthetic process", 0.007,-0.094,-6.831, 3.519,-6.9626,0.816,0.000),
c("GO:0008152","metabolic process",82.183,-1.394,-3.336, 7.612,-4.2652,0.998,0.000),
c("GO:0019835","cytolysis", 0.185,-1.221, 1.375, 4.963,-3.7352,0.969,0.018),
c("GO:0030212","hyaluronan metabolic process", 0.003, 5.195,-3.233, 3.107,-2.8271,0.939,0.025),
c("GO:0006911","phagocytosis, engulfment", 0.001, 5.376, 2.733, 2.814,-2.7771,0.870,0.027),
c("GO:0007568","aging", 0.013, 1.141, 0.428, 3.798,-2.1868,0.907,0.031),
c("GO:0008283","cell proliferation", 0.105, 0.930, 2.638, 4.717,-1.0217,0.946,0.036),
c("GO:0035356","cellular triglyceride homeostasis", 0.000,-7.449, 0.234, 1.908,-6.1113,0.826,0.044),
c("GO:0006629","lipid metabolic process", 3.094, 3.208,-2.173, 6.187,-4.7447,0.900,0.086),
c("GO:0070988","demethylation", 0.007, 0.188,-1.362, 3.544,-1.0788,0.934,0.086),
c("GO:0090305","nucleic acid phosphodiester bond hydrolysis", 2.508,-4.373, 3.817, 6.096,-1.0867,0.908,0.105),
c("GO:0019748","secondary metabolic process", 0.177, 5.843,-1.093, 4.944,-1.0765,0.923,0.115),
c("GO:0034255","regulation of urea metabolic process", 0.000,-4.485, 0.029, 1.591,-1.3138,0.837,0.118),
c("GO:0006725","cellular aromatic compound metabolic process",33.051,-0.459, 6.436, 7.216,-2.2663,0.944,0.119),
c("GO:0006956","complement activation", 0.069,-5.774, 1.291, 4.539,-5.8962,0.582,0.157),
c("GO:0019255","glucose 1-phosphate metabolic process", 0.000, 6.581,-2.266, 1.851,-1.1431,0.954,0.158),
c("GO:0043691","reverse cholesterol transport", 0.001, 5.143, 4.465, 2.663,-2.0719,0.895,0.159),
c("GO:0016192","vesicle-mediated transport", 0.381, 2.791, 6.243, 5.277,-2.0168,0.939,0.172),
c("GO:0018272","protein-pyridoxal-5-phosphate linkage via peptidyl-N6-pyridoxal phosphate-L-lysine", 0.000,-3.093, 7.022, 1.602,-1.1431,0.925,0.172),
c("GO:0019442","tryptophan catabolic process to acetyl-CoA", 0.000, 3.809,-5.912, 1.362,-3.6737,0.850,0.180),
c("GO:0060356","leucine import", 0.000, 3.842, 5.563, 1.322,-1.4361,0.912,0.208),
c("GO:0055114","oxidation-reduction process",15.044, 1.501,-3.543, 6.874,-9.4868,0.897,0.210),
c("GO:0040008","regulation of growth", 0.042,-7.240, 1.217, 4.317,-2.1454,0.854,0.220),
c("GO:0006147","guanine catabolic process", 0.013, 1.507,-5.851, 3.809,-2.5119,0.873,0.223),
c("GO:0051085","chaperone mediated protein folding requiring cofactor", 0.013,-4.027, 6.123, 3.815,-1.2767,0.921,0.226),
c("GO:0006103","2-oxoglutarate metabolic process", 0.010, 2.709,-6.531, 3.713,-1.2363,0.867,0.233),
c("GO:0006913","nucleocytoplasmic transport", 0.181, 3.002, 4.799, 4.954,-1.8898,0.922,0.243),
c("GO:0044524","protein sulfhydration", 0.000,-2.779, 6.770, 1.591,-1.1431,0.929,0.244),
c("GO:0006953","acute-phase response", 0.002,-6.086,-4.202, 3.048,-3.7595,0.824,0.246),
c("GO:0040029","regulation of gene expression, epigenetic", 0.225,-6.806, 1.956, 5.049,-1.0217,0.829,0.247),
c("GO:0030521","androgen receptor signaling pathway", 0.003,-6.815,-1.657, 3.213,-2.2362,0.746,0.252),
c("GO:0007584","response to nutrient", 0.004,-6.783,-3.967, 3.349,-4.6990,0.800,0.256),
c("GO:0038183","bile acid signaling pathway", 0.000,-7.370,-1.579, 2.004,-1.2196,0.778,0.268),
c("GO:0034616","response to laminar fluid shear stress", 0.001,-5.677,-3.892, 2.455,-1.8999,0.857,0.269),
c("GO:0000729","DNA double-strand break processing", 0.001,-6.189,-3.110, 2.542,-1.2030,0.788,0.271),
c("GO:0051289","protein homotetramerization", 0.004, 5.630, 1.298, 3.256,-2.2783,0.930,0.281),
c("GO:0006544","glycine metabolic process", 0.250, 2.235,-5.909, 5.095,-2.9554,0.827,0.293),
c("GO:0015827","tryptophan transport", 0.000, 4.300, 5.311, 1.699,-1.0788,0.910,0.321),
c("GO:0052695","cellular glucuronidation", 0.000, 3.487,-5.484, 2.045,-1.5615,0.873,0.325),
c("GO:0002790","peptide secretion", 0.010, 4.456, 4.835, 3.711,-1.0235,0.878,0.330),
c("GO:0042572","retinol metabolic process", 0.001,-3.344,-5.245, 2.604,-6.0590,0.747,0.334),
c("GO:0007596","blood coagulation", 0.015,-6.220,-2.017, 3.868,-2.7882,0.664,0.342),
c("GO:0006508","proteolysis", 3.705,-4.782, 5.294, 6.266,-2.3267,0.912,0.347),
c("GO:0010951","negative regulation of endopeptidase activity", 0.083,-5.827, 3.375, 4.616,-2.0949,0.740,0.353),
c("GO:0042157","lipoprotein metabolic process", 0.098,-4.716, 5.888, 4.687,-1.4536,0.928,0.359),
c("GO:0006641","triglyceride metabolic process", 0.005,-1.951,-7.121, 3.379,-2.5187,0.847,0.364),
c("GO:0070217","transcription factor TFIIIB complex assembly", 0.000, 5.321, 1.053, 0.301,-1.4361,0.945,0.368),
c("GO:0008202","steroid metabolic process", 0.040,-2.073,-6.782, 4.304,-1.5619,0.855,0.386));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$plot_size <- as.numeric( as.character(one.data$plot_size) );
one.data$log10_p_value <- as.numeric( as.character(one.data$log10_p_value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

S1 <- ggplot( data = one.data );
S1 <- S1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) ) + scale_size_area();
S1 <- S1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$log10_p_value), 0) );
S1 <- S1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
S1 <- S1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ]; 
S1 <- S1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 4 );
S1 <- S1 + labs (y = "semantic space x", x = "semantic space y");
S1 <- S1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
S1 <- S1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
S1 <- S1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10)+theme(legend.position="none");
S1<- S1 + annotate("text", x = -8, y = 8, label = "3) Swamp", size= 7)



# --------------------------------------------------------------------------
# Output the plot to screen

S1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
