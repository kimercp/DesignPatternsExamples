// This class is responsible for dispatching messages based on their type using the Strategy pattern.
public with sharing class MessageDispatcher {
    public static void dispatchMessageByType(String messageType) {
        // Query the custom metadata type to get the handler class name for the given message type
        List<MessageType__mdt> messageTypeRecords = [SELECT Type__c, HandlerName__c FROM MessageType__mdt];

        if (messageTypeRecords.size() < 1) {
            throw new MessageDispatcherException('No message types found in custom metadata.');
        }

        for (MessageType__mdt record : messageTypeRecords) {
            if (record.Type__c == messageType) {
                // Get the handler class name from the custom metadata record
                String handlerClassName = record.HandlerName__c;
                
                // Dynamically instantiate the handler class based on the class name from custom metadata
                // Use Type.forName to get the class type and create an instance of the handler
                // This is using the Refflection pattern to dynamically create an instance of the class at runtime
                MessageDispatchStrategy handlerInstance = (MessageDispatchStrategy) Type.forName(handlerClassName).newInstance();
                // Execute the strategy for the given message type
                handlerInstance.execute(messageType);
            }
        }
    }

    public class MessageDispatcherException extends Exception {}

    /* Usage examples:
    Create custom metadata records for each message type and specify the corresponding handler class name.
    Then, call the dispatchMessageByType method with the desired message type to execute the appropriate strategy.
    
    MessageDispatcher.dispatchMessageByType('First');
    or
    MessageDispatcher.dispatchMessageByType('Second');
    */
}