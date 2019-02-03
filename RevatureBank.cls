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
        for(BankAccount__c ba : [SELECT ID, name, Stored_Amount__c, Overdrawn__c FROM BankAccount__c])
        {
            myAccounts.add(ba);
        }
    }

//This method is for checking if a Bank Account is overdrawn
//The method will search through the myAccounts list and find a Bank Account
//with a Bank Account Name field that matches accountNum and then check if that
//Bank Account's Stored Amount field is in the negatives.
    public static void checkOverdrawn(String accountNum)
    {
        //It's possible that the myAccounts is null, so paranoid programming will help catch an error.
        //Side-Note: I pretty sure a for-loop won't be effective for a Company with thousands
        //of records, but I'm not sure of another way to do this at the moment.
        if(myAccounts!=null)
        {
            for (BankAccount__c ba : myAccounts)
            {
                if(ba.name == accountNum)
                {
                    if(ba.Stored_Amount__c < 0)
                    {
                        ba.Overdrawn__c = true;
                        system.debug('Bank Account has a negative value, Bank Account is Overdrawn.');
                    }
                    else 
                    {
                       ba.Overdrawn__c = false;
                       system.debug('Bank Account has a positive value, Bank Account is not Overdrawn');
                    }
                    database.update(myAccounts);
                    //Once match is found, we don't need to check other records.
                    break;
                }
            }
        }
    }

/* This is another way I found to complete the checkOverdrawn method, but I think using a for loop is best practice.
      focusAccount = [SELECT name, Stored_Amount__c, Overdrawn__c FROM BankAccount__c WHERE name = :accountnum];
                    if(focusAccount.Stored_Amount__c < 0)
                    {
                        focusAccount.Overdrawn__c = true;
                        system.debug('Bank Account has a negative value, Bank Account is Overdrawn.');
                    }
                    else 
                    {
                       focusAccount.Overdrawn__c = false;
                       system.debug('Bank Account has a positive value, Bank Account is not Overdrawn');
                    }
                    database.update(focusAccount);
*/


    //This method will create a new Transaction record based on three parameters.
    //transactionAcct is the Bank Account making the Transaction
    //The withdrawal bool determines if the transaction is taking money (true) or depositing money (false)
    //transactionAmount is how much money to withdrawal or deposit from the account.
    public static void newTransaction(BankAccount__c transactionAcct, boolean withdrawal, decimal transactionAmount)
    {
        
    }
}
