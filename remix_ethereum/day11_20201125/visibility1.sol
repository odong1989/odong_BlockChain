pragma solidity ^0.6.10;

contract Base {
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // This function will not compile since we're trying to call an external function here.
    /*function testExternalFunc() public pure returns (string memory) {
        return externalFunc();
    }*/
}

contract Child is Base {
    // Inherited contracts do not have access to private functions
    // and state variables.
    /*function testExternalFunc() public pure returns (string memory) {
        return externalFunc();
    }*/

    // Internal function call be called inside child contracts.
    function testInternalFunc2() public pure returns (string memory) {
        return internalFunc();
    }
    
    function testpublicFunc() public pure returns (string memory) {
        return publicFunc();
    }
}

uint full = 0;

modifier empty() {	
	require(full == 0;)
	full = 1;
	_;
	full  =0;
}

function gototoilet() public empty {
	if(a person need to go to toilet) {
		person goes to toilet;
	} else {
		everything is fine
	}
}

// calling extrenal and public functions from other contract
contract Child2  {
    Base bs = new Base();
    function testExternalFunc2() external view returns (string memory) {
        return bs.externalFunc();
    }
    function publicFunc2() public view returns (string memory) {
        return bs.publicFunc();
    }
}