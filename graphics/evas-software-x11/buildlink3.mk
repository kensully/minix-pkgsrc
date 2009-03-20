# $NetBSD: buildlink3.mk,v 1.1.1.1 2009/02/26 19:14:12 minskim Exp $

BUILDLINK_TREE+=	evas-software-x11

.if !defined(EVAS_SOFTWARE_X11_BUILDLINK3_MK)
EVAS_SOFTWARE_X11_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.evas-software-x11+=	evas-software-x11>=0.9.9.050
BUILDLINK_PKGSRCDIR.evas-software-x11?=	../../graphics/evas-software-x11

.include "../../x11/libX11/buildlink3.mk"
.endif # EVAS_SOFTWARE_X11_BUILDLINK3_MK

BUILDLINK_TREE+=	-evas-software-x11
