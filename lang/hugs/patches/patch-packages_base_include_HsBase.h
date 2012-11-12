$NetBSD$

--- packages/base/include/HsBase.h.orig	2006-09-20 22:01:52.000000000 +0000
+++ packages/base/include/HsBase.h
@@ -221,7 +221,11 @@ StgWord64 stg_integerToWord64 (StgInt sa
 # if defined(_MSC_VER)
 #  define INLINE extern __inline
 # elif defined(__GNUC__)
-#  define INLINE extern inline
+#  ifdef __GNUC_STDC_INLINE__
+#   define INLINE extern inline __attribute__((__gnu_inline__))
+#  else
+#   define INLINE extern inline
+#  endif
 # else
 #  define INLINE inline
 # endif
