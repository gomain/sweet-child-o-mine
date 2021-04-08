xpdf  -cfg .xpdfrc -remote $1 openFile\($2\) &
while inotifywait -e modify src/*.ly
do
    lilypond -o target/ src/score.ly && xpdf -remote $1 'reload';
done
