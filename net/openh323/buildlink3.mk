# $NetBSD: buildlink3.mk,v 1.8 2008/01/18 05:08:47 tnn Exp $

BUILDLINK_TREE+=	openh323

.if !defined(OPENH323_BUILDLINK3_MK)
OPENH323_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.openh323+=	openh323>=1.15.1
BUILDLINK_ABI_DEPENDS.openh323+=	openh323>=1.15.2nb2
BUILDLINK_PKGSRCDIR.openh323?=	../../net/openh323

.include "../../devel/pwlib/buildlink3.mk"
.endif # OPENH323_BUILDLINK3_MK

BUILDLINK_TREE+=	-openh323
