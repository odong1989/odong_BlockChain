pragma solidity >=0.4.22 <0.7.0;

contract example3 {
    // 숫자형 선언
    uint a = 4;
    uint b = 2;
    
    // 앞의 괄호에는 input값이 뒤의 괄호에는 output 값
    function add(uint d, uint e) public view returns (uint256, uint256) {
        d = a+d;
        e = e+2;
        return (d, e);
    }
}
