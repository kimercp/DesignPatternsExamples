public with sharing class ExpressShipping implements ShippingStrategy {
    public Decimal calculateShippingCost(Decimal orderAmount) {
        // express shipping cost calculation
        return orderAmount + 20.00; // fixed cost for express shipping
    }
}