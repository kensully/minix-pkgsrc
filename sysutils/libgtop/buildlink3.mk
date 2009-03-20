# $NetBSD: buildlink3.mk,v 1.5 2008/11/15 19:34:11 wiz Exp $

BUILDLINK_TREE+=	libgtop

.if !defined(LIBGTOP_BUILDLINK3_MK)
LIBGTOP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgtop+=	libgtop>=2.14.0
BUILDLINK_PKGSRCDIR.libgtop?=	../../sysutils/libgtop

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../x11/libXau/buildlink3.mk"
.endif # LIBGTOP_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgtop
