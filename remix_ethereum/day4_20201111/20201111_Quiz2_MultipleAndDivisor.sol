
//이름 :김보성
/*
2) 배수 약수 문제

1부터 25까지의 숫자중에서 2,3,5,7로 나누어 떨어지지 않는 숫자들의 합과 개수 
그리고 이들을 보관하고 있는 배열을 구하시오. 

합과 개수는 1개의 함수에서 볼 수 있어야 하며, 
배열 내 몇번째 요소가 무엇인지 알 수 있게 해주는 함수가 필요하다.
*/
pragma solidity >=0.4.22 < 0.7.0;
contract Quiz2_MultipleAndDivisor{
    
uint[] multiples;
uint totalMultiples=0;

function multipleArray() public{
    for(uint i=0;i<=25;i++){
        if(i%2!=0 && i%3!=0 && i%5!=0 && i%7!=0){
            multiples.push(i);
            totalMultiples+=i;
        }
    }    
}

//해당되는배수&약수의 총합
function totalValue() view public returns(uint totalValue){
    return(totalMultiples);    
}

//해당배수&약수의 배열길이 리턴
function arrayLength() view public returns(uint arrayLength){
    return(multiples.length);    
}


//개인용-입력정상확인용
function pointValue(uint cellPoint) view public returns(uint cellValue){
    return(multiples[cellPoint]);            
}    

    
}