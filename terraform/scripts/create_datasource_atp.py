 
from java.io import FileInputStream
 
propInputStream = FileInputStream("/home/oracle/atp.properties")
configProps = Properties()
configProps.load(propInputStream)
 
domainName=configProps.get("domain.name")
adminURL=configProps.get("admin.url")
adminUserName=configProps.get("admin.userName")
adminPassword=configProps.get("admin.password")
 
dsName=configProps.get("datasource.name")
dsFileName=configProps.get("datasource.filename")
dsDatabaseName=configProps.get("datasource.database.name")
datasourceTarget=configProps.get("datasource.target")
dsJNDIName=configProps.get("datasource.jndiname")
dsDriverName=configProps.get("datasource.driver.class")
dsURL=configProps.get("datasource.url")
dsUserName=configProps.get("datasource.username")
dsPassword=configProps.get("datasource.password")
dsTestQuery=configProps.get("datasource.test.query")
 
connect(adminUserName, adminPassword, adminURL)
edit()
startEdit()
cd('/')

try:
    cmo.createJDBCSystemResource(dsName)
    print '===> Created JDBC datasource - ' + dsName
    pass 
except BeanAlreadyExistsException:
    print '===> JDBC datasource \"' + dsName +'\" already exists'
    print '===> No action was performed'
    cancelEdit('y')
    exit()
    
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName)
cmo.setName(dsName)
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDataSourceParams/' + dsName )
set('JNDINames',jarray.array([String('jdbc/' + dsName )], String))
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName )
cmo.setUrl(dsURL)
cmo.setDriverName( dsDriverName )
cmo.setPassword(dsPassword)
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCConnectionPoolParams/' + dsName )
cmo.setTestTableName(dsTestQuery)
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName )
cmo.createProperty('user')
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName + '/Properties/user')
cmo.setValue(dsUserName)
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName )
cmo.createProperty('oracle.jdbc.fanEnabled')
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName + '/Properties/oracle.jdbc.fanEnabled')
cmo.setValue('false')

cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName )
cmo.createProperty('oracle.net.tns_admin')
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName + '/Properties/oracle.net.tns_admin')
cmo.setValue('/home/oracle/wallet/')

cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName )
cmo.createProperty('oracle.net.ssl_version')
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName + '/Properties/oracle.net.ssl_version')
cmo.setValue('1.2')

cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName )
cmo.createProperty('oracle.net.ssl_server_dn_match')
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName + '/Properties/oracle.net.ssl_server_dn_match')
cmo.setValue('true')

cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName )
cmo.createProperty('oracle.net.wallet_location')
 
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName + '/Properties/oracle.net.wallet_location')
cmo.setValue('/home/oracle/wallet/')
                        
cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDataSourceParams/' + dsName )
cmo.setGlobalTransactionsProtocol('OnePhaseCommit')
 
cd('/SystemResources/' + dsName )
set('Targets',jarray.array([ObjectName('com.bea:Name=' + datasourceTarget + ',Type=Server')], ObjectName))

save()
try:
    activate()
except Exception:
    cancelEdit('y')
    exit()