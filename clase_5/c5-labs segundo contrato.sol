pragma solidity ^0.5.0;

contract Ejercicio01 {
    address owner;
    uint256 numero;
    
    constructor(uint256 _num) public {
        numero = _num;
        owner = msg.sender;
    }
    
    function restarNumero(uint256 _nuevoNum) public validarUnderflow(_nuevoNum) view returns (uint256) {
        
        uint256 c = numero - _nuevoNum;
        
        return c;
    }
    
    modifier validarUnderflow(uint256 _num) {
        require(numero >= _num);
        _;
    }
    