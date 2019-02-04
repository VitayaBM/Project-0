public with sharing class ApexP0Exercises {
    public ApexP0Exercises() {

    }
//Task 1
public static Integer nFibonacci( Integer n )
{
    //0 and 1 are the given starting points, so it was difficult putting them in the loop
    //below without adding if checks.
    if(n == 0 || n == 1)
    {
        system.debug(n);
        return n;
    }

    //Stores the previous number in the sequence
    Integer prevNum = 0;
    //Stores the current number in the sequence
    Integer curNum = 1;
    //Stores the curNum before curNum+=prevNum so prevNum can be updated.
    Integer tempNum = 0;
    //the index of i starts at 2 since the indexes of 0 and 1 are caught above.
    for(Integer i = 2; i<=n; i++)
    {
        //system.debug('Loop start: i = ' + i + ' curNum is ' + curnum);
        tempNum = curNum;        
        curNum += prevNum;
        prevNum = tempNum;
        if(i == n)
        {
            break;
        }
        //system.debug('Loop End: i = ' + i + ' curNum is ' + curnum);
    }
    system.debug(curnum);
    return curNum;
}

//Task 2
public static Integer[] sortArray( Integer[] intList ) 
{
    //This will catch an empty string without giving an error during execution.
    if(intList.size() == 0)
    {
        system.debug('There are no numbers in the given List.');
        return intList;
    }
    
    //Variable to store the lowest value as we go through the given Array.
    Integer lowestVal = intList[0];
    //Variable to store the index of lowest value since "i" will no longer be available. 
    Integer lowestValIndex = 0;

    //The outer for-loop is to make sure we go through each number in the Array
    //The nested for-loop is to make look for the smallest number. i=r so we skip the previous smallest number.
    for(Integer r = 0; r < intList.size(); r++)
    {
        //Resets each loop so that the smallest values overall isn't counted every time.
        lowestVal = intList[r];
        lowestValIndex = r;
        for(Integer i = r ; i<intList.size(); i++)
        {
            if(intList[i] < lowestVal)
            {
                lowestVal = intList[i];
                lowestValIndex = i;
            }
        }
        //If remove was before add, we would get an out-of-bounds error.
        //add puts lowestVal at intList's r index
        intList.add(r, lowestVal);
        //Removes lowestVal at its old location. Since we added a number, we need +1.
        intList.remove(lowestValIndex+1);
    }
    system.debug('Sorted: ' + intList);
    return intList;
}

//Task 3
public static Integer nFactorial( Integer n) 
{
return 0;
}

//Task 4
//Given an array, array, and an integer, n, rotate the values in array left n times and return array

public static Integer[] rotateLeftNTimes( Integer[] ar, Integer n) 
{
return null;
}

//Task 5
//A bracket is any one of the following: (, ), {, }, [, or ]
public static Boolean bracketsAreBalanced( String s ) 
{
return false;
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

//Task 7
//Create a method that will find all leads that contain 'ca' in their fields. 
//If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
//Converted' and their description should display the message, "We are no longer doing 
//business in California."
public static void updateCALeads( ) 
{
}

//Task 8
//Create a method that will find all Opportunities which have already passed their Close Date 
//and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
//they are not marked as 'Closed Won', they should be marked as 'Closed Lost'
public static void closePastDueOpportunities( ) 
{
}
}