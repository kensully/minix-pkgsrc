$NetBSD$

* some header files are not included by libupnp>=1.6.7.

--- src/mime.c.orig	2007-12-09 13:03:36.000000000 +0000
+++ src/mime.c
@@ -21,6 +21,7 @@
 
 #include <stdlib.h>
 #include <string.h>
+#include <stdio.h>
 
 #include "mime.h"
 #include "ushare.h"
