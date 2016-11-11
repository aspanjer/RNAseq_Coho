source("https://bioconductor.org/biocLite.R")
biocLite("ComplexHeatmap")
biocLite("circlize")

library(ComplexHeatmap)
library(circlize)

set.seed(123)

mat = cbind(rbind(matrix(rnorm(16, -1), 4), matrix(rnorm(32, 1), 8)),
            rbind(matrix(rnorm(24, 1), 4), matrix(rnorm(48, -1), 8)))

mat = mat[sample(nrow(mat), nrow(mat)), sample(ncol(mat), ncol(mat))]

rownames(mat) = paste0("R", 1:12)
colnames(mat) = paste0("C", 1:10)

Heatmap(data)
