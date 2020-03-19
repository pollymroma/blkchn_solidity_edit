pragma solidity ^0.4.24;

contract EducacionITControlled {

  address public controller;

  constructor() public {
    controller = msg.sender;
  }

  function changeController(address _newController) onlyController public {
    controller = _newController;
  }

  modifier onlyController() {
    require(msg.sender == controller);
    _;
  }
}
