// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthcareRecord{
    address owner;

    struct Record{
        uint256 recordID;
        string patientName;
        string diagnosis;
        string treatment;
        uint256 timestamp;
    }

    mapping(uint256 => Record[]) private patientRecords;

    mapping(address => bool)private authorizeProviders;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this function");
        _;
    }
    modifier onlyAuthorizedProvider() {
        require(authorizeProviders[msg.sender], "Not an Authorized provider");
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    function getOwner() public view returns (address){
        return owner;
    }
}