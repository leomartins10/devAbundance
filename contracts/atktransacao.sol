
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ATKToken is ERC20 { // começa o contrato 
    address public owner; // cria o dono do contrato 

    // cria evento para registrar a transação no mercado secundário
    event ATKTransfer(address indexed from, address indexed to, uint256 amount);

    constructor() ERC20("ATK Token", "ATK") {
        owner = msg.sender;
        _mint(msg.sender, 1000000 * (10 ** decimals())); // 1 milhão de ATK para o deployer
    }

    /**
     * @dev Função para transação de ATK entre duas carteiras no mercado secundário.
     * @param from Endereço do remetente.
     * @param to Endereço do destinatário.
     * @param amount Quantidade de tokens ATK a serem transferidos.
     */
    function transferATK(address from, address to, uint256 amount) public returns (bool) {
        require(balanceOf(from) >= amount, "Saldo insuficiente!");
        require(to != address(0), "Endereco invalido!");

        // Transferência de tokens
        _transfer(from, to, amount);

        // Emite evento de transação
        emit ATKTransfer(from, to, amount);

        return true;
    }

    /**
     * @dev Função para verificar o saldo de uma carteira.
     * @param account Endereço da carteira a ser consultada.
     */
    function getBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}
