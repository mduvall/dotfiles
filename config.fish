function gifit
    command mkdir frames;
            and ffmpeg -i $argv -vf scale=600:-1 -r 10 frames/ffout%03d.png;
            cd frames;
            and convert -delay 5 -loop 0 ffout*.png output.gif;
            and mv output.gif ../;
            and cd ..;
            and rm -rf frames
end
