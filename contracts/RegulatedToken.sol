pragma solidity ^0.5.0;  

import "openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";
import './ServiceRegistry.sol';
import './RegulatorService.sol';

/// @notice An ERC-20 token that has the ability to check for trade validity
contract RegulatedToken is ERC20Mintable, ERC20Burnable {

	  event CheckStatus(uint8 reason, address indexed spender, address indexed from, address indexed to, uint256 value);

	  ServiceRegistry public registry;

	  constructor(ServiceRegistry _registry) public
	  {
		require(address(_registry) != address(0));

		registry = _registry;
	  }

	  function transfer(address _to, uint256 _value) public returns (bool) {
		if (_check(msg.sender, _to, _value)) {
		  return super.transfer(_to, _value);
		} else {
		  return false;
		}
	  }

	  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
		if (_check(_from, _to, _value)) {
		  return super.transferFrom(_from, _to, _value);
		} else {
		  return false;
		}
	  }

	  function _check(address _from, address _to, uint256 _value) private returns (bool) {
		uint8 reason = _service().check(address(this), msg.sender, _from, _to, _value);

		emit CheckStatus(reason, msg.sender, _from, _to, _value);

		return reason == 0;
	  }

	  function _service() view public returns (RegulatorService) {
		return RegulatorService(registry.service());
	  }
  
}