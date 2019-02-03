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
    public static boolean checkOverdrawn(String accountNum)
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
                        database.update(myAccounts);
                        system.debug('Bank Account has a negative value, Bank Account is Overdrawn.');
                        return true;
                        
                    }
                    else 
                    {
                       ba.Overdrawn__c = false;
                       database.update(myAccounts);
                       system.debug('Bank Account has a positive value, Bank Account is not Overdrawn');
                       return false;
                       
                    }
                }
            }
            system.debug('No matching account was found, make sure you put in the Account Number correctly.');
        }            
//The return for no match is true because if it's false in the newTransaction method, the method can continue with a non-existant account.
            return true; 
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

//This method will update a Bank Account's balance (Ammount Stored field) after a Transaction
//This method will be called from the newTransaction record.
    public static void updateBalance(boolean withdrawal, decimal transactionAmount, BankAccount__c transactionAcct) 
    {
        
    }
    //This method will create a new Transaction record based on three parameters.
    //transactionAcct is the Bank Account making the Transaction
    //The withdrawal bool determines if the transaction is taking money (true) or depositing money (false)
    //transactionAmount is how much money to withdrawal or deposit from the account.
    public static void newTransaction(String transactionAcct, boolean withdrawal, decimal transactionAmt)
    {
        //A Bank Account should not be able to make a Transaction if their they're already Overdrawn.
        boolean isOverdrawn = false;
        //If making a deposit, we don't care if the Account is Overdrawn.
        if(!withdrawal)
        {
            isOverdrawn = checkOverdrawn(transactionAcct);
        }
        if(!isOverdrawn)
        {
            Transaction__c newTrans = new Transaction__c();
            //Using myAccount to find the right Bank Account making the Transaction
            for(BankAccount__c ba : myAccounts)
            {
                if(ba.name == transactionAcct)
                {
                    newTrans.LinkedAccount__c = ba.ID;
                }
            }
            newTrans.Transaction_Date__c = Date.Today();
            newTrans.Transaction_Amount__c = transactionAmt;
            if(withdrawal)
            {
                newTrans.Transaction_Type__c = 'Withdrawal';
            }
            else
            {
                newTrans.Transaction_Type__c = 'Deposit';
            }
            database.insert(newTrans);
            //updateBalance(withdrawal, transactionAmt, newTrans.LinkedAccount__c);
        }
        else
        {
            system.debug('Cannot create a new Transaction because ' + transactionAcct + ' is overdrawn');
        }
    }
}
