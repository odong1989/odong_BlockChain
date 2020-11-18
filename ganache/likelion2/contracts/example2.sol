pragma solidity >=0.4.22 <0.7.0;

contract Example2 {
    uint[] array;
    
    function push1() public {
        array.push(1);
    }
    
    function push2() public {
        array.push(2);
    }
    
    function push3() public {
        array.push(3);
    }
    
    function pop() public {
        array.pop();
    }
    
    function pusheven(uint256  a) public {
        if(a%2 ==0)  {
            array.push(a);
        }
    }
    
    function pushcon1(uint256  a) public {
        if(10<=a && 15>=a) {
            array.push(a);
        }
    }
    
    function pushcon2(uint256 a) public {
        if(a>=100 || a%3==0) {
            array.push(a);
        }
    } 
    
    function get(uint256 a) public view returns(uint256) {
        return array[a];
    } 
}
