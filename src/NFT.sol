// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IVerifier {
	function verifyProof(
		uint[2] memory a,
		uint[2][2] memory b,
		uint[2] memory c,
		uint[1] memory input
	) external view returns (bool);
}

contract NFT is ERC721, Ownable {
	uint256 public tokenCounter;
	IVerifier public verifier;

	constructor(
		string memory _name,
		string memory _symbol,
		address _verifier
	) ERC721(_name, _symbol) Ownable(msg.sender) {
		tokenCounter = 0;
		verifier = IVerifier(_verifier);
	}

	function mint(address to) public {
		_safeMint(to, tokenCounter);
		tokenCounter++;
	}

	function transferNFT(address from, address to, uint256 tokenId) public {
		_transfer(from, to, tokenId);
	}

	function verifyNFTOwnership(
		uint[2] memory a,
		uint[2][2] memory b,
		uint[2] memory c,
		uint256 hashedAddress // The computed hash from Zokrates
	) public view returns (bool) {
		uint[1] memory input = [hashedAddress]; // Input as an array
		return verifier.verifyProof(a, b, c, input);
	}

	function setVerifier(address _verifier) public onlyOwner {
		verifier = IVerifier(_verifier);
	}
}
