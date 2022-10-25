python3 mp3_to_wav.py -i input_recordings

mkdir birdnet_out
python3 BirdNET-Analyzer/analyze.py \
--i input_recordings \
--o birdnet_out \
--slist ../spplist.txt

Rscript plot_spp_presence.R
