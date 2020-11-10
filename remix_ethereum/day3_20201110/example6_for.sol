pragma solidity >=0.4.22 < 0.7.0;

contract Forloop {
    //1부터 10까지 더하기
    function sum1to10() public view returns(uint256){
        uint total =0;
        
        for(uint i =0; i <=10; i++){
            total += i;
        }
        return total;
    }
 
 
    //if문 for문 공동활용   
    //0이상 100이하의 숫자들 중
    //2,3,5로 나누어지지 않는 수들의 합
    function dontDivideEx1() public view returns(uint256){
        uint total=0;
        
        for(uint i=0;i<=100;i++){
            if(i%2!=0 && i%3!=0 && i%5!=0){
                total=total + i;
            }
        }
        return total;
    }
    
    //1이상 15이하인 숫자들 중
    //2,3,5로 나누어 떨어지지 않는 수들의 합을 구하고
    //이들을 모아놓은 배열을 구하시오
    //배열에 담긴 숫자를 볼 수 있는 출력함수도 생성하시오
    
    
    uint[] totalArray;  //함수내에 선언하면 에러남... -ㅅ-;; 
    uint total=0;
    function dontDivideAndArrayEx() public { //배열 사용시 출력파트에 view를 써도 에러남. 에라이... -_-)
           for(uint i =0;i<=15; i++){
            if(i%2!=0 && i%3!=0 && i%5!=0){
                totalArray.push(i); //
                total=total + i;
            }
        }
    }
    
    function resultDontDivideAndArrayEx() public view returns(uint256){
        return(total);     
    }
    
    //배열의 한개의 셀당 저장된 값을 출력.
    function getlist(uint256 cell) public view returns(uint256,uint256){
        return(cell,totalArray[cell]);    
    }

    
}