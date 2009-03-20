# $NetBSD: buildlink3.mk,v 1.2 2007/12/07 19:43:20 martti Exp $

BUILDLINK_DEPMETHOD.xfce4-dev-tools?=	build

BUILDLINK_TREE+=	xfce4-dev-tools

.if !defined(XFCE4_DEV_TOOLS_BUILDLINK3_MK)
XFCE4_DEV_TOOLS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-dev-tools+=	xfce4-dev-tools>=4.4.0.1
BUILDLINK_PKGSRCDIR.xfce4-dev-tools?=	../../devel/xfce4-dev-tools
.endif # XFCE4_DEV_TOOLS_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-dev-tools
