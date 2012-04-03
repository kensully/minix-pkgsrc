$NetBSD: patch-ipc_chromium_src_base_platform__file__posix.cc,v 1.1 2011/08/19 14:39:10 tnn Exp $

--- mozilla/ipc/chromium/src/base/platform_file_posix.cc.orig	2012-02-16 10:25:01.000000000 +0000
+++ mozilla/ipc/chromium/src/base/platform_file_posix.cc
@@ -10,6 +10,7 @@
 #ifdef ANDROID
 #include <linux/stat.h>
 #endif
+#include <sys/stat.h> /* for S_IRUSR */
 
 #include "base/logging.h"
 #include "base/string_util.h"
