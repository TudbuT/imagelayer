IFS=: read -r BIN OTHERBIN <<< "$PATH"
mkdir /usr/lib/isbpl >& /dev/null
touch /usr/lib/isbpl/test && export BIN=/usr/bin && rm /usr/lib/isbpl/test
echo "Installing to $BIN."

cp "$BIN"/isbpl ISBPL.jar
mkdir tmp ; cd tmp
    cp ../Wrapper.java ../ISBPL.jar .
    javac -cp ISBPL.jar Wrapper.java 
    unzip ISBPL.jar 
    rm ISBPL.jar ../ISBPL.jar
    zip -r ../ISBPL.jar *
cd ..
rm -rf tmp
cat > "$BIN"/imagelayer << EOF
java -jar $(pwd)/ISBPL.jar $(pwd)/main.isbpl \$@
EOF
cat > "$BIN"/showimage << EOF
clear
java -jar $(pwd)/ISBPL.jar $(pwd)/main.isbpl 100 100 \$@ > /dev/null
EOF
chmod a+rx "$BIN"/imagelayer "$BIN"/showimage
