# $NetBSD: buildlink3.mk,v 1.17 2008/05/24 15:01:38 tnn Exp $

BUILDLINK_TREE+=	lesstif

.if !defined(LESSTIF_BUILDLINK3_MK)
LESSTIF_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.lesstif+=	lesstif>=0.95.0nb1
BUILDLINK_PKGSRCDIR.lesstif?=	../../x11/lesstif

.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/printproto/buildlink3.mk"
.endif # LESSTIF_BUILDLINK3_MK

BUILDLINK_TREE+=	-lesstif
