pragma solidity ^0.4.17;

contract UserExample {
  
  mapping(address => bool) user_verified;
  mapping(address => bytes32) user_codes;
  
  mapping(bytes32 => address) to_sign;
  mapping(bytes32 => bool) signed;
  
  address owner;
  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  
  function UserExample() public {
    owner = msg.sender;
  }
  
  function inviteUser(bytes32 documentHash, address user) public onlyOwner {
    to_sign[documentHash] = user;
  }
  
  function signDocument(bytes32 documentHash) public {
      if (msg.sender != to_sign[documentHash]) {
          revert();
      }
      signed[documentHash] = true;
  }

  function addUser(address user, bytes32 hashed_verification) public onlyOwner {
    user_verified[user] = false;
    user_codes[user] = hashed_verification;
  }
  
  function verify(bytes32 verification_code) public {
      if (user_verified[msg.sender] == false && 
          sha256(verification_code) == user_codes[msg.sender]) {
          user_verified[msg.sender] = true;
      }
  }
}