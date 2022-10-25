If you want to detect species and make plots for species presence over time (within recordings):

1. Download BirdNet-Analyzer from GitHub and add that directory to this directory
2. Add recordings to the subdirectory "input_recordings". mp3 or wav files work.
3. Add any additional species of interested to the spplist.txt file. Right now, it's just Carolina chickadees and tufted titmice. Species should be formatted scientific name_common name with whatever standard common name format Cornell is using (ABA probably?).
4. If you add any more species, add them to the color palette in plot_spp_presence.R. It's in line 10. White-breasted nuthatch is already there, along with hex codes for two other unused colors if you want to maintain this ~aesthetic~. Add the species as 'Species name' = '#hex_color' to the existing list.
5. Run birdnet_pipeline_detect_plot_presence.sh
(go to your terminal, cd to this directory, then use the command: bash birdnet_pipeline_detect_plot_presence.sh)

In plot_spp_presence.R, the plots just plot from 0  until the last detected presence in the recording, in seconds. If you want minutes or the actual time the recording was made, you'll have to make those changes. It's probably easiest to make that a new column in the data frame and changing the x variable in ggplot.
