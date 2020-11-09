pragma solidity >=0.4.22 <0.7.0;

contract example9 { //original : Grade
    string grade;
    
    function setGrade(uint _score) public {
        if(_score >= 90){
            grade='A';
        }
        
        else if(_score >=80){
            grade='B';
        }
        
        else if(_score >= 70){
            grade='C';
        }

        else if(_score >= 60){
            grade='D';
        } 
        else{
            grade='F';
        }
    }
    
    function getGrade() public view returns(string memory){
        return grade;
    }
    
}