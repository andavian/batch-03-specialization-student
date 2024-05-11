// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface IEleecciones {
    function votar() external returns (bool);

    function consultarConteo() external;
}

contract ObtenerSelector {
    IEleecciones eleccion;

    function getSelector() external view returns (bytes4) {
        return eleccion.votar.selector;
    }

    function getSelectorManual() external pure returns (bytes4) {
        return bytes4(keccak256("votar()"));
    }
}
