

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
revigo.data <- rbind(c("GO:0033280","response to vitamin D", 0.001,-5.619, 0.617, 2.787,-2.8441,0.787,0.000),
c("GO:0042359","vitamin D metabolic process", 0.001, 1.504, 5.297, 2.723,-3.7447,0.692,0.000),
c("GO:0051028","mRNA transport", 0.053,-2.615,-6.493, 4.422,-2.0116,0.749,0.000),
c("GO:0001649","osteoblast differentiation", 0.013, 5.501, 3.537, 3.806,-1.4005,0.824,0.028),
c("GO:0045727","positive regulation of translation", 0.047, 4.173,-5.694, 4.371,-1.5810,0.604,0.033),
c("GO:0055114","oxidation-reduction process",15.044,-2.842, 5.191, 6.874,-2.3335,0.827,0.084),
c("GO:0010467","gene expression",16.702, 5.781,-1.895, 6.920,-1.1632,0.768,0.159),
c("GO:0006397","mRNA processing", 0.373, 5.073,-3.930, 5.269,-1.3313,0.649,0.225),
c("GO:0006810","transport",17.382,-3.617,-5.217, 6.937,-1.0331,0.789,0.310),
c("GO:0035754","B cell chemotaxis", 0.000,-4.919,-1.594, 1.944,-1.8089,0.677,0.344));

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

J1 <- ggplot( data = one.data );
J1 <- J1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) ) + scale_size_area();
J1 <- J1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$log10_p_value), 0) );
J1 <- J1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
J1 <- J1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ]; 
J1 <- J1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 4 );
J1 <- J1 + labs (y = "semantic space x", x = "semantic space y");
J1 <- J1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
J1 <- J1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
J1 <- J1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10)+theme(legend.position="none");
J1<- J1 + annotate("text", x = -5.8, y = 5.8, label = "2) Jenkins", size= 7)


# --------------------------------------------------------------------------
# Output the plot to screen

J1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
