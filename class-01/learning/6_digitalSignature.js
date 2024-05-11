var { sign, hash, recoverPublicKey, createIdentity } = require("eth-crypto");

// Crear llaves de Alice
var alice = createIdentity();
var llavePublicAlice = alice.publicKey;

// Alice escribe el mensaje
// Alice hashea el mensaje
var message = "Hello Bob, this is a message from Alice";
var hashedMessage = hash.keccak256(message);

var signature = sign(alice.privateKey, hashedMessage);
console.log(signature);

// ---------------------------------------
// Verificacion de la firma digital de Alice

var publicKeyRecovered = recoverPublicKey(signature, hashedMessage);
console.log("Llave publica persona que firmo", publicKeyRecovered);
console.log(llavePublicAlice == publicKeyRecovered);
