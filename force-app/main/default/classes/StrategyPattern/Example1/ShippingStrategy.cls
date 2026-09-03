public interface ShippingStrategy {
    Decimal calculateShippingCost(Decimal orderAmount);
}