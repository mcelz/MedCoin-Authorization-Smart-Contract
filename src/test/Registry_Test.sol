// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../smart contract/Registry.sol";

contract RegistryTest {

    bytes32[] patientAddresses;

    Patient patientToTest;
    function beforeAll () public {
        patientAddresses.push(bytes32("patient1"));
        patientToTest = new Patient("Annie", patientAddresses, "Sue");
    }

    function checkPatientRegistry () public {
        Assert.equal(getPatientName(bytes32("patient1")), string("Annie"), "Patient name should be Annie");
        Assert.equal(getPatientHost(bytes32("patient1")), string("Sue"), "Patient Host should be Sue");
    }
}
