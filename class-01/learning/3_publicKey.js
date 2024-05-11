var { ec } = require("elliptic");
var curve = ec("secp256k1");

var pk = "e0eaab0558cac71f5b7efb11668f324000a76ab3843d2e5becfb201cbec97adc";

// G: generador de la curva
// p: campo finito
// Public Key = (d * G) mod p
// Public Key = (llave Privada * G) mod p

var publicKey = curve.g.mul(pk); // internamente hace mod p
console.log("Llave public", publicKey.encode("hex"));
// 04: version no compacta (concatena "x" y "y")
// 02: version compacta (solo una coordenada)
// 049d4b0a9f4cbdeeb35a328a71d19d0f184665017b6c4a77b3e23e8edcbc850921da6a7859df1797ed2dbda698cbd6f16b62be58fd85d05b1bbb3e9547c8f81127
// x:9d4b0a9f4cbdeeb35a328a71d19d0f184665017b6c4a77b3e23e8edcbc850921
// y:                                                                da6a7859df1797ed2dbda698cbd6f16b62be58fd85d05b1bbb3e9547c8f81127
console.log("Llave public (x)", publicKey.getX().toString(16));
console.log("Llave public (y)", publicKey.getY().toString(16));
