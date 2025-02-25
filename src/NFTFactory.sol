// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./NFT.sol";
import "./interfaces/INFTFactory.sol";

contract NFTFactory is INFTFactory {
    address[] public deployedNFTs;

    function createNFT(string memory name, string memory symbol) public returns (address) {
        NFT newNFT = new NFT(name, symbol);
        deployedNFTs.push(address(newNFT));
        return address(newNFT);
    }

    function getDeployedNFTs() public view returns (address[] memory) {
        return deployedNFTs;
    }
}