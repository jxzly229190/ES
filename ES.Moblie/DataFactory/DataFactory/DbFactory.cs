using System;
using System.Data;
using System.Data.SqlClient;
namespace DataFactory
{
	public static class DbFactory
	{
        public static string UpdateDataSet(SqlConnection conn, System.Data.SqlClient.SqlTransaction trans, string cmdText, SqlParameter[] param, DataSet changedDs, string type, out string result)
		{
			SqlCommand sqlCommand = new SqlCommand();
			DbFactory.PrepareCommand(cmdText, conn, sqlCommand, (CommandType)1, param, null);
			if (null != trans)
			{
				sqlCommand.Transaction = trans;
			}
            System.Data.SqlClient.SqlDataAdapter sqlDataAdapter = new System.Data.SqlClient.SqlDataAdapter(sqlCommand);
			if (type == "1")
			{
				sqlDataAdapter.UpdateCommand = sqlCommand;
			}
			else
			{
				sqlDataAdapter.InsertCommand = sqlCommand;
			}
			string result2;
			try
			{
				sqlDataAdapter.Update(changedDs.Tables[0]);
				changedDs.AcceptChanges();
				result = "1";
				result2 = "1";
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = "0";
			}
			finally
			{
				sqlDataAdapter.Dispose();
				sqlCommand.Dispose();
			}
			return result2;
		}
        private static void PrepareCommand(string cmdText, System.Data.SqlClient.SqlConnection conn, System.Data.SqlClient.SqlCommand cmd, CommandType cmdType, SqlParameter[] cmdParms, SqlParameter[] returnParms)
		{
			if (conn.State != ConnectionState.Open)
			{
				conn.Open();
			}
			cmd.Connection = conn;
			cmd.CommandText = cmdText;
			cmd.CommandType = cmdType;
			if (cmdParms != null)
			{
				for (int i = 0; i < cmdParms.Length; i++)
				{
					SqlParameter sqlParameter = cmdParms[i];
					sqlParameter.Direction = (ParameterDirection)1;
					cmd.Parameters.Add(sqlParameter);
				}
			}
			if (returnParms != null)
			{
				for (int i = 0; i < returnParms.Length; i++)
				{
					SqlParameter sqlParameter = returnParms[i];
                    sqlParameter.Direction = (ParameterDirection)2;
					cmd.Parameters.Add(sqlParameter);
				}
			}
		}
		public static DataSet ExecuteSet(SqlConnection con, string sqlstr, SqlParameter[] param, SqlParameter[] outParam, CommandType commType, out string result)
		{
			DataSet dataSet = new DataSet();
			SqlCommand sqlCommand = new SqlCommand();
			SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
			DataSet result2;
			try
			{
				DbFactory.PrepareCommand(sqlstr, con, sqlCommand, commType, param, outParam);
				sqlDataAdapter = new SqlDataAdapter(sqlCommand);
				sqlDataAdapter.Fill(dataSet);
				result = "1";
				result2 = dataSet;
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = null;
			}
			finally
			{
				con.Close();
				sqlCommand.Dispose();
				sqlDataAdapter.Dispose();
			}
			return result2;
		}
		public static int ExecuteNonQuery(SqlConnection con, string sqlstr, SqlParameter[] param, SqlParameter[] outParam, CommandType commType, out string result)
		{
			SqlCommand sqlCommand = new SqlCommand();
			sqlCommand.CommandTimeout = 500;
			int result2;
			try
			{
				DbFactory.PrepareCommand(sqlstr, con, sqlCommand, commType, param, outParam);
				int num = sqlCommand.ExecuteNonQuery();
				result = "1";
				result2 = num;
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = 0;
			}
			finally
			{
				con.Close();
				sqlCommand.Dispose();
			}
			return result2;
		}
		public static string ExecuteScalar(SqlConnection con, string sqlstr, SqlParameter[] param, SqlParameter[] outParam, CommandType commType, out string result)
		{
			SqlCommand sqlCommand = new SqlCommand();
			string result2;
			try
			{
				DbFactory.PrepareCommand(sqlstr, con, sqlCommand, commType, param, outParam);
				object obj = sqlCommand.ExecuteScalar();
				if (obj == null)
				{
					result = "未查询到结果！";
					result2 = null;
				}
				else
				{
					result = "1";
					result2 = obj.ToString();
				}
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = null;
			}
			finally
			{
				con.Close();
				sqlCommand.Dispose();
			}
			return result2;
		}
		public static SqlDataReader ExecuteReader(SqlConnection conn, string sqlstr, SqlParameter[] param, SqlParameter[] outParam, CommandType commType, out string result)
		{
			SqlCommand sqlCommand = new SqlCommand();
			SqlDataReader result2;
			try
			{
				DbFactory.PrepareCommand(sqlstr, conn, sqlCommand, commType, param, outParam);
				SqlDataReader sqlDataReader = sqlCommand.ExecuteReader((CommandBehavior)32);
				result = "1";
				result2 = sqlDataReader;
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = null;
			}
			return result2;
		}
        public static int ExecuteNonQuery(SqlConnection conn, System.Data.SqlClient.SqlTransaction trans, string sqlstr, SqlParameter[] param, SqlParameter[] outParam, CommandType commType, out string result)
		{
			SqlCommand sqlCommand = new SqlCommand();
			int result2;
			try
			{
				DbFactory.PrepareCommand(sqlstr, conn, sqlCommand, commType, param, outParam);
				if (null != trans)
				{
					sqlCommand.Transaction = trans;
				}
				int num = sqlCommand.ExecuteNonQuery();
				result = "1";
				result2 = num;
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = 0;
			}
			finally
			{
				conn.Close();
				sqlCommand.Dispose();
			}
			return result2;
		}
        public static string ExecuteScalar(SqlConnection conn, System.Data.SqlClient.SqlTransaction trans, string sqlstr, SqlParameter[] param, SqlParameter[] outParam, CommandType commType, out string result)
		{
			SqlCommand sqlCommand = new SqlCommand();
			string result2;
			try
			{
				DbFactory.PrepareCommand(sqlstr, conn, sqlCommand, commType, param, outParam);
				if (null != trans)
				{
					sqlCommand.Transaction = trans;
				}
				string text = sqlCommand.ExecuteScalar().ToString();
				result = "1";
				result2 = text;
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = "0";
			}
			finally
			{
				sqlCommand.Dispose();
			}
			return result2;
		}
		public static string UpdateDataSet(SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, DataSet changedDs, out string result)
		{
			SqlCommand sqlCommand = new SqlCommand();
            if (conn.State != ConnectionState.Open)
			{
				conn.Open();
			}
			sqlCommand.Connection = conn;
			if (null != trans)
			{
				sqlCommand.Transaction = trans;
			}
			sqlCommand.CommandType = cmdType;
			sqlCommand.CommandText = cmdText;
			SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
			sqlDataAdapter.SelectCommand = sqlCommand;
			string result2;
			try
			{
				SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(sqlDataAdapter);
				sqlCommandBuilder.DataAdapter = sqlDataAdapter;
				sqlDataAdapter.Update(changedDs.Tables[0]);
				changedDs.AcceptChanges();
				result = "1";
				result2 = "1";
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = "0";
			}
			finally
			{
				sqlDataAdapter.Dispose();
				sqlCommand.Dispose();
			}
			return result2;
		}
		public static string UpdateDataSet(SqlConnection conn, SqlTransaction trans, string cmdText, SqlParameter[] param, DataSet changedDs, out string result)
		{
			SqlCommand sqlCommand = new SqlCommand();
            DbFactory.PrepareCommand(cmdText, conn, sqlCommand, (CommandType)1, param, null);
			if (null != trans)
			{
				sqlCommand.Transaction = trans;
			}
			SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
			sqlDataAdapter.UpdateCommand = sqlCommand;
			string result2;
			try
			{
				sqlDataAdapter.Update(changedDs.Tables[0]);
				changedDs.AcceptChanges();
				result = "1";
				result2 = "1";
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = "0";
			}
			finally
			{
				sqlDataAdapter.Dispose();
				sqlCommand.Dispose();
			}
			return result2;
		}
	}
}
