set cloudconfig ./network/admin/wallet.zip
conn admin/WelcomeFolks123#!@weblogic_tp
/
lb update -changelog controller.xml
lb update -changelog data.xml
/
exit