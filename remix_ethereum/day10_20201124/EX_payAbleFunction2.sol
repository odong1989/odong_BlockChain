pragma solidity >=0.4.16 <0.7.0;
contract Pay {
    uint balance = 0;
    function pay() public payable {//getBalance,getBalance2 둘에게 모두 영향끼침         
        balance += msg.value;
    }
    
    function getBalance() public view returns(uint256) {
        return balance;
    }
    
    function getBalance2() public payable returns(uint256) {
        return balance;
    }
    
    function returnbalance() public view returns(uint) {
        return address(this).balance;
    }
}
