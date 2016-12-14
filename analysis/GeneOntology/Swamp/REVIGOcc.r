

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
revigo.data <- rbind(c("GO:0005576","extracellular region", 4.572, 5.441,-1.547, 6.031,-5.6635,0.957,0.000),
c("GO:0005623","cell",64.133, 1.736,-1.543, 7.178,-1.9202,0.984,0.000),
c("GO:0005925","focal adhesion", 0.016, 3.730,-3.819, 3.588,-2.0828,0.955,0.000),
c("GO:0016020","membrane",51.720, 0.944,-4.815, 7.085,-6.6904,0.978,0.000),
c("GO:0031012","extracellular matrix", 0.156,-4.264,-4.569, 4.564,-1.1006,0.955,0.000),
c("GO:0070062","extracellular exosome", 0.300,-5.063, 6.925, 4.848,-30.2692,0.526,0.000),
c("GO:0097447","dendritic tree", 0.006, 6.835, 0.715, 3.173,-4.1331,0.897,0.000),
c("GO:0043209","myelin sheath", 0.005,-1.541,-4.755, 3.049,-1.8298,0.931,0.016),
c("GO:0048471","perinuclear region of cytoplasm", 0.050,-5.637, 1.378, 4.067,-3.0419,0.750,0.018),
c("GO:0009897","external side of plasma membrane", 0.032, 5.702, 3.224, 3.872,-2.1245,0.894,0.020),
c("GO:0016021","integral component of membrane",35.230,-4.969,-2.310, 6.918,-1.4554,0.926,0.139),
c("GO:0002102","podosome", 0.002,-0.676, 7.001, 2.579,-2.6291,0.662,0.177),
c("GO:0000974","Prp19 complex", 0.001, 3.498, 7.278, 2.318,-1.1021,0.901,0.202),
c("GO:0005833","hemoglobin complex", 0.014,-0.738, 5.163, 3.525,-2.1500,0.714,0.230),
c("GO:0044194","cytolytic granule", 0.000,-6.418, 4.328, 2.061,-1.9912,0.689,0.242),
c("GO:0005829","cytosol", 0.807,-5.767, 2.292, 5.278,-1.6889,0.709,0.277),
c("GO:0000151","ubiquitin ligase complex", 0.066, 2.418, 6.982, 4.193,-1.7297,0.824,0.283),
c("GO:0017053","transcriptional repressor complex", 0.014, 2.095, 8.009, 3.530,-1.0642,0.894,0.283),
c("GO:0005777","peroxisome", 0.063,-5.132, 4.737, 4.170,-2.2143,0.592,0.331),
c("GO:0005789","endoplasmic reticulum membrane", 0.136,-4.395, 3.601, 4.506,-5.1343,0.466,0.352),
c("GO:0005579","membrane attack complex", 0.002, 3.769, 5.246, 2.754,-1.5219,0.847,0.362),
c("GO:0005759","mitochondrial matrix", 0.055,-4.266, 4.971, 4.114,-2.8697,0.573,0.377));

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
