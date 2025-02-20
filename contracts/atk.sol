// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ATK is ERC20, Ownable(msg.sender) {
    constructor() ERC20("Abundance Token", "ATK") { 
    }
}