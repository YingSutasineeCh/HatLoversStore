using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;

[DataObject(true)]
public static class CategoryDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static List<Category> GetCategories()
    {
        List<Category> categoryList = new List<Category>();
        string sel = "SELECT CategoryID, ShortName, Description "
            + "FROM Categories ORDER BY ShortName";
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sel, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Category category;
                while (dr.Read())
                {
                    category = new Category();
                    category.CategoryID = dr["CategoryID"].ToString();
                    category.ShortName = dr["ShortName"].ToString();
                    category.Description = dr["Description"].ToString();
                    categoryList.Add(category);
                }
                dr.Close();
            }
        }
        return categoryList;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings
            ["HatLoversStoreConnectionString"].ConnectionString;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static void InsertCategory(Category category)
    {
        string ins = "INSERT INTO Categories "
            + " (CategoryID, ShortName, Description) "
            + " VALUES(@CategoryID, @ShortName, @Description)";
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(ins, con))
            {
                cmd.Parameters.AddWithValue("CategoryID", category.CategoryID);
                cmd.Parameters.AddWithValue("ShortName", category.ShortName);
                cmd.Parameters.AddWithValue("Description", category.Description);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteCategory(Category category)
    {
        int deleteCount = 0;
        string del = "DELETE FROM Categories "
            + "WHERE CategoryID = @CategoryID "
            + "AND ShortName = @ShortName "
            + "AND Description = @Description ";
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(del, con))
            {
                cmd.Parameters.AddWithValue("CategoryID", category.CategoryID);
                cmd.Parameters.AddWithValue("ShortName", category.ShortName);
                cmd.Parameters.AddWithValue("Description", category.Description);
                con.Open();
                deleteCount = cmd.ExecuteNonQuery();
            }
        }
        return deleteCount;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateCategory(Category original_Category,
        Category category)
    {
        int updateCount = 0;
        string up = "UPDATE Categories "
            + "SET ShortName = @ShortName, "
            + "Description = @Description "
            + "WHERE CategoryID = @original_CategoryID "
            + "AND ShortName = @original_ShortName "
            + "AND Description = @original_Description";
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(up, con))
            {
                cmd.Parameters.AddWithValue("ShortName", category.ShortName);
                cmd.Parameters.AddWithValue("Description", category.Description);
                cmd.Parameters.AddWithValue("original_CategoryID",
                    original_Category.CategoryID);
                cmd.Parameters.AddWithValue("original_ShortName",
                    original_Category.ShortName);
                cmd.Parameters.AddWithValue("original_Description",
                    original_Category.Description);
                con.Open();
                updateCount = cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        return updateCount;
    }
}