pragma solidity ^0.6.10;
contract Base {
    // Private function can only be called - inside this contract Contracts that inherit this contract cannot call this function.
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }
    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }
    // Internal function can be called - inside this contract  - inside contracts that inherit this contract
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }
    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }
    // Public functions can be called - inside this contract - inside contracts that inherit this contract - by other contracts and accounts
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }
    // External functions can only be called - by other contracts and accounts
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }
    // This function will not compile since we’re trying to call an external function here.
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }
    // State variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // State variables cannot be external so this code won’t compile.
    // string external externalVar = “my external variable”;
}
contract Child is Base {//베이스로부터 상속받음
   //  Inherited contracts do not have access to private functions
    // and state variables.
     function testExternalFunc() public pure returns (string memory) {
         return privateFunc();
     }
    // Internal function call be called inside child contracts.
    function testInternalFunc2() public pure returns (string memory) {
        return internalFunc();
    }
    function testpublicFunc() public pure returns (string memory) {
        return publicFunc();
    }
}
// calling extrenal and public functions from other contract
contract Child2  {//상속없음
    Base bs = new Base();
    function testExternalFunc2() external view returns (string memory) {
        return bs.externalFunc();
    }
    function publicFunc2() public view returns (string memory) {
        return bs.publicFunc();
    }
}