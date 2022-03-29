// https://eips.ethereum.org/EIPS/eip-20
// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

import "./TokenERC20Template.sol";

contract CustomToken{
    
    /**
    * Contains list of tokens created by user
    */
    mapping(address => address[]) public customUserTokens;
    mapping(address => address) public customTokenToUser;

    constructor() {}

    function getUserTokensCount() public view returns(uint256) {
        return getUserTokens().length; 
    }

    function getUserTokens() public view returns(address[] memory) {
        return customUserTokens[msg.sender];
    }

    function getTokenCreator(address tokenAddress) public view returns(address) {
        return customTokenToUser[tokenAddress];
    }

    function createToken(
        uint256 _initialAmount, 
        string memory _tokenName, 
        uint8 _decimalUnits, 
        string memory _tokenSymbol
    ) public returns(address) {
        require(_initialAmount > 10**_decimalUnits,"Invalid Initial Amount or Decimal Units");

        TokenERC20Template token = new TokenERC20Template(_initialAmount, _tokenName, _decimalUnits, _tokenSymbol);
        address tokenAddress = address(token);
        
        // track tokens created by user
        address[] storage tokens = customUserTokens[msg.sender];
        tokens.push(tokenAddress);
        
        // find user address from token
        customTokenToUser[tokenAddress] = msg.sender;

        return tokenAddress;
    }

}
