# $NetBSD: buildlink3.mk,v 1.10 2007/01/17 23:47:20 wiz Exp $

BUILDLINK_TREE+=	jasper

.if !defined(JASPER_BUILDLINK3_MK)
JASPER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.jasper+=	jasper>=1.600.0
BUILDLINK_ABI_DEPENDS.jasper+=	jasper>=1.900.0
BUILDLINK_PKGSRCDIR.jasper?=	../../graphics/jasper

.include "../../graphics/jpeg/buildlink3.mk"
.endif # JASPER_BUILDLINK3_MK

BUILDLINK_TREE+=	-jasper
