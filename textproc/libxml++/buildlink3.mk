# $NetBSD: buildlink3.mk,v 1.6 2012/02/06 12:41:44 wiz Exp $

BUILDLINK_TREE+=	libxmlpp

.if !defined(LIBXMLPP_BUILDLINK3_MK)
LIBXMLPP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libxmlpp+=	libxml++>=2.10.0
BUILDLINK_ABI_DEPENDS.libxmlpp+=	libxml++>=2.32.0nb3
BUILDLINK_PKGSRCDIR.libxmlpp?=	../../textproc/libxml++

.include "../../textproc/libxml2/buildlink3.mk"
.include "../../devel/glibmm/buildlink3.mk"
.endif # LIBXMLPP_BUILDLINK3_MK

BUILDLINK_TREE+=	-libxmlpp
