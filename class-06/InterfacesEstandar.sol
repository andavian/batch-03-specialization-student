// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * Interfaces:
 * - Sirven para aplicar un estándar a un contrato iteligente:
 *      obligar a que el contrato implemente ciertos métodos
 *      Ejemplos de estándares de activos digitales en el Blockchain: ERC721, ERC1155, ERC777, ERC20
 *
 *
 * - Para crear una referencia de otro contrato ya publicado y poder usar métodos
 *      Sirve hacer llamadas intercontratos (desde un contrato puedes llamar a al método de otro contrato)
 */

interface IEleecciones {
    function votar() external returns (bool);

    function consultarConteo() external;
}

contract Elecciones is IEleecciones {
    function votar() public returns (bool) {}

    function consultarConteo() public {}

    function conteoVote() public {}
}

contract Elecciones2 is IEleecciones {
    function votar() public returns (bool) {}

    function consultarConteo() public {}
}

contract Elecciones3 is IEleecciones {
    function votar() public returns (bool) {}

    function consultarConteo() public {}
}
