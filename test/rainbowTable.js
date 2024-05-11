var { expect } = require("chai");
var { hash } = require("eth-crypto");

var { findPassword } = require("../class-01/exercises/rainbowTable");
var { mostCommonPasswords } = require("../class-01/exercises/utils");

describe("Finding a password: The Rainbow Table", () => {
  mostCommonPasswords.forEach((password) => {
    it(`Should find the password for ${password}`, () => {
      expect(findPassword(hash.keccak256(password))).to.be.equal(password);
    });
  });
});
