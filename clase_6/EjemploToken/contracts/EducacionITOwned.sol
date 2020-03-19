pragma solidity ^0.4.24;

contract EducacionITOwned {

  address public owner;
  address public newOwner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _newOwner) onlyOwner {
    newOwner = _newOwner;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  //funcion de aceptacion por parte del usuario receptor de los tokens
  function acceptOwnership() public {
    if (msg.sender == newOwner) {
      owner = newOwner;
    }
  }
}
