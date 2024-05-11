var { expect } = require("chai");

var {
  getAddressFromPrivateKey,
} = require("../class-01/exercises/ethereumAddress");

describe("Derive Ethereum Address from Private Key", () => {
  it("Given a Private Key, produces the right Ethereum Address", () => {
    expect(
      getAddressFromPrivateKey(
        "e0eaab0558cac71f5b7efb11668f324000a76ab3843d2e5becfb201cbec97adc"
      )
    ).to.be.equal("0x08Fb288FcC281969A0BBE6773857F99360f2Ca06".toLowerCase());
  });
});
