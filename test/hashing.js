var { expect } = require("chai");

var { answerOne, answerTwo } = require("../class-01/exercises/hashing");
var { keccak256 } = require("js-sha3");

describe("Verifies answers for hashing exercises", () => {
  it("1 - Collision with a secret", () => {
    expect(keccak256(String(answerOne))).to.be.equal(
      "983caa3bec7a5694615305790d6eb11a4854346491f59cfb03eb9ef47198e23a"
    );
  });
  it("2 - Collision between two distinct values", () => {
    expect(keccak256(String(answerTwo))).to.be.equal(
      "1b6edb65b6c2611a7285cc668f4110f574a7bc3b0d28690b40a16f141eada39a"
    );
  });
});
