#!/usr/bin/env bash
# #!/bin/bash
if [[ $# -eq 0 ]] || [[ "" == "--help" ]]
then
  echo ""
  echo ""
  echo "Usage: $0 "
  echo "Work under working directory."
  echo "by Le CHEN, (chenle02@gmail.com)"
  echo "Tue 17 Oct 2023 08:22:28 PM EDT"
  echo ""
  echo ""
  exit 1
fi

# This will run a 2D sim which
# 1. starts with a single particle at 0,0,
# 2. writes a 1000x1000 pixel PNG image out every 10 steps,
# 3. in which the particles are rendered onto a density field that spans -3..3 in x and y.

../../build/dla-2d -p 0 0 -every 10 -end 20000 -zone -3 3 -3 3 -dens -res 2000

# Convert to a movie file.
ffmpeg -y -framerate 24 -i dens_%04d.png -c:v libx264 -pix_fmt yuv420p output.mp4
mpv --loop=inf ./output.mp4
