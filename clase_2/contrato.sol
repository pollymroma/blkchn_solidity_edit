pragma solidity ^0.4.17;

contract EjemploPrimerContrato {
    string public message;
    
    function EjemploPrimerContrato(string initialMessage) public {
        message = initialMessage; 
    }
    
    function myMessage() public view returns (string) {
        return message;
    }
    
    function getExpression() public pure returns (string) {
        return "Bievenido a Solidity";
    }
}