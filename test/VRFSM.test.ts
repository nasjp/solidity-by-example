import { ethers } from "hardhat";

describe("VRFSM", function () {
  it("deploy", async function () {
    const VRFSM = await ethers.getContractFactory("VRFSM");
    const vrfsm = await VRFSM.deploy();
    await vrfsm.deployed();
  });
});
