pragma solidity ^0.4.17;

contract DocumentExample {
  
  bytes32[] documentHashes;

  function addDocument(bytes32 documentHash) {
    documentHashes.push(documentHash);
  }
  
}