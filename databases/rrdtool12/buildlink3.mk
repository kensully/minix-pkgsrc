# $NetBSD: buildlink3.mk,v 1.2 2009/01/02 20:07:10 martti Exp $

BUILDLINK_TREE+=	rrdtool

.if !defined(RRDTOOL_BUILDLINK3_MK)
RRDTOOL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.rrdtool+=	rrdtool>=1.2.29
BUILDLINK_PKGSRCDIR.rrdtool?=	../../databases/rrdtool

.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/libart/buildlink3.mk"
.endif # RRDTOOL_BUILDLINK3_MK

BUILDLINK_TREE+=	-rrdtool
