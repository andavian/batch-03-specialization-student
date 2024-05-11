/**
 * BRUTE FORCE HASHING: The Rainbow Table
 *
 * Hashing function have properties that makes them very useful for cryptography.
 * 1. Deterministic: Given the same input, the output will always be the same.
 * 2. One-way: It is impossible to reverse the hashing function to get the original input.
 * 3. Collision-resistant: It is impossible to find two different inputs that will produce the same output.
 * 4. Pre-image resistant: It is impossible to find an input that will produce a given output.
 * 5. Avalanche effect: A small change in the input will produce a large change in the output.
 *
 * EXERCISE: We will guess the input of a hash by using a rainbow table.
 *
 * What is a rainbow table?
 * It is a list of the most common passwords and their corresponding hash values.
 * With this table, an attacker could easily guess the password of a user by comparing the hash
 * of the password they entered with the hash values in the rainbow table.
 *
 * If the hash value is not in the table, he could easily create another table with more common passwords.
 *
 * To defend against use strong passwords, salted hashes and a slow hashing function.
 *
 * SIDE NOTE:
 *   What is a slow hashing function?
 *   A slow hash function is a type of cryptographic hash function that is designed to take
 *   a significant amount of time to compute, making it more difficult and resource-intensive
 *   for an attacker to perform a brute-force attack or generate a rainbow table.
 *
 *
 * Create a function that will:
 * - Receive a hash value
 * - Compare it with the most hash values of the common passwords
 * - Return the password if it is found
 * - If not found, return an empty string
 *
 * HINT: Use the 'mostCommonPasswords' array from the './utils.js' file
 *
 * Run the tests with the following command:
 * npx hardhat test test/rainbowTable.js
 */

var { hash } = require("eth-crypto");
var { mostCommonPasswords } = require("./utils");

function findPassword(hashValue) {
  // if (passwordFound) {return password;}
  return "";
}

module.exports = { findPassword };
