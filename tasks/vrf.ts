import { task } from "hardhat/config";
import { HardhatRuntimeEnvironment } from "hardhat/types";

task("deployVRFSM", async (taskArgs, hre) => {
  const factory = await hre.ethers.getContractFactory("VRFSM");

  const subscriptionManager = await factory.deploy();

  await subscriptionManager.deployed();

  console.log(subscriptionManager.address);
});

task("setupVRFSM", async (taskArgs, hre) => {
  const subscriptionManager = await hre.ethers.getContractAt(
    "VRFSM",
    "0xE4F65d701E635b8786e53a3619F0c3907BE31c84"
  );

  const tx = await subscriptionManager.setup();
  await tx.wait();
});

task("checkVRFSM", async (taskArgs, hre) => {
  const subscriptionManager = await hre.ethers.getContractAt(
    "VRFSM",
    "0xE4F65d701E635b8786e53a3619F0c3907BE31c84"
  );

  const randomNumber = await subscriptionManager.randomWord();

  console.log(randomNumber);
});
