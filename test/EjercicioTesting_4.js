var {
  loadFixture,
  setBalance,
  impersonateAccount,
} = require("@nomicfoundation/hardhat-network-helpers");
var { expect } = require("chai");
var { ethers } = require("hardhat");

const getRole = (role) => ethers.keccak256(ethers.toUtf8Bytes(role));

const ROLE_ONE = getRole("ROLE_ONE");
const ROLE_TWO = getRole("ROLE_TWO");
const ROLE_THREE = getRole("ROLE_THREE");

describe("GRANULAR ROLES", function () {
  async function deployFixture() {
    const [owner, alice, bob, carl] = await ethers.getSigners();
    const otherAccounts = [alice, bob, carl];

    const GranualRoles = await ethers.getContractFactory("Ejercicio_4");
    const granularRoles = await GranualRoles.deploy();

    return { granularRoles, owner, alice, bob, carl, otherAccounts };
  }

  describe("Only Owner", () => {
    it("Verify only owner for grantRole", async function () {
      const { granularRoles, owner, alice, bob, carl, otherAccounts } =
        await loadFixture(deployFixture);

      await expect(
        granularRoles.connect(alice).grantRole(alice.address, ROLE_ONE)
      ).to.be.revertedWith("You are not the owner.");
    });
  });

  describe("Verify ROLE per method", function () {
    it("Verify method one with ROLE_ONE", async function () {
      const { granularRoles, owner, alice, bob, carl, otherAccounts } =
        await loadFixture(deployFixture);

      await expect(granularRoles.connect(alice).methodOne()).to.be.revertedWith(
        "You don't have assigned that role."
      );

      await granularRoles.grantRole(alice.address, ROLE_ONE);
      await granularRoles.connect(alice).methodOne();
    });

    it("Verify method one with ROLE_TWO", async function () {
      const { granularRoles, owner, alice, bob, carl, otherAccounts } =
        await loadFixture(deployFixture);

      await expect(granularRoles.connect(alice).methodTwo()).to.be.revertedWith(
        "You don't have assigned that role."
      );

      await granularRoles.grantRole(alice.address, ROLE_TWO);
      await granularRoles.connect(alice).methodTwo();
    });

    it("Verify method one with ROLE_THREE", async function () {
      const { granularRoles, owner, alice, bob, carl, otherAccounts } =
        await loadFixture(deployFixture);

      await expect(
        granularRoles.connect(alice).methodThree()
      ).to.be.revertedWith("You don't have assigned that role.");

      await granularRoles.grantRole(alice.address, ROLE_THREE);
      await granularRoles.connect(alice).methodThree();
    });
  });
});
