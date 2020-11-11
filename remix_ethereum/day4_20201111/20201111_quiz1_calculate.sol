//이름: 김보성
/*
1) 계산기 문제 

2개의 Input값을 가지고 1개의 output값을 가지는 4개의 함수를 만드시오.
각각의 함수는 더하기, 빼기, 곱하기, 나누기(몫과 나머지 반환)를 실행합니다.
*/
pragma solidity >=0.4.22 < 0.7.0;

contract Quiz1_calculate{

    function add(uint value1, uint value2) view public returns(uint result){
        return(value1+ value2);
    }
    
    function sub(uint value1, uint value2) view public returns(uint result){
        return(value1-value2);
    }
    
    function mul(uint value1, uint value2) view public returns(uint result){
        return(value1*value2);
    }
    
    function div(uint value1, uint value2) view public returns(uint result){
        return(value1/value2);
    }
    
}
