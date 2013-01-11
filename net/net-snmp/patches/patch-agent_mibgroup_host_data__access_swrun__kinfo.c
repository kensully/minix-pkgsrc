$NetBSD$

--- agent/mibgroup/host/data_access/swrun_kinfo.c.orig	2013-01-11 11:01:25.000000000 +0000
+++ agent/mibgroup/host/data_access/swrun_kinfo.c
@@ -5,6 +5,10 @@
  *
  * NB: later FreeBSD uses a different kinfo_proc structure
  */
+#ifdef __NetBSD__
+#define _KMEMUSER
+#endif
+
 #include <net-snmp/net-snmp-config.h>
 
 #include <stdio.h>
