﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ES.Repository.Client
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="ES.Client")]
	public partial class DBDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertTranConfig(TranConfig instance);
    partial void UpdateTranConfig(TranConfig instance);
    partial void DeleteTranConfig(TranConfig instance);
    partial void InsertTranLog(TranLog instance);
    partial void UpdateTranLog(TranLog instance);
    partial void DeleteTranLog(TranLog instance);
    partial void InsertClient(Client instance);
    partial void UpdateClient(Client instance);
    partial void DeleteClient(Client instance);
    #endregion
		
		public DBDataContext() : 
				base(global::ES.Repository.Properties.Settings.Default.ES_ClientConnectionString2, mappingSource)
		{
			OnCreated();
		}
		
		public DBDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<TranConfig> TranConfig
		{
			get
			{
				return this.GetTable<TranConfig>();
			}
		}
		
		public System.Data.Linq.Table<TranLog> TranLog
		{
			get
			{
				return this.GetTable<TranLog>();
			}
		}
		
		public System.Data.Linq.Table<Client> Clients
		{
			get
			{
				return this.GetTable<Client>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.TranConfig")]
	public partial class TranConfig : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private System.Guid _Guid;
		
		private string _Name;
		
		private string _Code;
		
		private int _Sort;
		
		private int _MaxCount;
		
		private System.Data.Linq.Binary _LastStamp;
		
		private int _Direct;
		
		private string _HeaderSql;
		
		private string _DetailSql;
		
		private string _FooterSql;
		
		private string _Remark;
		
		private int _Status;
		
		private System.Data.Linq.Binary _Timestamp;
		
		private System.DateTime _CreatedTime;
		
		private string _CreatedBy;
		
		private System.Nullable<System.DateTime> _ModifiedTime;
		
		private string _ModifiedBy;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnGuidChanging(System.Guid value);
    partial void OnGuidChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnCodeChanging(string value);
    partial void OnCodeChanged();
    partial void OnSortChanging(int value);
    partial void OnSortChanged();
    partial void OnMaxCountChanging(int value);
    partial void OnMaxCountChanged();
    partial void OnLastStampChanging(System.Data.Linq.Binary value);
    partial void OnLastStampChanged();
    partial void OnDirectChanging(int value);
    partial void OnDirectChanged();
    partial void OnHeaderSqlChanging(string value);
    partial void OnHeaderSqlChanged();
    partial void OnDetailSqlChanging(string value);
    partial void OnDetailSqlChanged();
    partial void OnFooterSqlChanging(string value);
    partial void OnFooterSqlChanged();
    partial void OnRemarkChanging(string value);
    partial void OnRemarkChanged();
    partial void OnStatusChanging(int value);
    partial void OnStatusChanged();
    partial void OnTimestampChanging(System.Data.Linq.Binary value);
    partial void OnTimestampChanged();
    partial void OnCreatedTimeChanging(System.DateTime value);
    partial void OnCreatedTimeChanged();
    partial void OnCreatedByChanging(string value);
    partial void OnCreatedByChanged();
    partial void OnModifiedTimeChanging(System.Nullable<System.DateTime> value);
    partial void OnModifiedTimeChanged();
    partial void OnModifiedByChanging(string value);
    partial void OnModifiedByChanged();
    #endregion
		
		public TranConfig()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true, UpdateCheck=UpdateCheck.Never)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Guid", DbType="UniqueIdentifier NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public System.Guid Guid
		{
			get
			{
				return this._Guid;
			}
			set
			{
				if ((this._Guid != value))
				{
					this.OnGuidChanging(value);
					this.SendPropertyChanging();
					this._Guid = value;
					this.SendPropertyChanged("Guid");
					this.OnGuidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="NVarChar(64) NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Code", DbType="NVarChar(50)", UpdateCheck=UpdateCheck.Never)]
		public string Code
		{
			get
			{
				return this._Code;
			}
			set
			{
				if ((this._Code != value))
				{
					this.OnCodeChanging(value);
					this.SendPropertyChanging();
					this._Code = value;
					this.SendPropertyChanged("Code");
					this.OnCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Sort", DbType="Int NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public int Sort
		{
			get
			{
				return this._Sort;
			}
			set
			{
				if ((this._Sort != value))
				{
					this.OnSortChanging(value);
					this.SendPropertyChanging();
					this._Sort = value;
					this.SendPropertyChanged("Sort");
					this.OnSortChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MaxCount", DbType="Int NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public int MaxCount
		{
			get
			{
				return this._MaxCount;
			}
			set
			{
				if ((this._MaxCount != value))
				{
					this.OnMaxCountChanging(value);
					this.SendPropertyChanging();
					this._MaxCount = value;
					this.SendPropertyChanged("MaxCount");
					this.OnMaxCountChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastStamp", DbType="Binary(16)", UpdateCheck=UpdateCheck.Never)]
		public System.Data.Linq.Binary LastStamp
		{
			get
			{
				return this._LastStamp;
			}
			set
			{
				if ((this._LastStamp != value))
				{
					this.OnLastStampChanging(value);
					this.SendPropertyChanging();
					this._LastStamp = value;
					this.SendPropertyChanged("LastStamp");
					this.OnLastStampChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Direct", DbType="Int NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public int Direct
		{
			get
			{
				return this._Direct;
			}
			set
			{
				if ((this._Direct != value))
				{
					this.OnDirectChanging(value);
					this.SendPropertyChanging();
					this._Direct = value;
					this.SendPropertyChanged("Direct");
					this.OnDirectChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HeaderSql", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string HeaderSql
		{
			get
			{
				return this._HeaderSql;
			}
			set
			{
				if ((this._HeaderSql != value))
				{
					this.OnHeaderSqlChanging(value);
					this.SendPropertyChanging();
					this._HeaderSql = value;
					this.SendPropertyChanged("HeaderSql");
					this.OnHeaderSqlChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DetailSql", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string DetailSql
		{
			get
			{
				return this._DetailSql;
			}
			set
			{
				if ((this._DetailSql != value))
				{
					this.OnDetailSqlChanging(value);
					this.SendPropertyChanging();
					this._DetailSql = value;
					this.SendPropertyChanged("DetailSql");
					this.OnDetailSqlChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FooterSql", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string FooterSql
		{
			get
			{
				return this._FooterSql;
			}
			set
			{
				if ((this._FooterSql != value))
				{
					this.OnFooterSqlChanging(value);
					this.SendPropertyChanging();
					this._FooterSql = value;
					this.SendPropertyChanged("FooterSql");
					this.OnFooterSqlChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Remark", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Remark
		{
			get
			{
				return this._Remark;
			}
			set
			{
				if ((this._Remark != value))
				{
					this.OnRemarkChanging(value);
					this.SendPropertyChanging();
					this._Remark = value;
					this.SendPropertyChanged("Remark");
					this.OnRemarkChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Status", DbType="Int NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public int Status
		{
			get
			{
				return this._Status;
			}
			set
			{
				if ((this._Status != value))
				{
					this.OnStatusChanging(value);
					this.SendPropertyChanging();
					this._Status = value;
					this.SendPropertyChanged("Status");
					this.OnStatusChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Timestamp", AutoSync=AutoSync.Always, DbType="rowversion NOT NULL", CanBeNull=false, IsDbGenerated=true, IsVersion=true, UpdateCheck=UpdateCheck.Never)]
		public System.Data.Linq.Binary Timestamp
		{
			get
			{
				return this._Timestamp;
			}
			set
			{
				if ((this._Timestamp != value))
				{
					this.OnTimestampChanging(value);
					this.SendPropertyChanging();
					this._Timestamp = value;
					this.SendPropertyChanged("Timestamp");
					this.OnTimestampChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CreatedTime", DbType="DateTime NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public System.DateTime CreatedTime
		{
			get
			{
				return this._CreatedTime;
			}
			set
			{
				if ((this._CreatedTime != value))
				{
					this.OnCreatedTimeChanging(value);
					this.SendPropertyChanging();
					this._CreatedTime = value;
					this.SendPropertyChanged("CreatedTime");
					this.OnCreatedTimeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CreatedBy", DbType="VarChar(64)", UpdateCheck=UpdateCheck.Never)]
		public string CreatedBy
		{
			get
			{
				return this._CreatedBy;
			}
			set
			{
				if ((this._CreatedBy != value))
				{
					this.OnCreatedByChanging(value);
					this.SendPropertyChanging();
					this._CreatedBy = value;
					this.SendPropertyChanged("CreatedBy");
					this.OnCreatedByChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ModifiedTime", DbType="DateTime", UpdateCheck=UpdateCheck.Never)]
		public System.Nullable<System.DateTime> ModifiedTime
		{
			get
			{
				return this._ModifiedTime;
			}
			set
			{
				if ((this._ModifiedTime != value))
				{
					this.OnModifiedTimeChanging(value);
					this.SendPropertyChanging();
					this._ModifiedTime = value;
					this.SendPropertyChanged("ModifiedTime");
					this.OnModifiedTimeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ModifiedBy", DbType="VarChar(64)", UpdateCheck=UpdateCheck.Never)]
		public string ModifiedBy
		{
			get
			{
				return this._ModifiedBy;
			}
			set
			{
				if ((this._ModifiedBy != value))
				{
					this.OnModifiedByChanging(value);
					this.SendPropertyChanging();
					this._ModifiedBy = value;
					this.SendPropertyChanged("ModifiedBy");
					this.OnModifiedByChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.TranLog")]
	public partial class TranLog : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private string _TranName;
		
		private string _Source;
		
		private string _Target;
		
		private string _Request;
		
		private string _Response;
		
		private System.DateTime _TranTime;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnTranNameChanging(string value);
    partial void OnTranNameChanged();
    partial void OnSourceChanging(string value);
    partial void OnSourceChanged();
    partial void OnTargetChanging(string value);
    partial void OnTargetChanged();
    partial void OnRequestChanging(string value);
    partial void OnRequestChanged();
    partial void OnResponseChanging(string value);
    partial void OnResponseChanged();
    partial void OnTranTimeChanging(System.DateTime value);
    partial void OnTranTimeChanged();
    #endregion
		
		public TranLog()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TranName", DbType="NVarChar(32)")]
		public string TranName
		{
			get
			{
				return this._TranName;
			}
			set
			{
				if ((this._TranName != value))
				{
					this.OnTranNameChanging(value);
					this.SendPropertyChanging();
					this._TranName = value;
					this.SendPropertyChanged("TranName");
					this.OnTranNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Source", DbType="VarChar(32)")]
		public string Source
		{
			get
			{
				return this._Source;
			}
			set
			{
				if ((this._Source != value))
				{
					this.OnSourceChanging(value);
					this.SendPropertyChanging();
					this._Source = value;
					this.SendPropertyChanged("Source");
					this.OnSourceChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Target", DbType="VarChar(32)")]
		public string Target
		{
			get
			{
				return this._Target;
			}
			set
			{
				if ((this._Target != value))
				{
					this.OnTargetChanging(value);
					this.SendPropertyChanging();
					this._Target = value;
					this.SendPropertyChanged("Target");
					this.OnTargetChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Request", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Request
		{
			get
			{
				return this._Request;
			}
			set
			{
				if ((this._Request != value))
				{
					this.OnRequestChanging(value);
					this.SendPropertyChanging();
					this._Request = value;
					this.SendPropertyChanged("Request");
					this.OnRequestChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Response", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string Response
		{
			get
			{
				return this._Response;
			}
			set
			{
				if ((this._Response != value))
				{
					this.OnResponseChanging(value);
					this.SendPropertyChanging();
					this._Response = value;
					this.SendPropertyChanged("Response");
					this.OnResponseChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TranTime", DbType="DateTime NOT NULL")]
		public System.DateTime TranTime
		{
			get
			{
				return this._TranTime;
			}
			set
			{
				if ((this._TranTime != value))
				{
					this.OnTranTimeChanging(value);
					this.SendPropertyChanging();
					this._TranTime = value;
					this.SendPropertyChanged("TranTime");
					this.OnTranTimeChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Client")]
	public partial class Client : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private System.Guid _GUID;
		
		private string _Code;
		
		private string _Name;
		
		private System.Nullable<bool> _IsCurrent;
		
		private int _Type;
		
		private string _Address;
		
		private System.Data.Linq.Binary _Timestamp;
		
		private int _Status;
		
		private string _CreatedBy;
		
		private System.Nullable<System.DateTime> _CreatedTime;
		
		private string _ModifiedBy;
		
		private System.Nullable<System.DateTime> _ModifiedTime;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnGUIDChanging(System.Guid value);
    partial void OnGUIDChanged();
    partial void OnCodeChanging(string value);
    partial void OnCodeChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnIsCurrentChanging(System.Nullable<bool> value);
    partial void OnIsCurrentChanged();
    partial void OnTypeChanging(int value);
    partial void OnTypeChanged();
    partial void OnAddressChanging(string value);
    partial void OnAddressChanged();
    partial void OnTimestampChanging(System.Data.Linq.Binary value);
    partial void OnTimestampChanged();
    partial void OnStatusChanging(int value);
    partial void OnStatusChanged();
    partial void OnCreatedByChanging(string value);
    partial void OnCreatedByChanged();
    partial void OnCreatedTimeChanging(System.Nullable<System.DateTime> value);
    partial void OnCreatedTimeChanged();
    partial void OnModifiedByChanging(string value);
    partial void OnModifiedByChanged();
    partial void OnModifiedTimeChanging(System.Nullable<System.DateTime> value);
    partial void OnModifiedTimeChanged();
    #endregion
		
		public Client()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true, UpdateCheck=UpdateCheck.Never)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_GUID", DbType="UniqueIdentifier NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public System.Guid GUID
		{
			get
			{
				return this._GUID;
			}
			set
			{
				if ((this._GUID != value))
				{
					this.OnGUIDChanging(value);
					this.SendPropertyChanging();
					this._GUID = value;
					this.SendPropertyChanged("GUID");
					this.OnGUIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Code", DbType="VarChar(50)", UpdateCheck=UpdateCheck.Never)]
		public string Code
		{
			get
			{
				return this._Code;
			}
			set
			{
				if ((this._Code != value))
				{
					this.OnCodeChanging(value);
					this.SendPropertyChanging();
					this._Code = value;
					this.SendPropertyChanged("Code");
					this.OnCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="NVarChar(50)", UpdateCheck=UpdateCheck.Never)]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IsCurrent", DbType="Bit", UpdateCheck=UpdateCheck.Never)]
		public System.Nullable<bool> IsCurrent
		{
			get
			{
				return this._IsCurrent;
			}
			set
			{
				if ((this._IsCurrent != value))
				{
					this.OnIsCurrentChanging(value);
					this.SendPropertyChanging();
					this._IsCurrent = value;
					this.SendPropertyChanged("IsCurrent");
					this.OnIsCurrentChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Type", DbType="Int NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public int Type
		{
			get
			{
				return this._Type;
			}
			set
			{
				if ((this._Type != value))
				{
					this.OnTypeChanging(value);
					this.SendPropertyChanging();
					this._Type = value;
					this.SendPropertyChanged("Type");
					this.OnTypeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Address", DbType="NVarChar(500)", UpdateCheck=UpdateCheck.Never)]
		public string Address
		{
			get
			{
				return this._Address;
			}
			set
			{
				if ((this._Address != value))
				{
					this.OnAddressChanging(value);
					this.SendPropertyChanging();
					this._Address = value;
					this.SendPropertyChanged("Address");
					this.OnAddressChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Timestamp", AutoSync=AutoSync.Always, DbType="rowversion NOT NULL", CanBeNull=false, IsDbGenerated=true, IsVersion=true, UpdateCheck=UpdateCheck.Never)]
		public System.Data.Linq.Binary Timestamp
		{
			get
			{
				return this._Timestamp;
			}
			set
			{
				if ((this._Timestamp != value))
				{
					this.OnTimestampChanging(value);
					this.SendPropertyChanging();
					this._Timestamp = value;
					this.SendPropertyChanged("Timestamp");
					this.OnTimestampChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Status", DbType="Int NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public int Status
		{
			get
			{
				return this._Status;
			}
			set
			{
				if ((this._Status != value))
				{
					this.OnStatusChanging(value);
					this.SendPropertyChanging();
					this._Status = value;
					this.SendPropertyChanged("Status");
					this.OnStatusChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CreatedBy", DbType="VarChar(50)", UpdateCheck=UpdateCheck.Never)]
		public string CreatedBy
		{
			get
			{
				return this._CreatedBy;
			}
			set
			{
				if ((this._CreatedBy != value))
				{
					this.OnCreatedByChanging(value);
					this.SendPropertyChanging();
					this._CreatedBy = value;
					this.SendPropertyChanged("CreatedBy");
					this.OnCreatedByChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CreatedTime", DbType="DateTime", UpdateCheck=UpdateCheck.Never)]
		public System.Nullable<System.DateTime> CreatedTime
		{
			get
			{
				return this._CreatedTime;
			}
			set
			{
				if ((this._CreatedTime != value))
				{
					this.OnCreatedTimeChanging(value);
					this.SendPropertyChanging();
					this._CreatedTime = value;
					this.SendPropertyChanged("CreatedTime");
					this.OnCreatedTimeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ModifiedBy", DbType="VarChar(50)", UpdateCheck=UpdateCheck.Never)]
		public string ModifiedBy
		{
			get
			{
				return this._ModifiedBy;
			}
			set
			{
				if ((this._ModifiedBy != value))
				{
					this.OnModifiedByChanging(value);
					this.SendPropertyChanging();
					this._ModifiedBy = value;
					this.SendPropertyChanged("ModifiedBy");
					this.OnModifiedByChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ModifiedTime", DbType="DateTime", UpdateCheck=UpdateCheck.Never)]
		public System.Nullable<System.DateTime> ModifiedTime
		{
			get
			{
				return this._ModifiedTime;
			}
			set
			{
				if ((this._ModifiedTime != value))
				{
					this.OnModifiedTimeChanging(value);
					this.SendPropertyChanging();
					this._ModifiedTime = value;
					this.SendPropertyChanged("ModifiedTime");
					this.OnModifiedTimeChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
