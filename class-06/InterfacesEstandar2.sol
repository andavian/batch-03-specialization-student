// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface IEleeccionesGeneral {
    function consultarConteo() external;
}

interface IEleecciones is IEleeccionesGeneral {
    function votar() external returns (bool);
}

contract Elecciones is IEleecciones {
    function votar() public returns (bool) {}

    function consultarConteo() public {}

    function conteoVote() public {}
}
