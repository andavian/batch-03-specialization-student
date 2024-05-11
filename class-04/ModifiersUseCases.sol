// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract ModifierUseCases {
    // Modifier que permite al metodo ser llamado durante cierto tiempo
    uint256 windowTimeEnd = block.timestamp + 10 days;
    modifier validateTime() {
        require(block.timestamp < windowTimeEnd, "Time run out");
        _;
    }

    // Modifier que permite al metodo ser llamada 10 veces
    uint256 counter;
    modifier validateCounter() {
        require(counter < 11, "More than 10 calls");
        _;
    }

    // Modifier que permite al metodo pausar y despausarse
    // Si paused == false, no esta pausado
    // Si paused == true, sí está pausado
    bool paused; // false.
    modifier whenNotPaused() {
        require(!paused, "Method is paused");
        _;
    }

    function pause() public {
        paused = true;
    }

    function unpause() public {
        paused = false;
    }

    address myWallet = 0xCA420CC41ccF5499c05AB3C0B771CE780198555e;
    // Modifier que authentica quien llama al metodo
    modifier onlyMyWallet() {
        // msg.sender: una variable global. representa a la persona que llama al método
        require(msg.sender == myWallet, "Not my wallet");
        _;
    }

    // Modifier que protege al metodo para que una lista de personas en lista blanca lo llame

    function method1() public validateTime {}

    function method2() public validateCounter validateTime {
        // other operations..
        counter++;
    }

    function method3() public whenNotPaused {}

    function method4() public onlyMyWallet {}

    function method5() public {}

    function method6() public {}

    function method7() public {}

    function method8() public {}

    function method9() public {}
}
