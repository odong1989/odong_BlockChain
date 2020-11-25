pragma solidity >=0.4.16 <0.7.0;
contract Lib {
    address public owner;// 
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    modifier ashouldbefive {
        require(a == 5);
        _;
    }
    
    uint a=5;


    function sown() public {//setOwner의 줄임말. 
        //③계정1로 먼저 swon을 실행한다. 그러면 오너1가 메시지 센더가 된다.(계정1인 이유는 그냥 편의상 바로 설정되는 애로 진행한 거임)
        owner = msg.sender;//메시지 센더로 설정. (=계정1이 메시지 센더가 되었습니다.)
        a = 3;
    }

    function gown() public view returns (address, uint) { //getOwner의 줄임말. 
        return (owner, a);
    }
    
    function getmsgsender() public view onlyOwner returns (address) { //제어자 modifier onlyOwner {..}의 내용들이 먼저 실행된다.
        return msg.sender;
    }
    
    function getmsgsender2() public view returns (address) {
        return msg.sender;
    }
    
    function check() public view ashouldbefive returns (string memory) {//제어자 modifier onlyOwner {..}의 내용들이 먼저 실행된다.
        return "a is five";
    }
}