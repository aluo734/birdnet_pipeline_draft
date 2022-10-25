library(ggplot2)

dir.create('species_presence_over_time_plots')

for (i in list.files('birdnet_out/')) {
  file <- paste0('birdnet_out/', i)
  presence <- read.table(file, sep = '\t', header = T)[,c(4, 5, 9, 10)]
  colnames(presence) <- c('begin', 'end', 'species', 'confidence')

  colors = c('Carolina Chickadee' = '#7e9680', 'Tufted Titmouse' = '#79616f', 'White-breasted Nuthatch' = '#ae6378')
  # two more colors in this palette: #d87f81 (lighter pink) and #eab595 (yellow)

  ggplot(presence, aes(begin, species, fill = species)) +
    geom_tile(height = 0.25) +
    theme_classic() +
    scale_fill_manual(values = colors) +
    theme(legend.position = 'none',
          text = element_text(size = 16),
          axis.title.y = element_blank()) +
    xlab('Time (s)')
  ggsave(paste0('species_presence_over_time_plots/', strsplit(i, '.', fixed = T)[[1]][1], '.png'),
  last_plot(),
  width = 10, height = 8, units = 'in')
}
