/**  http://developer.force.com/cookbook/recipe/trigger-pattern-for-tidy-streamlined-bulkified-triggers


 * Trigger Handler for the Account SObject. This class implements the ITrigger  
 * interface to help ensure the trigger code is bulkified and all in one place.  

 */ 

public with sharing class AccountHandler implements ITrigger  

{     
    

    // Constructor
    public AccountHandler()  
    {  

    }  


    public void bulkBefore()  
    {  

    }  

       

    public void bulkAfter()  
    {  

    }  

           

    public void beforeInsert(SObject so)  
    { 

    }  
    
    public void beforeInsert(List<SObject> soList, Map<Id,SObject> soMap)  
    {  
        List<Account> rList = (List<Account>) soList;
        for(Account r : rList)
        {
            r.Amministratore_di_condominio__c = r.TECH_Amministratore_di_condominio__c;  
        }
    }   
    
    public void afterInsert(SObject so)  
    {  

    }  


    public void afterInsert(List<SObject> soList, Map<Id,SObject> soMap)  
    {

    }    
 
    
    public void beforeUpdate(SObject oldSo, SObject so)  
    {  
        

    }  

        
    public void beforeUpdate(List<SObject> oldSoList, List<SObject> soList, Map<Id,SObject> oldSoMap, Map<Id,SObject> soMap)  
    {  
        List<Account> rList = (List<Account>) soList;
        for(Account r : rList)
        {
            r.Amministratore_di_condominio__c = r.TECH_Amministratore_di_condominio__c; 
        }
    }      
    
    public void afterUpdate(SObject oldSo, SObject so)  
    {  

    }  

    public void afterUpdate(List<SObject> oldSoList, List<SObject> soList, Map<Id,SObject> oldSoMap, Map<Id,SObject> soMap)  
    {

    }  
    

    public void beforeDelete(SObject so)  
    {     

    }  
    
    public void beforeDelete(List<SObject> soList, Map<Id,SObject> soMap)  
    {  

    } 


    public void afterDelete(SObject so)  
    {  

    }  
    
    public void afterUndelete(SObject so)  
    {  

    }  
    
    public void afterDelete(List<SObject> soList, Map<Id,SObject> soMap)  
    {  

    }  

    public void afterUndelete(List<SObject> soList, Map<Id,SObject> soMap)  
    {  

    }         


    public void andFinally()  

    {  


    }  
    


}