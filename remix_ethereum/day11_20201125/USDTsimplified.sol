pragma solidity ^0.4.17;

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {}

    function div(uint256 a, uint256 b) internal pure returns (uint256) { }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {}

    function add(uint256 a, uint256 b) internal pure returns (uint256) {}
}

contract Ownable {
    address public owner;

    function Ownable() public {}

    modifier onlyOwner() {}

    function transferOwnership(address newOwner) public onlyOwner {}

}

contract ERC20Basic {
    uint public _totalSupply;
    function totalSupply() public constant returns (uint);
    function balanceOf(address who) public constant returns (uint);
    function transfer(address to, uint value) public;
    event Transfer(address indexed from, address indexed to, uint value);
}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public constant returns (uint);
    function transferFrom(address from, address to, uint value) public;
    function approve(address spender, uint value) public;
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract BasicToken is Ownable, ERC20Basic {
    using SafeMath for uint;

    mapping(address => uint) public balances;
 
    uint public basisPointsRate = 0;
    uint public maximumFee = 0;

    modifier onlyPayloadSize(uint size) {}

    function transfer(address _to, uint _value) public onlyPayloadSize(2 * 32) {}

    function balanceOf(address _owner) public constant returns (uint balance) {}

}

contract StandardToken is BasicToken, ERC20 {

    mapping (address => mapping (address => uint)) public allowed;

    uint public constant MAX_UINT = 2**256 - 1;

    function transferFrom(address _from, address _to, uint _value) public onlyPayloadSize(3 * 32) {}
    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) {}
    function allowance(address _owner, address _spender) public constant returns (uint remaining) {}

}


contract Pausable is Ownable {
  event Pause();
  event Unpause();

  bool public paused = false;

  modifier whenNotPaused() {}
  modifier whenPaused() {}

  function pause() onlyOwner whenNotPaused public {}
  function unpause() onlyOwner whenPaused public {}
}

contract BlackList is Ownable, BasicToken {
    
    function getBlackListStatus(address _maker) external constant returns (bool) {}

    function getOwner() external constant returns (address) {}

    mapping (address => bool) public isBlackListed;
    
    function addBlackList (address _evilUser) public onlyOwner {}
    function removeBlackList (address _clearedUser) public onlyOwner {}
    function destroyBlackFunds (address _blackListedUser) public onlyOwner {}

    event DestroyedBlackFunds(address _blackListedUser, uint _balance);
    event AddedBlackList(address _user);
    event RemovedBlackList(address _user);

}

contract UpgradedStandardToken is StandardToken{
    function transferByLegacy(address from, address to, uint value) public;
    function transferFromByLegacy(address sender, address from, address spender, uint value) public;
    function approveByLegacy(address from, address spender, uint value) public;
}

contract TetherToken is Pausable, StandardToken, BlackList {

    string public name;
    string public symbol;
    uint public decimals;
    address public upgradedAddress;
    bool public deprecated;

    function TetherToken(uint _initialSupply, string _name, string _symbol, uint _decimals) public {}
    function transfer(address _to, uint _value) public whenNotPaused {}
    function transferFrom(address _from, address _to, uint _value) public whenNotPaused {}
    function balanceOf(address who) public constant returns (uint) {}
    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) {}
    function allowance(address _owner, address _spender) public constant returns (uint remaining) {}
    function deprecate(address _upgradedAddress) public onlyOwner {}
    function totalSupply() public constant returns (uint) {}
    function issue(uint amount) public onlyOwner {}
    function redeem(uint amount) public onlyOwner {}
    function setParams(uint newBasisPoints, uint newMaxFee) public onlyOwner {}

    event Issue(uint amount);

    event Redeem(uint amount);

    event Deprecate(address newAddress);

    event Params(uint feeBasisPoints, uint maxFee);
}