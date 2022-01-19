// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//register a patient
contract PatientRegistry {
  struct Patient {
    string name;
    address contractAddr;
    string host;
  }
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

  //
  function setPatientName(string name) public {
      //throw if the proposed name is already taken
      require(patientByName[name] == address(0));
      patientInfo[msg.sender].name = name;
      patientByName[name] = msg.sender;
  }

  function setPatientContractAddr(address contractAddr) public {
      patientInfo[msg.sender].contractAddr = contractAddr;
      patientFromContract[contractAddr] = msg.sender;
  }

  function setPatientHost(string host) public {
      agentInfo[msg.sender].host = host;
  }

  function getPatientByName(string name) public constant returns (address) {
    return patientByName[name];
  }

  function getPatientName(address addr) public constant returns (string) {
    return patientInfo[addr].name;
  }

  function getPatientContractAddr(address addr) public constant returns (address) {
    return patientInfo[addr].contractAddr;
  }

  function getPatientHost(address addr) public constant returns (string) {
    return patientInfo[addr].host;
  }
}
