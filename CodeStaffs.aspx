﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CodeStaffs.aspx.cs" Inherits="KindergartenWebApp.CodeStaffs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
<table border="0">
    <tr>
    <td>
    <asp:Label ID="LabelFindStaff" runat="server" Text="Label">Сотрудник</asp:Label><asp:TextBox ID="TextBoxFindStaff" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonFindStaff" runat="server" Text="Найти" OnClick="ButtonFindStaff_Click" />
    <br />        
        <asp:GridView ID="GridViewStaff" runat="server" AutoGenerateColumns="False"
            AllowPaging="True" 
            AutoGenerateDeleteButton="True" 
            AutoGenerateEditButton="True" 
            OnRowCancelingEdit="GridViewStaff_RowCancelingEdit" 
            OnRowDeleting="GridViewStaff_RowDeleting" 
            OnRowEditing="GridViewStaff_RowEditing" 
            OnRowUpdating="GridViewStaff_RowUpdating" PageSize="15" 
            OnPageIndexChanging="GridViewStaff_PageIndexChanging"
            Caption="Сотрудник" 
            EmptyDataText="Нет данных" CaptionAlign="Top" PageIndex="0">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Код" SortExpression="Id" />
                <asp:BoundField DataField="FullName" HeaderText="ФИО" SortExpression="FullName" />
                <asp:BoundField DataField="Adress" HeaderText="Адрес" SortExpression="Adress" />
                <asp:BoundField DataField="Phone" HeaderText="Номер телефона" SortExpression="Phone" />
                <asp:TemplateField HeaderText="Должность" SortExpression="PositionId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="PositionDropDownList" runat="server" DataSourceID="SqlDataSourcePosition" DataTextField="PositionName" DataValueField="Id" SelectedValue='<%# Bind("PositionId") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                     <asp:Label ID="PositionId" runat="server"  Text='<%# Eval("Position.PositionName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Info" HeaderText="Информация" SortExpression="Info" />
                <asp:BoundField DataField="Reward" HeaderText="Награды" SortExpression="Reward" />
            </Columns>
            
    </asp:GridView>
        </td>
        <td>
        <strong>Добавить сотрудника:</strong>
            <br />
            <asp:label runat="server">ФИО:</asp:label><asp:TextBox ID="TextBoxFullName" runat="server"></asp:TextBox>
            <br />
            <asp:label runat="server">Адрес:</asp:label><asp:TextBox ID="TextBoxAdress" runat="server"></asp:TextBox>
            <br />
            <asp:label runat="server">Номер телефона:</asp:label><asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
            <br />
            <asp:label runat="server">Должность:</asp:label><asp:DropDownList ID="PositionDropDownList" DataSourceID="SqlDataSourcePosition" DataValueField="Id" DataTextField="PositionName" runat="server"></asp:DropDownList>
            <br />
            <asp:label runat="server">Информация:</asp:label><asp:TextBox ID="TextBoxInfo" runat="server"></asp:TextBox>
            <br />
            <asp:label runat="server">Награды:</asp:label><asp:TextBox ID="TextBoxReward" runat="server"></asp:TextBox>
            <br />
        </td>
        <td>
            <asp:Button ID="ButtonAddStaff" runat="server" Text="Добавить" OnClick="ButtonAddStaff_Click" />

        </td>
</tr>
</table>
    <asp:SqlDataSource ID="SqlDataSourcePosition" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KindergartenConnectionString %>" 
        SelectCommand="SELECT [Id], [PositionName] FROM [Positions]">
    </asp:SqlDataSource>
    </asp:Content>
