<%@ page import="example.*" %>
<%@ page import = " java.util.* " %>
    
<%
if(session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp"); 
}

if (request.getParameter("saveFree") != null) {
    // save free
   TierPrice tierPrice = new TierPrice(Float.parseFloat(request.getParameter("free_price_monthly")),
                                       Integer.parseInt(request.getParameter("free_price_users")),
                                       Integer.parseInt(request.getParameter("free_price_storage")),
                                       request.getParameter("free_price_support"));
   TierOptions tierOptions = new TierOptions(request.getParameter("free_options_public"),
                                           request.getParameter("free_options_private"),
                                           request.getParameter("free_options_permissions"),
                                           request.getParameter("free_options_sharing"),
                                           request.getParameter("free_options_unlimited"),
                                           request.getParameter("free_options_extrasec"));
   Atp.saveTierPrice("FREE", tierPrice);
   Atp.saveTierOptions("FREE", tierOptions);
} else if (request.getParameter("savePro") != null) {
   // Save Pro
   TierPrice tierPrice = new TierPrice(Float.parseFloat(request.getParameter("pro_price_monthly")),
                                       Integer.parseInt(request.getParameter("pro_price_users")),
                                       Integer.parseInt(request.getParameter("pro_price_storage")),
                                       request.getParameter("pro_price_support"));
   TierOptions tierOptions = new TierOptions(request.getParameter("pro_options_public"),
                                           request.getParameter("pro_options_private"),
                                           request.getParameter("pro_options_permissions"),
                                           request.getParameter("pro_options_sharing"),
                                           request.getParameter("pro_options_unlimited"),
                                           request.getParameter("pro_options_extrasec"));
   Atp.saveTierPrice("PRO", tierPrice);
   Atp.saveTierOptions("PRO", tierOptions);
} else if (request.getParameter("saveEnterprise") != null) {
   // Save Enterprise
   TierPrice tierPrice = new TierPrice(Float.parseFloat(request.getParameter("enterprise_price_monthly")),
                                       Integer.parseInt(request.getParameter("enterprise_price_users")),
                                       Integer.parseInt(request.getParameter("enterprise_price_storage")),
                                       request.getParameter("enterprise_price_support"));
   TierOptions tierOptions = new TierOptions(request.getParameter("enterprise_options_public"),
                                           request.getParameter("enterprise_options_private"),
                                           request.getParameter("enterprise_options_permissions"),
                                           request.getParameter("enterprise_options_sharing"),
                                           request.getParameter("enterprise_options_unlimited"),
                                           request.getParameter("enterprise_options_extrasec"));
   Atp.saveTierPrice("ENTERPRISE", tierPrice);
   Atp.saveTierOptions("ENTERPRISE", tierOptions);
}
TierPrice priceFree = Atp.getTierPrice("FREE");
TierPrice pricePro = Atp.getTierPrice("PRO");
TierPrice priceEnterprise = Atp.getTierPrice("ENTERPRISE");
TierOptions optionsFree = Atp.getTierOptions("FREE");
TierOptions optionsPro = Atp.getTierOptions("PRO");
TierOptions optionsEnterprise = Atp.getTierOptions("ENTERPRISE");
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mika Rinne, and Bootstrap contributors">
    <title>Pricing admin - Bootstrap v5.0</title>

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
    <link href="admin.css" rel="stylesheet">
  </head>
  <body>
    
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check" viewBox="0 0 16 16">
    <title>Check</title>
    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
  </symbol>
</svg>

