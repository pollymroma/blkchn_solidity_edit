pragma solidity ^0.4.17;
//import "./jds.sol";

contract Ejercicio {
       
   struct Persona {
       address billetera;
       string nombre;
       string apellido;
       uint edad;
   }
   
   uint valor;
   Persona private miPersona;
    
    constructor(uint _valorInicial) public {
        valor = _valorInicial;
        miPersona = Persona(0x3a7D7125ba608175bBb48E014274127D81f4c25a, "Joaquin", "de Sousa", _valorInicial);
    }
    
    function recuperarValorGuardado() public view returns(uint) {
        return valor;
    }
    
    function obtenerEdadPersona() public view returns (uint) {
        return miPersona.edad;
    }
}