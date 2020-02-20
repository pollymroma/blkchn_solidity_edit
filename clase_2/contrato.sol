pragma solidity ^0.4.17;

contract EjemploPrimerContrato {
    string public message;
    string private finalMessage;
    
    function EjemploPrimerContrato(string initialMessage, string otherMessage) public {
        message = initialMessage;
        finalMessage = otherMessage;
    }
    
    function myMessage() public view returns (string) {
        return message;
    }
    
    function getExpression() public pure returns (string) {
        return "Bievenido a Solidity";
    }
    
    function myFinalMessage() public view returns (string) {
        return finalMessage;
    }
}