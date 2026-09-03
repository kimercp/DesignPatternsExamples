/* Any class that implements this interface must provide an implementation for the execute method, 
which takes a messageType as a parameter.
 
eg. messageType would be the Apex class name that could be set in the custom metadata records

*/
public interface MessageDispatchStrategy {
    void execute(String messageType); 
}