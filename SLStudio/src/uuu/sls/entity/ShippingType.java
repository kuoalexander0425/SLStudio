package uuu.sls.entity;

public enum ShippingType {
        SELF("自取"),HOME("送貨到府",100),STORE("便利店取貨",50);
        
	private final String description;        
	private final double fee;	 
	
    public double getFee() {
        return fee;
    }

    public String getDescription() {
        return description;
    }

    private ShippingType(String description,double fee) {
        
        this.description = description;
        this.fee = fee;
    }

    private ShippingType(String description) {
        this.description = description;
        this.fee = 0;              
    }

    @Override
    public String toString() {
        return description +  (fee==0?"":","+fee+"元");
    }
	 
}
 
