/ SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//identifies the existing relationships of patients list of third parties
contract Authorization {

    address public patient;
    bool public patientEnabled;
    address[] public thirdParties;
    bool[] public thirdPartiesEnabled;
    address[] public relationships; //list of Relationship contract addresses


    //creates a modifier that determines whether the action taker is the actual owner of the patient information
    modifier isOwner() {
        bool enable;
        if(patientEnabled && msg.sender == patient) enable = true;
        for(uint i = 0; i < thirdParties.length; i++) {
            if(thirdPartiesEnabled[i] && msg.sender == thirdParties[i]) {
                enable = true;
                break;
            }
        }
        //if the enable variable is not true then repeat the process
        if(!enable) revert();
        _;
    }

    //defines a patient
    function Patient() public {
        patient = msg.sender;
        patientEnabled = true;
    }

    //link a patient to its address
    function setPatient(address addr) public isOwner {
        patient = addr;
    }

    //enable a patient
    function enablePatient(bool enable) public isOwner {
        patientEnabled = enable;
        require(getNumEnabledPatients() > 0);
    }

    //add a third party if it sends request to a patient
    function addThirdParties(address addr) public isOwner {
        thirdParties.push(addr);
        thirdPartiesEnabled.push(true);
    }

    //remove a third party whenever the patient feels necessary
    function removeThirdParties(address addr) public isOwner {
        bool overwrite = false;
        for(uint i = 0; i < thirdParties.length; i++) {
        if(overwrite) {
            thirdParties[i - 1] = thirdParties[i];
            thirdPartiesEnabled[i-1] = thirdPartiesEnabled[i];
        }
        if(thirdParties[i] == addr) {
            overwrite = true;
        }
        }
        delete(thirdParties[thirdParties.length-1]);
        delete(thirdPartiesEnabled[thirdPartiesEnabled.length-1]);
        thirdParties.length -= 1;
        thirdPartiesEnabled.length -= 1;
        require(getNumEnabledThirdParties() > 0);
    }

    //enable a third party
    function enableThirdParties(address addr, bool enable) public {
        for(uint i = 0; i < thirdParties.length; i++) {
        if(thirdParties[i] == addr) {
            thirdPartiesEnabled[i] = enable;
            break;
        }
        }
        require(getNumEnabledOwners() > 0);
    }

    //log a patient-information requestor relationship
    function addRelationship(address r) public isOwner {
        relationships.push(r);
    }

    //get the number of information established in this contract
    function getNumRelationships() public constant returns (uint) {
        return relationships.length;
    }

    //get the number of enabled patients
    function getNumEnabledPatients() public constant returns (uint) {
        uint num = 0;
        if(patientEnabled) num++;
        for(uint i = 0; i < patientEnabled.length; i++) {
        if(patientEnabled[i]) num++;
        }
        return num;
    }

    //get the number of enabled third parties
    function getNumEnabledThirdParties() public constant returns (uint) {
        return thirdParties.length;
    }
}
