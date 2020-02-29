pragma solidity ^0.4.17;
//import "./jds.sol";

contract Ejercicio {
  
  string mensaje;
  address owner;
  enum Proceso { Inicial, Comenzado, Finalizado }
  
       
   Proceso private estadoDelProceso = Proceso.Inicial;
    
    constructor(string _mensajeInicial) public {
        mensaje = _mensajeInicial;
        estadoDelProceso = Proceso.Comenzado;
    }
    
    function FinalizarProceso() public {
        estadoDelProceso = Proceso.Finalizado;
    }
    
    function obtenerEstadoDelProceso() public view returns (Proceso) {
        return estadoDelProceso;
    }
}