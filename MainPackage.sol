// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface bhtTokens { 
    function mint(address to, uint256 amount) external;
}

interface BuildingAssets {
    function mintLevel_1_Assets(address to) external;
    function mintLevel_2_Assets(address to) external;
    function mintLevel_3_Assets(address to) external;
    function mintLevel_4_Assets(address to) external;
    function mintLevel_5_Assets(address to) external;
}

interface PlotLand {
    function MintLevel_1_Plot(uint256 PlotNumber,address to) external;
    function MintLevel_2_Plot(uint256 PlotNumber,address to) external;
    function MintLevel_3_Plot(uint256 PlotNumber,address to) external;
    function MintLevel_4_Plot(uint256 PlotNumber,address to) external;
    function MintLevel_5_Plot(uint256 PlotNumber,address to) external;
}

import "@openzeppelin/contracts/access/Ownable.sol";

contract Package is Ownable{
    address public bhtTokenAddress;
    address public buildingAssetsAddress;
    address public PlotLandAddress;
    error InvalidLevel(string ErrorMessage);

    IERC20 public usdt; // USDT token (6 decimals)
    mapping(address => bool) public isOwner;

    constructor(
        address initialOwner,
        address _bhtTokenAddress,
        address _buildingAssetsAddress,
        address _PlotLandAddress,
        IERC20 _usdt
    ) Ownable(initialOwner) {
        bhtTokenAddress = _bhtTokenAddress;
        buildingAssetsAddress = _buildingAssetsAddress;
        PlotLandAddress = _PlotLandAddress;
        usdt = _usdt;
        isOwner[initialOwner] = true;
    }

    modifier onlyOwners() {
        require(isOwner[msg.sender], "Not an owner");
        _;
    }

    mapping (uint256 => address ) public PlotOwners;
    uint256[] public plotNumbers;

 
    function Buy(uint plotNumber , uint level,uint256 usdtAmountInWE) public   {
        uint256 USDT_Decimal= 1000000; //USDT on Polygon is 6 Decimal 
        if(level == 1 && usdtAmountInWE > 650*USDT_Decimal  && usdtAmountInWE <  850*USDT_Decimal  ){
            PlotOwners[plotNumber] = msg.sender;
            MintLevel1_Package(plotNumber);
            plotNumbers.push(plotNumber);
            usdt.transferFrom(msg.sender, address(this), usdtAmountInWE);
        }
        else if (level == 2 && usdtAmountInWE > 850*USDT_Decimal && usdtAmountInWE < 1000*USDT_Decimal  )
        {
            PlotOwners[plotNumber] = msg.sender;
            MintLevel2_Package(plotNumber );
            plotNumbers.push(plotNumber);
            usdt.transferFrom(msg.sender, address(this), usdtAmountInWE);
        }
        else if (level == 3 && usdtAmountInWE > 1000*USDT_Decimal && usdtAmountInWE < 1250*USDT_Decimal )
        {
            PlotOwners[plotNumber] = msg.sender;
            MintLevel3_Package(plotNumber);
            plotNumbers.push(plotNumber);
            usdt.transferFrom(msg.sender, address(this), usdtAmountInWE);
        }
        else if (level == 4 && usdtAmountInWE > 2250 * USDT_Decimal && usdtAmountInWE < 2500* USDT_Decimal )
        {
            PlotOwners[plotNumber] = msg.sender;
            MintLevel4_Package(plotNumber );
            plotNumbers.push(plotNumber);
            usdt.transferFrom(msg.sender, address(this), usdtAmountInWE);
        }
        else if (level == 5 && usdtAmountInWE > 2500*USDT_Decimal && usdtAmountInWE < 3000 * USDT_Decimal ) 
        {
            PlotOwners[plotNumber] = msg.sender;
            MintLevel5_Package(plotNumber);
            plotNumbers.push(plotNumber);
            usdt.transferFrom(msg.sender, address(this), usdtAmountInWE);
        }
        else {
            revert InvalidLevel("Invalid Number");
        }
    }

    function MintLevel1_Package(uint plotNumber) internal  {
        // Mint BHT tokens
        bhtTokens bhtTokenInstance = bhtTokens(bhtTokenAddress);
        bhtTokenInstance.mint(msg.sender, 6000 * 10**18);

        //Mint buildingassets
        BuildingAssets buildingAssetsInstance = BuildingAssets(buildingAssetsAddress);
        buildingAssetsInstance.mintLevel_1_Assets(msg.sender);

        // Mint plot level 1
        PlotLand PlotLandInstance = PlotLand(PlotLandAddress);
        PlotLandInstance.MintLevel_1_Plot(plotNumber , msg.sender);
    }

    function MintLevel2_Package(uint plotNumber) internal  {
        // Mint BHT tokens
        bhtTokens bhtTokenInstance = bhtTokens(bhtTokenAddress);
        bhtTokenInstance.mint(msg.sender, 6000 * 10**18);

        //Mint buildingassets
        BuildingAssets buildingAssetsInstance = BuildingAssets(buildingAssetsAddress);
        buildingAssetsInstance.mintLevel_2_Assets(msg.sender);

        // Mint plot level 1
        PlotLand PlotLandInstance = PlotLand(PlotLandAddress);
        PlotLandInstance.MintLevel_2_Plot(plotNumber , msg.sender);
    }
    function MintLevel3_Package(uint plotNumber) internal  {
        // Mint BHT tokens
        bhtTokens bhtTokenInstance = bhtTokens(bhtTokenAddress);
        bhtTokenInstance.mint(msg.sender, 6000 * 10**18);

        //Mint buildingassets
        BuildingAssets buildingAssetsInstance = BuildingAssets(buildingAssetsAddress);
        buildingAssetsInstance.mintLevel_3_Assets(msg.sender);

        // Mint plot level 1
        PlotLand PlotLandInstance = PlotLand(PlotLandAddress);
        PlotLandInstance.MintLevel_3_Plot(plotNumber , msg.sender);
    }
    function MintLevel4_Package(uint plotNumber) internal  {
        // Mint BHT tokens
        bhtTokens bhtTokenInstance = bhtTokens(bhtTokenAddress);
        bhtTokenInstance.mint(msg.sender, 12000 * 10**18);

        //Mint buildingassets
        BuildingAssets buildingAssetsInstance = BuildingAssets(buildingAssetsAddress);
        buildingAssetsInstance.mintLevel_4_Assets(msg.sender);

        // Mint plot level 1
        PlotLand PlotLandInstance = PlotLand(PlotLandAddress);
        PlotLandInstance.MintLevel_4_Plot(plotNumber , msg.sender);
    }

    function MintLevel5_Package(uint plotNumber) internal  {
        // Mint BHT tokens
        bhtTokens bhtTokenInstance = bhtTokens(bhtTokenAddress);
        bhtTokenInstance.mint(msg.sender, 12000 * 10**18);

        //Mint buildingassets
        BuildingAssets buildingAssetsInstance = BuildingAssets(buildingAssetsAddress);
        buildingAssetsInstance.mintLevel_5_Assets(msg.sender);

        // Mint plot level 1
        PlotLand PlotLandInstance = PlotLand(PlotLandAddress);
        PlotLandInstance.MintLevel_5_Plot(plotNumber , msg.sender);
    }

    function withdrawFunds() external onlyOwners {
        if(usdt.balanceOf(address(this)) > 0) {
            usdt.transfer(msg.sender, usdt.balanceOf(address(this)));
        } 
    }

    function getAllPlotOwners() public view returns (uint256[] memory, address[] memory) {
        address[] memory owners = new address[](plotNumbers.length);
        for (uint256 i = 0; i < plotNumbers.length; i++) {
            owners[i] = PlotOwners[plotNumbers[i]];
        }
        return (plotNumbers, owners);
    }

    function addOwner(address newOwner) external onlyOwners {
        require(!isOwner[newOwner], "Already an owner");
        isOwner[newOwner] = true;
    }
}