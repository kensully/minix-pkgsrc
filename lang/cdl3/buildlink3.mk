# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 23:10:54 jlam Exp $

BUILDLINK_TREE+=	cdl3

.if !defined(CDL3_BUILDLINK3_MK)
CDL3_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.cdl3+=	cdl3>=1.2.5
BUILDLINK_ABI_DEPENDS.cdl3?=	cdl3>=1.2.5nb1
BUILDLINK_PKGSRCDIR.cdl3?=	../../lang/cdl3
.endif # CDL3_BUILDLINK3_MK

BUILDLINK_TREE+=	-cdl3
