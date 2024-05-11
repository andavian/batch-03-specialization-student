var { encryptWithPublicKey, decryptWithPrivateKey } = require("eth-crypto");
var { ec } = require("elliptic");

var EC = new ec("secp256k1");
var bobKeyPair = EC.genKeyPair();
var publicKeyBob = bobKeyPair.getPublic("hex");
var privateKeyBob = bobKeyPair.getPrivate("hex");

async function encryptAndDecryptMessage() {
  // Alice le enviara un mensaje secreto a Bob
  var message = "Hello Bob, this is a secret message";

  var encryptedMessage = await encryptWithPublicKey(publicKeyBob, message);

  console.log("Mensaje encriptado", encryptedMessage);

  var decryptedMessage = await decryptWithPrivateKey(
    privateKeyBob,
    encryptedMessage
  );

  console.log("Mensaje secreto de Alice", decryptedMessage);
}

encryptAndDecryptMessage();
