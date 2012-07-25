$NetBSD$

--- libjava/boehm.cc.orig	Mon Oct 22 21:24:35 2007
+++ libjava/boehm.cc
@@ -747,7 +747,8 @@ _Jv_GCAttachThread ()
   // The registration interface is only defined on posixy systems and
   // only actually works if pthread_getattr_np is defined.
   // FIXME: until gc7 it is simpler to disable this on solaris.
-#if defined(HAVE_PTHREAD_GETATTR_NP) && !defined(GC_SOLARIS_THREADS)
+#if defined(HAVE_PTHREAD_GETATTR_NP) && !defined(GC_SOLARIS_THREADS) \
+    && !defined(__NetBSD__)
   GC_register_my_thread ();
 #endif
 }
@@ -755,7 +756,8 @@ _Jv_GCAttachThread ()
 void
 _Jv_GCDetachThread ()
 {
-#if defined(HAVE_PTHREAD_GETATTR_NP) && !defined(GC_SOLARIS_THREADS)
+#if defined(HAVE_PTHREAD_GETATTR_NP) && !defined(GC_SOLARIS_THREADS) \
+    && !defined(__NetBSD__)
   GC_unregister_my_thread ();
 #endif
 }
