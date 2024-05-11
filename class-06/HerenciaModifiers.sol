// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {OnlyOwner} from "./OnlyOwner.sol";

contract Paused {
    bool private paused;

    function pause() internal {
        paused = true;
    }

    function unpause() internal {
        paused = false;
    }

    modifier whenNotPaused() {
        require(!paused, "Method is paused");
        _;
    }
}

contract ModiferInheritance is OnlyOwner, Paused {
    bool paused;
    bool owner;

    function protectedByOwner() public onlyOwner {}

    function protectedByPaused() public whenNotPaused {}

    function pauseMethod() public onlyOwner {
        pause();
    }
}
