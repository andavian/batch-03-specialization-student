// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Structs {
    /**
        Struct:
        - tipo de dato complejo (puede agrupar diferentes tipos de datos)
        - es un tipo de dato definido por el usuario
    */

    struct Balance {
        uint256 monto;
        uint256 limiteGastoMensual;
        uint256 interes;
        string nombre;
    }

    Balance _balance; // = inicializar struct

    function crearBalance() public {
        // manera legible de inicializar un struct
        _balance = Balance({
            interes: 120,
            monto: 123,
            nombre: "Cuenta ahorro",
            limiteGastoMensual: 456
        });
    }

    function crearBalanceSucinta() public {
        // manera legible de inicializar un struct
        _balance = Balance(123, 456, 120, "Cuenta ahorro");
        _balance.monto = 456;
        _balance.nombre = "Cuenta corriente";
    }
}
