require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545/",
      accounts: [process.env.PRIVATE_KEY],
    },
    moonbase: {
      url: process.env.MOONBASE_TESTNET_URL,
      accounts: [process.env.PRIVATE_KEY],
      timeout: 0,
      gas: "auto",
      gasPrice: "auto",
    },
  },
};
