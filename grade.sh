# Create your grading script here

rm -rf student-submission
git clone $1 student-submission

#useful variables 
CP=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

#copy over our written tests to the student-submission directory 
cp TestListExamples.java student-submission
cp -r lib student-submission
#go into the student-submission directory 
cd student-submission 


#check if ListExamples.java is a file 
if [[ -f ListExamples.java ]]
then 
    echo "File detected."
else 
    echo "Error: File not detected. Please submit the correct files in the correct directory"
    exit 1 
fi 


#check if javac is working 
javac -cp $CP *.java 

#if after javac there is any error message, 
    #that means that the methods were not written correctly 
if ! [[ $? -eq 0 ]]
then 
    echo "method implementation error"
    exit 1
else 
    echo "implemented methods correctly"
fi


if [[ -f ListExamples.class ]]
then #it's working 
    echo "javac Compiled"
else #javac is not working
    echo "Compile error"
    exit 1 
fi 


java -cp $CP org.junit.runner.JUnitCore TestListExamples > testanswers.txt 

# grep for all the tests --- then find how many failed to find the score 
# start from full score + deduct by 1 for every failed test 


declare -i a=5

output1=$(grep "mergeTest(*" testanswers.txt)
if [[ ! -z "$output1" ]] 
then 
    let "a=a-1"
    echo 1
fi

output2=$(grep "mergeTestLong*" testanswers.txt)
if [[ ! -z "$output2" ]] 
then 
    let "a=a-1"
    echo 2
fi

output3=$(grep "mergeTestEmpty*" testanswers.txt)
if [[ ! -z "$output3" ]] 
then 
    let "a=a-1"
    echo 3
fi

output4=$(grep "filterTest(*" testanswers.txt)
if [[ ! -z "$output4" ]] 
then 
    let "a=a-1"
    echo 4
fi

output5=$(grep "filterTestAgain*" testanswers.txt)
if [[ ! -z "$output5" ]] 
then 
    let "a=a-1"
fi

echo "Score is: " $a " out of 5"