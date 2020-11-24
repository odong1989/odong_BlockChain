pragma solidity >=0.4.22 <0.7.0;

contract example2 {
    // 숫자형 선언
    uint a = 4;
    uint b = 2;
    
    // 앞의 괄호에는 input값이 뒤의 괄호에는 output 값, pure로
    function add(uint d) public returns (uint256) {
        d = a+d;
        return d;
    }

    // 앞의 괄호에는 input값이 뒤의 괄호에는 output 값, pure로
    function add2(uint d) public returns (uint256) {
        d = a+d;
        return d;
    } 
    
    // 앞의 괄호에는 input값이 뒤의 괄호에는 output 값
    function retreive() public returns (uint256){
        return a;
    }
    
    function retreive2() public returns (uint256) {
        return b**a;
    }
}
