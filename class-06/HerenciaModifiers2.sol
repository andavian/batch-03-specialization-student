// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Paused {
    bool private paused;

    function pause() internal virtual {
        paused = true;
    }

    function unpause() internal {
        paused = false;
    }

    modifier whenNotPaused() virtual {
        require(!paused, "Method is paused");
        _;
    }
}

contract ModiferInheritance is Paused {
    bool paused123;

    // otro setter para paused123

    modifier whenNotPaused() override {
        require(!paused123, "Method is paused");
        _;
    }

    function protectedByPaused() public whenNotPaused {}
}
