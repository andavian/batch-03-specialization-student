/**
 * Problem: Write a function that takes a private key as input and generates the corresponding Ethereum address.
 *          The function should return the address as a string.
 *          The address should be prefixed with '0x'.
 *          The address should be the last 20 bytes of the keccak256 hash of the public key.
 *
 * The function method is getAddressFromPrivateKey(privateKey: string): string
 * Steps:
 * 1 - Initialize the secp256k1 curve
 * 2 - Generate a key pair from the private key (use keyFromPrivate)
 * 3 - Get the public key from the key pair (use getPublic)
 * 4 - Hash the public key using keccak256 and remove the first byte (0x04) from the public key
 * 5 - Add the prefix '0x' to the hash and take the last 20 bytes (40 characters)
 *
 * Run the tests with the following command:
 * npx hardhat test test/ethereumAddress.js
 */

//0. import 'elliptic' and 'js-sha3' libraries

function getAddressFromPrivateKey(privateKey) {
  // 1 - Initialize the secp256k1 curve
  // 2 - Generate a new key pair
  // 3 - Get the public key from the key pair (concatenate X and Y coordinates)
  // 4 - Hash the public key using keccak256 and remove the first byte (0x04) from the public key
  // 5 - Add the prefix '0x' to the hash and take the last 20 bytes (40 characters)
  //   return address;
}

module.exports = { getAddressFromPrivateKey };
