public class Category
{
    private string categoryID;
    private string shortName;
    private string description;

    public Category()
    {
    }

    public string CategoryID
    {
        get
        {
            return categoryID;
        }
        set
        {
            categoryID = value;
        }
    }

    public string ShortName
    {
        get
        {
            return shortName;
        }
        set
        {
            shortName = value;
        }
    }

    public string Description
    {
        get
        {
            return description;
        }
        set
        {
            description = value;
        }
    }
}