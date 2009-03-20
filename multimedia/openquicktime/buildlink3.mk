# $NetBSD: buildlink3.mk,v 1.8 2006/07/08 23:11:02 jlam Exp $

BUILDLINK_TREE+=	openquicktime

.if !defined(OPENQUICKTIME_BUILDLINK3_MK)
OPENQUICKTIME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.openquicktime+=	openquicktime>=1.0nb2
BUILDLINK_ABI_DEPENDS.openquicktime?=	openquicktime>=1.0nb4
BUILDLINK_PKGSRCDIR.openquicktime?=	../../multimedia/openquicktime

.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/jpeg/buildlink3.mk"
.endif # OPENQUICKTIME_BUILDLINK3_MK

BUILDLINK_TREE+=	-openquicktime
