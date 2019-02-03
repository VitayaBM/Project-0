/*
    This will contain the three methods pertaining to the Bank itself.
    • Check if an account is overdrawn and change the status of the account accordingly.
    • Create a new transaction relating to the account.
    • Update the account based on all related transactions to show current balance.
*/
public with sharing class RevatureBank {
    private static List<BankAccount__c> myAccounts = new List<BankAccount__c>();

    public RevatureBank() {

    }

//This method is for filling myAccounts with all the Bank Accounts on the Org.
    public static void fillList()
    {
        for(BankAccount__c ba : [SELECT ID, name FROM BankAccount__c])
        {
            myAccounts.add(ba);
            system.debug(ba.name);
        }
    }

    public static void checkOverdrawn()
    {
        
    }
}
