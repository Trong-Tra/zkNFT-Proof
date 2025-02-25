// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

interface INFTFactory {
	function createNFT(
		string memory name,
		string memory symbol
	) external returns (address);
	function getNFTs() external view returns (address[] memory);
}
