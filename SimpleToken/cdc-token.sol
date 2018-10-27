pragma solidity ^0.4.24;

import "./SafeMath.sol";

contract ERC20 {
    using SafeMath for uint256;

    // Internal Variables
    uint256 private _totalSupply = 1000000;
    mapping(address => uint256) private _balances;

    // Events
    event Transfer(address from, address to, uint256 amount);

    constructor() public {
        _balances[msg.sender] = _totalSupply;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    // acct 1: 2000
    // transfer(0xAnotherAddress, 4000)
    // 2^256-1 - 2000

    function _transfer(address from, address to, uint256 amount) internal {
        require(amount <= _balances[from], "Insufficient Funds");
        require(to != address(0), "Cannot transfer to burn address");

        _balances[from] = _balances[from].sub(amount);
        _balances[to] = _balances[from].add(amount);
        emit Transfer(from, to, amount);
    }
    
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
}
