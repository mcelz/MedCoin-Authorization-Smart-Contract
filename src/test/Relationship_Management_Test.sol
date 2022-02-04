// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.15;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../smart contract/Relationship_Management.sol";

contract Relationship_Management_Test {

    address public patient;
    bool public patientEnabled;
    address[] public thirdParties;
    bool[] public thirdPartiesEnabled;
    address[] public relationships; //list of Relationship contract addresses

    //test
    function beforeAll () public {
        patientAddresses.push(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        patientToTest = new Patient("Annie",0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "Sue");
        patientToTest.addThirdParties(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db)
    }

    //test check relationship management
    function checkRelationshipManagement () public {
        Assert.equal(getNumEnabledPatients(), 1, "Enabled patient should be 1");
        Assert.equal(getNumRelationships(), 1, "The Number of enabled relationships should be 1");
        Assert.equal(getNumEnabledThirdParties(), 1, "The Number of enabled third parties should be 1");
    }
}