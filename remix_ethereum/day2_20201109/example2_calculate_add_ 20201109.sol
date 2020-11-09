pragma solidity >=0.4.22 <0.7.0;

contract example3 {
    // 숫자형(uint) 선언
    uint a = 1;
    uint b = 2;
    uint c = 3;
    
    // 앞의 괄호에는 input값이 뒤의 괄호에는 output 값
    function add(uint d, uint e, uint f) public view returns (uint256, uint256, uint256, uint256) {
        d = d-a;
        e = e-b;
        f = f-c;
        return (d, e, f, d+e+f);
    }
}
