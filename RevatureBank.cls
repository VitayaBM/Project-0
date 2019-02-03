/*
    This will contain the three methods pertaining to the Bank itself.
    • Check if an account is overdrawn and change the status of the account accordingly.
    • Create a new transaction relating to the account.
    • Update the account based on all related transactions to show current balance.
*/
public with sharing class RevatureBank {
    List<Bank_Account> myAccounts = new List<Bank_Account>;

    public RevatureBank() {

    }

//This method is for filling myAccounts with all the Bank Accounts on the Org.
    public static void fillList()
    {
        for(Bank_Account ba: [SELECT ID, name FROM Bank_Account])
        {
            myAccounts.add(ba);
            system.debug(ba.name);
        }
    }

    public static void checkOverdrawn()
    {
        
    }
}
