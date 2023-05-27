#!/bin/bash

pipenv run whisper --fp16 False --model medium --word_timestamps True --language English --output_format json --verbose False --output_dir data/improved_timestamps $1/*mkv
