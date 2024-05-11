// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// Asumir que IEleecciones es un estandar
interface IEleecciones {
    function votar() external returns (bool);

    function consultarConteo() external;
}

contract InterfaceId is IEleecciones {
    /**
     * InterfaceId
     * - es una manera de programatica de saber si un contrato ha implementado una interface (estandar)
     * - es un resumen de todos los metodos que se encuentran dentro de la interface
     * - se aplica XOR a todos los metodos de la interface para llegar al interface id
     */

    function votar() external returns (bool) {}

    function consultarConteo() external {}

    function getInterfaceId() external pure returns (bytes4) {
        return type(IEleecciones).interfaceId;
    }
}
