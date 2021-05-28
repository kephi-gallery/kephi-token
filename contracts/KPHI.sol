// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KPHI is ERC20Pausable, Ownable {

    constructor(address _owner) ERC20("Kephi Token","KPHI") {
        _mint(_owner, 50000000*(10**18));
        transferOwnership(_owner);
    }

    function pause() external onlyOwner {
        super._pause();
    }

    function unpause() external onlyOwner {
        super._unpause();
    }

    function burn(uint256 amount) external onlyOwner {
        _burn(_msgSender(), amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override {
        ERC20Pausable._beforeTokenTransfer(from, to, amount);
    }
}
