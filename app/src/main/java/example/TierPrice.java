package example;

public class TierPrice
{
    public float price_mo;
    public int users;
    public int storage;
    public String support;

    public TierPrice()
    {
        this.price_mo = 0;
        this.users = 0;
        this.storage = 0;
        this.support = "";
    }

    public void setTierPrice(float price_mo, int users, int storage, String support)
    {
        this.price_mo = price_mo;
        this.users = users;
        this.storage = storage;
        this.support = support;
    }
}