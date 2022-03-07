// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.15;


//Modified from https://github.com/mitmedialab/medrec/blob/master/SmartContracts/contracts/AgentRegistry.sol

//register a patient
contract PatientsRegistry {
  struct Patient {
    string name;
    address contractAddr;
    string host;
  }
  
  //create mappings
  mapping(address => Patient) patientInfo;
  mapping(string => address) patientByName;
  mapping(address => address) public patientFromContract;


  function PatientRegistry(string name, address contractAddr, string host) public {
    //signers.push(msg.sender);
    patientInfo[msg.sender] = Patient(name, contractAddr, host);
    patientByName[name] = msg.sender;
    patientFromContract[contractAddr] = msg.sender;
    //isSigner[msg.sender] = true;
  }

  //set the name of the patient
  function setPatientName(string name) public {
      //throw if the proposed name is already taken
      require(patientByName[name] == address(0));
      patientInfo[msg.sender].name = name;
      patientByName[name] = msg.sender;
  }

  //log the address of the patient
  function setPatientContractAddr(address contractAddr) public {
      patientInfo[msg.sender].contractAddr = contractAddr;
      patientFromContract[contractAddr] = msg.sender;
  }

  //set the host of patient
  function setPatientHost(string host) public {
      patientInfo[msg.sender].host = host;
  }

  //get the name of the patient
  function getPatientName(address addr) public constant returns (string) {
    return patientInfo[addr].name;
  }

  //get the contract address of the patient
  function getPatientContractAddr(address addr) public constant returns (address) {
    return patientInfo[addr].contractAddr;
  }

  //get the host of the patient
  function getPatientHost(address addr) public constant returns (string) {
    return patientInfo[addr].host;
  }
}
