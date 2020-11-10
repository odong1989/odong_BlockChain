pragma solidity >=0.4.22 < 0.7.0;

contract GradeArray {
    /*
    성적을 부여하는 프로그램입니다.
    90점 이상 A
    80점 이상 B
    70점 이상 C
    60점 이상 D
    A,B만 push할 수 있는 array를 만드세요
    Push되는 것은 점수입니다
    즉,  숫자
    */
    
    /* 
    //내가 작성한 코드
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
        //    grade='C';
        }

        else if(_score >= 60){
        //   grade='D';
        } 
        else{
        //    grade='F';
        }
    }
    
    function showGrade(uint256 cell) view public returns (string memory){
        return gradeArrayString[cell];        
    }
    
    function showScore(uint256 cell) view public returns (uint256){
        return gradeArrayScore[cell];        
    }
    */
    
    
    //=====================================================================
    //모범답안
    string grade;
    uint[] grades;
    
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

    }
    

    
    function getScore(uint256 a) public view returns(uint256){
        return grades[a];
    }

    
    
}