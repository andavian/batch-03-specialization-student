var { ec } = require("elliptic");
var curve = ec("secp256k1");
var { keccak256 } = require("js-sha3");

var pk = "e0eaab0558cac71f5b7efb11668f324000a76ab3843d2e5becfb201cbec97adc";
var publicKey = curve.g.mul(pk).encode("hex");

// convertimos a bytes nuestra public key
var publicKeyBytes = Buffer.from(publicKey, "hex");
// sacamos un byte de informacion (8 bits, 2 characters)
publicKeyBytes = publicKeyBytes.slice(1);

// Aplicando la funcion hash
var hash = keccak256(publicKeyBytes);

// Nos quedamos con los 40 ultimos chars
var ethereumAddress = "0x" + hash.slice(-40);
console.log("Ethereum Address", ethereumAddress);
// 0x08fb288fcc281969a0bbe6773857f99360f2ca06
