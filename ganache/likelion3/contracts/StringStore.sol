pragma solidity >=0.4.22 <0.7.0;

contract StringStore {
    string[] sarray;
    
    function push1() public {
        sarray.push("a");
    }
    
    function push2() public {
        sarray.push("b");
    }
    
    function push3() public  {
        sarray.push("c");
    }
    
    function pop() public {
        sarray.pop();
    }
    
    function pushcon1(string memory aaa) public {
        if(keccak256(bytes(aaa)) == keccak256(bytes("a"))) {
            sarray.push(aaa);
        }
    }
    
    function pushcon2(string memory a2) public {
        if(keccak256(bytes(a2))!=keccak256(bytes("james"))) {
            sarray.push(a2);
        }
    }
    
    function get(uint256 a) public view returns(string memory) {
        return  sarray[a];
    }
}
