# $NetBSD: buildlink3.mk,v 1.15 2006/07/08 23:10:53 jlam Exp $

BUILDLINK_TREE+=	tiff

.if !defined(TIFF_BUILDLINK3_MK)
TIFF_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.tiff+=	tiff>=3.6.1
BUILDLINK_ABI_DEPENDS.tiff+=	tiff>=3.7.2nb1
BUILDLINK_PKGSRCDIR.tiff?=	../../graphics/tiff

.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/jpeg/buildlink3.mk"
.endif # TIFF_BUILDLINK3_MK

BUILDLINK_TREE+=	-tiff
