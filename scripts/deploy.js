// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
 const [owner] = await hre.ethers.getSigners();
 const DMKContractFactory = await hre.ethers.getContractFactory("DamiKing");
 const DMKContract = await DMKContractFactory.deploy();
 await DMKContract.deployed();
 console.log("Smart Contract Deployed with the address: ",owner.address);
 console.log("Total Suppy: ",await DMKContract.checkBalance(owner.address), await DMKContract.symbol());
 console.log("owner address: ", owner.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
