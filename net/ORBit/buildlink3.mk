# $NetBSD: buildlink3.mk,v 1.10 2006/07/08 23:11:02 jlam Exp $

BUILDLINK_TREE+=	ORBit

.if !defined(ORBIT_BUILDLINK3_MK)
ORBIT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ORBit+=	ORBit>=0.5.15nb5
BUILDLINK_ABI_DEPENDS.ORBit+=	ORBit>=0.5.17nb1
BUILDLINK_PKGSRCDIR.ORBit?=	../../net/ORBit

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.endif # ORBIT_BUILDLINK3_MK

BUILDLINK_TREE+=	-ORBit
