// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ERC20V1.sol";

/// @title SimpleUpgradeToken V2
/// @notice Adds a mint function protected by onlyOwner and an on-chain description storage packed for gas efficiency.
contract ERC20V2 is ERC20V1 {
    // Storage: pack small values; example of gas-aware storage layout.
    string private _description; // new storage slot (kept compatible)

    function initializeV2(string calldata description) external reinitializer(2) {
        // simple upgrade initializer to set new state
        _description = description;
    }

    /// @notice New functionality in V2
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function description() external view returns (string memory) {
        return _description;
    }
}
