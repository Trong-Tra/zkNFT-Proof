// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface INFT is IERC721 {
    function tokenCounter() external view returns (uint256);

    function baseURI() external view returns (string memory);

    function mint(address to) external;

    function transferNFT(address from, address to, uint256 tokenId) external;

    function ownerOfNFT(uint256 tokenId) external view returns (address);

    function setBaseURI(string memory _newBaseURI) external;

    function burn(uint256 tokenId) external;
}