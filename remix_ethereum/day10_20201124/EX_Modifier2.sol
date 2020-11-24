pragma solidity >=0.4.16 <0.7.0;
contract Lib {
    address public owner;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    modifier ashouldbefive {
        require(a == 5);
        _;
    }
    
    uint a=5;

    function sown() public {
        owner = msg.sender;
        a = 3;
    }

    function gown() public view returns (address, uint) {
        return (owner, a);
    }
    
    function getmsgsender() public view onlyOwner returns (address) {
        return msg.sender;
    }
    
    function getmsgsender2() public view returns (address) {
        return msg.sender;
    }
    
    
    function check() public view ashouldbefive returns (string memory) {
        return "a is five";
    }
}
