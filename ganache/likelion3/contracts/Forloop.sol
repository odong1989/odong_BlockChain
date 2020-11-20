pragma solidity >=0.4.22 <0.7.0;

contract Forloop {
    uint  a=0;
    uint[] numbers;
    
    function add() public {
        for(uint i=1;i<16;i++) {
            if(i%2!=0 && i%3!=0 && i%5!=0) {
                a += i;
                numbers.push(i);
            }
        }
    }
    
    function getAdd() public view returns(uint256) {
        return a;
    }
    
    function getList(uint256 a) public view returns(uint256, uint256) {
        return (a, numbers[a]);
    }
}
