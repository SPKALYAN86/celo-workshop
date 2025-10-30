// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoteKing {
    // Store total votes for each candidate (fixed list)
    uint public votesForAlice;
    uint public votesForBob;

    // Record whether an address has already voted
    mapping(address => bool) public hasVoted;

    // Owner of the contract
    address public owner;

    constructor() {
        owner = msg.sender; // deployer becomes the owner
    }

    // Function for voting Alice
    function voteAlice() public {
        require(!hasVoted[msg.sender], "You already voted!");
        hasVoted[msg.sender] = true;
        votesForAlice += 1;
    }

    // Function for voting Bob
    function voteBob() public {
        require(!hasVoted[msg.sender], "You already voted!");
        hasVoted[msg.sender] = true;
        votesForBob += 1;
    }

    // View winner
    function getWinner() public view returns (string memory winner) {
        if (votesForAlice > votesForBob) {
            winner = "Alice is the VoteKing!";
        } else if (votesForBob > votesForAlice) {
            winner = "Bob is the VoteKing!";
        } else {
            winner = "It's a tie!";
        }
    }
}
