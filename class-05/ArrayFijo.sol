// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ArrayFijo {
    /**
    ARRAY FIJO
    - Ya tiene definido la cantidad de elementos del array
    - No se puede incrementar/disminuir la cantidad de elementos del array
    - No funciona push ni pop
    - Se guarda informacion usando los índice del array: arr[0] = value;
    - Dentro de un método no puedo crear arrays dinámicos; solo arrays fijos
    - Los arrays fijos que se crean dentro de los métodos solo pueden ser 'memory', no 'storage'
    
    T[N] nombreVariable;
    T: tipo de dato
    N: cantidad de elemtnos

    */

    // Definir un array fijo de 5 elementos del tipo de dato uint256
    uint256[5] public arrInteger;
    // Definir un array fijo de 100 bool;
    bool[100] public arrBools;

    function guardarInfoEnArray() public {
        arrInteger[0] = 123;
        // ...
        arrInteger[4] = 134324;
    }

    function deleteInfoArray() public {
        // no podemos eliminar un elemento. Solo podemos resetearlo a su valor de default
        delete arrInteger[0];
    }

    function iterate() public {
        address[] memory _listaAddresses2 = new address[](5);

        address[6] memory _listaAddresses;

        _listaAddresses[0] = address(this);
        _listaAddresses[1] = address(0);

        for (uint256 i; i < _listaAddresses.length; i++) {}
    }
}
