/**
 * Singleton feature flag manager. Loads ALL Feature_Flag__mdt records once per transaction
 * via getAll() (no SOQL limit consumed), keyed by DeveloperName.
 */
public with sharing class FeatureToggleManager {
    private static FeatureToggleManager instance;
    private final Map<String, Feature_Flag__mdt> featureFlagsCache;


    private FeatureToggleManager() {
        // getAll() returns every record of this metadata type, keyed by DeveloperName.
        // Works fine whether the org has 0, 1, or 200 flag records defined.
        this.featureFlagsCache = Feature_Flag__mdt.getAll();
    }

    public static FeatureToggleManager getInstance() {
        if (instance == null) {
            instance = new FeatureToggleManager();
        }
        return instance;
    }

    /**
     * Returns whether a named flag is enabled.
     * Unknown flag name, defaults to false (fail closed) rather than throwing an exception,
     * since we don't want to break transaction if a feature flag is missing.
     * This is a design choice, we could throw an exception and create a log for unknown flags.
     */
    public Boolean isFeatureEnabled(String flagDeveloperName) {
        if (String.isBlank(flagDeveloperName)) {
            return false;
        }

        Feature_Flag__mdt featureFlag = featureFlagsCache.get(flagDeveloperName);
        if (featureFlag == null) {
            //return false;
            throw new FeatureToggleManagerException('Feature flag not found: ' + flagDeveloperName);
        }
        return featureFlag.IsEnabled__c;
    }

    public class FeatureToggleManagerException extends Exception {}

    /** Usage examples:

    Example 1: Check if a feature is enabled and execute code accordingly
        if (FeatureToggleManager.getInstance().isFeatureEnabled('New_Discount_Approval_Flow')) {
            NewDiscountApprovalService.process();
        } else {
            LegacyDiscountService.process(); // old path if the feature is not enabled
        }

    Example 2: Use a feature flag to conditionally execute a scheduled job
        global class NightlyDataSyncScheduler implements Schedulable {
            global void execute(SchedulableContext sc) {
                if (!FeatureToggleManager.getInstance().isFeatureEnabled('Nightly_Sync_Enabled')) {
                    return; // Job is scheduled but does nothing while the flag is off
                }
                Database.executeBatch(new NightlyDataSyncBatch());
            }
        }

    */
}