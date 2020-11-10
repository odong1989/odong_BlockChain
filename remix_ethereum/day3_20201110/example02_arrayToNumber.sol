pragma solidity >=0.4.22 <0.7.0;

contract exampleArray {
    
    uint[] array;// uint[] : 크기를 정하지 않음. 유동적이다. 계속 증가하여 받을 수있다.
    
    function push1() public {
        //어레이에 1을 넣기
        array.push(1);
    }
    
    function push2() public {
        //어레이에 2을 넣기
        array.push(2);
    }
    
    function push3() public {
        //어레이에 2을 넣기
        array.push(3);        
    }
    
    function pop() public {
        array.pop();        //가장 최근에 푸쉬된 것을 빼낸다. 
    }
    
    //짝수만 입력하는 푸쉬.
    function pusheven(uint256 a ) public {
        if(a%2 == 0 ){
            array.push(a);
        }
    }
    
    //10~15사이의 숫자만 push할 수 있는 함수
    function pushTenToFifteen(uint256 a) public {
        if( 10<=a && a<=15 ){
            array.push(a);            
        }
    }
    
    //100보다 크거나 3의 배수이면 push
    function pushExtend3or100uppera(uint256 a) public {
        if( a>=100 || a%3==0 ){
            array.push(a);            
        }
    }
    
    //몇 번째 칸의 값을 알고 싶다. 배열의 칸은 0부터 시작한다.
    function get(uint256 a) public view returns(uint256 ){
        return array[a];
    }
}