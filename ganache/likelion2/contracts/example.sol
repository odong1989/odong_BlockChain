/*
const Migrations = artifacts.require("Migrations");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
*/
pragma solidity >=0.4.22 < 0.7.0;

contract example {
    
    function add(uint a, uint b) public view returns (uint256) {
        return a+b;
    }
    
    function sub(uint a, uint b) public view returns (uint256) {
        return a-b;
    }
    
    function mul(uint a, uint b) public view returns (uint256) {
        return a*b;
    }
    
    function div(uint a, uint b) public view returns (uint256) {
        return a / b;
    }
    
    function div2(uint a, uint b) public view returns (uint256, uint256) {
        return (a/b, a%b);
    }
    
    function power(uint a, uint b) public view returns (uint256) {
        return a**b;
    }
}
