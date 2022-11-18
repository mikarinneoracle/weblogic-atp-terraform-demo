### Demo - Deploying WebLogic from OCI Marketplace UCM image with ATP using oci cli and Terraform in OCI cloud shell including maven build from source. Includes DB schema creation in Terraform with Liquibase.

<p>
<img src="wls_atp_tf.png" width="800" />
    
<p>
Deploying ATP to a <i>private</i> subnet instead of public in this <a href="https://github.com/mikarinneoracle/weblogic-atp-terraform-demo/tree/weblogic-with-ATP-in-private-subnet">branch</a>. (Excludes the Terraform Liquibase part.)
    
## Instructions

<i>prereq: oci cli must be working in oci cloud shell</i> (should be ok by default).

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
Using Terraform the script will create a "weblogic-VCN" and a compute VM instance "webLogic" from <b>Marketplace UCM image</b> adding it to the VCN public subnet. Terraform will also create autonomous database Weblogic-ATP" with Internet access and adds a custom schema to it. Finally it will do a maven build from source <code>app</code> then and install the built WebLogic sample <code>app.war</code> on the VM using <b>instance-agent</b>.
    
<i>Note:</i> To make the <code>VM instance-agent</code> run succesfully add the following <code>policy</code> to
the <code>dynamic group</code> you are running within:
<pre>
Allow dynamic-group MyDynamicGroup to use instance-agent-command-execution-family in compartment &lt;YOUR COMPARTMENT&gt;
</pre>
    
<p>
Access <b><code>http://&lt;ip address of the VM&gt;:7001/app</code></b> from your browser.

<p>
Access "price admin" from the <i>Admin</i> -link on the page.
Admin <b>username</b> is <code>priceadmin</code> and <b>password</b> is <code>WelcomeFolks123#!</code>
Edit prices and options and then save and reload the price page.

<p>
WLS console can be accessed using url:

<p>
<b><code>http://&lt;ip address of the VM&gt;:7001/console</code></b> with user <code>weblogic</code> and password <code>Welcome1</code>.

<p>
After making sure WebLogic sample app works delete all created resources with Terraform by:
<pre>
    cd terraform
    terraform destroy
</pre>

### See on Youtube

<a href="https://www.youtube.com/watch?v=4oQPy4K83Fk">https://www.youtube.com/watch?v=4oQPy4K83Fk</a>
