pragma solidity >=0.4.16 <0.7.0;
contract Pay {
    uint balance = 0;
    function pay() public payable {
        balance += msg.value;
    }
    
    function getBalance() public view returns(uint256) {
        return balance;
    }
}
