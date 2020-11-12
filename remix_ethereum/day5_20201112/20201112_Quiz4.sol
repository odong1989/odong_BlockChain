// 
// https://solidity-kr.readthedocs.io/ko/latest/index.html

//김보성
/*
4-1) 이름 등록부

사람들이 이름을 등록을 해놓는 방명록 프로그램입니다. 
특정이름을 보유한 사람은 등록을 할 수 없습니다. 

등록이 안될 이름은 James

4-2) Password 맟추기

당신은 회원들의 정보를 갖고 있는 서비스 제공자입니다. 
회원들은 회원등록을 할 때 2가지 입력을 합니다. 
ID와 비밀번호입니다. 여러분은 결과 해시값만을 보유하고 있습니다. 

추후에 가입한 회원은 ID와 비밀번호를 입력하여 로그인을 할 수 있으며 그렇지 않으면 Error 메세지를 반환합니다.

*/

pragma solidity >=0.4.22 < 0.7.0;

contract Quiz4{
    string[] userName; 
    bytes32[] userHashValue; // ID,패스워드는 불허.
    

    //4-1) 이름 등록부
    function guestWrite(string memory name) public view returns(string memory authority){ //authority : 권한(방명록 작성가능여부)
        if(keccak256(bytes(name)) == keccak256(bytes("james")) || keccak256(bytes(name)) == keccak256(bytes("James")) ){
            return("James씨는 불가입니다.");
        }
        else {
            return("방명록 작성가능");
        }
    }
    
    //4-2) 로그인서비스(단,해시값만활용)
    //4-2-1)회원가입(해시값생성기)
    function signUp(string memory id, string memory pw) public{
        bytes32 temp = keccak256(abi.encodePacked(id, pw));
        userHashValue.push(temp);    //keccak256(abi.encodePacked(a, b))힌트입니다
    }

    function logIn(string memory id, string memory pw) view public returns(string memory resultLogIn){
        bytes32 temp = keccak256(abi.encodePacked(id, pw));
        
        for(uint i=0; i<userHashValue.length; i++){
            if(userHashValue[i] == temp){
                return("로그인되었습니다.");
            }
            else{
                return("로그인실패");
            }
        }
    }
}