pragma solidity ^0.4.22;

contract Laboratorio1 {
    
    address owner;
    uint256[] arrayFijo = new uint256[](5);
    uint256[] lista;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function asignarValor(uint256 valor, uint256 posicion) public {
        arrayFijo[posicion] = valor;
    }
    
    function obtenerValor(uint256 posicion) public view returns(uint256) {
        return arrayFijo[posicion];
    }
    
    function asignarValorLista(uint256 valor) public {
        lista.push(valor);
    }
    
    function obtenerValorLista(uint256 posicion) public view returns(uint256) {
        return lista[posicion];
    }
}