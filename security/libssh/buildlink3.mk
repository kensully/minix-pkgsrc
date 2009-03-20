# $NetBSD: buildlink3.mk,v 1.7 2006/07/08 23:11:07 jlam Exp $

BUILDLINK_TREE+=	libssh

.if !defined(LIBSSH_BUILDLINK3_MK)
LIBSSH_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libssh+=	libssh>=0.11
BUILDLINK_PKGSRCDIR.libssh?=	../../security/libssh
.endif # LIBSSH_BUILDLINK3_MK

BUILDLINK_TREE+=	-libssh
