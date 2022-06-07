IFS=$'\n' 
for INPUT in $(ls ./jobs) 
do 
	echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $INPUT"
	NOMEJOB="${INPUT%.*}"
	java -jar jenkins-cli.jar -s "http://localhost:8080" -auth alberto:vissio create-job "$NOMEJOB" < ./jobs/$INPUT
done

