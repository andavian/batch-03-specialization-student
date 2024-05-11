var { expect } = require("chai");
var {
  sign,
  encryptWithPublicKey,
  cipher,
  hash,
  createIdentity,
} = require("eth-crypto");

var {
  decryptVoteAndCount,
  encryptVote,
} = require("../class-01/exercises/voting");

describe("Voting: Public-key cryptography", () => {
  const candidates = ["Alice", "Bob", "Charlie"];
  const voters = Array(4)
    .fill(0)
    .map(() => createIdentity());
  const official = createIdentity();
  var votes;

  before(async () => {
    var promises = voters.map((voter) => {
      const candidate =
        candidates[Math.floor(Math.random() * candidates.length)];
      const encryptedVote = encryptVote(
        voter.privateKey,
        candidate,
        official.publicKey
      );
      return encryptedVote;
    });
    votes = await Promise.all(promises);
  });

  it("Should encrypt the vote with the official's public key", () => {
    votes.forEach((vote) => {
      expect(vote).to.be.a("string");
      expect(vote.length).to.be.equal(
        "1785171c2b373e15ef4f8545f2f3701902f14a301c05517bb99188068b3d91999ba0332e3f1386c0aff259a99a441f6b496428202dc8f42c53d7e49fe2f20391f6a4a8c672c2c83992af074a33ffb0d196232920477a2f4487c00137cfca379575241bf9d03ec6a5736d5f18aeb1f5aaa728a4cf39599a2f40f47bdcef79eb92dc3a086b1fddea257311a2621495b83e049691f581107eb50d80e4a4edf424d71217abe5c3226da5612c207e8085bb0113d565334606bf96963886e6eed1361018cd9c3fda00e530f11a9276099e1358cef3787c72b99f206bdcd321f31c893fac445d803e64c61131e7e796625f9cc271606f9832c4d4173cf7f49097bcb4f06b"
          .length
      );
    });
  });

  it("Should decrypt the vote with the official's private key and count", async () => {
    const publicKeyVoters = voters.map((voter) => voter.publicKey);
    const voteCounts = await decryptVoteAndCount(
      publicKeyVoters,
      votes,
      official.privateKey
    );
    expect(
      [...Object.keys(voteCounts)].reduce((acc, key) => {
        return acc + voteCounts[key];
      }, 0)
    ).to.be.equal(voters.length);
  });
});
