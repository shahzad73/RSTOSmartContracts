/**
   Copyright (c) 2017 Harbor Platform, Inc.

   Licensed under the Apache License, Version 2.0 (the “License”);
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an “AS IS” BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

pragma solidity ^0.5.0;  

import './RegulatorService.sol';

/**
 * TestRegulatorService is a RegulatorService meant for testing purposes.
 * It returns check() reason codes based on the amount of the transaction.
 */
contract RRegulatedService is RegulatorService  {
  uint8 constant private SUCCESS = 0;  
  uint8 constant private FAILED = 1;  
  
  mapping (address => bool) public whitelisted;
  function addWhitelistAddress (address user) public onlyOwner { 
  	  whitelisted[user] = true; 
  }
  function removeWhitelistAddress (address user) public onlyOwner { 
  	  delete whitelisted[user];
  }
  function isInvestorWhiteListed(address user) public view returns (bool) {
  	   return whitelisted[user]; 
  }

  
  /**
   * @notice Checks whether or not a trade should be approved by checking the trade amount
   *
   * @param  _token The address of the token to be transfered
   * @param  _spender The address of the spender of the token (unused in this implementation)
   * @param  _from The address of the sender account
   * @param  _to The address of the receiver account
   * @param  _amount The quantity of the token to trade
   *
   * @return `true` if the trade should be approved and `false` if the trade should not be approved
   */
  function check(address _token, address _spender, address _from, address _to, uint256 _amount) public returns (uint8) {
  
  	  if (whitelisted[_to])
	  {
	  	 if (whitelisted[_from]) 
     		return SUCCESS;
		 else
		 	return FAILED;
	  } else
	      return FAILED;
	 
  }
  
  
}
