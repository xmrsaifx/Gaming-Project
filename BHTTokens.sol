// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract BitcoinHashToken is ERC20, ERC20Burnable, ERC20Pausable, Ownable, ERC20Permit {

    mapping(address => bool) public isOwner;

    modifier onlyOwners() {
        require(isOwner[msg.sender], "Not an owner");
        _;
    }

    constructor(address initialOwner)
        ERC20("Bitcoin Hash Token", "BHT")
        Ownable(initialOwner)
        ERC20Permit("Bitcoin Hash Token")
    {
        isOwner[initialOwner] = true;
    }

    function pause() public onlyOwners {
        _pause();
    }

    function unpause() public onlyOwners {
        _unpause();
    }

    function mint(address to, uint256 amount) external onlyOwners {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }

    function addOwner(address newOwner) external onlyOwners {
        require(!isOwner[newOwner], "Already an owner");
        isOwner[newOwner] = true;
    }

}