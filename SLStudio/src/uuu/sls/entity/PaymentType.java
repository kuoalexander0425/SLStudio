package uuu.sls.entity;

public enum PaymentType {
    FACE("面交", new ShippingType[]{ShippingType.SELF}),
    ATM("ATM轉帳", new ShippingType[]{ShippingType.HOME, ShippingType.STORE}),
    HOME("貨到付款", 50, new ShippingType[]{ShippingType.HOME}),
    STORE("便利店", new ShippingType[]{ShippingType.STORE}),
    CARD("信用卡", new ShippingType[]{ShippingType.STORE, ShippingType.HOME});

    private final String description;
    private final double fee;
    private final ShippingType[] shippingTypesArray;

    private PaymentType(String description, ShippingType[] shippingTypesArray) {
        this(description, 0, shippingTypesArray);
    }

    private PaymentType(String description, double fee, ShippingType[] shippingTypesArray) {
        this.description = description;
        this.fee = fee;
        this.shippingTypesArray = shippingTypesArray;
    }
    public ShippingType[] getShippingTypesArray(){
        return shippingTypesArray.clone();
    }

    public String getDescription() {
        return description;
    }

    public double getFee() {
        return fee;
    }

    @Override
    public String toString() {
        return description + (fee == 0 ? "" : "," + fee + '元');
    }

}
