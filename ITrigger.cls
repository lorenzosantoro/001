/*
 * http://developer.force.com/cookbook/recipe/trigger-pattern-for-tidy-streamlined-bulkified-triggers
 * the interface do not requires test coverage https://developer.salesforce.com/forums/?id=906F000000092cdIAA
 * Interface containing methods Trigger Handlers must implement to enforce best practice  
 * and bulkification of triggers.  
 */ 
 


public interface ITrigger {  

    /**  
    * BULK 
    *  
    * Those methods are called prior to execution of a trigger. Use those to cache  
    * any data required into maps prior execution of the trigger.  
    */ 

    void bulkBefore();
    void bulkAfter();

    
    /*INSERT*/
     
    void beforeInsert(SObject so);   
    void beforeInsert(List<SObject> soList, Map<Id,SObject> soMap);
     
    void afterInsert(SObject so);    
    void afterInsert(List<SObject> soList, Map<Id,SObject> soMap); 
     
    /*INSERT*/



    /*UPDATE*/
    
    void beforeUpdate(SObject oldSo, SObject so);
    void beforeUpdate(List<SObject> oldSoList, List<SObject> soList, Map<Id,SObject> oldSoMap, Map<Id,SObject> soMap); 

    void afterUpdate(SObject oldSo, SObject so);
    void afterUpdate(List<SObject> oldSoList, List<SObject> soList, Map<Id,SObject> oldSoMap, Map<Id,SObject> soMap); 
    
    /*UPDATE*/



    /*DELETE*/ 
    
    void beforeDelete(SObject so); 
    void beforeDelete(List<SObject> soList, Map<Id,SObject> soMap); 

    void afterDelete(SObject so);
    void afterDelete(List<SObject> soList, Map<Id,SObject> soMap); 
    
    /*DELETE*/     
     
    
    
    /*UNDELETE*/ 
    
    void afterUndelete(SObject so);
    void afterUndelete(List<SObject> soList, Map<Id,SObject> soMap);
    
    /*UNDELETE*/        

    /** 
    * andFinally
    *  
    * This method is called once all records have been processed by the trigger. Use this   
    * method to accomplish any final operations such as creation or updates of other records.  
    */ 

     void andFinally();

}