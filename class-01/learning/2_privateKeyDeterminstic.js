var ecc = require("tiny-secp256k1");
var { BIP32Factory } = require("bip32");

var bip39 = require("bip39");
var bip32 = BIP32Factory(ecc);

// Crear frase semilla
// var mnemonic = bip39.generateMnemonic();
var mnemonic =
  "great refuse hip milk sister impulse hockey float situate struggle obey tuition";
// console.log(mnemonic);
// great refuse hip milk sister impulse hockey float situate struggle obey tuition

// Convertir semilla en Bytes (buffer)
var seed = bip39.mnemonicToSeedSync(mnemonic);
// console.log(seed);

// Creamos Billetera jarquimente determinista
var hdWallet = bip32.fromSeed(seed);

// Derivation path (camino)
var derivationPath = "m/44'/60'/0'/0";

// Obteniendo mi primera llave privada
var firstPrivateKey = hdWallet
  .derivePath(derivationPath + "/" + 0)
  .privateKey.toString("hex");
console.log("1st", firstPrivateKey);

var secondPrivateKey = hdWallet
  .derivePath(derivationPath + "/" + 1)
  .privateKey.toString("hex");
console.log("2nd", secondPrivateKey);

var thirdPrivateKey = hdWallet
  .derivePath(derivationPath + "/" + 2)
  .privateKey.toString("hex");
