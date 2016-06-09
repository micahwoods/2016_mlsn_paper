# prepares table 2

# this will give the table with scale and shape parameters

kShape <- shapeScale(potassium)
pShape <- shapeScale(phosphorus)
mgShape <- shapeScale(magnesium)
sShape <- shapeScale(sulfur)

shape.table <- rbind(kShape, pShape,
                     mgShape, sShape)

elements <- c("K", "P", "Mg", "S")

shape.table <- cbind.data.frame(elements, shape.table)

colnames(shape.table) <- c("Element", "Scale", "Shape", "$P(X \\leq x) = 0.1$ mg kg\\textsuperscript{-1}")

options(xtable.comment = FALSE)
options(xtable.booktabs = TRUE)
shape.table <- xtable(shape.table, caption = "Parameters of the log-logistic distributions for K, P, Mg, and S.", 
                      label = "tab:shapetable",
                      digits = c(0, 0, 2, 2, 0),
                      align = c("l", "l", "l", "l", "p{3cm}"))