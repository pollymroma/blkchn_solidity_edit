pragma solidity ^0.4.24;

contract Votacion {
  address owner;
  mapping (string => uint8) private votesReceived;
  string[] public candidateList;

  constructor() public {
    owner = msg.sender;
    candidateList = ["candidato uno","candidato dos","candidato tres"];
  }

  function voteForCandidate(string candidate) requireEther public payable {
    emit ANewVoteForCandidate(candidate);
    votesReceived[candidate] += 1;
  }

  function changeOwner(address _newOwner) onlyOwner requireEther public payable {
      owner = _newOwner;
  }

  event ANewVoteForCandidate(string _candidate);

  modifier requireEther() {
      require(msg.value == 0.1 ether);
      _;
  }

  modifier onlyOwner() {
      require(msg.sender == owner);
      _;
  }
}
