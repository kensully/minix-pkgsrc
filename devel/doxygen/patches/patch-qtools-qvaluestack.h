$NetBSD$

--- qtools/qvaluestack.h.orig	2009-08-25 11:26:15.000000000 +0000
+++ qtools/qvaluestack.h
@@ -49,7 +49,7 @@ class Q_EXPORT QValueStack : public QVal
 public:
     QValueStack() {}
    ~QValueStack() {}
-    void  push( const T& d ) { append(d); }
+    void  push( const T& d ) { this->append(d); }
     T pop()
     {
 	T elem( this->last() );
