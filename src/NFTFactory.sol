// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./NFT.sol";

contract NFTFactory {
	address[] public deployedNFTs;

	function createNFT(
		string memory name,
		string memory symbol,
		address verifier
	) public returns (address) {
		NFT newNFT = new NFT(name, symbol, verifier);
		deployedNFTs.push(address(newNFT));
		return address(newNFT);
	}

	function getDeployedNFTs() public view returns (address[] memory) {
		return deployedNFTs;
	}
}
