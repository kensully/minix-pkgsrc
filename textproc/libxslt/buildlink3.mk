# $NetBSD: buildlink3.mk,v 1.15 2006/07/08 23:11:11 jlam Exp $

BUILDLINK_TREE+=	libxslt

.if !defined(LIBXSLT_BUILDLINK3_MK)
LIBXSLT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libxslt+=	libxslt>=1.1.8
BUILDLINK_ABI_DEPENDS.libxslt+=	libxslt>=1.1.15nb1
BUILDLINK_PKGSRCDIR.libxslt?=	../../textproc/libxslt

.include "../../security/libgcrypt/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.endif # LIBXSLT_BUILDLINK3_MK

BUILDLINK_TREE+=	-libxslt
