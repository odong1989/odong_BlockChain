pragma solidity >=0.4.22 < 0.7.0;
//김보성
/*
아래의 함수를 만드세요

1~3을 입력하면 입력한 수의 제곱을 반환받습니다.
4~6을 입력하면 입력한 수의 2배를 반환받습니다.
7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환받습니다.
10을 입력하면 Error를 반환받습니다.
*/
contract Quiz5_1{

    function calCase(uint userIn) view public returns(uint calResult,string memory errorMessage){
        if(1<=userIn && userIn<=3){
            return (userIn*userIn, "입력한 수의 제곱을 반환.");
        }
        else if(4<=userIn && userIn<=6){
            return (userIn*2, "입력한 수의 2배를 반환.");
        }
        else if(7<=userIn && userIn<=9){
            return (userIn%3,"입력한 수를 3으로 나눈 나머지를 반환.");
        }
        else{
            return(0,"에러발생(미지정)");
        }
        
    }

}