# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 23:11:06 jlam Exp $

BUILDLINK_TREE+=	courier-authlib

.if !defined(COURIER_AUTHLIB_BUILDLINK3_MK)
COURIER_AUTHLIB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.courier-authlib+=	courier-authlib>=0.53
BUILDLINK_ABI_DEPENDS.courier-authlib?=	courier-authlib>=0.58nb2
BUILDLINK_PKGSRCDIR.courier-authlib?=	../../security/courier-authlib
.endif # COURIER_AUTHLIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-courier-authlib
