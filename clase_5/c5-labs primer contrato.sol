pragma solidity ^0.5.0;

contract Ejercicio01 {
    address owner;
    uint256 numero;
    
    constructor(uint256 num) public {
        numero = num;
        owner = msg.sender;
    }
    
    function sumarNumero(uint256 _nuevoNum) public view returns (uint256) {
        uint256 c = numero + _nuevoNum;
        require(c >= numero);
        
        return c;
    }
    
}