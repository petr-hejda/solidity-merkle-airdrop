// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract MyToken is ERC20 {
	bytes32 root;
	mapping(address => bool) hasClaimed;

	constructor(bytes32 _root) ERC20("MyToken", "MyT") {
		root = _root;
	}

	function airdrop(bytes32[] calldata _proof) public {
		bool isEligible = MerkleProof.verify(_proof, root, keccak256(abi.encodePacked(msg.sender)));
		require(isEligible, "Not eligible");
		require(hasClaimed[msg.sender] == false, "Already claimed");
		hasClaimed[msg.sender] = true;
		_mint(msg.sender, 1000 * 1e18);
	}
}
