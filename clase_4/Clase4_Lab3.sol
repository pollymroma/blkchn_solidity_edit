pragma solidity ^0.4.22;

contract Laboratorio3 {
    
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function cualquieraPuedeLlamar(string _mensaje) public pure returns(string, string, int) {
        return ("Hola", _mensaje, 12345);
    }
    
    function cualquieraPuedeLlamarDos(string _mensaje1, string _mensaje2) public payable returns(string, string, int) {
        //maneja dinero, no puede ir como view
        require(msg.sender == owner);
        require(msg.value >= 1 ether);
        return (_mensaje1, _mensaje2, 1234);
    }
}