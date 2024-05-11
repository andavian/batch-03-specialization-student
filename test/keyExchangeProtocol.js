var { Sx, Sy, QBx, QBy } = require("../class-01/exercises/keyExchangeProtocol");
var { keccak_256 } = require("js-sha3");
var { expect } = require("chai");

var SxHashAnswer =
  "e4b1702d9298fee62dfeccc57d322a463ad55ca201256d01f62b45b2e1c21c10";
var SyHashAnswer =
  "13600b294191fc92924bb3ce4b969c1e7e2bab8f4c93c3fc6d0a51733df3c060";
var QBxHashAnswer =
  "d2f8f61201b2b11a78d6e866abc9c3db2ae8631fa656bfe5cb53668255367afb";
var QByHashAnswer =
  "5c4c6aa067b6f8e6cb38e6ab843832a94d1712d661a04d73c517d6a1931a9e5d";

describe("Key Exchange Protocolo Test", () => {
  it("Shared Secret coordinate x is correct", () => {
    expect(SxHashAnswer).to.be.equal(keccak_256(String(Sx)));
  });

  it("Shared Secret coordinate y is correct", () => {
    expect(SyHashAnswer).to.be.equal(keccak_256(String(Sy)));
  });

  it("Public Key Bob coordinate x is correct", () => {
    expect(QBxHashAnswer).to.be.equal(keccak_256(String(QBx)));
  });

  it("Public Key Bob coordinate y is correct", () => {
    expect(QByHashAnswer).to.be.equal(keccak_256(String(QBy)));
  });
});
