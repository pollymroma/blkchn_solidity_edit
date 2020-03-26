pragma solidity ^0.4.24;

contract EjercicioUno {
  address owner;
  mapping (string => uint8) public votesReceived;
  string[] public candidateList;

  constructor() public {
    owner = msg.sender;
    candidateList = ["opcion uno","opcion dos","opcion tres"];
  }

  function totalVotesFor(string candidate) public view returns (uint8) {
    require(msg.value > 0.05 ether);
    return votesReceived[candidate];
  }

  function voteForCandidate(string candidate) public payable {
    require(msg.value > 0.15 ether);
    votesReceived[candidate] += 1;
  }
}
