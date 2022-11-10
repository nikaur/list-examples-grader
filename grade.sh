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
    echo "Error: File not detected. Please submit the correct files"
    exit 1 
fi 


#check if javac is working 
javac -cp $CP *.java 

if [[ -f ListExamples.class ]]
then #it's working 
    echo "javac Compiled"
else #javac is not working
    echo "Compile error"
    exit 1 
fi 

java -cp $CP org.junit.runner.JUnitCore TestListExamples > testanswers.txt 
grep "mergeTest1*" testanswers.txt 

# grep for all the tests --- then find how many failed to find the score 
# start from full score + deduct by 1 for every failed test 

echo 5
let a=5 
if [[ $Comp == "mergeTest1" ]]
then
    let a-1
    echo a
fi 

if [[ grep "mergeTest2" testanswers.txt ]]
then
    let a-1
    echo a
fi 

if [[ grep "mergeTest3" testanswers.txt ]]
then
    let a-1
    echo a
fi 

if [[ grep "filterTest1" testanswers.txt ]]
then
    let a-1
    echo a
fi 

if [[ grep "filterTest2" testanswers.txt ]]
then
    let a-1
    echo a
fi

echo "Score is: " $a " out of 5"