pragma solidity >=0.4.22 <0.7.0;

contract Storage {
    uint number;
    string name;
    
    function store(uint256 num) public {
        number = num;
    }
    
    function store_name(string memory _name) public {
        name = _name;
    }
    
    function retreive() public returns (uint256){
        return number;
    }
    
    function retreive_name() public returns (string memory){
        return name;
    }
    
}