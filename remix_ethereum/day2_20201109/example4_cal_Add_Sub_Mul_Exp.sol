pragma solidity >=0.4.22 <0.7.0;

contract example4_cal_Add_Sub_Mul_Exp {
    // 앞의 괄호에는 input값이 뒤의 괄호에는 output 값
    function add(uint a, uint b) public view returns (uint256) {
        return (a+b);
    }
    
    function sub(uint a, uint b) public view returns (uint256) {
        return (a-b);
    }
    
    function mul(uint a, uint b) public view returns (uint256) {
        return (a*b);
    }
    
    function exp(uint a, uint b) public view returns(uint256) {
        return (a/b);
    }

    
}
