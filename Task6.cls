public class Task6 {
    
    public static void updateAccountSize()
    {
    	List<Account> myAccounts = new List<Account>();
        for(Account a : [SELECT ID, name, numberofemployees, Size__c FROM Account])
        {
            if(a.NumberOfEmployees >=1 && a.NumberOfEmployees<=1000)
            {
                a.Size__c = 'Small';
            }
            else if(a.NumberOfEmployees <= 10000)
            {
                a.Size__c = 'Medium';
            }
            else if (a.NumberOfEmployees > 10000)
            {
                a.Size__c = 'Large';
            }
            //I've seen at least 1 Account with nothing in the Employee field.
            //This is to catch that exception.
            else
            {
                a.Size__c = null;
            }
            myAccounts.add(a);
        }
        database.update(myAccounts);
    }
}