$NetBSD$

Add missing header.

--- src/compressionexps/SelExpDataMaker.h.orig	2006-10-17 19:36:03.000000000 +0000
+++ src/compressionexps/SelExpDataMaker.h
@@ -61,7 +61,7 @@
 #include "../AM/PagePlacer.h"
 #include <ctime>
 #include "../UnitTests/UnitTest.h"
-#include <fstream.h>
+#include <fstream>
 
 class SelExpDataMaker : public UnitTest
 {
