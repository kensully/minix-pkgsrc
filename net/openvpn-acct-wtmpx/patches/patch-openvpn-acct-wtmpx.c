$NetBSD$

--- openvpn-acct-wtmpx.c.orig	2013-01-11 01:18:53.000000000 +0000
+++ openvpn-acct-wtmpx.c
@@ -4,6 +4,7 @@
 #include <util.h>
 #include <stdlib.h>
 #include <syslog.h>
+#include <utmpx.h>
 #include <sys/param.h>
 
 #include "openvpn-plugin.h"
