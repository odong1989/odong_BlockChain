pragma solidity >=0.4.22 < 0.7.0;

contract GradeArray {
    /*
    //내가 작성한 답
    uint[]   gradeArrayScore;
    string[] gradeArrayString; 
    
    function setGrade(uint _score) public {
        if(_score >= 90){
            gradeArrayString.push('A');
            gradeArrayScore.push(_score);
        }
        
        else if(_score >=80){
            gradeArrayString.push('B');
            gradeArrayScore.push(_score);
        }
        
        else if(_score >= 70){
            gradeArrayString.push('C');
            gradeArrayScore.push(_score);
        }

        else if(_score >= 60){
            gradeArrayString.push('D');
            gradeArrayScore.push(_score);        
        } 
        else{
            gradeArrayString.push('F');
            gradeArrayScore.push(_score);
        }
    }
    
    function showGrade(uint256 cell) view public returns (string memory){
        return gradeArrayString[cell];        
    }
    
    function showScore(uint256 cell) view public returns (uint256){
        return gradeArrayScore[cell];        
    }

    //전체학생들 점수의 평균값
    function getAvgByAllStudents() public view returns(uint256){
        uint total = 0;
        for(uint i=0; i< gradeArrayScore.length; i++){
            total = total +gradeArrayScore[i];
        }
        return total / gradeArrayScore.length;
    }    
    
    //학점 a,b만의 평균값
    function getAvgByGradeAandB() public view returns(uint256){
        uint total = 0;
        uint countTarget = 0;
        for(uint i=0; i< gradeArrayScore.length; i++){
            if(keccak256(bytes(gradeArrayString[i])) == keccak256(bytes("A")) || keccak256(bytes(gradeArrayString[i])) == keccak256(bytes("B")) ){
            total = total +gradeArrayScore[i];
            countTarget++;
            }
        }
        return total / countTarget;
    }
    */
    

    //모범답안
    //모범답안
    string grade;
    uint[] grades;
    uint[] totalGrades;
    
    function setGrade(uint _score) public{
        if(_score >= 90){
            grade = "A";
            grades.push(_score);
        }
        else if(_score >= 80){
            grade = "B";
            grades.push(_score);
        }        
        else if(_score >= 70){
            grade = "C";
        }                
        else if(_score >= 80){
            grade = "D";
        }                
        else {
            grade ="F";
        }

        if(keccak256(bytes(grade)) == keccak256(bytes("A")) || keccak256(bytes(grade)) == keccak256(bytes("B")) ){
            grades.push(_score);    
        }

        totalGrades.push(_score);//학점이 a,b,급인 사람들의 성적들만 반영. 80점 이상만 저장되어 있으니 주의
    }
    

    //학점이 a,b,급인 사람들의 성적들만 반영. 80점 이상만 저장되어 있으니 주의
    function getScore(uint256 a) public view returns(uint256){
        return grades[a];
    }
    
    function getAverage() public view returns(uint256){
        uint a =0; // a=total 
        for(uint i=0; i<grades.length;i++){
            a=a+grades[i];
        }
        return (a/grades.length);
    }
    
    
    function getTotalAverage() public view returns(uint256){
        uint a=0;
        for(uint i=0; i<grades.length;i++){
            a=a+totalGrades[i];
        }
        return (a/totalGrades.length);        
    } 
    
    
}