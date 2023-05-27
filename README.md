# CDawgVA and Friends Saying STFU for 20 Minutes

Resulting video: [https://www.youtube.com/watch?v=wlj69LSS94k](https://www.youtube.com/watch?v=wlj69LSS94k)

## Intall dependencies

Ensure you have the following tools installed:

- python 3
- pipenv
- ffmpeg

```bash
pipenv install
```

## Usage

You need up to 1 TB of storage available to store the clips and the various stages of processing.

### Download subtitles

```bash
./fetch_subtitles.sh
```

### Download rough cut of all stfu occurances

```bash
pipenv run extract_stfu_occurances --delete-clips-directory true --rough True --clips-directory ${PATH_TO_STORE_ROUGH_CLIPS?}
```

### Improve the timestamps using Whisper AI

```bash
./improve_timestamps.sh ${PATH_TO_STORE_ROUGH_CLIPS?}
```

### Cut the clips exactly using the original timestamps and improved timestamps

```bash
pipenv run improve_stfu_occurances --clips-directory ${PATH_TO_STORE_ROUGH_CLIPS?} --improved-clips-directory ${PATH_TO_STORE_IMPROVED_CLIPS?}
```

### Concatenate the clips into a single video, normalize audio and generate description

```bash
./concat_video.sh
```

The final video can be found at `./data/video_concatenated.mkv` and the description at `./data/description.txt`.
