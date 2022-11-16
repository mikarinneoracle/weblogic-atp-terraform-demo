<%@ page import="example.*" %>
    
<% TierPrice priceFree = Atp.getTierPrice("FREE"); %>
<% TierPrice pricePro = Atp.getTierPrice("PRO"); %>
<% TierPrice priceEnterprise = Atp.getTierPrice("ENTERPRISE"); %>
<% TierOptions optionsFree = Atp.getTierOptions("FREE"); %>
<% TierOptions optionsPro = Atp.getTierOptions("PRO"); %>
<% TierOptions optionsEnterprise = Atp.getTierOptions("ENTERPRISE"); %>
    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>Weblogic and ATP Terraform demo</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/pricing/">

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
  </head>
  <body>
    
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
      <symbol id="check" viewBox="0 0 16 16">
        <title>Check</title>
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
      </symbol>
    </svg>

    <div class="container py-3">

      <header>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
          <h1 class="display-4 fw-normal">Pricing Page</h1>
          <p class="fs-5 text-muted">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It's built with default Bootstrap components and utilities with little customization.</p> 
        </div>
      </header>
    
  <main>
    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
      <div class="col">
        <%= Atp.error %><p><%= optionsFree.isPublic %>
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
            <h4 class="my-0 fw-normal">Free</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$<%= priceFree.price_mo %><small class="text-muted fw-light">/mo</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li><%= priceFree.users %> users included</li>
              <li><%= priceFree.storage %> GB of storage</li>
              <li><%= priceFree.support %></li>
              <li>Help center access</li>
            </ul>
            <button type="button" class="w-100 btn btn-lg btn-outline-primary">Sign up for free</button>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
            <h4 class="my-0 fw-normal">Pro</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$<%= pricePro.price_mo %><small class="text-muted fw-light">/mo</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li><%= pricePro.users %> users included</li>
              <li><%= pricePro.storage %> GB of storage</li>
              <li><%= pricePro.support %></li>
              <li>Help center access</li>
            </ul>
            <button type="button" class="w-100 btn btn-lg btn-primary">Get started</button>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm border-primary">
          <div class="card-header py-3 text-white bg-primary border-primary">
            <h4 class="my-0 fw-normal">Enterprise</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$<%= priceEnterprise.price_mo %><small class="text-muted fw-light">/mo</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li><%= priceEnterprise.users %> users included</li>
              <li><%= priceEnterprise.storage %> GB of storage</li>
              <li><%= priceEnterprise.support %></li>
              <li>Help center access</li>
            </ul>
            <button type="button" class="w-100 btn btn-lg btn-primary">Contact us</button>
          </div>
        </div>
      </div>
    </div>

    <h2 class="display-6 text-center mb-4">Compare plans</h2>

    <div class="table-responsive">
      <table class="table text-center">
        <thead>
          <tr>
            <th style="width: 34%;"></th>
            <th style="width: 22%;">Free</th>
            <th style="width: 22%;">Pro</th>
            <th style="width: 22%;">Enterprise</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row" class="text-start">Public</th>
            <td><% if (optionsFree.isPublic.equals("Y")) { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } else { %> XXXXXX <% } %></td>
            <td><% if (optionsPro.isPublic == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsEnterprise.isPublic == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Private</th>
            <td><% if (optionsFree.isPrivate == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsPro.isPrivate == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsEnterprise.isPrivate == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
          </tr>
        </tbody>

        <tbody>
          <tr>
            <th scope="row" class="text-start">Permissions</th>
            <td><% if (optionsFree.isPermissions == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsPro.isPermissions == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsEnterprise.isPermissions == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Sharing</th>
            <td><% if (optionsFree.isSharing == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsPro.isSharing == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsEnterprise.isSharing == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Unlimited members</th>
            <td><% if (optionsFree.isUnlimited == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsPro.isUnlimited == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsEnterprise.isUnlimited == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Extra security</th>
            <td><% if (optionsFree.isExtrasec == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsPro.isExtrasec == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
            <td><% if (optionsEnterprise.isExtrasec == "Y") { %><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg><% } %></td>
          </tr>
        </tbody>
      </table>
    </div>
  </main>
      </div>
  </body>
</html>