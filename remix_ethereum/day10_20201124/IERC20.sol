pragma solidity >=0.6.0 <0.8.0;

interface IERC20 {

    function totalSupply() external view returns (uint256); //총 얼마만큼의 토큰을 발행할 것인가?를 결정
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);//보내는 사람은 없다
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);


    //아래의 이벤트는 상속이 가능하다.
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}