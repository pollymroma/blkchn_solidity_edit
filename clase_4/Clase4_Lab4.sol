pragma solidity ^0.4.22;

contract Laboratorio4 {

    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function fnEspecial(string algo) public payable onlyOwner onlyWithEther returns(string) {
        return algo;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier onlyWithEther() {
        require(msg.value >= 1 ether);
        _;
    }
    
    function semiRandom() public view returns(uint) {
        return uint(keccak256(block.difficulty, now, block.number));
    }
}

