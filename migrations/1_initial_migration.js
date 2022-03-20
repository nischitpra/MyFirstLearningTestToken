const FUCKSToken = artifacts.require("FUCKSToken");
const MappingTest = artifacts.require("MappingTest");
const RemoteCall = artifacts.require("RemoteCall");

module.exports = function (deployer) {
  deployer.then(async () => {
    await deployer.deploy(FUCKSToken);
    await deployer.deploy(MappingTest, FUCKSToken.address);
    await deployer.deploy(RemoteCall, MappingTest.address);
  });
};
