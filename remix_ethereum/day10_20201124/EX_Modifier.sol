pragma solidity >=0.4.16 <0.7.0;
contract Lib {
    address public owner;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    uint a;

    function sown() public {
        owner = msg.sender;
    }

    function gown() public view returns (address, uint) {
        return (owner, a);
    }
    
    function getmsgsender() public view onlyOwner returns (address) {
        return msg.sender;
    }
}
