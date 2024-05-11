var {
  cipher,
  sign,
  hash,
  recoverPublicKey,
  createIdentity,
  encryptWithPublicKey,
  decryptWithPrivateKey,
} = require("eth-crypto");

var alice = createIdentity();
var bob = createIdentity();

async function signAndEncryptBobMessage() {
  var loveLetter = "Dear Alice, this is a secret letter to you";
  var hashedMessage = hash.keccak256(loveLetter);

  var signature = sign(bob.privateKey, hashedMessage);

  var payload = JSON.stringify({
    message: loveLetter,
    signature,
  });

  var encryptedObject = await encryptWithPublicKey(alice.publicKey, payload);

  var encryptedString = cipher.stringify(encryptedObject);
  return encryptedString;
}

async function decryptingAndAuthenticatingBobMessage() {
  var encrypted = cipher.parse(await signAndEncryptBobMessage());

  var decrypted = await decryptWithPrivateKey(alice.privateKey, encrypted);

  var decryptedPayload = JSON.parse(decrypted);

  var messageBob = decryptedPayload.message;
  console.log("mensaje de Bob", messageBob);
  var hashedMessageBob = hash.keccak256(messageBob);
  var signatureBob = decryptedPayload.signature;

  var publicKeyRecovered = recoverPublicKey(signatureBob, hashedMessageBob);
  console.log("Lo envio Bob?", publicKeyRecovered == bob.publicKey);
}

// signAndEncryptBobMessage();
decryptingAndAuthenticatingBobMessage();
