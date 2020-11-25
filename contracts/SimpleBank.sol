// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

contract SimpleBank {

/* Fill in the keyword. Hint: We want to protect our users balance from other contracts*/
    mapping (address => uint) private balances;
    /* Fill in the keyword. We want to create a getter function and allow contracts to be able to see if a user is enrolled.  */
    mapping (address => bool) public enrolled;

/* Let's make sure everyone knows who owns the bank. Use the appropriate keyword for this*/
    address public owner;

/* Add an argument for this event, an accountAddress */
    event LogEnrolled(address accountAddress);

/* Add 2 arguments for this event, an accountAddress and an amount */
    event LogDepositMade(address accountAddress, uint amount);

    
    event LogWithdrawal(address accountAddress, uint withdrawAmount, uint newBalance);

 /* Create an event called LogWithdrawal */
    /* Add 3 arguments for this event, an accountAddress, withdrawAmount and a newBalance */


    //
    // Functions
    //

    /* Use the appropriate global variable to get the sender of the transaction */

// first argument constructor
    constructor() public {
        owner = msg.sender;
    }


    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    function enroll() public returns (bool){
        address bank_customer = msg.sender;
        enrolled[bank_customer] = true;
        emit LogEnrolled(bank_customer);
    }

    modifier onlyEnrolled {
        require(
            enrolled[msg.sender] = true,
            "Account"
        );
        _;
    }

      
    function withdraw(uint withdrawAmount) public onlyEnrolled returns (uint) {

        if(balances[msg.sender] >= withdrawAmount){
            balances[msg.sender] <= withdrawAmount;
            return balances[msg.sender];
        } else {
            return balances[msg.sender];
        }
    }

}