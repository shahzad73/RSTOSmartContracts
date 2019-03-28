pragma solidity ^0.5.0;  
  
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";

/**  
* @title BearToken is a basic ERC20 Token  
*/  
contract BearToken is ERC20Mintable, ERC20Burnable {  
  
	  uint256 public totalSupplyToken;  
	  string public name;  
	  string public symbol;  
	  uint32 public decimals;  
 
	 constructor() public {  
		  symbol = "DIGI";  
		  name = "DigiShares";  
		  decimals = 0;  
		  totalSupplyToken = 100000;

		  _mint(msg.sender, totalSupplyToken);  

		  emit Transfer(address(0x0), msg.sender, totalSupplyToken);
	 }

 }