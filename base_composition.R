# Required packages
library(BiocManager) # Required for installation of Biostrings
library(Biostrings)
library(ggplot2)

# Set input and output file paths directly
input_file <- "data/fasta.fa"
output_file <- "output/base_plot.png"

# Read fasta
seqs <- readDNAStringSet(filepath = input_file)
sequence <- as.character(seqs[[1]])

# Count bases
base_counts <- table(strsplit(sequence, "")[[1]])
base_df <- as.data.frame(base_counts)
names(base_df) <- c("Base", "Count")

# Plot
p <- ggplot(base_df, aes(x = Base, y = Count, fill = Base)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  ggtitle("Base Composition")

ggsave(output_file, plot = p)

print(paste("Base composition plot saved to", output_file))