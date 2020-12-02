//김보성
/*
18) 은행 어플입니다.
1만원 인출, 2만원 인출, 5만원 인출, 10만원 인출, 전액 인출 기능을 구현해야합니다. 
10만원 인출은 5번 밖에 못합니다. 75만원이상 인출은 불가능합니다. 인출은 owner만 가능하다.
10만원 5번
5만원 4번
70만원
2만원 2번
74만원
2만원 1번
x
*/

pragma solidity >=0.4.16 <0.7.0;
contract Lib {
    address public owner;
    
        
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
        //print("오너가 아닙니다.");
    }
    
    uint balance=1000000;
    uint cnt_limit100000 = 0; //10만원 인출은 5번 밖에 못합니다. 
    function sown() public {
        owner = msg.sender;
    }

    function gown() public view returns (address, uint) {
        return (owner, balance);
    }
    
    function getmsgsender() public view onlyOwner returns (address) {
        return msg.sender;
    }
/*
1만원 인출, 2만원 인출, 5만원 인출, 10만원 인출, 전액 인출 기능을 구현해야합니다. 

10만원 인출은 5번 밖에 못합니다. 
10만원 5번
5만원 4번
70만원
2만원 2번
74만원
2만원 1번

*/ 
    //Q1.인출(Withdrawal)은 owner만 가능하다.                              송금액,      송금후 잔고, 정상처리여부안내문    
    function Withdrawal(uint price) public payable onlyOwner returns (uint Withdrawal, uint Balance, string memory result) {
        //Q2. 75만원이상 인출은 불가능합니다. 
        if(price>=750000){
            return(0,0,"75만원이상 인출불가");
        }
        
        //Q3. 10만원 인출은 5번 밖에 못합니다. 
        if(price == 100000){ 
            if(cnt_limit100000 <=5 ){
                cnt_limit100000++;
                balance=balance-price;
                return(cnt_limit100000,balance,"10만원 인출 5회제한에 걸립니다.");                                
            }
            else{
                return(0,0,"10만원 인출 5회제한에 걸립니다.");                
            }
        }
        //Q3 END
        
        //Q4. 5만원 인출
        if(price == 50000){ 
            if(balance >= price ){
                return(0,balance,"10만원 인출 5회제한에 걸립니다.");                                
            }
            else{
                return(0,0,"10만원 인출 5회제한에 걸립니다.");                
            }
        }
        
        /*
        //Q5. 2만원 인출,
        if(price == 100000){ 
            if(cnt_limit100000 <=5 ){
                cnt_limit100000++;
                return(0,balance,"10만원 인출 5회제한에 걸립니다.");                                
            }
            else{
                return(0,0,"10만원 인출 5회제한에 걸립니다.");                
            }
        }        
        //Q6. 1만원 인출
        if(price == 100000){ 
            if(cnt_limit100000 <=5 ){
                cnt_limit100000++;
                return(0,balance,"10만원 인출 5회제한에 걸립니다.");                                
            }
            else{
                return(0,0,"10만원 인출 5회제한에 걸립니다.");                
            }
        }
        */
        
    }
}