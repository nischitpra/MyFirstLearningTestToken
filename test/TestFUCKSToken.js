const FUCKSToken = artifacts.require("FUCKSToken");

contract("test_FUCKSToken", async (accounts) => {
  it("initial tokens should be in 0th account", async () => {
    const fucks = await FUCKSToken.deployed();
    const balance = (await fucks.balanceOf(accounts[0])).toNumber();
    assert.equal(balance, 2100000000);
  });

  it("send token from 0th to 1st account", async () => {
    const fucks = await FUCKSToken.deployed();
    const tokens = 100000;

    const acc0_balance = (await fucks.balanceOf(accounts[0])).toNumber();
    const acc1_balance = (await fucks.balanceOf(accounts[1])).toNumber();

    const res = await fucks.transfer(accounts[1], tokens, { from: accounts[0] });
    assert.equal(res.receipt.status, true, "could not transfer tokens");

    const acc0_balance_new = (await fucks.balanceOf(accounts[0])).toNumber();
    const acc1_balance_new = (await fucks.balanceOf(accounts[1])).toNumber();

    assert.equal(acc0_balance_new, acc0_balance - tokens, "acc 0 balance is not correctly deducted");
    assert.equal(acc1_balance_new, acc1_balance + tokens, "acc 1 balance is not correctly added");
  });
});
