public with sharing class MessageTypeOne implements MessageDispatchStrategy{
    public void execute(String messageType) {
        // Implement the logic for handling MessageTypeOne
        System.debug('Executing strategy for MessageTypeOne: ' + messageType);
        // Add custom logic for handling MessageTypeOne
    }
}