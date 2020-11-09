pragma solidity >=0.4.22 <0.7.0;

contract example5 {
    //나누기 
    function division(uint a, uint b) public view returns (uint256) {
        return (a/b);
    }
    
    //나머지
    function Remainder(uint a, uint b) public view returns(uint256) {
        return (a%b);
    }

}
