// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ATK is ERC20, Ownable(msg.sender) {
    uint256 public totalEmitido;

    constructor() ERC20("Abundance Token", "ATK") {
    }

    function emitirTokens(uint256 quantidade) external onlyOwner {
        _mint(owner(), quantidade);
        totalEmitido += quantidade;
    }

    function _beforeTokenTransfer(address de, address para, uint256 quantidade) internal  {
        super._beforeTokenTransfer(de, para, quantidade);
        if (de == address(0) || para == address(0)) {
            return;
        }
        if (de == owner()) {
            uint256 saldoDepois = balanceOf(owner()) - quantidade;
            uint256 minimoNecessario = (totalEmitido * 30) / 100;
            require(
                saldoDepois >= minimoNecessario,
                "ATK: Proprietario deve manter no minimo 30% dos tokens emitidos."
            );
        }
    }
}