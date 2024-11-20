// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;


/// @title IConnected Interface
/// @author Muhammad Haroon
/// @notice This interface defines the standard functionalities for connected contracts dealing with NFT data.
/// @dev This interface should be implemented by any contract that needs to interact with NFTs within the ecosystem.interface IConnected {

interface IConnected {
    // Struct to encapsulate detailed information about an Nft, used for easy data retrieval.
     struct Nft { 
        uint256 tokenId;    
        uint256 count;
        string uri;
        uint256 mintTime;        
        bool minted;
    }

    // Functions to be implemented by connected contracts for updating and retrieving Nft data
    function updatetokenId(address _to,uint256 _tokenId,address seller) external;
    function gettokenId(address _to) external view returns(Nft[] memory);
    function getTokenUri(uint256 _tokenId) external view returns(string memory);
    function getUserTokenUri(uint256 tokenId) external view returns(string memory);

    }

