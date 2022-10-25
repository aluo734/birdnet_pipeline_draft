import os
import argparse
from pydub import AudioSegment

parser = argparse.ArgumentParser()
parser.add_argument('-i', '--input_folder')
args = parser.parse_args()

for filename in os.listdir(args.input_folder):
    if filename.endswith('.mp3'):
        sound = AudioSegment.from_mp3(os.path.join(args.input_folder, filename))
        newname = filename.split(' ')[0] + '.wav'
        sound.export(os.path.join(args.input_folder, newname), format = 'wav')
        os.remove(os.path.join(args.input_folder, filename))
