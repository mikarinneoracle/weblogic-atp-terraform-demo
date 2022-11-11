## Instructions

<i><b>prereq: oci cli must be working in oci cloud shell</b></i>

### Demo - deploying WebLogic with ATP using oci cli and Terraform in cloud shell
<p>
Open oci cloud shell

<p>
Run <code>git clone https://github.com/mikarinneoracle/weblogic-atp-terraform-demo.git</code>

<p>
Edit <code>script.sh</code> with oci code editor<br>
    => add your oci compartment by replacing <i>&lt;YOUR COMPARTMENT OCID&gt;</i> and the <i>region</i> and AD respectively if necessary (lines 1-3):

<p>
<pre>
export compt_ocid='&lt;YOUR COMPARTMENT OCID&gt;'
export region="eu-amsterdam-1"
export ad="Vihs:eu-amsterdam-1-AD-1"
</pre>

<p>
<i>Note</i>: Just make sure you are running the Cloud Shell in the <i>same region</i> as this one.

<p>
Run <code>sh script.sh</code>

<p>
Script will create a "weblogic-VCN" VCN and then attach "weblogic-ATP" ATP instance into it. Then it will a VM for WebLogic from Marketplace image and install a WebLogic sample app including the ATP connection. 
    
<p>
Access <i>http://<ip address of the VM>:7001/app</ip></i> from your browser.

<p>
After making sure WebLogic sample app works delete all created resources with Terraform by:
<pre>
    cd terraform
    terraform destroy
</pre>

### See on Youtube
