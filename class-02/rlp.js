var { ethers } = require("hardhat");
var { keccak256, encodeRlp } = ethers;

async function calculateAddress() {
  // obteniendo el sender
  var [sender] = await ethers.getSigners();

  // obteniendo el nonce
  // getTransactionCount: entrega el nonce
  var nonce = await ethers.provider.getTransactionCount(sender.address);
  console.log("Nonce", nonce);
  var nonceHex = nonce.toString(16);
  // 0x, 0x1, 0x2, ..., 0x10
  if (nonceHex == "0") {
    nonceHex = "0x";
  } else if (nonceHex.length % 2 != 0) {
    nonceHex = "0x0" + nonceHex;
  } else {
    nonceHex = "0x" + nonceHex;
  }

  // keccak256(rlp.encode(sender, nonce)) => Address

  var addressContrato =
    "0x" + keccak256(encodeRlp([sender.address, nonceHex])).slice(-40);
  console.log("Address Contrato", addressContrato);
}

async function deployContract() {
  var contract = await ethers.deployContract("MyFirstContract");
  console.log("Contract Address", await contract.getAddress());
  // 0x171a385fEf9422F78925D53ec13586689b31dcAd
}
// deployContract();
// calculateAddress();
