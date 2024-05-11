// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// pure:
// - no lees ningún estado del contrato
// - no lees ninguna variable
// - no tiene efectos secundarios (no altera ningún estado/varible del contrato)
contract Pure {
    function funcPure() public pure returns (uint256) {
        return 3;
    }

    function funcPure2(uint256 a) internal pure returns (uint256) {
        return a ** 3;
    }

    function funcPure3(uint256 a) external pure returns (uint256) {
        return a ** 3;
    }
}

// view:
// - sí lee estados del contrato
// - sí puede utilizar los valores de las variables de storage del contrato
// - no tiene efectos secundarios (no altera ningún estado/varible del contrato)
// - es read-only (lectura de las variables del contrato)

contract View {
    uint256 value = 143242423423;
    event Number(uint256 a);

    function funcView() public view returns (uint256) {
        // emit Number(value);
        return value;
    }

    function funcView2() internal view returns (uint256) {
        // emit Number(value);
        return value;
    }

    function funcView3() external view returns (uint256) {
        // emit Number(value);
        return value;
    }
}
