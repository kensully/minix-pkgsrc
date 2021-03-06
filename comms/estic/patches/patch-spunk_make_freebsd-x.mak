$NetBSD$

--- spunk/make/freebsd-x.mak.orig	1996-11-24 22:33:26.000000000 +0000
+++ spunk/make/freebsd-x.mak
@@ -27,10 +27,9 @@ AS = gas
 AR = ar
 LD = ld
 ZIP = zip
-CC = g++
 
 # Flags for the gnu compiler
-CFLAGS	= -DFREEBSD -DUSE_OLD_TTY -g -Wall -x c++ -I /usr/X11R6/include -fno-implicit-templates -DEXPLICIT_TEMPLATES
+CFLAGS	+= $(CPPFLAGS) -Wall -I$(X11BASE)/include -fno-implicit-templates -DEXPLICIT_TEMPLATES
 
 LIB	= spunk.a
 ZIPFILE = spunk.zip
@@ -42,7 +41,7 @@ ZIPFILE = spunk.zip
 	$(CC) $(CFLAGS) -c $<
 
 .cc.o:
-	$(CC) $(CFLAGS) -c $<
+	$(CXX) $(CFLAGS) -c $<
 
 # ------------------------------------------------------------------------------
 # All SPUNK OBJ files
@@ -136,7 +135,7 @@ RESEDITOBJS	=	resed.o		\
 # Dummy targets
 
 xresed:		$(LIB) $(RESEDITOBJS)
-	$(CC) -g -o xresed $(RESEDITOBJS) $(LIB) -lg++ -L/usr/X11R6/lib -lX11
+	$(CXX) -o xresed $(RESEDITOBJS) $(LIB) $(LDFLAGS) -lX11
 
 lib:	$(LIB)
 
@@ -149,28 +148,28 @@ $(LIB):		$(OBJS)
 
 depend dep:
 	@echo "Creating dependency information"
-	$(CC) -DFREEBSD -MM *.cc > .depend
+	$(CXX) -DFREEBSD -MM *.cc > .depend
 
 # ------------------------------------------------------------------------------
 # Target specific files
 
 console.o:	xsrc/console.cc $(HDRS)
-	$(CC) $(CFLAGS) -c $<
+	$(CXX) $(CFLAGS) -c $<
 
 delay.o:	unixsrc/delay.cc $(HDRS)
-	$(CC) $(CFLAGS) -c $<
+	$(CXX) $(CFLAGS) -c $<
 
 filesys.o:	unixsrc/filesys.cc $(HDRS)
-	$(CC) $(CFLAGS) -c $<
+	$(CXX) $(CFLAGS) -c $<
 
 nlsinit.o:	unixsrc/nlsinit.cc $(HDRS)
-	$(CC) $(CFLAGS) -c $<
+	$(CXX) $(CFLAGS) -c $<
 
 screen.o:	xsrc/screen.cc $(HDRS)
-	$(CC) $(CFLAGS) -c $<
+	$(CXX) $(CFLAGS) -c $<
 
 sercom.o:	unixsrc/sercom.cc $(HDRS)
-	$(CC) $(CFLAGS) -c $<
+	$(CXX) $(CFLAGS) -c $<
 
 # ------------------------------------------------------------------------------
 # Create a ZIP file
