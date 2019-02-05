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
    Integer factorial = n;
    system.debug(factorial + ' start');
    for(Integer i = n; i>1; i--)
    {
        factorial*=(i-1);
        system.debug('i is ' + i + ' fact is ' + factorial);
    }
    system.debug(factorial);
    return factorial;
}

//Task 4
//Given an array, array, and an integer, n, rotate the values in array left n times and return array

public static Integer[] rotateLeftNTimes( Integer[] ar, Integer n) 
{
    //List<Integer> oldIndexes = new List<Integer>();
    List<Integer> newIndexes = new List<Integer>();
    List<Integer> newAr = new List<Integer>();
    if(n > ar.size())
    {
        //n=size+1 and n=size+6 will result in the same amount as n=1. When doing doing n-=ar.size until n<=size, 
        //n will become a number thats easier to work with.
        while(n>ar.size())
        {
            n-=ar.size();
        }
    }
    for(Integer i = 0; i<ar.size(); i++)
    {
        //I'm setting newAR values here instead of newAr = ar so that the original ar doesn't change values.
        newAr.add(ar[i]);
        if(i-n < 0)
        {
            //if index in question is 0, n=3, and size=5. the new index should be 2. 0-3= -3. -3+5= 2
            newIndexes.add(i-n+ar.size());
        }
        else
        {
            newIndexes.add(i-n);
        }
    }
    //I'm doing the same for-loop again because I wanted the setup to have its own for-loop.
    for(Integer i = 0; i < ar.size(); i++)
    {
        newAr.set(newIndexes[i], ar[i]);
    }
    system.debug(newAR);
    return newAr;
}

//Task 5
//A bracket is any one of the following: (, ), {, }, [, or ]
public static Boolean bracketsAreBalanced( String s ) 
{
    //Since I can get a method to return '(' instead of the ASCII value, I'll be using charAt Integers for comparisons
    //( = 40
    //) = 41
    //[ = 91
    //] = 93
    //{ = 123
    //} = 125

    //The following two Lists will separate the string into opening brackets and closing brackets resptively.
    List<Integer> leftBrack = new List<Integer>();
    List<Integer> rightBrack = new List<Integer>();
    //This is for the final for-loop to increase the variable iBegin.
    Integer loopCounter = 0;
    //This for-loop fills leftBrack and rightBrack based on ASCII values.
    for(Integer i = 0; i<s.length(); i++)
    {
        if(s.charAt(i) == 40 || s.charAt(i) == 91 || s.charAt(i) == 123 )
        {
            leftBrack.add(s.charAt(i));
        }
        else if(s.charAt(i) == 41 || s.charAt(i) == 93 || s.charAt(i) == 125)
        {
            rightBrack.add(s.charAt(i));
        }
    }
    //Automatically return false if the two Lists are not the same size.
    if(leftBrack.size() != rightBrack.size())
    {
        system.debug('false');
        return false;
    }

    //This for loop will start from the middle of the string and work its way outward. The checking starts with the
    //last leftBracket value and the first rightBracket value
    for(Integer iEnd = leftBrack.size()-1; iEnd>=0; iEnd--)
    {
        Integer iBegin = loopCounter;
            if(leftbrack[iEnd] == 40 && rightBrack[iBegin] != 41)
            {
                system.debug('false');
                return false;
            }
            if(leftbrack[iEnd] == 91 && rightBrack[iBegin] != 93)
            {
                system.debug('false');
                return false;
            }
            if(leftbrack[iEnd] == 123 && rightBrack[iBegin] != 125)
            {
                system.debug('false');
                return false;
            }
        loopCounter++;
    }
    //If no discrepencies were found in the above loop, the string is a balanced bracket.
    system.debug('true');
    return true;
}

//Task 6 (Done in class with Harvey Hill)
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
        List<Lead> myLeads = new List<Lead>();
        for(Lead l : [SELECT name, status, description, state FROM Lead WHERE state = 'CA'])
        {
            l.status = 'Closed - Not Converted';
            l.description = 'We are no longer doing business in California.';
            //Adding updated California Leads to myLeads so I can update the database.
            myLeads.add(l);
        }
        database.update(myLeads);
    }

    //Task 8
    //Create a method that will find all Opportunities which have already passed their Close Date 
    //and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
    //they are not marked as 'Closed Won', they should be marked as 'Closed Lost'
    public static void closePastDueOpportunities( ) 
    {
        List<Opportunity> myOpps = new List<Opportunity>();
        Date thisDate = Date.today();
        for(Opportunity o : [SELECT name, closedate, stagename FROM Opportunity 
        WHERE stagename != 'Closed Won' AND closedate < :thisDate])
        {
            o.stagename = 'Closed Lost';
            myOpps.add(o);
        }
        database.update(myOpps);

    }
}