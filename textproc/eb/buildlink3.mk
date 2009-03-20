# $NetBSD: buildlink3.mk,v 1.13 2007/04/27 04:08:19 uebayasi Exp $

BUILDLINK_TREE+=	eb

.if !defined(EB_BUILDLINK3_MK)
EB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.eb+=		eb>=3.3.2nb1
BUILDLINK_ABI_DEPENDS.eb+=		eb>=4.1.3nb1
BUILDLINK_PKGSRCDIR.eb?=		../../textproc/eb

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.endif # EB_BUILDLINK3_MK

BUILDLINK_TREE+=	-eb
