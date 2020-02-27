pragma solidity ^0.4.22;

contract Laboratorio3 {
    string name;
    mapping(address => uint256) public balances; //saldo de la cuenta asociada a ese address
    
    constructor(string _name) public {
        name = _name;
    }
    
    function sumar(uint256 _addbalance) public {
        balances[msg.sender] = balances[msg.sender] + _addbalance;
    }
    
    function restar(uint256 _newbalance) private {
        balances[msg.sender] = balances[msg.sender] - _newbalance;
    }
    
    function hacerAlgo(uint256 _numero) public returns(string) {
        restar(_numero - 2);
        return "Chau";
    }    
}

