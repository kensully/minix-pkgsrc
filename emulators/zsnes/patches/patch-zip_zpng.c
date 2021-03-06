$NetBSD$

* direct access is not allowed with png-1.5, but already set color_type.

--- zip/zpng.c.orig	2007-01-15 23:06:29.000000000 +0000
+++ zip/zpng.c
@@ -129,7 +129,6 @@ int Png_Dump(const char *filename, unsig
         png_set_IHDR(png_ptr, info_ptr, width, height, 8,
                      PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
                      PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);
-        info_ptr->color_type = PNG_COLOR_TYPE_RGB;
 
         //Allocate an array of scanline pointers
         row_pointers = (png_bytep*)malloc(height*sizeof(png_bytep));
