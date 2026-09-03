public with sharing class InternationalShipping implements ShippingStrategy{
    public Decimal calculateShippingCost(Decimal orderAmount) {
        // international shipping cost calculation
        return orderAmount + 30.00; // fixed cost for international shipping
    }
}