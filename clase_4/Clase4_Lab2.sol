pragma solidity ^0.4.22;

contract Laboratorio2 {
    
    address owner;
    address[] public apostadores;
    address[] private listaEspecial;
    
    constructor() public {
        owner = msg.sender;
        listaEspecial.push(msg.sender);
    }
    
    function apostar() public payable {
        require(msg.value >= 1 ether);
        apostadores.push(msg.sender);
    }
    
    function obtenerListaApostadores() public view returns(address[]) {
        return apostadores;
    }
    
    function obtenerListaEspecial() public view returns(address[]) {
        require(msg.sender == owner);
        return listaEspecial;
    }
    
    function apuestaEspecial() public payable {
        require(msg.value >= 5 ether);
        require(msg.sender != owner);
        listaEspecial.push(msg.sender);
    }
}