Gaming Project Smart Contracts Readme
Welcome to the Gaming Project! This project utilizes a set of smart contracts designed to facilitate various aspects of a gaming ecosystem. Below, you will find an overview of each contract, their functionalities using the custom ERC20 , and ERC721 implementation, and how they interact within the gaming environment.
Table of Contents
BHTTokens.sol
BuildingAssets.sol
IConnected.sol
MainPackage.sol
NFTMarketplace.sol
PlotLand.sol
SepoliaUSDT.sol
1. BHTTokens.sol
Overview
This contract handles the creation and management of in-game tokens. It have custom features as transfer limitations, It allows for the minting, burning, and transfer of tokens among players.
Key Features
Mint Tokens: Create new tokens.
Burn Tokens: Remove tokens from circulation.
Transfer Tokens: Move tokens between player accounts.
2. BuildingAssets.sol
Overview
Manages in-game assets related to building and construction. This includes structures, upgrades, and other building-related items.
Key Features
Asset Creation: Add new building assets to the game.
Asset Upgrade: Upgrade existing assets.
Asset Transfer: Transfer assets between players.
3. IConnected.sol
Overview
This interface contract defines the standard for connectivity between different smart contracts within the gaming ecosystem.
Key Features
Standardized Methods: Ensures all contracts can interact seamlessly.
Event Triggers: Facilitates communication between contracts.
4. MainPackage.sol
Overview
The central contract that ties together all aspects of the gaming project. It manages game state, player interactions, and overall game logic.
Key Features
Game State Management: Controls the overall state of the game.
Player Interaction: Handles interactions between players.
Contract Integration: Integrates with other contracts for a cohesive gaming experience.
5. NFTMarketplace.sol
Overview
A decentralized marketplace for trading Non-Fungible Tokens (NFTs) related to the game. This includes characters, items, and other unique digital assets.
Key Features
NFT Listing: Allow players to list their NFTs for sale.
NFT Purchase: Enable players to buy NFTs from other players.
NFT Transfer: Facilitate the transfer of NFTs between players.
6. PlotLand.sol
Overview
Manages the creation and distribution of plot Land that correspond to digital assets in the game.
Key Features
Land Creation: Generate physical cards based on digital assets.
Land Distribution: Distribute cards to players.
Land Verification: Verify the authenticity of physical cards.
8. SepoliaUSDT.sol
Overview
Handles the integration of USDT (Tether) stablecoin on the Sepolia test network for in-game transactions.
Key Features
Token Integration: Integrates USDT with the game's economy.
Transaction Handling: Manages transactions using USDT.
Test Network Support: Facilitates testing and development on the Sepolia network.
Getting Started
To get started with the Gaming Project, you will need to:
Deploy the Contracts: Deploy each contract on the desired blockchain network.
Configure Interactions: Ensure contracts interact correctly as defined by the IConnected.sol interface.
Test Functionality: Test each contract's functionality to ensure they work as expected.
Integrate with Frontend: Develop a frontend application to interact with the smart contracts.
