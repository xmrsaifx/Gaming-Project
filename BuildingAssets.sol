// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BuildingAssets is ERC1155, Ownable {

    string Celestial_Dew_Chamber_URI;
    string Eco_Spheres_Pod_URI;
    string Time_Capsules_Locker_URI;
    string Harmonic_Crystals_Coffer_URI;
    string Pyroclast_Essence_Vault_URI;
    string Quantum_Qubit_Repository_URI;
    string Nano_Meld_Chamber_URI;
    string Cryo_Fuser_URI;
    string Nebula_Container_URI;
    string Pulse_Blaster_URI;
    string Thorned_Armor_URI;
    string Vortex_Field_URI;
    string Aurora_Gate_URI;
    string Soul_Weaver_URI;
    string Pyroclast_Essence_Generator_URI;
    string Celestial_Dew_Extractor_URI;
    string Quantum_Qubit_Harvester_URI;
    string Eco_Spheres_Reactor_URI;
    string Time_Capsules_Processor_URI;
    string Harmonic_Crystals_Resonator_URI;
    string Wildlands_Gateway_URI;

    mapping(address => bool) public isOwner;

    function SetURI(string[] memory URI) external onlyOwners {
        Celestial_Dew_Chamber_URI = URI[0];
        Eco_Spheres_Pod_URI = URI[1];
        Time_Capsules_Locker_URI = URI[2];
        Harmonic_Crystals_Coffer_URI = URI[3];
        Pyroclast_Essence_Vault_URI = URI[4];
        Quantum_Qubit_Repository_URI = URI[5];
        Nano_Meld_Chamber_URI = URI[6];
        Cryo_Fuser_URI = URI[7];
        Nebula_Container_URI = URI[8];
        Pulse_Blaster_URI = URI[9];
        Thorned_Armor_URI = URI[10];
        Vortex_Field_URI = URI[11];
        Aurora_Gate_URI = URI[12];
        Soul_Weaver_URI = URI[13];
        Pyroclast_Essence_Generator_URI = URI[14];
        Celestial_Dew_Extractor_URI = URI[15];
        Quantum_Qubit_Harvester_URI = URI[16];
        Eco_Spheres_Reactor_URI = URI[17];
        Time_Capsules_Processor_URI = URI[18];
        Harmonic_Crystals_Resonator_URI = URI[19];
        Wildlands_Gateway_URI = URI[20];
    }

    modifier onlyOwners() {
        require(isOwner[msg.sender], "Not an owner");
        _;
    }

    constructor(address initialOwner) ERC1155("") Ownable(initialOwner) {
        isOwner[initialOwner] = true;
    }

    function mintLevel_1_Assets(address to)
        external onlyOwners
    {
        _setURI(Thorned_Armor_URI);
        _mint(to, 1, 1, "");
         _setURI(Time_Capsules_Locker_URI);
        _mint(to, 2, 1, "");
         _setURI(Eco_Spheres_Reactor_URI);
        _mint(to, 3, 1, "");
         _setURI(Nano_Meld_Chamber_URI);
        _mint(to, 4, 1, "");
         _setURI(Eco_Spheres_Pod_URI);
        _mint(to, 5, 1, "");
         _setURI(Celestial_Dew_Extractor_URI);
        _mint(to, 6, 2, "");
         _setURI(Pyroclast_Essence_Generator_URI);
        _mint(to, 7, 2, "");
         _setURI(Celestial_Dew_Chamber_URI);
        _mint(to, 8, 2, "");
         _setURI(Pyroclast_Essence_Vault_URI);
        _mint(to, 9, 2, "");
    }

    function mintLevel_2_Assets(address to)
        external onlyOwners
    {
        _setURI(Thorned_Armor_URI);
        _mint(to, 1, 1, "");
         _setURI(Time_Capsules_Locker_URI);
        _mint(to, 2, 1, "");
         _setURI(Eco_Spheres_Reactor_URI);
        _mint(to, 3, 1, "");
         _setURI(Nano_Meld_Chamber_URI);
        _mint(to, 4, 1, "");
         _setURI(Eco_Spheres_Pod_URI);
        _mint(to, 5, 1, "");
         _setURI(Celestial_Dew_Extractor_URI);
        _mint(to, 6, 4, "");
         _setURI(Pyroclast_Essence_Generator_URI);
        _mint(to, 7, 3, "");
         _setURI(Celestial_Dew_Chamber_URI);
        _mint(to, 8, 3, "");
         _setURI(Pyroclast_Essence_Vault_URI);
        _mint(to, 9, 3, "");
    }

    function mintLevel_3_Assets(address to)
        external onlyOwners
    {
         _setURI(Time_Capsules_Locker_URI);
        _mint(to, 2, 1, "");
         _setURI(Eco_Spheres_Reactor_URI);
        _mint(to, 3, 1, "");
         _setURI(Nano_Meld_Chamber_URI);
        _mint(to, 4, 1, "");
         _setURI(Eco_Spheres_Pod_URI);
        _mint(to, 5, 1, "");
         _setURI(Celestial_Dew_Extractor_URI);
        _mint(to, 6, 5, "");
         _setURI(Pyroclast_Essence_Generator_URI);
        _mint(to, 7, 5, "");
         _setURI(Celestial_Dew_Chamber_URI);
        _mint(to, 8, 5, "");
         _setURI(Pyroclast_Essence_Vault_URI);
        _mint(to, 9, 5, "");
         _setURI(Vortex_Field_URI);
        _mint(to, 10, 1, "");
         _setURI(Quantum_Qubit_Harvester_URI);
        _mint(to, 11, 1, "");
         _setURI(Quantum_Qubit_Repository_URI);
        _mint(to, 12, 1, "");
    }

    function mintLevel_4_Assets(address to)
        external onlyOwners
    {
         _setURI(Time_Capsules_Locker_URI);
        _mint(to, 2, 1, "");
         _setURI(Eco_Spheres_Reactor_URI);
        _mint(to, 3, 1, "");
         _setURI(Nano_Meld_Chamber_URI);
        _mint(to, 4, 1, "");
         _setURI(Eco_Spheres_Pod_URI);
        _mint(to, 5, 1, "");
         _setURI(Celestial_Dew_Extractor_URI);
        _mint(to, 6, 6, "");
         _setURI(Pyroclast_Essence_Generator_URI);
        _mint(to, 7, 6, "");
         _setURI(Celestial_Dew_Chamber_URI);
        _mint(to, 8, 6, "");
         _setURI(Pyroclast_Essence_Vault_URI);
        _mint(to, 9, 6, "");
         _setURI(Vortex_Field_URI);
        _mint(to, 10, 1, "");
         _setURI(Quantum_Qubit_Harvester_URI);
        _mint(to, 11, 2, "");
         _setURI(Quantum_Qubit_Repository_URI);
        _mint(to, 12, 2, "");
         _setURI(Cryo_Fuser_URI);
        _mint(to, 13, 1, "");
         _setURI(Aurora_Gate_URI);
        _mint(to, 14, 1, "");
         _setURI(Time_Capsules_Processor_URI);
        _mint(to, 15, 2, "");
    }

    function mintLevel_5_Assets(address to)
        external onlyOwners
    {
         _setURI(Time_Capsules_Locker_URI);
        _mint(to, 2, 1, "");
         _setURI(Eco_Spheres_Reactor_URI);
        _mint(to, 3, 1, "");
         _setURI(Nano_Meld_Chamber_URI);
        _mint(to, 4, 1, "");
         _setURI(Eco_Spheres_Pod_URI);
        _mint(to, 5, 1, "");
         _setURI(Celestial_Dew_Extractor_URI);
        _mint(to, 6, 8, "");
         _setURI(Pyroclast_Essence_Generator_URI);
        _mint(to, 7, 8, "");
         _setURI(Celestial_Dew_Chamber_URI);
        _mint(to, 8, 8, "");
         _setURI(Pyroclast_Essence_Vault_URI);
        _mint(to, 9, 8, "");
         _setURI(Vortex_Field_URI);
        _mint(to, 10, 4, "");
         _setURI(Quantum_Qubit_Harvester_URI);
        _mint(to, 11, 3, "");
         _setURI(Quantum_Qubit_Repository_URI);
        _mint(to, 12, 3, "");
         _setURI(Cryo_Fuser_URI);
        _mint(to, 13, 1, "");
         _setURI(Aurora_Gate_URI);
        _mint(to, 14, 1, "");
         _setURI(Time_Capsules_Processor_URI);
        _mint(to, 15, 3, "");
        _setURI(Harmonic_Crystals_Resonator_URI);
        _mint(to, 16, 1, "");
        _setURI(Soul_Weaver_URI);
        _mint(to, 17, 1, "");
        _setURI(Nebula_Container_URI);
        _mint(to, 18, 1, "");
    }

    function addOwner(address newOwner) external onlyOwners {
        require(!isOwner[newOwner], "Already an owner");
        isOwner[newOwner] = true;
    }
}