# $NetBSD: buildlink3.mk,v 1.20 2010/09/14 11:01:02 wiz Exp $

BUILDLINK_TREE+=	libgnomecanvas

.if !defined(LIBGNOMECANVAS_BUILDLINK3_MK)
LIBGNOMECANVAS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgnomecanvas+=	libgnomecanvas>=2.8.0
BUILDLINK_ABI_DEPENDS.libgnomecanvas+=	libgnomecanvas>=2.30.2nb1
BUILDLINK_PKGSRCDIR.libgnomecanvas?=	../../graphics/libgnomecanvas

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libglade/buildlink3.mk"
.include "../../graphics/libart/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # LIBGNOMECANVAS_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgnomecanvas
