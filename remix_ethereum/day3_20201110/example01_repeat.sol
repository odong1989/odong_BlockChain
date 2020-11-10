pragma solidity >=0.4.22 <0.7.0;

contract example01_20201110 { 
    
    function add(uint a, uint b, uint c) public view returns (uint256) {
        return (a+b+c);
    }
    
    function mul(uint a, uint b, uint c) public view returns (uint256){
        return (a*b*c);
    }
}
