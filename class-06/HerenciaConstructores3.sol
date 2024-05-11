// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Human {
    string private saluteHuman;
    uint256 private ageHuman;

    constructor(string memory _salute, uint256 _age) {
        saluteHuman = _salute;
        ageHuman = _age;
    }
}

contract Male is Human {
    uint256 height;

    constructor(
        string memory _salute,
        uint256 _age,
        uint256 _height
    ) Human(_salute, _age) {
        height = _height;
    }
}

// los contratos Male y Human no tienen ninguna relación entre sí
// Aplica la regla de linearización (desde el más base hasta el más derivado)?

contract Programmer is Male {
    constructor(
        string memory _salute,
        uint256 _age,
        uint256 _height
    ) Male(_salute, _age, _height) {}
}
