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

import './RegulatedToken.sol';

/**
 * TestRegulatedToken is a RegulatedToken meant for testing purposes.
 * Developers can mint an unlimited number of TestRegulatedTokens.
 * TestRegulatedToken is meant to be instantiated with a ServiceRegistry
 * that points to an instance of TestRegulatorService.
 */
contract RRegulatedToken is RegulatedToken {

  uint256 public totalSupplyToken;  
  string public name;  
  string public symbol;  
  uint32 public decimals;

  constructor(ServiceRegistry _registry) RegulatedToken(_registry) public
  {
		  symbol = "USDC";  
		  name = "USDC";  
		  decimals = 18;
		  totalSupplyToken = 200000000000000000000000;

		  _mint(msg.sender, totalSupplyToken);  

		  emit Transfer(address(0x0), msg.sender, totalSupplyToken);
  }

}
