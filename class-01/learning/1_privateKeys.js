var crypto = require("crypto");
var privateKey = crypto.randomBytes(32);
console.log("\ncrypto: Private key");
console.log(privateKey.toString("hex"));

var { ethers } = require("hardhat");
privateKey = ethers.Wallet.createRandom().privateKey;
console.log("\nEthers.js: Private key");
console.log(privateKey);

var { ec } = require("elliptic");
var curve = new ec("secp256k1");
var entropy = crypto.randomBytes(32);
var keyPair = curve.genKeyPair({ entropy });
console.log("\nElliptic curve: Private key");
console.log(keyPair.getPrivate("hex"));
