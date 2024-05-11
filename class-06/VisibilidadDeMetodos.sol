// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// 1: view, pure (NO SIEMPRE SE PONEN)
// 2: external, public, internal, private (SIEMPRE SE ESCOGE UNO DE ELLOS)

contract VisibilidadDeMetodos {
    // public
    // 1. Llamado desde afuera (llamado por un EOA)
    // 2. Llamado desde otro contrato inteligente (llamado desde un SCA)
    // 3. Este método es heredable
    // 4. Este método se muesta en el ABI (producto de la compilación)
    // 5. Este método se puede sobreescribir
    // 6. Puede ser usando dentro de este mismo contrato
    function funcionPublic() public {}

    // internal
    // 1. Este método es heredable
    // 2. Este método se puede sobreescribir
    // 3. Puede ser usando dentro de este mismo contrato
    function funcionInternal() internal {}

    // private
    // 1. Puede ser usando dentro de este mismo contrato
    function funcionPrivate() private {}

    // external
    // 1. Llamado desde afuera (llamado por un EOA)
    // 2. Llamado desde otro contrato inteligente (llamado desde un SCA)
    // 3. Este método es heredable
    // 4. Este método se muesta en el ABI (producto de la compilación)
    // 5. Este método se puede sobreescribir
    function funcionExternal() external {}
}
