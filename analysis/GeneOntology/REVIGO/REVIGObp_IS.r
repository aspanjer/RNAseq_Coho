

# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800


# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
#install.packages( "ggplot2" );
#library( ggplot2 );
# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
#install.packages( "scales" );
#library( scales );


# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0002376","immune system process", 0.625,-0.877, 6.525, 5.493,-3.4202,0.992,0.000),
c("GO:0006957","complement activation, alternative pathway", 0.000, 5.128,-1.674, 1.892,-17.8928,0.609,0.000),
c("GO:0007160","cell-matrix adhesion", 0.015,-3.090, 5.583, 3.867,-2.4539,0.973,0.000),
c("GO:0008152","metabolic process",82.183, 7.020, 3.842, 7.612,-4.6517,0.998,0.000),
c("GO:0032981","mitochondrial respiratory chain complex I assembly", 0.001, 0.865, 1.725, 2.816,-4.4168,0.921,0.000),
c("GO:0019835","cytolysis", 0.185, 0.397, 5.892, 4.963,-3.3307,0.967,0.016),
c("GO:0032920","putrescine acetylation", 0.000,-4.448, 4.051, 1.398,-1.1866,0.923,0.018),
c("GO:0007568","aging", 0.013,-2.670, 1.501, 3.798,-3.5884,0.916,0.025),
c("GO:0008283","cell proliferation", 0.105,-1.812, 4.182, 4.717,-2.4571,0.947,0.036),
c("GO:0031086","nuclear-transcribed mRNA catabolic process, deadenylation-independent decay", 0.000,-0.153,-8.555, 1.826,-2.7309,0.917,0.056),
c("GO:0006099","tricarboxylic acid cycle", 0.483,-4.667,-4.420, 5.381,-6.0545,0.814,0.060),
c("GO:0006629","lipid metabolic process", 3.094,-6.569,-0.478, 6.187,-2.8044,0.906,0.128),
c("GO:0010866","regulation of triglyceride biosynthetic process", 0.001, 1.464,-5.677, 2.675,-5.9957,0.802,0.133),
c("GO:0055088","lipid homeostasis", 0.006, 4.222,-7.087, 3.484,-3.5452,0.836,0.152),
c("GO:0006475","internal protein amino acid acetylation", 0.018, 4.224, 3.778, 3.953,-2.9918,0.908,0.167),
c("GO:0043066","negative regulation of apoptotic process", 0.047, 4.322,-6.152, 4.365,-3.3449,0.729,0.186),
c("GO:0043434","response to peptide hormone", 0.013, 7.471,-2.365, 3.823,-4.2226,0.711,0.199),
c("GO:0070389","chaperone cofactor-dependent protein refolding", 0.000, 3.047, 5.239, 2.057,-1.0816,0.930,0.205),
c("GO:0055114","oxidation-reduction process",15.044,-6.612,-1.370, 6.874,-10.4353,0.902,0.210),
c("GO:0051365","cellular response to potassium ion starvation", 0.000, 7.325,-1.396, 1.477,-2.3237,0.786,0.221),
c("GO:0014823","response to activity", 0.001, 7.238,-0.353, 2.852,-1.6781,0.845,0.221),
c("GO:0015986","ATP synthesis coupled proton transport", 0.450,-2.724,-3.011, 5.350,-2.9644,0.800,0.225),
c("GO:0019346","transsulfuration", 0.000,-5.021,-2.798, 1.602,-3.9788,0.868,0.225),
c("GO:0070493","thrombin receptor signaling pathway", 0.001, 6.141,-3.711, 2.695,-1.5625,0.724,0.232),
c("GO:0010506","regulation of autophagy", 0.078, 2.129,-6.649, 4.589,-2.4593,0.790,0.232),
c("GO:0007529","establishment of synaptic specificity at neuromuscular junction", 0.000, 0.254, 0.677, 1.959,-1.1307,0.904,0.246),
c("GO:0046038","GMP catabolic process", 0.000,-1.078,-7.520, 1.699,-1.1307,0.885,0.275),
c("GO:0006104","succinyl-CoA metabolic process", 0.000,-5.076, 1.091, 1.863,-2.1133,0.928,0.292),
c("GO:0014065","phosphatidylinositol 3-kinase signaling", 0.005, 5.771,-4.108, 3.436,-1.5591,0.711,0.295),
c("GO:0006103","2-oxoglutarate metabolic process", 0.010,-4.672,-5.345, 3.713,-5.2557,0.860,0.301),
c("GO:0044524","protein sulfhydration", 0.000, 3.946, 4.570, 1.591,-1.2515,0.926,0.303),
c("GO:0018272","protein-pyridoxal-5-phosphate linkage via peptidyl-N6-pyridoxal phosphate-L-lysine", 0.000, 4.588, 4.281, 1.602,-1.2515,0.925,0.303),
c("GO:0006979","response to oxidative stress", 0.539, 6.833,-1.771, 5.428,-3.2733,0.770,0.329),
c("GO:0033539","fatty acid beta-oxidation using acyl-CoA dehydrogenase", 0.013,-2.244,-6.188, 3.799,-4.0975,0.831,0.347),
c("GO:0043491","protein kinase B signaling", 0.009, 5.459,-3.781, 3.637,-1.2550,0.705,0.366),
c("GO:2000427","positive regulation of apoptotic cell clearance", 0.000, 2.040,-2.724, 2.029,-9.3063,0.693,0.375),
c("GO:0036109","alpha-linolenic acid metabolic process", 0.000,-3.480,-5.585, 1.079,-1.0816,0.890,0.387),
c("GO:0070814","hydrogen sulfide biosynthetic process", 0.072,-5.561, 1.540, 4.553,-1.6817,0.926,0.389),
c("GO:0019550","glutamate catabolic process to aspartate", 0.000,-3.022,-6.586, 1.792,-1.0816,0.857,0.391),
c("GO:0007260","tyrosine phosphorylation of STAT protein", 0.003, 4.765,-0.733, 3.209,-1.0379,0.687,0.395));

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

I1 <- ggplot( data = one.data );
I1 <- I1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) ) + scale_size_area();
I1 <- I1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( -15, 0) );
I1 <- I1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
I1 <- I1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ]; 
I1 <- I1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 4 );
I1 <- I1 + labs (y = "semantic space x", x = "semantic space y");
I1 <- I1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
I1 <- I1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
I1 <- I1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10)+theme(legend.position="none")+ annotate("text", x = -9.5, y = 8, label = "Some text");
I1<- I1 + annotate("text", x = -7, y = 7, label = "1) Issaquah", size= 7)


# --------------------------------------------------------------------------
# Output the plot to screen

I1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
