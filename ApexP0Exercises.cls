public with sharing class ApexP0Exercises {
    public ApexP0Exercises() {

    }
//Task 1
public static Integer nFibonacci( Integer n )
{
    for(int i = 0; i<=n; i++)
    {
        
    }
}

//Task 2
public static Integer[] sortArray( Integer[] intList ) 
{

}

//Task 3
public static Integer nFactorial( Integer n) 
{

}

//Task 4
//Given an array, array, and an integer, n, rotate the values in array left n times and return array

public static Integer[] rotateLeftNTimes( Integer[] array, Integer n) 
{

}

//Task 5
//A bracket is any one of the following: (, ), {, }, [, or ]
public static Boolean bracketsAreBalanced( String s ) 
{
 
}

//Task 6 
//Create a method that retrieves a list of all accounts and updates those accounts.
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

//Task 7
//Create a method that will find all leads that contain 'ca' in their fields. 
//If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
//Converted' and their description should display the message, "We are no longer doing 
//business in California."
public static void updateCALeads( ) {
 
}

//Task 8
//Create a method that will find all Opportunities which have already passed their Close Date 
//and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
//they are not marked as 'Closed Won', they should be marked as 'Closed Lost'
public static void closePastDueOpportunities( ) {
 
}