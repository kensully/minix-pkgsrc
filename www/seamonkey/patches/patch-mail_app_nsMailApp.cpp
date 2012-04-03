$NetBSD$

--- mail/app/nsMailApp.cpp.orig	2012-03-13 05:23:12.000000000 +0000
+++ mail/app/nsMailApp.cpp
@@ -48,6 +48,27 @@
 
 #include <stdio.h>
 #include <stdarg.h>
+#include <sys/resource.h>
+/*
+ * On netbsd-4, ulimit -n is 64 by default; too few for us.
+ */
+static void netbsd_fixrlimit(void) {
+	struct rlimit rlp;
+	if (getrlimit(RLIMIT_NOFILE, &rlp) == -1) {
+		fprintf(stderr, "warning: getrlimit failed\n");
+		return;
+	}
+	if (rlp.rlim_cur >= 512)
+		return;
+	if (rlp.rlim_max < 512) {
+		fprintf(stderr, "warning: hard limit of 'ulimit -n' too low\n");
+		rlp.rlim_cur = rlp.rlim_max;
+	}
+	else
+		rlp.rlim_cur = 512;
+	if (setrlimit(RLIMIT_NOFILE, &rlp) == -1)
+		fprintf(stderr, "warning: setrlimit failed\n");
+}
 
 #include "nsCOMPtr.h"
 #include "nsILocalFile.h"
@@ -147,6 +168,7 @@ static int do_main(const char *exePath, 
 
 int main(int argc, char* argv[])
 {
+  netbsd_fixrlimit();
   char exePath[MAXPATHLEN];
 
   nsresult rv = mozilla::BinaryPath::Get(argv[0], exePath);
