public with sharing class StandardShipping implements ShippingStrategy {
    public Decimal calculateShippingCost(Decimal orderAmount) {
        // standard shipping cost calculation
        return orderAmount + 10.00; // fixed cost for standard shipping
    }
}