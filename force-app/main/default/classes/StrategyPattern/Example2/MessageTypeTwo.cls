public with sharing class MessageTypeTwo implements MessageDispatchStrategy {
    public void execute(String messageType) {
        // Implement the logic for handling MessageTypeTwo
        System.debug('Executing strategy for MessageTypeTwo: ' + messageType);
        // Add custom logic for handling MessageTypeTwo
    }
}