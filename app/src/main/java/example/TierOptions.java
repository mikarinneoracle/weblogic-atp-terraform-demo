package example;

public class TierOptions
{
    public String isPublic;
    public String isPrivate;
    public String isPermissions;
    public String isSharing;
    public String isUnlimited;
    public String isExtrasec;

    public TierOptions()
    {
        this.isPublic = "";
        this.isPrivate = "";
        this.isPermissions = "";
        this.isSharing = "";
        this.isUnlimited = "";
        this.isExtrasec = "";
    }

    public TierOptions(String isPublic, String isPrivate, String isPermissions, String isSharing, String isUnlimited, String isExtrasec)
    {
        this.isPublic = isPublic;
        this.isPrivate = isPrivate;
        this.isPermissions = isPermissions;
        this.isSharing = isSharing;
        this.isUnlimited = isUnlimited;
        this.isExtrasec = isExtrasec;
    }
    
    public void setTierOptions(String isPublic, String isPrivate, String isPermissions, String isSharing, String isUnlimited, String isExtrasec)
    {
        this.isPublic = isPublic;
        this.isPrivate = isPrivate;
        this.isPermissions = isPermissions;
        this.isSharing = isSharing;
        this.isUnlimited = isUnlimited;
        this.isExtrasec = isExtrasec;
    }
}