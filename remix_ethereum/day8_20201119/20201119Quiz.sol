/*
9) 은행 금고의 비밀번호는 4자리 입니다. 
은행은 여러분들의 비밀번호는 모르며 검증할 수 있는 방법만 각 자리에는 0~9까지의 숫자가 들어갈 수 있습니다. 
여러분은 실제 비밀번호를 모르는 상태이며, 
앞 자리 2개의 숫자가 0,4 인 것을 알고 있습니다. 실제 비밀번호를 알아내는 함수를 구현하세요. 

실제 비밀번호 : 0429

*/
pragma solidity >=0.4.22 < 0.7.0;

contract Quiz8{
    bytes32[] hashPW; //각 비밀번호에 대한 해싱값만 보유(비밀번호는 모른다)
    
    //사용자의 비밀번호에 대한 해시값을 생성위한 함수
    function hashByPW(uint pw) public{
        bytes32 temp = keccak256(abi.encodePacked(pw));
        hashPW.push(temp);   
    }

    function logInAccount(uint pw) view public returns(string memory resultLogIn){
        bytes32 temp = keccak256(abi.encodePacked(pw));
        
        for(uint i=0; i<hashPW.length; i++){
            if(hashPW[i] == temp){
                return("계좌접속OK.");
            }
            else{
                return("계좌비번이 일치 않습니다");
            }
        }
    }
}