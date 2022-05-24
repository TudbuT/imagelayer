cp /bin/isbpl ISBPL.jar
javac -cp ISBPL.jar Wrapper.java 
mkdir tmp ; cd tmp
    unzip ../ISBPL.jar 
    rm ../ISBPL.jar
    cp ../*.class .
    zip -r ../ISBPL.jar *
cd ..
rm -rf tmp
