<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewClient.aspx.cs" Inherits="ES.Server.NewClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新客户端注册</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
</head>
<body>
    <form class="form-horizontal" runat="server" style="width: 60%;margin-left: auto;margin-right: auto;">
        <fieldset>
            <h2>新客户端注册</h2>
            <hr/>
            <div class="form-group">
                <label for="tbName" class="col-lg-2 control-label">名称</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="tbName" runat="server" class="form-control" placeholder="名称"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="tbCode" class="col-lg-2 control-label">编码</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="tbCode" runat="server" class="form-control" placeholder="编码"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="tbAddress" class="col-lg-2 control-label">地址</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="tbAddress" runat="server" class="form-control" placeholder="地址"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <span class="col-lg-2 control-label"></span>
                <div class="col-lg-10">
                    <asp:Label runat="server" ID="lblMsg" class="alert alert-dismissible alert-warning">
                    </asp:Label>
                </div>
            </div>
            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                  <button type="reset" class="btn btn-default">重 置</button>
                  <asp:Button ID="btnOk" runat="server" Text="提 交" class="btn btn-primary" OnClick="BtnOkClick"/>
              </div>
            </div>
        </fieldset>
    </form>
</body>
</html>
