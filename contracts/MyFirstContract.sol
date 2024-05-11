// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract MyFirstContract {
    uint256 year = 2024;
    bool isBlockchain = true;
    address bbitesAdd = 0xCA420CC41ccF5499c05AB3C0B771CE780198555e;

    event Transfer(address from, address to, uint256 amount);

    function updateYear(uint256 _year) public {
        year = _year;
    }

    function getYear() public view returns (uint256) {
        return year;
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        // .. other operations
        emit Transfer(msg.sender, to, amount);

        return true;
    }
}
