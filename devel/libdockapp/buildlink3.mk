# $NetBSD: buildlink3.mk,v 1.9 2006/12/15 20:32:54 joerg Exp $

BUILDLINK_TREE+=	libdockapp

.if !defined(LIBDOCKAPP_BUILDLINK3_MK)
LIBDOCKAPP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libdockapp+=		libdockapp>=0.4.0
BUILDLINK_ABI_DEPENDS.libdockapp+=	libdockapp>=0.4.0nb2
BUILDLINK_PKGSRCDIR.libdockapp?=	../../devel/libdockapp

.include "../../x11/libXpm/buildlink3.mk"
.endif # LIBDOCKAPP_BUILDLINK3_MK

BUILDLINK_TREE+=	-libdockapp
