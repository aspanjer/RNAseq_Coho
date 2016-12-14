

# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800


# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );
# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );


# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0003713","transcription coactivator activity", 0.025,-5.357, 2.283, 4.077,-2.5178,0.957,0.000),
c("GO:0003824","catalytic activity",69.295,-2.164, 7.263, 7.516,-5.5436,0.992,0.000),
c("GO:0004867","serine-type endopeptidase inhibitor activity", 0.030,-4.802, 4.641, 4.155,-6.2950,0.939,0.000),
c("GO:0005044","scavenger receptor activity", 0.013, 5.534, 0.802, 3.782,-3.3161,0.958,0.000),
c("GO:0009922","fatty acid elongase activity", 0.000,-3.308,-0.725, 2.292,-5.2865,0.956,0.000),
c("GO:0022829","wide pore channel activity", 0.137,-1.791,-7.411, 4.811,-2.8184,0.949,0.000),
c("GO:0044822","poly(A) RNA binding", 0.135, 6.850,-2.167, 4.806,-4.3143,0.924,0.000),
c("GO:0004252","serine-type endopeptidase activity", 0.675,-3.356,-3.085, 5.504,-4.2411,0.911,0.013),
c("GO:0004745","retinol dehydrogenase activity", 0.001,-7.351,-0.147, 2.648,-3.4724,0.923,0.014),
c("GO:0044540","L-cystine L-cysteine-lyase (deaminating)", 0.002,-5.860, 5.414, 2.951,-1.0746,0.967,0.014),
c("GO:0004658","propionyl-CoA carboxylase activity", 0.003, 0.485, 6.364, 3.181,-2.5034,0.913,0.015),
c("GO:0034186","apolipoprotein A-I binding", 0.000, 5.804, 4.122, 2.049,-2.8184,0.827,0.027),
c("GO:0016918","retinal binding", 0.000,-3.580,-5.019, 2.212,-1.5157,0.887,0.027),
c("GO:0016491","oxidoreductase activity",14.657,-2.954, 4.380, 6.841,-4.6289,0.962,0.033),
c("GO:0008201","heparin binding", 0.013,-0.147,-2.599, 3.777,-3.5129,0.923,0.033),
c("GO:0003823","antigen binding", 0.064,-0.336, 7.570, 4.484,-1.1826,0.945,0.037),
c("GO:0005515","protein binding", 2.482,-3.507, 6.418, 6.070,-2.7018,0.936,0.051),
c("GO:0016787","hydrolase activity",21.764,-7.053, 3.311, 7.013,-1.1378,0.963,0.065),
c("GO:0020037","heme binding", 1.765, 1.384,-7.148, 5.922,-2.1936,0.928,0.093),
c("GO:0005509","calcium ion binding", 0.365, 4.288,-2.974, 5.237,-1.7414,0.926,0.101),
c("GO:0004372","glycine hydroxymethyltransferase activity", 0.056, 2.024, 4.994, 4.425,-2.5173,0.946,0.118),
c("GO:0015020","glucuronosyltransferase activity", 0.003,-3.989, 1.118, 3.188,-2.3422,0.933,0.132),
c("GO:0008398","sterol 14-demethylase activity", 0.001,-7.230,-1.729, 2.547,-2.0241,0.940,0.140),
c("GO:0000980","RNA polymerase II distal enhancer sequence-specific DNA binding", 0.004, 6.420,-4.505, 3.267,-1.1826,0.934,0.143),
c("GO:0004833","tryptophan 2,3-dioxygenase activity", 0.004,-6.614,-3.144, 3.293,-1.8332,0.937,0.151),
c("GO:0008301","DNA binding, bending", 0.001, 5.037,-5.882, 2.822,-1.0321,0.936,0.159),
c("GO:0030429","kynureninase activity", 0.006,-1.179,-0.424, 3.474,-1.3815,0.947,0.163),
c("GO:0008892","guanine deaminase activity", 0.015, 2.238, 2.320, 3.838,-2.5034,0.932,0.172),
c("GO:0000166","nucleotide binding",20.353, 3.093,-5.832, 6.983,-2.4147,0.902,0.175),
c("GO:0030170","pyridoxal phosphate binding", 1.703, 1.702,-5.040, 5.906,-1.9115,0.909,0.189),
c("GO:0003690","double-stranded DNA binding", 0.200, 6.036,-4.139, 4.977,-1.1381,0.924,0.207),
c("GO:0051213","dioxygenase activity", 0.413,-7.530,-0.997, 5.291,-1.2542,0.925,0.210),
c("GO:0000994","RNA polymerase III core binding", 0.000, 5.697, 4.760, 0.699,-1.3096,0.833,0.246),
c("GO:0004029","aldehyde dehydrogenase (NAD) activity", 0.042,-7.167,-2.571, 4.302,-1.0907,0.932,0.247),
c("GO:0005344","oxygen transporter activity", 0.039,-2.503,-7.081, 4.266,-2.0602,0.949,0.258),
c("GO:0050692","DBD domain binding", 0.000, 4.908, 5.016, 1.663,-1.1389,0.826,0.269),
c("GO:0005548","phospholipid transporter activity", 0.019,-3.253,-6.882, 3.949,-1.2191,0.937,0.295),
c("GO:0003730","mRNA 3'-UTR binding", 0.003, 2.464,-3.124, 3.074,-1.0124,0.934,0.311),
c("GO:0004467","long-chain fatty acid-CoA ligase activity", 0.016,-0.955, 3.351, 3.887,-2.2213,0.892,0.328),
c("GO:0000234","phosphoethanolamine N-methyltransferase activity", 0.000, 1.478, 4.841, 2.179,-1.4318,0.951,0.331),
c("GO:0005506","iron ion binding", 2.467, 4.649,-2.450, 6.067,-1.4676,0.919,0.338),
c("GO:0034188","apolipoprotein A-I receptor activity", 0.000, 4.914, 0.886, 1.845,-1.2154,0.959,0.349),
c("GO:0015238","drug transmembrane transporter activity", 0.176,-1.555,-7.284, 4.921,-1.1160,0.949,0.353),
c("GO:0038181","bile acid receptor activity", 0.000, 3.737, 0.397, 2.004,-1.3096,0.959,0.355),
c("GO:0005102","receptor binding", 0.416, 5.242, 5.078, 5.293,-2.1597,0.758,0.391));

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

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) ) + scale_size_area();
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$log10_p_value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ]; 
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);



# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
