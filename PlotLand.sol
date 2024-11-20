// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract PlotLand is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _itemsId;

    // URI storage for different levels
    mapping(uint8 => string) public levelURIs;

    struct NFT {
        uint256 PlotNumber;
        uint256 tokenId;
        uint256 count;
        string uri;
        uint32 mintTime;
        bool minted;
        bool isActive;
    }

    // Mappings
    mapping(address => bool) public isOwner;
    mapping(uint256 => NFT) public nftMinting;
    mapping(address => mapping(uint256 => uint256)) public NftId;
    mapping(address => uint256) public count;

    // Events
    event TokenTrackingUpdated(
        address indexed seller,
        address indexed recipient,
        uint256 plotNumber,
        uint256 tokenId
    );
    event LevelURIUpdated(uint8 level, string uri);
    event OwnerAdded(address newOwner);

    // Reentrancy guard
    bool private locked;

    // Modifiers
    modifier nonReentrant() {
        require(!locked, "Reentrant call");
        locked = true;
        _;
        locked = false;
    }

    modifier onlyOwners() {
        require(isOwner[msg.sender], "Not an owner");
        _;
    }

    constructor(address initialOwner)
        ERC721("Plot", "PLOT")
        Ownable(initialOwner)
    {
        isOwner[initialOwner] = true;
    }

    // URI Management
    function setLevelURI(uint8 level, string calldata uri) external onlyOwners {
        require(level >= 1 && level <= 5, "Invalid level");
        levelURIs[level] = uri;
        emit LevelURIUpdated(level, uri);
    }

    function setURIs(string[5] memory URIs) external onlyOwners {
        for (uint8 i = 0; i < 5; i++) {
            levelURIs[i + 1] = URIs[i];
            emit LevelURIUpdated(i + 1, URIs[i]);
        }
    }

    // Unified Minting Function
    function mintPlot(uint256 plotNumber, address to, uint8 level) 
        private 
        returns (uint256) 
    {
        require(level >= 1 && level <= 5, "Invalid level");
        require(to != address(0), "Invalid recipient");
        
        _itemsId.increment();
        uint256 newItemId = _itemsId.current();
        
        _safeMint(to, plotNumber);
        _setTokenURI(plotNumber, levelURIs[level]);
        
        count[to]++;
        NftId[to][count[to]] = newItemId;
        
        nftMinting[newItemId] = NFT(
            plotNumber,
            plotNumber,
            count[to],
            levelURIs[level],
            uint32(block.number),
            true,
            true
        );
        
        return newItemId;
    }

    // Level-specific minting functions
    function MintLevel_1_Plot(uint256 plotNumber, address to) external onlyOwners {
        mintPlot(plotNumber, to, 1);
    }

    function MintLevel_2_Plot(uint256 plotNumber, address to) external onlyOwners {
        mintPlot(plotNumber, to, 2);
    }

    function MintLevel_3_Plot(uint256 plotNumber, address to) external onlyOwners {
        mintPlot(plotNumber, to, 3);
    }

    function MintLevel_4_Plot(uint256 plotNumber, address to) external onlyOwners {
        mintPlot(plotNumber, to, 4);
    }

    function MintLevel_5_Plot(uint256 plotNumber, address to) external onlyOwners {
        mintPlot(plotNumber, to, 5);
    }

    // Transfer tracking functions
    function FinalupdateTokenId(
        address _to,
        uint256 _plotNumber,
        address _seller
    ) public nonReentrant {
        require(_to != address(0), "Invalid recipient address");
        require(_seller != address(0), "Invalid seller address");
        require(_to != _seller, "Cannot transfer to self");

        uint256 recipientCount = count[_to];
        uint256 sellerCount = count[_seller];
        require(sellerCount > 0, "Seller has no tokens");

        uint256 tokenIdToTransfer;
        uint256 indexFound;
        bool tokenFound = false;

        // Find the token in seller's inventory
        for (uint256 i = 1; i <= sellerCount; i++) {
            uint256 currentTokenId = NftId[_seller][i];
            if (nftMinting[currentTokenId].PlotNumber == _plotNumber) {
                tokenIdToTransfer = currentTokenId;
                indexFound = i;
                tokenFound = true;
                break;
            }
        }
        
        require(tokenFound, "Token not found in seller's inventory");

        // Update nftMinting mapping for the transferred token
        NFT storage transferredNFT = nftMinting[tokenIdToTransfer];
        transferredNFT.count = recipientCount + 1;

        // Update recipient's token tracking
        NftId[_to][recipientCount + 1] = tokenIdToTransfer;
        count[_to]++;

        // Update seller's token tracking
        if (indexFound < sellerCount) {
            uint256 lastTokenId = NftId[_seller][sellerCount];
            NftId[_seller][indexFound] = lastTokenId;
            
            NFT storage movedNFT = nftMinting[lastTokenId];
            movedNFT.count = indexFound;
        }

        delete NftId[_seller][sellerCount];
        count[_seller]--;

        emit TokenTrackingUpdated(_seller, _to, _plotNumber, tokenIdToTransfer);
    }

    // View functions
    function getTokenId(address _seller) public view returns (NFT[] memory) {
        uint256 userCount = count[_seller];
        NFT[] memory myArray = new NFT[](userCount);
        
        for (uint256 i = 0; i < userCount; i++) {
            uint256 tokenId = NftId[_seller][i + 1];
            myArray[i] = nftMinting[tokenId];
        }
        
        return myArray;
    }

    function getNFTDetails(uint256 tokenId) public view returns (NFT memory) {
        return nftMinting[tokenId];
    }

    function getUserTokens(address user) external view returns (
        uint256[] memory tokenIds,
        uint256[] memory plotNumbers
    ) {
        uint256 userCount = count[user];
        tokenIds = new uint256[](userCount);
        plotNumbers = new uint256[](userCount);
        
        for (uint256 i = 0; i < userCount; i++) {
            uint256 tokenId = NftId[user][i + 1];
            tokenIds[i] = tokenId;
            plotNumbers[i] = nftMinting[tokenId].PlotNumber;
        }
        
        return (tokenIds, plotNumbers);
    }

    // Admin functions
    function addOwner(address newOwner) external onlyOwners {
        require(!isOwner[newOwner], "Already an owner");
        isOwner[newOwner] = true;
        emit OwnerAdded(newOwner);
    }

    // Required overrides
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    // Optional: Cleanup function for direct token URI access
    function getTokenUri(uint256 tokenId) external view returns (string memory) {
        return tokenURI(tokenId);
    }
}