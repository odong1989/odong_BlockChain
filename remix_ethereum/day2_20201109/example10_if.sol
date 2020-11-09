pragma solidity >=0.4.22 <0.7.0;

contract example10 { 
    uint month;
    string quarter;
        
function setQuarter(uint _month) public {
    if( _month ==1 || _month ==2 || _month ==3 ){
    //if(_month<=3 && month>=1){ 이게 더 낫지.

        quarter='1분기';
    }
            
    else if(_month ==4 || _month ==5 || _month ==6 ){
    //_month <=6&&_month>=4

        quarter='2분기';
    }
            
    else if(_month ==7 || _month ==8 || _month ==9 ){
        quarter='3분기';
    }
    
    else if(_month ==10 || _month ==11 || _month ==12 ){
        quarter='4분기';
    } 
    
    else{
        quarter='엉뚱한 입력입니다.';
    }
    }
        
        function getQuarter() public view returns(string memory){
            return quarter;
        }
        
    }