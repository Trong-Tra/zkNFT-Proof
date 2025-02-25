// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface INFT {
    function mint(address to, uint256 tokenId) external;
    function transfer(address from, address to, uint256 tokenId) external;
    function ownerOf(uint256 tokenId) external view returns (address);
}