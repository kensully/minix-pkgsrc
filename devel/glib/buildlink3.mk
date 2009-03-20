# $NetBSD: buildlink3.mk,v 1.11 2006/07/08 23:10:43 jlam Exp $

BUILDLINK_TREE+=	glib

.if !defined(GLIB_BUILDLINK3_MK)
GLIB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.glib+=	glib>=1.2.10nb5
BUILDLINK_ABI_DEPENDS.glib+=	glib>=1.2.10nb7
BUILDLINK_PKGSRCDIR.glib?=	../../devel/glib

PTHREAD_OPTS+=	require

.include "../../mk/pthread.buildlink3.mk"
.endif # GLIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-glib
