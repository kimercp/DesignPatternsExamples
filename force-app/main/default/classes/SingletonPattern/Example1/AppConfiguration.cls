public with sharing class AppConfiguration {
    // private static AppConfiguration instance - one per transaction
    private static AppConfiguration instance;
    
    private Map<String, Object> settingsCache;
    
    // private constructor to prevent instantiation from outside the class
    private AppConfiguration() {
        settingsCache = new Map<String, Object>();
        // Load settings from Custom Metadata or Custom Settings
        loadSettings();
    }

    // public static method to get the singleton instance
    public static AppConfiguration getInstance() {
        if (instance == null) {
            instance = new AppConfiguration();
        }
        return instance;
    }

    private void loadSettings() {
        // load settings from custom metadata and populate the settingsCache map
        // assuming that there is only one record with the configuration settings
        List<AppConfiguration__mdt> appConfigurations = [SELECT ConfigurationFieldNumber__c, ConfigurationFieldOne__c, ConfigurationFieldTwo__c, URLConfiguration__c FROM AppConfiguration__mdt WHERE IsConfigurationActive__c = true];
        if (appConfigurations.isEmpty()) {
            throw new AppConfigurationException('No active configuration found.');
        }

        if (appConfigurations.size() > 1) {
            throw new AppConfigurationException('Multiple active configurations found. Please ensure only one configuration is active.');
        }

        AppConfiguration__mdt appConfiguration = appConfigurations[0];
        settingsCache.put('ConfigurationFieldNumber', appConfiguration.ConfigurationFieldNumber__c);
        settingsCache.put('ConfigurationFieldOne', appConfiguration.ConfigurationFieldOne__c);
        settingsCache.put('ConfigurationFieldTwo', appConfiguration.ConfigurationFieldTwo__c);
        settingsCache.put('URLConfiguration', appConfiguration.URLConfiguration__c);
    }

    public Object getSetting(String key) {
        return settingsCache.get(key);
    }

    public class AppConfigurationException extends Exception {}

    // Usage examples:

    //Object configurationFieldOne = AppConfiguration.getInstance().getSetting('ConfigurationFieldOne');
    //System.debug(configurationFieldOne);

    //Object configurationFieldNumber = AppConfiguration.getInstance().getSetting('ConfigurationFieldNumber');
    //System.debug(configurationFieldNumber);
}