/*
12) 은행 계좌 잔고 확인 및 결제 시스템을 만들어주세요. 여러분의 잔고는 여러분 스스로와 저만이 확인할 수 있습니다. 
여러분의 계좌에서 다른 계좌로 돈을 전송하는 기능은 오직 그 계정의 주인만이 할 수 있습니다. 
잔고보다 많은 돈을 보내려고 하면 error 메세지를 반환해주세요. 100이상의 돈을 보내려고 하면 경고 메세지를 반환해주세요. 
보낸 후의 계좌의 잔고가 50이하가 될 것으로 예상되면, 경고 메세지를 반환해주세요.
0xB63821320A1FA1ABf15d92C4561538e63f6ccdcC
*/

pragma solidity >=0.4.22 < 0.7.0;
contract Quiz1125{
/*
12) 은행 계좌 잔고 확인 및 결제 시스템을 만들어주세요. 여러분의 잔고는 여러분 스스로와 저만이 확인할 수 있습니다. 


*/

    //구조체 workInf 생성
    struct account{
        bytes32 pwHash; // ID,패스워드는 불허.
        uint money;             
    } 
    
    account[] public accountGroup;  
    
    function createNewAccount(string memory _password , uint _money) public{ 
        bytes32 temp = keccak256(abi.encodePacked(_password));
        accountGroup.push(account(temp, _money) );
    }    
    
    

    function sendMoney (string memory _password , uint _money, uint _accountNumber ) view public returns(string memory report){
        bytes32 temp = keccak256(abi.encodePacked(_password));
        
        //여러분의 계좌에서 다른 계좌로 돈을 전송하는 기능은 오직 그 계정의 주인만이 할 수 있습니다.         
        for(uint i=0; i< accountGroup.length;i++){
            if(temp == accountGroup[i].pwHash){
              //  return(studentGroup[i].name , studentGroup[i].credit );
            }
        }
    }
    
    //잔고보다 많은 돈을 보내려고 하면 error 메세지를 반환해주세요.
    //100이상의 돈을 보내려고 하면 경고 메세지를 반환해주세요. 
    
    
    //보낸 후의 계좌의 잔고가 50이하가 될 것으로 예상되면,경고 메세지를 반환해주세요.    
        
}