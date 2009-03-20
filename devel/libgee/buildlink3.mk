# $NetBSD: buildlink3.mk,v 1.1.1.1 2009/03/05 21:59:43 ahoka Exp $

BUILDLINK_TREE+=	libgee

.if !defined(LIBGEE_BUILDLINK3_MK)
LIBGEE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgee+=	libgee>=0.1.5
BUILDLINK_PKGSRCDIR.libgee?=	../../devel/libgee

.include "../../devel/glib2/buildlink3.mk"
.include "../../lang/vala/buildlink3.mk"
.endif # LIBGEE_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgee
