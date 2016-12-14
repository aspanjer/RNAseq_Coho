

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
revigo.data <- rbind(c("GO:0005576","extracellular region", 4.572,-5.429,-1.687, 6.031,-5.8601,0.964,0.000),
c("GO:0005623","cell",64.133,-2.638,-2.476, 7.178,-2.3132,0.987,0.000),
c("GO:0005925","focal adhesion", 0.016,-3.829,-5.061, 3.588,-1.1781,0.963,0.000),
c("GO:0016020","membrane",51.720,-2.299, 1.743, 7.085,-2.5213,0.982,0.000),
c("GO:0043209","myelin sheath", 0.005,-1.483,-6.917, 3.049,-12.5171,0.936,0.000),
c("GO:0070062","extracellular exosome", 0.300, 7.709,-0.020, 4.848,-33.4377,0.529,0.000),
c("GO:0009897","external side of plasma membrane", 0.032, 2.150, 6.726, 3.872,-6.5607,0.861,0.018),
c("GO:0005833","hemoglobin complex", 0.014, 3.319,-3.705, 3.525,-3.9666,0.680,0.019),
c("GO:0043025","neuronal cell body", 0.028,-3.780, 4.487, 3.822,-1.4658,0.934,0.020),
c("GO:0009986","cell surface", 0.186,-5.337, 1.477, 4.641,-4.3233,0.930,0.022),
c("GO:0045177","apical part of cell", 0.035,-1.550, 6.239, 3.918,-1.4806,0.933,0.022),
c("GO:0005938","cell cortex", 0.094, 3.548, 3.873, 4.344,-1.1678,0.706,0.218),
c("GO:0097136","Bcl-2 family protein complex", 0.001, 2.445,-6.760, 2.176,-1.0257,0.831,0.220),
c("GO:0002102","podosome", 0.002, 5.549,-3.831, 2.579,-1.4789,0.647,0.230),
c("GO:0031094","platelet dense tubular network", 0.001, 7.948, 1.669, 2.217,-1.0694,0.727,0.247),
c("GO:0005581","collagen trimer", 0.057, 3.662,-6.672, 4.126,-1.3125,0.800,0.280),
c("GO:0005886","plasma membrane",13.934, 3.149, 6.535, 6.515,-1.1910,0.862,0.322),
c("GO:0005764","lysosome", 0.049, 6.081, 0.913, 4.063,-2.0371,0.619,0.325),
c("GO:0005759","mitochondrial matrix", 0.055, 6.011,-0.723, 4.114,-13.3391,0.535,0.328),
c("GO:0005777","peroxisome", 0.063, 5.451, 0.337, 4.170,-2.2963,0.628,0.331),
c("GO:0031301","integral component of organelle membrane", 0.076, 7.557,-1.141, 4.252,-1.4281,0.594,0.348));

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
