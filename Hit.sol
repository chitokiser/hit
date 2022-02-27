// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC20/ERC20.sol)

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
//오픈 제플린에서 ERC20 토큰 계약 소스 가져오기
contract Hit is ERC20{

  address public hitbank;
  address public admin;
    constructor(string memory name, string memory symbol )ERC20(name,symbol){
        _mint(msg.sender,100000000000000000000*10000000000*uint(decimals(2))); //소수점2자리까지 표현
        admin=msg.sender;
    }
 function automint( )public{   // Hitbank 요청에 의한 자동이체
    require(hitbank==msg.sender);
    _mint(msg.sender,100000000000000000000*10000000000*uint(decimals(2)))
 }
 function hitexup(address _hibank)public{   //hitex 호출 시 자동 이체

    require(admin==msg.sender);
    hibank=_hitbank;
 }
}
