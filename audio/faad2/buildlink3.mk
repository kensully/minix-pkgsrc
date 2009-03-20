# $NetBSD: buildlink3.mk,v 1.12 2008/02/25 16:12:34 sborrill Exp $

BUILDLINK_TREE+=	faad2

.if !defined(FAAD2_BUILDLINK3_MK)
FAAD2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.faad2+=	faad2>=2.6.1
BUILDLINK_ABI_DEPENDS.faad2?=	faad2>=2.6.1
BUILDLINK_PKGSRCDIR.faad2?=	../../audio/faad2
BUILDLINK_INCDIRS.faad2?=	include/faad2
.endif # FAAD2_BUILDLINK3_MK

BUILDLINK_TREE+=	-faad2
