// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

/// @title SimpleUpgradeToken V1
/// @notice ERC20 token with UUPS upgradeability. Minimal, well-documented.
contract ERC20V1 is ERC20Upgradeable, UUPSUpgradeable, OwnableUpgradeable {
    /// @notice Initialize instead of constructor for upgradeable contracts
    function initialize(string memory name, string memory symbol, uint256 initialSupply, address owner) public initializer {
        __ERC20_init(name, symbol);
        __Ownable_init(owner);
        __UUPSUpgradeable_init();
        _mint(owner, initialSupply);
        transferOwnership(owner);
    }

    /// @notice required by UUPS to authorize upgrades
    function _authorizeUpgrade(address) internal view override onlyOwner {}
}
