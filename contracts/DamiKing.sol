// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DamiKing is ERC20 {
    //set and admin for access control
    address public admin;

    //relay some message status to the frontend
    event serverStatus(string serverMessage);


    //ERC20 constructor from openzeppelin takes in 2values of Token Name and Token Symbol
    constructor() ERC20('DamiKing', 'DMK'){
    
        //mint and set the totalsupply to 10,000 $DMK
        _mint(msg.sender, 10000 * 10 ** decimals());

        //set the admin variable to the deployer of the contract
        admin = msg.sender;
    }

   //a function to mint more token incase you dont have a fixed supply
   function mint(address to, uint amount) external{
    //a security check tto ensure only authorized address can mint more token to avoid inflation
    require(msg.sender == admin, "Only Admin can mint more token");
    _mint(to, amount);
   }


   function transferTo(address to, uint amount) external{
    if(balanceOf(msg.sender) < amount){
        emit serverStatus("You don't have sufficient $DMK, please recharge your wallet");
    }else{
        transfer(to, amount);
        emit Transfer(msg.sender, to, amount);
    }
    }

    
    function checkBalance(address _account) external view returns(uint256){
        return balanceOf(_account);
    }


    //burn function made public so that anybody can call it
    function Burn(uint256 _amount) public{
        _burn(msg.sender, _amount);
    }
}