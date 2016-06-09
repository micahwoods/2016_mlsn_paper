# prepare Table 1 with summary of data

kRow <- rowData(potassium)
pRow <- rowData(phosphorus)
caRow <- c(mlsn.normal(calcium),
           min(calcium, na.rm = TRUE),
           median(calcium, na.rm = TRUE),
           max(calcium, na.rm = TRUE))
mgRow <- rowData(magnesium)
sRow <- rowData(sulfur)

sum.table <- rbind(kRow, pRow, caRow,
                   mgRow, sRow)

carrow <- c(117, 55, 751, 121, 41)

elements <- c("K", "P", "Ca", "Mg", "S")

sum.table <- cbind.data.frame(elements, sum.table, carrow)

colnames(sum.table) <- c("Element", "MLSN", "minimum",
                         "median", "maximum mg kg\\textsuperscript{-1}", "Conventional guideline")

sum.table <- sum.table[ , c(1, 3, 4, 5, 2, 6)]

options(xtable.comment = FALSE)
options(xtable.booktabs = TRUE)
sum.table <- xtable(sum.table, caption = "Summary of MLSN data, with conventional guidelines from \\cite{clarifying-3} included for reference.", 
                    label = "tab:sumtable",
                    digits = c(0, 0, 0, 0, 0, 0, 0),
                    align = c("l", "l", "l",
                              "l", "p{2cm}", "l", "l"))