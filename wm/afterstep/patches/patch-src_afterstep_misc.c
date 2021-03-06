$NetBSD$

--- src/afterstep/misc.c.orig	2012-05-04 14:35:08.000000000 +0000
+++ src/afterstep/misc.c
@@ -32,14 +32,14 @@
 /****************************************************************************/
 /* window management specifics - button ungrabbing convinience functions:   */
 /****************************************************************************/
-inline void
+void
 ungrab_window_buttons( Window w )
 {
 	LOCAL_DEBUG_OUT( "w = %lX", w );
     XUngrabButton (dpy, AnyButton, AnyModifier, w);
 }
 
-inline void
+void
 ungrab_window_keys (Window w )
 {
     XUngrabKey (dpy, AnyKey, AnyModifier, w);
