pragma solidity ^0.4.24;

contract Ejemplo1 {
    
    address private owner;
    uint256 private numero;
    
    constructor (uint256 number) public {
        owner = msg.sender;
        numero = number;
    }
    
    function getNumber() public view returns(uint256) {
        return numero;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function() payable public { //funcion de fallback, sin nombre
        numero = numero +1;
    }
}