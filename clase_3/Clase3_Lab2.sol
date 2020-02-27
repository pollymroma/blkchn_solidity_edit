pragma solidity ^0.4.22;

contract Laboratorio2 {
    uint valor;
    struct Persona {
        address billetera;
        string nombre;
        string apellido;
        uint edad;
    }
    Persona private miPersona;
    
    constructor(uint _valorInicial) public {
        valor = _valorInicial;
        miPersona = Persona(0x3a7D7654564645454567, "Paola", "Romanello", _valorInicial);
    }
    
    function recuperarValorGuardado() public view returns(uint) {
        return valor;
    }
    
    function obtenerEdadPersona() public view returns(uint) {
        return miPersona.edad;
    }
}