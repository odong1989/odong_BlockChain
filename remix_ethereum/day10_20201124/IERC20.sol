pragma solidity >=0.6.0 <0.8.0;

interface IERC20 {//인터페이스를 구현한다.

    function totalSupply() external view returns (uint256); 
    //총 얼마만큼의 토큰을 발행할 것인가?를 결정
    
    function balanceOf(address account) external view returns (uint256);
    //해당주소가 얼마만큼의 잔고(발행한 토큰에 대한 잔고)를 갖고 있는가?
    //토큰을 현화로 비유하면 오직! 원화에 대해서만 리턴하는셈.
    //내잔고 확인 :  function balanceOf(나의 account) 

    function transfer(address recipient, uint256 amount) external returns (bool);//보내는 사람은 없다
    //수금자 주소, 송금액을 인풋, 잘 전송여부를 bool값(참/거짓)으로 리턴한다.
    //b가 C에게 10만큼 보낸다 : transfer(C주소, 10)
    //송금시 송금자가 실행시키는 함수.(돈을 움직이는 함수1)
    function allowance(address owner, address spender) external view returns (uint256);
    //오너 혹은 스펜더가 얼마만큼의 토큰을 받을 수 잇는가?(#야, 홍길동이 얼마나 받을 수 있대??)
    //msg.sender가 누군가에게 보내겠다고 허가한 돈의 값을 확인할 때
    //(예)b는 a에게 얼마를 허가받았는지 확인한다. : function allowance(A,B)        

    function approve(address spender, uint256 amount) external returns (bool);
    //토큰을 만든 CA가 어떤 스펀에게 어느정도의 금액보낼수 있는가 없는가에대한 것을 넣고 결과를 불값으로 리턴.
    //[소선아님 의견]msg.sender(비유하면 은행시스템)가 누군가에게 얼마를 보내겠다고 허가할 때: approve
    //(예)A는 B에게100을 허한다 : function approve(B,100)
    //external이라는 원칙상은 누구나 볼 수 있지만 실제는 당사자만 가능.

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    // 돈을 보낼때 사용한다.가 아님...-_- 낚임 안됨;
    //SPENDER는 돈을 쏘는 사람.
    //송금시 송금대행자(배달의민족, ㅇㅇ은행등)들이 실시하는 함수.(돈을 움직이는 함수2)

    //아래의 이벤트는 상속이 가능하다.
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}