# $NetBSD: buildlink3.mk,v 1.13 2006/07/08 23:11:10 jlam Exp $

BUILDLINK_TREE+=	icu

.if !defined(ICU_BUILDLINK3_MK)
ICU_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.icu+=	icu>=3.4
BUILDLINK_ABI_DEPENDS.icu?=	icu>=3.4nb1
BUILDLINK_PKGSRCDIR.icu?=	../../textproc/icu
.endif # ICU_BUILDLINK3_MK

BUILDLINK_TREE+=	-icu
