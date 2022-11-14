package example;

public class TierPrice
{
    float price_mo;
    int users;
    int storage;
    String support;

    public TierPrice()
    {
        this.price_mo = "";
        this.users = "";
        this.storage = "";
        this.support = "";
    }

    public setTierPrice(String price_mo, String users, String storage, String support ) {
        this.price_mo = price_mo;
        this.users = users;
        this.storage = storage;
        this.support = support;
    }
}