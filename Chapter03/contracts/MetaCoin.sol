pragma solidity ^0.4.17;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

contract MetaCoin is StandardToken {

	string public name = 'MetaCoinToken';
	string public symbol = 'MCT';
	uint8 public decimals = 6;
	uint public INITIAL_SUPPLY = 10000000;

	function MetaCoin() public {
	  totalSupply_ = INITIAL_SUPPLY;
	  balances[msg.sender] = INITIAL_SUPPLY;
	}
}
