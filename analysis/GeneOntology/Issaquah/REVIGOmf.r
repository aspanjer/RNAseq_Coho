

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
revigo.data <- rbind(c("GO:0003824","catalytic activity",69.295, 2.203, 7.054, 7.516,-1.4412,0.996,0.000),
c("GO:0004866","endopeptidase inhibitor activity", 0.084,-0.038, 8.144, 4.598,-7.6576,0.972,0.000),
c("GO:0005344","oxygen transporter activity", 0.039,-0.466,-0.917, 4.266,-2.3940,0.980,0.000),
c("GO:0009055","electron carrier activity", 2.493, 2.479, 0.473, 6.072,-1.8926,0.986,0.000),
c("GO:0016620","oxidoreductase activity, acting on the aldehyde or oxo group of donors, NAD or NADP as acceptor", 0.788,-4.374, 6.277, 5.571,-5.5513,0.904,0.000),
c("GO:0031715","C5L2 anaphylatoxin chemotactic receptor binding", 0.000, 3.218,-3.433, 1.568,-6.9355,0.874,0.000),
c("GO:0032216","glucosaminyl-phosphotidylinositol O-acyltransferase activity", 0.000, 5.612, 4.150, 0.903,-2.3344,0.762,0.011),
c("GO:0004776","succinate-CoA ligase (GDP-forming) activity", 0.000,-4.111,-3.614, 2.025,-3.8827,0.959,0.013),
c("GO:0004613","phosphoenolpyruvate carboxykinase (GTP) activity", 0.010,-0.927,-6.370, 3.685,-1.7041,0.949,0.016),
c("GO:0004053","arginase activity", 0.014, 5.552,-4.070, 3.824,-2.5131,0.964,0.016),
c("GO:0005542","folic acid binding", 0.011,-1.801,-2.414, 3.711,-3.4855,0.947,0.022),
c("GO:0070026","nitric oxide binding", 0.000,-2.210, 2.759, 1.851,-1.4289,0.972,0.023),
c("GO:0016829","lyase activity", 4.488, 0.330, 6.304, 6.327,-1.2259,0.962,0.028),
c("GO:0003823","antigen binding", 0.064, 0.700, 8.982, 4.484,-2.9727,0.967,0.032),
c("GO:0019825","oxygen binding", 0.074, 3.680, 7.873, 4.546,-2.6974,0.967,0.036),
c("GO:0016491","oxidoreductase activity",14.657, 4.755,-2.396, 6.841,-7.9508,0.961,0.045),
c("GO:0005515","protein binding", 2.482,-3.314, 0.059, 6.070,-2.6122,0.961,0.048),
c("GO:0008289","lipid binding", 0.237, 4.972,-1.230, 5.049,-1.2249,0.965,0.054),
c("GO:0008144","drug binding", 0.260,-0.836, 2.561, 5.089,-1.9804,0.965,0.054),
c("GO:0070025","carbon monoxide binding", 0.000,-7.135,-0.428, 1.114,-1.5518,0.968,0.060),
c("GO:0044822","poly(A) RNA binding", 0.135, 0.451,-4.794, 4.806,-3.3372,0.956,0.063),
c("GO:0034930","1-hydroxypyrene sulfotransferase activity", 0.000, 0.233, 0.932, 0.301,-1.0869,0.830,0.070),
c("GO:0048037","cofactor binding", 6.702, 2.325, 8.563, 6.501,-3.8761,0.960,0.082),
c("GO:0030351","inositol-1,3,4,5,6-pentakisphosphate 3-phosphatase activity", 0.000, 0.760,-6.488, 0.301,-1.0431,0.969,0.090),
c("GO:0020037","heme binding", 1.765, 1.767, 4.318, 5.922,-1.4483,0.958,0.093),
c("GO:0019809","spermidine binding", 0.000,-5.644,-2.268, 0.954,-1.1920,0.967,0.101),
c("GO:0002060","purine nucleobase binding", 0.000,-4.870,-1.004, 1.978,-1.0869,0.965,0.107),
c("GO:0000062","fatty-acyl-CoA binding", 0.016,-6.749,-2.223, 3.866,-2.9913,0.951,0.138),
c("GO:0004252","serine-type endopeptidase activity", 0.675, 5.648,-4.499, 5.504,-2.1144,0.959,0.172),
c("GO:0008403","25-hydroxycholecalciferol-24-hydroxylase activity", 0.000,-5.549, 2.938, 1.580,-1.5518,0.932,0.173),
c("GO:0008480","sarcosine dehydrogenase activity", 0.000,-6.572, 2.503, 1.778,-1.5518,0.943,0.178),
c("GO:0004623","phospholipase A2 activity", 0.011,-3.484,-5.230, 3.709,-1.0205,0.963,0.214),
c("GO:0008951","palmitoleoyl [acyl-carrier-protein]-dependent acyltransferase activity", 0.000, 7.260, 2.282, 0.301,-1.2569,0.798,0.214),
c("GO:0019186","acyl-CoA N-acyltransferase activity", 0.000, 6.592, 1.544, 0.301,-1.2569,0.792,0.214),
c("GO:0052890","oxidoreductase activity, acting on the CH-CH group of donors, with a flavin as acceptor", 0.003,-4.155, 5.765, 3.213,-3.5129,0.927,0.217),
c("GO:0050421","nitrite reductase (NO-forming) activity", 0.005,-3.545, 5.197, 3.374,-1.5518,0.934,0.222),
c("GO:0046941","azetidine-2-carboxylic acid acetyltransferase activity", 0.000, 6.965, 1.203, 0.301,-1.2569,0.791,0.248),
c("GO:0004450","isocitrate dehydrogenase (NADP+) activity", 0.050,-5.503, 4.666, 4.372,-2.9470,0.921,0.263),
c("GO:0004658","propionyl-CoA carboxylase activity", 0.003,-5.029,-3.894, 3.181,-2.7417,0.962,0.268),
c("GO:0035925","mRNA 3'-UTR AU-rich region binding", 0.000, 2.799,-5.274, 2.303,-1.4875,0.963,0.281),
c("GO:0044540","L-cystine L-cysteine-lyase (deaminating)", 0.002, 1.959,-6.314, 2.951,-1.1920,0.949,0.295),
c("GO:0016751","S-succinyltransferase activity", 0.030, 6.209, 3.631, 4.148,-1.2569,0.668,0.300),
c("GO:0017091","AU-rich element binding", 0.002,-0.757,-4.603, 2.885,-1.1703,0.962,0.303),
c("GO:0016752","sinapoyltransferase activity", 0.000, 5.991, 2.365, 1.176,-1.1920,0.779,0.309),
c("GO:0004122","cystathionine beta-synthase activity", 0.006,-1.682,-6.177, 3.441,-1.3340,0.952,0.313),
c("GO:0052858","peptidyl-lysine N-acetyltransferase activity, acting on acetyl phosphate as donor", 0.000, 5.724, 3.413, 1.633,-1.1920,0.762,0.324),
c("GO:0051990","(R)-2-hydroxyglutarate dehydrogenase activity", 0.000,-6.356, 3.969, 1.477,-1.0869,0.939,0.336),
c("GO:0016627","oxidoreductase activity, acting on the CH-CH group of donors", 1.092,-4.688, 5.840, 5.713,-2.3548,0.914,0.350),
c("GO:0003954","NADH dehydrogenase activity", 0.792,-3.863, 6.611, 5.573,-1.6355,0.916,0.350),
c("GO:0034738","lanosterol O-acyltransferase activity", 0.000, 6.773, 2.789, 0.301,-1.1920,0.771,0.356),
c("GO:0016454","C-palmitoyltransferase activity", 0.001, 6.581, 3.803, 2.633,-1.2569,0.726,0.363),
c("GO:0005102","receptor binding", 0.416, 2.453,-3.240, 5.293,-5.9914,0.848,0.368),
c("GO:0016651","oxidoreductase activity, acting on NAD(P)H", 1.351,-3.721, 6.280, 5.805,-1.7796,0.913,0.372),
c("GO:0019107","myristoyltransferase activity", 0.002, 6.204, 4.224, 3.020,-1.0431,0.738,0.380),
c("GO:0016753","O-sinapoyltransferase activity", 0.000, 6.433, 3.083, 1.176,-1.2569,0.756,0.387),
c("GO:0004361","glutaryl-CoA dehydrogenase activity", 0.000,-5.241, 5.627, 2.196,-1.5518,0.933,0.390));

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
