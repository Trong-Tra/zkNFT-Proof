// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/NFT.sol";

contract DeployAndMint is Script {
	function run() external {
		uint256 deployerPrivateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
		address deployerAddress = vm.addr(deployerPrivateKey);

		vm.startBroadcast(deployerPrivateKey);

		NFT nft = new NFT("MyNFT", "MNFT", address(0));
		console.log("NFT contract deployed at:", address(nft));

		nft.mint(deployerAddress);
		console.log("NFT minted to deployer:", deployerAddress);

		vm.stopBroadcast();
	}
}
