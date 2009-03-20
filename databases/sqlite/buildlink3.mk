# $NetBSD: buildlink3.mk,v 1.7 2006/07/08 23:10:40 jlam Exp $

BUILDLINK_TREE+=	sqlite

.if !defined(SQLITE_BUILDLINK3_MK)
SQLITE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.sqlite+=	sqlite>=2.8.0
BUILDLINK_ABI_DEPENDS.sqlite+=	sqlite>=2.8.16nb1
BUILDLINK_PKGSRCDIR.sqlite?=	../../databases/sqlite
.endif # SQLITE_BUILDLINK3_MK

BUILDLINK_TREE+=	-sqlite
