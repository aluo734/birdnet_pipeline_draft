*If you want to detect species and make plots for species presence over time (within recordings)*

1. Download BirdNet-Analyzer from GitHub (https://github.com/kahst/BirdNET-Analyzer) and add that to this directory
2. Add mp3 or wav files to the included subdirectory "input_recordings"
3. Add additional species of interest to the spplist.txt file. Species should be formatted scientific name_common name.
4. If you add any more species, add them to the color palette in plot_spp_presence.R. It's in line 10. There are hex codes for two other unused colors if you want to maintain this ~aesthetic~. Add the species as 'Species' = '#hex_code' to the existing list.
5. Run the commands in the pipeline below.

Note: In plot_spp_presence.R, the plots just go from 0 until the last detected presence in the recording in seconds, not the actual date/time or in minutes.

# PIPELINE

If you have mp3 files, convert to wav files:

`python3 mp3_to_wav.py -i input_recordings`

Detect songs:

`
mkdir birdnet_out
python3 BirdNET-Analyzer/analyze.py \
--i input_recordings \
--o birdnet_out \
--slist ../spplist.txt
`

Plot species presence:
`Rscript plot_spp_presence.R`