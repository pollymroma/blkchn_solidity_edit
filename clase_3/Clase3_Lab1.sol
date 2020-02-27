pragma solidity ^0.4.22;

contract Laboratorio1 {
    string mensaje;
    enum Proceso { Inicial, Comenzado, Finalizado }
    Proceso private estadoDelProceso = Proceso.Inicial;
    
    constructor(string _mensajeInicial) public {
        mensaje = _mensajeInicial;
        estadoDelProceso = Proceso.Comenzado;
    }
    
    function finalizarProceso() public {
        estadoDelProceso = Proceso.Finalizado;
    }
    
    function obtenerEstadoDelProceso() public view returns(Proceso) {
        return estadoDelProceso;
    }
}