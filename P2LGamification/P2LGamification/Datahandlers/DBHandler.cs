using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

namespace P2LGamification.Datahandlers
{
    public class DBHandler
    {
        private SqlCommand myCommand;

        private string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

        /// <summary>
        /// Implicit call to default constructor of DBHandler object
        /// </summary> 
        public DBHandler()
        {
            myCommand = new SqlCommand
            {
                Connection = new SqlConnection(cs)
            };
        }

        /// <summary>
        /// Calls a Stored Procedure with x no. of parameters.
        /// Is mostly intended to be used with INSERT,UPDATE and DELETE statements 
        /// </summary> 
        public void ExecuteNonStp(string myStp)
        {
            myCommand.CommandText = myStp;
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Connection.Open();
            myCommand.ExecuteNonQuery();
            this.DestroyHandler();
        }

        /// <summary>
        /// Calls a Stored Procedure with x no. of parameters. 
        /// Is mostly intended to be used with a single SELECT statement 
        /// Returns a datatable
        /// </summary>   
        public void ExecuteStp(string myStp, ref DataTable myDataTable)
        {
            myCommand.CommandText = myStp;
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Connection.Open();
            SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter();
            mySqlDataAdapter.SelectCommand = myCommand;
            mySqlDataAdapter.Fill(myDataTable);
            mySqlDataAdapter.Dispose();
            this.DestroyHandler();
        }

        /// <summary>
        /// Calls a Stored Procedure with x no. of parameters. 
        /// Is mostly intended to be used with multiple SELECT statements 
        /// Returns a dataset
        /// </summary>
        internal void ExecuteStp(string myStp, ref DataSet myDataSet)
        {
            myCommand.CommandText = myStp;
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Connection.Open();
            SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter();
            mySqlDataAdapter.SelectCommand = myCommand;
            mySqlDataAdapter.Fill(myDataSet);
            mySqlDataAdapter.Dispose();
            this.DestroyHandler();
        }

        /// <summary>
        /// Calls a Stored Procedure with x no. of parameters. 
        /// Is mostly intended to be used with single or multiple SELECT statements 
        /// Returns a SqlDataReader
        /// NOTE:The connection must be closed after iteration through the reader
        /// </summary> 
        internal void ExecuteStp(string myStp, ref SqlDataReader myDataReader)
        {
            myCommand.CommandText = myStp;
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Connection.Open();
            myDataReader = myCommand.ExecuteReader();
        }

        /// <summary>
        /// Is mostly intended to be used with SELECT statements 
        /// Returns a datatable
        /// </summary> 
        public void ExecuteSql(string mySql, ref DataTable myDataTable)
        {
            myCommand.CommandText = mySql;
            myCommand.CommandType = CommandType.Text;
            myCommand.Connection.Open();
            SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter();
            mySqlDataAdapter.SelectCommand = myCommand;
            mySqlDataAdapter.Fill(myDataTable);
            mySqlDataAdapter.Dispose();
            this.DestroyHandler();
        }

        /// <summary>
        /// Is mostly intended to be used with INSERT,UPDATE and DELETE statements
        /// Returns no. of rows affected
        /// </summary>
        public void ExecuteNonSql(string mySql)
        {
            myCommand.CommandText = mySql;
            myCommand.CommandType = CommandType.Text;
            myCommand.Connection.Open();
            myCommand.ExecuteNonQuery();
            this.DestroyHandler();
        }

        /// <summary>
        /// The short way of adding a parameter
        /// </summary>  
        public void AddParm(string myParmName, SqlDbType myParmType, object myValue)
        {
            myCommand.Parameters.Add(new SqlParameter(myParmName, myParmType) { Value = (myValue ?? DBNull.Value) });
        }

        /// <summary>
        /// Cleans up everything that needs to be disposed
        /// </summary>  
        public void DestroyHandler()
        {
            myCommand.Connection.Close(); // always call Close to ensure it is done.
            myCommand.Connection.Dispose();
            myCommand.Dispose();
        }
    }
}