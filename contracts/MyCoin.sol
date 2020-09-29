// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

contract MyCoin {
    // The keyword "public" makes variables
    // accessible from other contracts
    address public minter;
    mapping(address => uint256) public balances;

    // Events allow clients to react to specific
    // contract changes you declare
    event Sent(address from, address to, uint256 amount);

    // Constructor code is only run when the contract
    // is created
    constructor() public {
        minter = msg.sender;
    }

    // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    function mint(address receiver, uint256 amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    // Sends an amount of existing coins
    // from any caller to an address
    function send(address receiver, uint256 amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
