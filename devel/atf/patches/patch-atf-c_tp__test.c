$NetBSD$

Need getopt.h on SunOS.

--- atf-c/tp_test.c.orig	2012-02-26 16:44:57.000000000 +0000
+++ atf-c/tp_test.c
@@ -29,6 +29,9 @@
 
 #include <string.h>
 #include <unistd.h>
+#ifdef __sun
+#include <getopt.h>
+#endif
 
 #include <atf-c.h>
 
