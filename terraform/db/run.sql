set cloudconfig ./network/admin/wallet.zip
conn admin/WelcomeFolks123#!@weblogic_tp
/
lb update -changelog-file controller.xml
lb update -changelog-file data.xml
/
exit