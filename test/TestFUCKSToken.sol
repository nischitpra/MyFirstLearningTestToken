// https://eips.ethereum.org/EIPS/eip-20
// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/FUCKSToken.sol";

contract TestFUCKSToken {
    function testInitialBalance() public  {
        FUCKSToken fucks = FUCKSToken(DeployedAddresses.FUCKSToken());
        Assert.equals(fucks.balanceOf(tx.origin), 2100000000, "Owner should have 2100000000 tokens");
    }


}