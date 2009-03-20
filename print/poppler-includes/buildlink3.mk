# $NetBSD: buildlink3.mk,v 1.1.1.1 2008/11/20 14:32:19 dillo Exp $

BUILDLINK_TREE+=	poppler-includes

.if !defined(POPPLER_INCLUDES_BUILDLINK3_MK)
POPPLER_INCLUDES_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.poppler-includes+=	poppler-includes>=0.10.0
BUILDLINK_PKGSRCDIR.poppler-includes?=	../../print/poppler-includes
.endif # POPPLER_INCLUDES_BUILDLINK3_MK

BUILDLINK_TREE+=	-poppler-includes
