IFS=$'\n' 
for OUTPUT in $(java -jar jenkins-cli.jar -s "http://localhost:8181" -auth alberto:vissio list-jobs) 
do 
	java -jar jenkins-cli.jar -s "http://localhost:8181" -auth alberto:vissio get-job "$OUTPUT" > ./jobs/$OUTPUT.xml
done

