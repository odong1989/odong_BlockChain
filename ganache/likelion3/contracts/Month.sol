//새로운 컨트랙트 추가, 가나슈에 추가반영되는지 확인
pragma solidity >=0.4.22 <0.7.0;

contract Month {
    string season;
    uint month;
    
    function setSeason(uint _month) public {
        if(_month <=3 && _month >=1) {
            season = "1 quarter";
        } else if  (_month >= 4 && _month <=6) {
            season = "2 quarter";
        } else if  (_month >= 7 && _month <=9) {
            season = "3 quarter";
        } else if  (_month >= 10 && _month <=12) {
            season = "4 quarter";
        } else {
            season = "error message : out of the range";
        }
    }
    
    function getSeason() public view returns (string memory) {
        return season;
    }
}

/*
 truffle mygraion  
truffle mygrations
truffle example
truffle compile
Truffle migrate
*/ 