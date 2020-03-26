pragma solidity ^0.4.24;

import "./EducacionITController.sol";
import "./EducacionITToken.sol";
import "./EducacionITOwned.sol";

contract EducacionITICO is EducacionITToken, EducacionITController, EducacionITOwned {

  uint256 constant public limit = 200; //cant maxima de dinero en ether
  uint256 constant public equivalence = 250; //cant de tokens que vamos a dar por cada ether recibido
  uint256 public totalCollected;
  EducacionITToken tokens;
  address myCta = 0x525523;

  constructor() public {
    owner = msg.sender;
    totalCollected = 0;
  }

  function initializationToken(address _token, address _destiny) {
    require(address(tokens) == 0x0);
    tokens = EducacionITToken(_token);
    require(tokens.totalSupply == 0);
    require(tokens.controller == address(this));
  }

  function proxyPayment(address _dir) payable returns(bool) {
    return realBuy(_dir, msg.value);
  }

  function realBuy(address _sender, uint256 _amount) public returns(bool) {
    //calcular la cantidad de token a generar
    uint256 tokensGenerate = _amount * equivalence;
    //validar de no pasarnos en lo estipulado en el contrato
    require(totalCollected + _amount <= limit);
    //generar tokens
    assert(tokens.generateTokens(_sender, tokensGenerate));
    //uso assert porque ante cualquier falla, aborta ejecucion y hace rollback de los cambios
    myCta.transfer(_amount);
    totalCollected = totalCollected + _amount;
    return true;
  }

  //fallback
  function() payable {
    proxyPayment(msg.sender);
  }
}
