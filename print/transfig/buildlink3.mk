# $NetBSD: buildlink3.mk,v 1.8 2006/12/15 20:33:00 joerg Exp $

BUILDLINK_TREE+=	transfig

.if !defined(TRANSFIG_BUILDLINK3_MK)
TRANSFIG_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.transfig+=	transfig>=3.2.4
BUILDLINK_ABI_DEPENDS.transfig?=	transfig>=3.2.5alpha7nb2
BUILDLINK_PKGSRCDIR.transfig?=	../../print/transfig

.include "../../graphics/png/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.endif # TRANSFIG_BUILDLINK3_MK

BUILDLINK_TREE+=	-transfig
