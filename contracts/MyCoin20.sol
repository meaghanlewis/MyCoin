// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyCoin20 is ERC20 {
    // The keyword "public" makes variables
    // accessible from other contracts
    address public minter;
    //mapping (address => uint) public balances;

    // Events allow clients to react to specific
    // contract changes you declare
    event Sent(address from, address to, uint256 amount);

    // Constructor code is only run when the contract
    // is created
    constructor() public ERC20("T20", "T20") {
        minter = msg.sender;
    }

    // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    function mint(address receiver, uint256 amount) public {
        _mint(msg.sender, amount);
    }

    // Sends an amount of existing coins
    // from any caller to an address
    function send(address receiver, uint256 amount) public {
        _transfer(msg.sender, receiver, amount);
        emit Sent(msg.sender, receiver, amount);
    }
}
