pragma solidity ^0.4.24;
import "./EducacionITControlled.sol";

contract EducacionITToken is EducacionITControlled { //permite que use cosas del Controlled aca (inheritance)
  //definimos funciones y eventos del standard ERC20

  event Transfer(address _from, address _to, uint256 _value);
  mapping (address => uint256) public balances;
  uint256 public totalSupply; //maxima cantidad de tokens

  constructor() public {
    controller = msg.sender;
  }

  function balanceOf(address _owner) public view returns(uint256 balance) {
    return balances[_owner];
  }

  function transfer(address _to, uint256 _value) public returns(bool success) {
    realTransfer(msg.sender, _to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns(bool success) {
    realTransfer(_from, _to, _value);
  }

  //from origen, el que vende
  function realTransfer(address _from, address _to, uint256 _value) internal returns(bool success) {
    //valido el valor //internal no se puede llamar desde fuera de la blockchain
    if (_value == 0) return true;
    // para el from, el origen
    uint256 previusBalanceFrom = balanceOf(_from); //verifico si quien envia los tokens tiene la cantidad suficiente
    if (previousBalanceFrom < _value) {
      return false; //no tiene cantidad suficiente en su balance, no llega ni a value
    }
    // para el to, el destinatario
    uint256 previousBalanceTo = balanceOf(_to);
    require(previousBalanceTo + _value > previousBalanceTo);
    balances[_from] = balances[_from] - _value; // restamos tokens al emisor
    balances[_to] = balances[_to] + _value; // incrementamos tokens al receptor

    emit Transfer(_from, _to, _value);

    return true;
  }

  function generateTokens(address _owner, uint256 _amount) returns(bool success) {
    uint256 currentTotalSupply = totalSupply;
    //validar no superar la cantidad que definimos como max de generateTokens
    require(currentTotalSupply + _amount >= totalSupply); //evitamos overflow de tokens
    // >= o deberia ser <= ???

    uint256 previousBalanceTo = balanceOf(_owner);
    require(previousBalanceTo + _amount > previousBalanceTo);

    totalSupply = currentTotalSupply + _amount;
    balances[_owner] = previousBalanceTo + _amount;

    emit Transfer(0, _owner, _amount);
    return true;
  }
}
