<%@ page import="example.*" %>

<%= Atp.getError() %>
    
<h2>Free tier price</h2>

<% TierPrice priceFree = Atp.getTierPrice("FREE"); %>
<b><%= priceFree.price_mo %></b>
<b><%= priceFree.users %></b>
<b><%= priceFree.storage %></b>
<b><%= priceFree.support %></b>

<h2>Pro tier price</h2>

<% TierPrice pricePro = Atp.getTierPrice("PRO"); %>
<b><%= pricePro.price_mo %></b>
<b><%= pricePro.users %></b>
<b><%= pricePro.storage %></b>
<b><%= pricePro.support %></b>

<h2>Enterprise tier price</h2>

<% TierPrice priceEnterprise = Atp.getTierPrice("ENTERPRISE"); %>
<b><%= priceEnterprise.price_mo %></b>
<b><%= priceEnterprise.users %></b>
<b><%= priceEnterprise.storage %></b>
<b><%= priceEnterprise.support %></b>