<div class="container" id="pricing">
    
    <div class="container py-3">
    
      <main>
        <form class="form-horizontal" role="form" method="POST">    
          <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
              
              <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                  <div class="card-header py-3">
                    <h4 class="my-0 fw-normal">Free</h4>
                  </div>
                  <div class="card-body">
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_monthly">Monthly $</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_monthly" name="free_price_monthly" placeholder="" value="<%= priceFree.price_mo %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_users">Users</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_users" name="free_price_users" placeholder="" value="<%= priceFree.users %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_storage">Storage GB</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_storage" name="free_price_storage" placeholder="" value="<%= priceFree.storage %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_support">Support</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_support" name="free_price_support" placeholder="" value="<%= priceFree.support %>"/>
                        </div>
                      </div>    
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_public">Public</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_public" name="free_options_public" placeholder="" value="<%= optionsFree.isPublic %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_private">Private</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_private" name="free_options_private" placeholder="" value="<%= optionsFree.isPrivate %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_permissions">Permissions</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_permissions" name="free_options_permissions" placeholder="" value="<%= optionsFree.isPermissions %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_sharing">Sharing</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_sharing" name="free_options_sharing" placeholder="" value="<%= optionsFree.isSharing %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_unlimited">Unlimited</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_unlimited" name="free_options_unlimited" placeholder="" value="<%= optionsFree.isUnlimited %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="free_extrasec">Extra Sec</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="free_extrasec" name="free_options_extrasec" placeholder="" value="<%= optionsFree.isExtrasec %>"/>
                        </div>
                      </div>
                      <div class="col-md-8 pull-left">
                        <div class="col-md-8">
                          <button type="submit" class="btn btn-primary" name="saveFree">Save</button>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
              
              <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                  <div class="card-header py-3">
                    <h4 class="my-0 fw-normal">Pro</h4>
                  </div>
                  <div class="card-body">
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_monthly">Monthly $</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_monthly" name="pro_price_monthly" placeholder="" value="<%= pricePro.price_mo %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_users">Users</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_users" name="pro_price_users" placeholder="" value="<%= pricePro.users %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_storage">Storage GB</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_storage" name="pro_price_storage" placeholder="" value="<%= pricePro.storage %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_support">Support</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_support" name="pro_price_support" placeholder="" value="<%= pricePro.support %>"/>
                        </div>
                      </div>   
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_public">Public</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_public" name="pro_options_public" placeholder="" value="<%= optionsPro.isPublic %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_private">Private</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_private" name="pro_options_private" placeholder="" value="<%= optionsPro.isPrivate %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_permissions">Permissions</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_permissions" name="pro_options_permissions" placeholder="" value="<%= optionsPro.isPermissions %>"//>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_sharing">Sharing</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_sharing" name="pro_options_sharing" placeholder="" value="<%= optionsPro.isSharing %>"//>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_unlimited">Unlimited</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_unlimited" name="pro_options_unlimited" placeholder="" value="<%= optionsPro.isUnlimited %>"/ />
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="pro_extrasec">Extra Sec</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="pro_extrasec" name="pro_options_extrasec" placeholder="" value="<%= optionsPro.isExtrasec %>"/>
                        </div>
                      </div>
                      <div class="col-md-8 pull-left">
                        <div class="col-md-8">
                          <button type="submit" class="btn btn-primary" name="savePro">Save</button>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
              
              <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                  <div class="card-header py-3">
                    <h4 class="my-0 fw-normal">Enterprise</h4>
                  </div>
                  <div class="card-body">
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_monthly">Monthly $</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_monthly" name="enterprise_price_monthly" placeholder="" value="<%= priceEnterprise.price_mo %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_users">Users</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_users" name="enterprise_price_users" placeholder="" value="<%= priceEnterprise.users %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_storage">Storage GB</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_storage" name="enterprise_price_storage" placeholder="" value="<%= priceEnterprise.storage %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_support">Support</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_support" name="enterprise_price_support" placeholder="" value="<%= priceEnterprise.support %>"/>
                        </div>
                      </div>    
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_public">Public</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_public" name="enterprise_options_public" placeholder="" value="<%= optionsEnterprise.isPublic %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_private">Private</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_private" name="enterprise_options_private" placeholder="" value="<%= optionsEnterprise.isPrivate %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_permissions">Permissions</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_permissions" name="enterprise_options_permissions" placeholder="" value="<%= optionsEnterprise.isPermissions %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_sharing">Sharing</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_sharing" name="enterprise_options_sharing" placeholder="" value="<%= optionsEnterprise.isSharing %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_unlimited">Unlimited</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_unlimited" name="enterprise_options_unlimited" placeholder="" value="<%= optionsEnterprise.isUnlimited %>"/>
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label class="col-md-5 control-label" for="enterprise_extrasec">Extra Sec</label>
                        <div class="col-md-5">
                            <input class="form-control" type="text" id="enterprise_extrasec" name="enterprise_options_extrasec" placeholder="" value="<%= optionsEnterprise.isExtrasec %>"/>
                        </div>
                      </div>
                      <div class="col-md-8 pull-left">
                        <div class="col-md-8">
                          <button type="submit" class="btn btn-primary" name="saveEnterprise">Save</button>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
              
            </div>
        </form>
      </main>
  
    </div>
</div>    
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.js"></script>
  </body>
</html>
