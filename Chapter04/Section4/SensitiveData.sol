pragma solidity ^0.4.17;

contract SensitiveDataExample {
  
  bytes32[] userHashes;
    
  // The backend would take a user-object. For example a simple JSON
  // {name: "Kenny", familyName: "Vaneetvelde", address: "Some Address 123"}
  // After hashing this entire object, you can pass it to the function below.
  // Later, you can re-hash it, to verify the user and data if/when needed.
  function addUser(bytes32 userHash) {
    userHashes.push(userHash);
  }
  
}