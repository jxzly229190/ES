﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ES.Client.TransferService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.CollectionDataContractAttribute(Name="ArrayOfAnyType", Namespace="http://tempuri.org/", ItemName="anyType")]
    [System.SerializableAttribute()]
    public class ArrayOfAnyType : System.Collections.Generic.List<object> {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ResponseData", Namespace="http://tempuri.org/")]
    [System.SerializableAttribute()]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(ES.Client.TransferService.ArrayOfAnyType))]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(ES.Client.TransferService.SqlData))]
    public partial class ResponseData : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private int StateField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string MessageField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private object dataField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int State {
            get {
                return this.StateField;
            }
            set {
                if ((this.StateField.Equals(value) != true)) {
                    this.StateField = value;
                    this.RaisePropertyChanged("State");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string Message {
            get {
                return this.MessageField;
            }
            set {
                if ((object.ReferenceEquals(this.MessageField, value) != true)) {
                    this.MessageField = value;
                    this.RaisePropertyChanged("Message");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public object data {
            get {
                return this.dataField;
            }
            set {
                if ((object.ReferenceEquals(this.dataField, value) != true)) {
                    this.dataField = value;
                    this.RaisePropertyChanged("data");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="SqlData", Namespace="http://tempuri.org/")]
    [System.SerializableAttribute()]
    public partial class SqlData : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string HeaderSqlField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DetailSqlField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string FooterSqlField;
        
        private int RowCountField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string MaxTimeStampField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false)]
        public string HeaderSql {
            get {
                return this.HeaderSqlField;
            }
            set {
                if ((object.ReferenceEquals(this.HeaderSqlField, value) != true)) {
                    this.HeaderSqlField = value;
                    this.RaisePropertyChanged("HeaderSql");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string DetailSql {
            get {
                return this.DetailSqlField;
            }
            set {
                if ((object.ReferenceEquals(this.DetailSqlField, value) != true)) {
                    this.DetailSqlField = value;
                    this.RaisePropertyChanged("DetailSql");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public string FooterSql {
            get {
                return this.FooterSqlField;
            }
            set {
                if ((object.ReferenceEquals(this.FooterSqlField, value) != true)) {
                    this.FooterSqlField = value;
                    this.RaisePropertyChanged("FooterSql");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true, Order=3)]
        public int RowCount {
            get {
                return this.RowCountField;
            }
            set {
                if ((this.RowCountField.Equals(value) != true)) {
                    this.RowCountField = value;
                    this.RaisePropertyChanged("RowCount");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=4)]
        public string MaxTimeStamp {
            get {
                return this.MaxTimeStampField;
            }
            set {
                if ((object.ReferenceEquals(this.MaxTimeStampField, value) != true)) {
                    this.MaxTimeStampField = value;
                    this.RaisePropertyChanged("MaxTimeStamp");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="TransferService.TransferSoap")]
    public interface TransferSoap {
        
        // CODEGEN: Generating message contract since element name HelloWorldResult from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/HelloWorld", ReplyAction="*")]
        ES.Client.TransferService.HelloWorldResponse HelloWorld(ES.Client.TransferService.HelloWorldRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/HelloWorld", ReplyAction="*")]
        System.Threading.Tasks.Task<ES.Client.TransferService.HelloWorldResponse> HelloWorldAsync(ES.Client.TransferService.HelloWorldRequest request);
        
        // CODEGEN: Generating message contract since element name clientCode from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Get", ReplyAction="*")]
        [System.ServiceModel.ServiceKnownTypeAttribute(typeof(ES.Client.TransferService.ArrayOfAnyType))]
        [System.ServiceModel.ServiceKnownTypeAttribute(typeof(ES.Client.TransferService.ResponseData))]
        [System.ServiceModel.ServiceKnownTypeAttribute(typeof(ES.Client.TransferService.SqlData))]
        ES.Client.TransferService.GetResponse Get(ES.Client.TransferService.GetRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Get", ReplyAction="*")]
        System.Threading.Tasks.Task<ES.Client.TransferService.GetResponse> GetAsync(ES.Client.TransferService.GetRequest request);
        
        // CODEGEN: Generating message contract since element name clientCode from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Post", ReplyAction="*")]
        ES.Client.TransferService.PostResponse Post(ES.Client.TransferService.PostRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/Post", ReplyAction="*")]
        System.Threading.Tasks.Task<ES.Client.TransferService.PostResponse> PostAsync(ES.Client.TransferService.PostRequest request);
        
        // CODEGEN: Generating message contract since element name clientCode from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetTranConfigs", ReplyAction="*")]
        ES.Client.TransferService.GetTranConfigsResponse GetTranConfigs(ES.Client.TransferService.GetTranConfigsRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetTranConfigs", ReplyAction="*")]
        System.Threading.Tasks.Task<ES.Client.TransferService.GetTranConfigsResponse> GetTranConfigsAsync(ES.Client.TransferService.GetTranConfigsRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class HelloWorldRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="HelloWorld", Namespace="http://tempuri.org/", Order=0)]
        public ES.Client.TransferService.HelloWorldRequestBody Body;
        
        public HelloWorldRequest() {
        }
        
        public HelloWorldRequest(ES.Client.TransferService.HelloWorldRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class HelloWorldRequestBody {
        
        public HelloWorldRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class HelloWorldResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="HelloWorldResponse", Namespace="http://tempuri.org/", Order=0)]
        public ES.Client.TransferService.HelloWorldResponseBody Body;
        
        public HelloWorldResponse() {
        }
        
        public HelloWorldResponse(ES.Client.TransferService.HelloWorldResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class HelloWorldResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string HelloWorldResult;
        
        public HelloWorldResponseBody() {
        }
        
        public HelloWorldResponseBody(string HelloWorldResult) {
            this.HelloWorldResult = HelloWorldResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="Get", Namespace="http://tempuri.org/", Order=0)]
        public ES.Client.TransferService.GetRequestBody Body;
        
        public GetRequest() {
        }
        
        public GetRequest(ES.Client.TransferService.GetRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string clientCode;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string varifyCode;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public string lastTimeStamp;
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=3)]
        public int rowCount;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=4)]
        public string configGuid;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=5)]
        public ES.Client.TransferService.ArrayOfAnyType paras;
        
        public GetRequestBody() {
        }
        
        public GetRequestBody(string clientCode, string varifyCode, string lastTimeStamp, int rowCount, string configGuid, ES.Client.TransferService.ArrayOfAnyType paras) {
            this.clientCode = clientCode;
            this.varifyCode = varifyCode;
            this.lastTimeStamp = lastTimeStamp;
            this.rowCount = rowCount;
            this.configGuid = configGuid;
            this.paras = paras;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetResponse", Namespace="http://tempuri.org/", Order=0)]
        public ES.Client.TransferService.GetResponseBody Body;
        
        public GetResponse() {
        }
        
        public GetResponse(ES.Client.TransferService.GetResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public ES.Client.TransferService.ResponseData GetResult;
        
        public GetResponseBody() {
        }
        
        public GetResponseBody(ES.Client.TransferService.ResponseData GetResult) {
            this.GetResult = GetResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class PostRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="Post", Namespace="http://tempuri.org/", Order=0)]
        public ES.Client.TransferService.PostRequestBody Body;
        
        public PostRequest() {
        }
        
        public PostRequest(ES.Client.TransferService.PostRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class PostRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string clientCode;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string varifyCode;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public ES.Client.TransferService.SqlData data;
        
        public PostRequestBody() {
        }
        
        public PostRequestBody(string clientCode, string varifyCode, ES.Client.TransferService.SqlData data) {
            this.clientCode = clientCode;
            this.varifyCode = varifyCode;
            this.data = data;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class PostResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="PostResponse", Namespace="http://tempuri.org/", Order=0)]
        public ES.Client.TransferService.PostResponseBody Body;
        
        public PostResponse() {
        }
        
        public PostResponse(ES.Client.TransferService.PostResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class PostResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public ES.Client.TransferService.ResponseData PostResult;
        
        public PostResponseBody() {
        }
        
        public PostResponseBody(ES.Client.TransferService.ResponseData PostResult) {
            this.PostResult = PostResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetTranConfigsRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetTranConfigs", Namespace="http://tempuri.org/", Order=0)]
        public ES.Client.TransferService.GetTranConfigsRequestBody Body;
        
        public GetTranConfigsRequest() {
        }
        
        public GetTranConfigsRequest(ES.Client.TransferService.GetTranConfigsRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetTranConfigsRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string clientCode;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string varifyCode;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public string timestamp;
        
        public GetTranConfigsRequestBody() {
        }
        
        public GetTranConfigsRequestBody(string clientCode, string varifyCode, string timestamp) {
            this.clientCode = clientCode;
            this.varifyCode = varifyCode;
            this.timestamp = timestamp;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetTranConfigsResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetTranConfigsResponse", Namespace="http://tempuri.org/", Order=0)]
        public ES.Client.TransferService.GetTranConfigsResponseBody Body;
        
        public GetTranConfigsResponse() {
        }
        
        public GetTranConfigsResponse(ES.Client.TransferService.GetTranConfigsResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetTranConfigsResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public ES.Client.TransferService.ResponseData GetTranConfigsResult;
        
        public GetTranConfigsResponseBody() {
        }
        
        public GetTranConfigsResponseBody(ES.Client.TransferService.ResponseData GetTranConfigsResult) {
            this.GetTranConfigsResult = GetTranConfigsResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface TransferSoapChannel : ES.Client.TransferService.TransferSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class TransferSoapClient : System.ServiceModel.ClientBase<ES.Client.TransferService.TransferSoap>, ES.Client.TransferService.TransferSoap {
        
        public TransferSoapClient() {
        }
        
        public TransferSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public TransferSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public TransferSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public TransferSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        ES.Client.TransferService.HelloWorldResponse ES.Client.TransferService.TransferSoap.HelloWorld(ES.Client.TransferService.HelloWorldRequest request) {
            return base.Channel.HelloWorld(request);
        }
        
        public string HelloWorld() {
            ES.Client.TransferService.HelloWorldRequest inValue = new ES.Client.TransferService.HelloWorldRequest();
            inValue.Body = new ES.Client.TransferService.HelloWorldRequestBody();
            ES.Client.TransferService.HelloWorldResponse retVal = ((ES.Client.TransferService.TransferSoap)(this)).HelloWorld(inValue);
            return retVal.Body.HelloWorldResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<ES.Client.TransferService.HelloWorldResponse> ES.Client.TransferService.TransferSoap.HelloWorldAsync(ES.Client.TransferService.HelloWorldRequest request) {
            return base.Channel.HelloWorldAsync(request);
        }
        
        public System.Threading.Tasks.Task<ES.Client.TransferService.HelloWorldResponse> HelloWorldAsync() {
            ES.Client.TransferService.HelloWorldRequest inValue = new ES.Client.TransferService.HelloWorldRequest();
            inValue.Body = new ES.Client.TransferService.HelloWorldRequestBody();
            return ((ES.Client.TransferService.TransferSoap)(this)).HelloWorldAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        ES.Client.TransferService.GetResponse ES.Client.TransferService.TransferSoap.Get(ES.Client.TransferService.GetRequest request) {
            return base.Channel.Get(request);
        }
        
        public ES.Client.TransferService.ResponseData Get(string clientCode, string varifyCode, string lastTimeStamp, int rowCount, string configGuid, ES.Client.TransferService.ArrayOfAnyType paras) {
            ES.Client.TransferService.GetRequest inValue = new ES.Client.TransferService.GetRequest();
            inValue.Body = new ES.Client.TransferService.GetRequestBody();
            inValue.Body.clientCode = clientCode;
            inValue.Body.varifyCode = varifyCode;
            inValue.Body.lastTimeStamp = lastTimeStamp;
            inValue.Body.rowCount = rowCount;
            inValue.Body.configGuid = configGuid;
            inValue.Body.paras = paras;
            ES.Client.TransferService.GetResponse retVal = ((ES.Client.TransferService.TransferSoap)(this)).Get(inValue);
            return retVal.Body.GetResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<ES.Client.TransferService.GetResponse> ES.Client.TransferService.TransferSoap.GetAsync(ES.Client.TransferService.GetRequest request) {
            return base.Channel.GetAsync(request);
        }
        
        public System.Threading.Tasks.Task<ES.Client.TransferService.GetResponse> GetAsync(string clientCode, string varifyCode, string lastTimeStamp, int rowCount, string configGuid, ES.Client.TransferService.ArrayOfAnyType paras) {
            ES.Client.TransferService.GetRequest inValue = new ES.Client.TransferService.GetRequest();
            inValue.Body = new ES.Client.TransferService.GetRequestBody();
            inValue.Body.clientCode = clientCode;
            inValue.Body.varifyCode = varifyCode;
            inValue.Body.lastTimeStamp = lastTimeStamp;
            inValue.Body.rowCount = rowCount;
            inValue.Body.configGuid = configGuid;
            inValue.Body.paras = paras;
            return ((ES.Client.TransferService.TransferSoap)(this)).GetAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        ES.Client.TransferService.PostResponse ES.Client.TransferService.TransferSoap.Post(ES.Client.TransferService.PostRequest request) {
            return base.Channel.Post(request);
        }
        
        public ES.Client.TransferService.ResponseData Post(string clientCode, string varifyCode, ES.Client.TransferService.SqlData data) {
            ES.Client.TransferService.PostRequest inValue = new ES.Client.TransferService.PostRequest();
            inValue.Body = new ES.Client.TransferService.PostRequestBody();
            inValue.Body.clientCode = clientCode;
            inValue.Body.varifyCode = varifyCode;
            inValue.Body.data = data;
            ES.Client.TransferService.PostResponse retVal = ((ES.Client.TransferService.TransferSoap)(this)).Post(inValue);
            return retVal.Body.PostResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<ES.Client.TransferService.PostResponse> ES.Client.TransferService.TransferSoap.PostAsync(ES.Client.TransferService.PostRequest request) {
            return base.Channel.PostAsync(request);
        }
        
        public System.Threading.Tasks.Task<ES.Client.TransferService.PostResponse> PostAsync(string clientCode, string varifyCode, ES.Client.TransferService.SqlData data) {
            ES.Client.TransferService.PostRequest inValue = new ES.Client.TransferService.PostRequest();
            inValue.Body = new ES.Client.TransferService.PostRequestBody();
            inValue.Body.clientCode = clientCode;
            inValue.Body.varifyCode = varifyCode;
            inValue.Body.data = data;
            return ((ES.Client.TransferService.TransferSoap)(this)).PostAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        ES.Client.TransferService.GetTranConfigsResponse ES.Client.TransferService.TransferSoap.GetTranConfigs(ES.Client.TransferService.GetTranConfigsRequest request) {
            return base.Channel.GetTranConfigs(request);
        }
        
        public ES.Client.TransferService.ResponseData GetTranConfigs(string clientCode, string varifyCode, string timestamp) {
            ES.Client.TransferService.GetTranConfigsRequest inValue = new ES.Client.TransferService.GetTranConfigsRequest();
            inValue.Body = new ES.Client.TransferService.GetTranConfigsRequestBody();
            inValue.Body.clientCode = clientCode;
            inValue.Body.varifyCode = varifyCode;
            inValue.Body.timestamp = timestamp;
            ES.Client.TransferService.GetTranConfigsResponse retVal = ((ES.Client.TransferService.TransferSoap)(this)).GetTranConfigs(inValue);
            return retVal.Body.GetTranConfigsResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<ES.Client.TransferService.GetTranConfigsResponse> ES.Client.TransferService.TransferSoap.GetTranConfigsAsync(ES.Client.TransferService.GetTranConfigsRequest request) {
            return base.Channel.GetTranConfigsAsync(request);
        }
        
        public System.Threading.Tasks.Task<ES.Client.TransferService.GetTranConfigsResponse> GetTranConfigsAsync(string clientCode, string varifyCode, string timestamp) {
            ES.Client.TransferService.GetTranConfigsRequest inValue = new ES.Client.TransferService.GetTranConfigsRequest();
            inValue.Body = new ES.Client.TransferService.GetTranConfigsRequestBody();
            inValue.Body.clientCode = clientCode;
            inValue.Body.varifyCode = varifyCode;
            inValue.Body.timestamp = timestamp;
            return ((ES.Client.TransferService.TransferSoap)(this)).GetTranConfigsAsync(inValue);
        }
    }
}
