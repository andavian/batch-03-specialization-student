// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ArrayLiterals {
    uint256[] arrDinamicoEnteros = [1, 2, 3, 4, 5, 10000];

    // Crea un array de cuatro elementos del tipo de dato boolean
    // Para el indice 4 del array guarda X informacion: NO ES CORRECTO
    bool[4] arrFijoDeBooleans;

    function createArrayMemory() public {
        // TypeError: Type uint8[4] memory is not implicitly convertible to expected type uint256[4] memory.
        uint256[4] memory arryLiteralMemory = [uint256(1000), 2, 3, 4];
    }
}
