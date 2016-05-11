/**  http://developer.force.com/cookbook/recipe/trigger-pattern-for-tidy-streamlined-bulkified-triggers

 * Class TriggerFactory  
 * Used to instantiate and execute Trigger Handlers associated with sObjects.  
 */ 

public with sharing class TriggerFactory  
{  

    /**  

     * Public static method to create and execute a trigger handler  
     * Arguments:   Schema.sObjectType soType - Object type to process (SObject.sObjectType)  
     * Throws a TriggerException if no handler has been coded.  

     */ 
   

    /**  
     * private static method to control the execution of the handler  
     * Arguments:   ITrigger handler - A Trigger Handler to execute  
     */  

    private static void execute(ITrigger handler)  
    {  
        if (Trigger.isBefore)  
        {  

            // Call the bulk before to handle any caching of data and enable bulkification  
            handler.bulkBefore();  

            // Iterate through the records passing them to the handler. 
            
            if (Trigger.isInsert)  
            {  

                for (SObject so : Trigger.new)  
                {  
                    handler.beforeInsert(so);  
                }  
                
                handler.beforeInsert(Trigger.new, Trigger.newMap);
            }  

            else if (Trigger.isUpdate)  
            {  
                for (SObject so : Trigger.old)  
                {  
                    handler.beforeUpdate(so, Trigger.newMap.get(so.Id));  
                }  
                
                handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);  
            } 

            else if (Trigger.isDelete)  
            {  
                for (SObject so : Trigger.old)  
                {  
                    handler.beforeDelete(so);  
                }  
                  
                handler.beforeDelete(Trigger.old, Trigger.oldMap);  
            }  


 

        }  

        if (Trigger.isAfter) 
        {  
            // Call the bulk after to handle any caching of data and enable bulkification  
            handler.bulkAfter();  


            if (Trigger.isInsert)  
            {  

                for (SObject so : Trigger.new)  
                {  
                    handler.afterInsert(so);  
                }  
                
                handler.afterInsert(Trigger.new, Trigger.newMap); 

            }  

            else if (Trigger.isUpdate)  
            {  
                for (SObject so : Trigger.old)  
                {  
                    handler.afterUpdate(so, Trigger.newMap.get(so.Id));  
                }  
                
                handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }             
            
             
            else if (Trigger.isDelete)  
            {  

                for (SObject so : Trigger.old)  
                {  
                    handler.afterDelete(so);  
                }  
                
                handler.afterDelete(Trigger.old, Trigger.oldMap);  
            } 
            
            else if (Trigger.isUndelete)
            {  

                for (SObject so : Trigger.new)  
                {  
                    handler.afterUndelete(so);  
                }  
                
                handler.afterUndelete(Trigger.new, Trigger.newMap);  
            } 


        }  

        // Perform any post processing  
        handler.andFinally();  

    }  
 

    /**  
     * private static method to get the appropriate handler for the object type.  
     * Modify this method to add any additional handlers.  
     * Arguments:   Schema.sObjectType soType - Object type tolocate (SObject.sObjectType)  
     * Returns:     ITrigger - A trigger handler if one exists or null.  
     */ 

  
    
    //----------------------------------------------------------------------------------------------------------------------------------  


    //V.02
    public static void createHandler(String ClassName)  
    {  
        // Get a handler appropriate to the object being processed  
        ITrigger handler = getHandler(ClassName);  
        system.debug(handler);

        // Make sure we have a handler registered, new handlers must be registered in the getHandler method.  
        if (handler == null)  
        {  
          //throw new TriggerException('No Trigger Handler registered for Object Type: ' + soType);  
        }  

        // Execute the handler to fulfil the trigger  
        execute(handler);  
    }      
    
    //V.02
    private static ITrigger getHandler(String ClassName)  
    {  
        Type t = Type.forName(ClassName+'');
        return (ITrigger)t.newInstance();      
    }  
    
    
     

}