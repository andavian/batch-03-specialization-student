// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract EliminacionEnKTime {
    uint256[] listaDeEnteros;

    constructor() {
        listaDeEnteros.push(6);
        listaDeEnteros.push(7);
        listaDeEnteros.push(9);
        listaDeEnteros.push(8);
        listaDeEnteros.push(10);
        listaDeEnteros.push(5);
        listaDeEnteros.push(2);
        listaDeEnteros.push(3);
        listaDeEnteros.push(1);
        listaDeEnteros.push(4);
    }

    // [6, 7, 9, 8, 10, 5, 2, 3, 1 ,4]

    function elmininarLinear(uint256 _el) public {
        uint256 i;
        for (i; i < listaDeEnteros.length; i++) {
            if (listaDeEnteros[i] == _el) break;
        }

        for (uint256 k = i + 1; k < listaDeEnteros.length; k++) {
            listaDeEnteros[i] = listaDeEnteros[k];
            i++;
        }
        listaDeEnteros.pop();
    }

    function elmininarLinear2(uint256 _el) public {
        uint256 i;
        for (i; i < listaDeEnteros.length; i++) {
            if (listaDeEnteros[i] == _el) break;
        }

        listaDeEnteros[i] = listaDeEnteros[listaDeEnteros.length - 1];
        listaDeEnteros.pop();
    }

    // function eliminarEnKtime(uint256 _el)
}

contract EliminarEnKTime {
    uint256[] listaDeEnteros;
    mapping(uint256 => uint256) indexes;
    uint256 counter; // indica el indice del elemento que se guarda en el array

    constructor() {
        _guardarEnter(6);
        _guardarEnter(7);
        _guardarEnter(9);
        _guardarEnter(8);
        _guardarEnter(10);
        _guardarEnter(5);
        _guardarEnter(2);
        _guardarEnter(3);
        _guardarEnter(1);
        _guardarEnter(4);
    }

    // [6, 7, 9, 8, 10, 5, 2, 3, 1 ,4]

    function _guardarEnter(uint256 _el) internal {
        listaDeEnteros.push(_el);
        indexes[_el] = counter;
        counter++;
    }

    function eliminarEntero(uint256 _el) public {
        // leemos el indice del elemento a borrar
        uint256 ix = indexes[_el];

        // capturo el ultimo elemento del array
        uint256 lastEl = listaDeEnteros[listaDeEnteros.length - 1];

        // reemplazo el ultimo elemento en el indice que quiero borrar
        listaDeEnteros[ix] = lastEl;

        // elimino ultimo elemento duplicado
        listaDeEnteros.pop();

        // actualizo el indice el mapping para el ultimo elemento que reemplazo a _el
        indexes[lastEl] = ix;

        counter--;

        // eliminar el indice dentro del mapping para el elemento borrado
        delete indexes[_el];
    }
}
