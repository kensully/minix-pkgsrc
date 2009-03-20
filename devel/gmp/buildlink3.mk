# $NetBSD: buildlink3.mk,v 1.9 2006/12/09 03:38:16 jnemeth Exp $

BUILDLINK_TREE+=	gmp

.if !defined(GMP_BUILDLINK3_MK)
GMP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gmp+=		gmp>=4.2.1
BUILDLINK_ABI_DEPENDS.gmp+=	gmp>=4.2.1
BUILDLINK_PKGSRCDIR.gmp?=	../../devel/gmp
.endif # GMP_BUILDLINK3_MK

BUILDLINK_TREE+=	-gmp
