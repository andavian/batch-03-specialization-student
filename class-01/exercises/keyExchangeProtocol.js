/**
 * KEY EXCHANGE PROTOCOL
 *
 * This technique allows two people to establish a secret key through an insecure communication (internet).
 * In other words, two people will arrive at one particular secret value that they only know, regardless if
 * they use the internet to coordinate what that value is.
 *
 * Let's see how this process works:
 *
 * 0 - Elliptic Curve Selection
 * Both Alice and Bob select a known and secure Elliptic Curve whose parameters are public.
 * Let's use this Elliptic Curve equation:
 *
 * y^2 =  x^3 - 3x + 4 (mod 17)
 * Parameters:
 * - Generator point G (x, y): (12, 9)
 * - n (order of the curve): 15
 * - p (Finite Field Group): 17
 *
 * 1 - Key Generation
 * Each party, Alice and Bob, needs to generate their own set of private and public keys
 *
 * Alice and Bob randomly select their private key.
 * They are nA and nB:
 *
 * - nA: private key Alice (only known by her)
 * - nB: private key Bob   (only known by him)
 *
 * Alice and Bob find their public key by using the Generator Point G
 * They are QA (public key Alice) and QB (public key Bob):
 *
 * - QA = nA * G
 * - QB = nB * G
 *
 * 2 - Key Exchange
 * Each party sends his public key to each other
 * - Bob receives QA, Alice's public key
 * - Alice receives QB, Bob's public key
 *
 *
 * 3 - Derivation of the secret value
 * Each party computes the secret value:
 *
 * Alice has: nA, QA and QB
 * Bob has: nB, QB and QA
 *
 * Alice computes secret value: S = nA * QB
 * Bob computes secret value:   S = nB * QA
 *
 * Now both have a secret value S that was coordinated through the internet.
 * This works because:
 *
 * For Alice: S = nA * QB = nA * (nB * G) = nA * nB * G
 * For Bob:   S = nB * QA = nB * (nA * G) = nA * nB * G
 *
 * At the heart of this technique we find the Elliptic Curve Discrete Logarithm Problem.
 */

/**
 * EXERCISE
 * Export the file where you developed the algorithm for the elliptic curve:
 * var { ECC, Point } = require("../learning/0_EllipticCurve");
 *
 * Use the following elliptic curve for computing a Shared Secret S:
 *
 *  * y^2 =  x^3 - 3x + 4 (mod 17)
 * Parameters:
 * - Generator point G (x, y): (12, 9)
 * - n (order of the curve): 15
 * - p (Finite Field Group): 17
 *
 * Alice sends you the QA that is: QA = (0, 15)
 * Your private key nB is:         nB = 13
 * Find S:                          S = ?
 * Find QB:                        QB = ?
 *
 * At the end, export the answers in module.exports such as:
 *
 * // Sx: coordinate x of shared secret S
 * // Sy: coordinate y of shared secret S
 * // QBx: coordinate x of Public Key QB
 * // QBy: coordinate y of Public Key QB
 * module.exports = { Sx, Sy, QBx, QBy };
 *
 * Tu run the tests:
 *
 * npx hardhat test test/keyExchangeProtocol.js
 */

// Import your Elliptic Curve
var { ECC } = require("../learning/0_EllipticCurve");

var a = -3;
var p = 17;

// module.exports = { Sx: , Sy: , QBx: , QBy:  };
