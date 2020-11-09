pragma solidity >=0.4.22 <0.7.0;

contract example {
    // 숫자형 선언
    uint a = 4;
    uint b = 3;
    
    uint c = a**b;
    
    // 앞의 괄호에는 input값이 뒤의 괄호에는 output 값
    function retreive() public view returns (uint256){
        return c;
    }        
    function retreive2() public view returns (uint256){
        return b**a;        

    }
}
