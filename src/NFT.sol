// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, Ownable {
    uint256 public tokenCounter;

    constructor() ERC721("ZeroKnowledgeNFT", "ZKNFT") {
        tokenCounter = 0;
    }

    function mint(address to) public onlyOwner {
        _safeMint(to, tokenCounter);
        tokenCounter++;
    }

    function transferNFT(address from, address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(msg.sender, tokenId), "Caller is not owner nor approved");
        _transfer(from, to, tokenId);
    }

    function ownerOfNFT(uint256 tokenId) public view returns (address) {
        return ownerOf(tokenId);
    }
}