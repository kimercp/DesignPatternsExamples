public with sharing class ShippingStrategyContext {
    private ShippingStrategy shippingStrategy;

    public ShippingStrategyContext(ShippingStrategy shippingStrategy) {
        this.shippingStrategy = shippingStrategy;
    }

    public Decimal calculateShippingCost(Decimal orderAmount) {
        return shippingStrategy.calculateShippingCost(orderAmount);
    }


    /**
      Examples of usage of the Strategy Pattern:

      Example 1: Using different shipping strategies to calculate shipping costs for an order.
        Decimal orderAmount = 100.00;
        
        context = new ShippingStrategyContext(new ExpressShipping());
        Decimal expressCost = context.calculateShippingCost(orderAmount);
        
        context2 = new ShippingStrategyContext(new InternationalShipping());
        Decimal internationalCost = context2.calculateShippingCost(orderAmount);

        Example 2: 
            Decimal orderAmount = 100.00;
            ShippingStrategy strategy = order.Shipping_Type__c == 'Express'
                ? new ExpressShipping()
                : new StandardShipping();
            ShippingContext context = new ShippingContext(strategy);
            Decimal cost = context.calculateShippingCost(orderAmount)
    */
}