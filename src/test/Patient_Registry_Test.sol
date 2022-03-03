// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.15;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../smart contract/Patient_Registry.sol";

contract Patient_Registry_Test {

    //create test instances
    bytes32[] patientAddresses;

    Patient patientToTest;

    //test
    function beforeAll () public {0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2bytes32("patient1"));
        patientToTest = new Patient("Annie", 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "Sue");
    }

    //test check patient register
    function checkPatientRegistry () public {
        Assert.equal(getPatientName(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2), string("Annie"), "Patient name should be Annie");
        Assert.equal(getPatientHost(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2), string("Sue"), "Patient Host should be Sue");
        Assert.equal(getPatientContractAddr(bytes32("Annie"), 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "Patient address should be 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2");
    }
}
