// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ArrayDinamico {
    // T[] nombreVariable;
    // Si tiene push, pop
    // Puede crecer y disminuir en tamaño
    // Solamente se definen dentro de la sección STORAGE

    // definir array dinamico de entero
    uint256[] arrDinEntero;
    // definir array dinamico de addresses
    address[] arrDinAddress;
    // definir array dinamico de boolean
    bool[] arrDinBool;

    // definir array dinamico de structs
    struct ID {
        string nombre;
        string apellido;
    }
    ID[] arrDinStruc;

    function guardarInfoArray() public {
        arrDinEntero.push(12); // [12]
        arrDinEntero.push(34); // [12, 34]
        arrDinEntero.push(56); // [12, 34, 56]
    }

    function deleteEleArray(uint256 _el) public {
        delete arrDinEntero[_el];
        //  [12, 34, 56]
        // delete arrDinEntero[1]; => [12, 0, 56]
    }

    function eliminarInfoArray() public {
        // JS: .map, .reduce, .filter, .unshift
        //  [12, 34, 56]
        arrDinEntero.pop();
        //  [12, 34]
        arrDinEntero.pop();
        //  [12]
        // uint256 el = arrDinEntero.pop(); NO ES POSIBLE
    }
}
