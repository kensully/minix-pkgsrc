# $NetBSD: buildlink3.mk,v 1.12 2006/09/15 15:05:52 jmmv Exp $

BUILDLINK_TREE+=	gnome-doc-utils

.if !defined(GNOME_DOC_UTILS_BUILDLINK3_MK)
GNOME_DOC_UTILS_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.gnome-doc-utils+=	build
BUILDLINK_API_DEPENDS.gnome-doc-utils+=	gnome-doc-utils>=0.8.0
BUILDLINK_PKGSRCDIR.gnome-doc-utils?=	../../textproc/gnome-doc-utils
.endif # GNOME_DOC_UTILS_BUILDLINK3_MK

BUILDLINK_TREE+=	-gnome-doc-utils
