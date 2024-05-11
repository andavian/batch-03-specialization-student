// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract GrandPa {
    modifier mod() virtual {
        _;
    }
}

contract Father {
    modifier mod() virtual {
        _;
    }
}

contract Son is GrandPa, Father {
    modifier mod() override(GrandPa, Father) {
        _;
    }
}
