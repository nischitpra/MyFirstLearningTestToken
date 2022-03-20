const MappingTest = artifacts.require("MappingTest");
const RemoteCall = artifacts.require("RemoteCall");

contract("test_RemoteCall", async (accounts) => {
  it("insert to list from mappingTest", async () => {
    const mappingTest = await MappingTest.deployed();
    const itemsSize = (await mappingTest.itemsSize()).toNumber();

    const res = await mappingTest.addItem("hello from mappingTest test", { gas: 100000 });
    assert.equal(res.receipt.logs[0].event, "Added", "emit event not matching");

    assert.equal((await mappingTest.itemsSize()).toNumber(), itemsSize + 1, "item not inserted correctly");
  });

  it("insert to list from remoteCall", async () => {
    const mappingTest = await MappingTest.deployed();
    const remoteCall = await RemoteCall.deployed();

    const item = "hello from test";
    const itemsLength = (await mappingTest.itemsSize()).toNumber();

    await remoteCall.addItem(item, { gas: 100000 });

    assert.equal((await mappingTest.itemsSize()).toNumber(), itemsLength + 1, "item not inserted correctly");
    assert.equal(await mappingTest.items.call(itemsLength), item, "item not inserted correctly");
  });
});
