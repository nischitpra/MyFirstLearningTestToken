// https://eips.ethereum.org/EIPS/eip-20
// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

import "./TokenERC20Template.sol";

contract FUCKSToken is
    TokenERC20Template(2100000000, "First Utility Centric Kathmandu Street Token", 2, "FUCKS")
{
    constructor() {}
}
