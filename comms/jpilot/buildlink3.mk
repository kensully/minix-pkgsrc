# $NetBSD: buildlink3.mk,v 1.22 2012/02/06 12:39:41 wiz Exp $

BUILDLINK_TREE+=	jpilot

.if !defined(JPILOT_BUILDLINK3_MK)
JPILOT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.jpilot+=	jpilot>=1.6.0
BUILDLINK_ABI_DEPENDS.jpilot+=	jpilot>=1.6.0nb12
BUILDLINK_PKGSRCDIR.jpilot?=	../../comms/jpilot

.include "../../comms/pilot-link-libs/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # JPILOT_BUILDLINK3_MK

BUILDLINK_TREE+=	-jpilot
