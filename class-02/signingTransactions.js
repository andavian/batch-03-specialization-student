var { ethers } = require("hardhat");
var { FeeMarketEIP1559Transaction } = require("@ethereumjs/tx");
require("dotenv").config();

async function sendTransaction() {
  var [owner] = await ethers.getSigners();

  // crear el calldata
  var calldata =
    "0xa9059cbb000000000000000000000000ca420cc41ccf5499c05ab3c0b771ce780198555e00000000000000000000000000000000000000000000000000000000000186a0";

  // crear una billetera que firma transactions
  var wallet = new ethers.Wallet(process.env.PRIVATE_KEY, ethers.provider);
  var contractAddress = "0x982AbE5D0191510A6c4531D956a94C441adDf93A";

  // creando el objeto transaction
  var tx = {};
  tx.to = contractAddress;
  tx.data = calldata;
  tx.gasLimit = 50000n;

  // firma la transaction (usando la llave privada) y propaga la transaccion a la red
  var receipt = await wallet.sendTransaction(tx);
  console.log(receipt.hash);
}

async function rawTransaction() {
  var wallet = new ethers.Wallet(process.env.PRIVATE_KEY, ethers.provider);
  var contractAddress = "0x982AbE5D0191510A6c4531D956a94C441adDf93A";
  var calldata =
    "0xa9059cbb000000000000000000000000ca420cc41ccf5499c05ab3c0b771ce780198555e00000000000000000000000000000000000000000000000000000000000186a0";

  var txData = {};
  txData.nonce = await ethers.provider.getTransactionCount(wallet.address);
  txData.to = contractAddress;
  txData.data = calldata;
  txData.gasLimit = 50000; //numbern: big number
  txData.chainId = 80002; // el id del blockchain con el que interactuas
  txData.type = 2;
  txData.value = 0;
  txData.maxPriorityFeePerGas = 2000000000;
  txData.maxFeePerGas = 1200000000000;

  // firmando la transaction
  var tx = FeeMarketEIP1559Transaction.fromTxData(txData);
  var signedTx = tx.sign(Buffer.from(process.env.PRIVATE_KEY, "hex"));
  var signedTxSerialized = signedTx.serialize().toString("hex");

  // eth_sendRawTransaction
  var receipt = await ethers.provider.send("eth_sendRawTransaction", [
    "0x" + signedTxSerialized,
  ]);
  console.log(receipt);
}

rawTransaction();
// sendTransaction();
