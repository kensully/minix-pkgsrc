$NetBSD$

--- security/nss/lib/softoken/config.mk.orig	2013-03-24 14:50:22.000000000 +0000
+++ security/nss/lib/softoken/config.mk
@@ -92,3 +92,5 @@ endif
 ifeq ($(OS_TARGET),WINCE)
 DEFINES += -DDBM_USING_NSPR
 endif
+
+MKSHLIB += -Wl,-rpath,${PREFIX}/lib/nvu-1.0
