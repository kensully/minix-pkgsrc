# $NetBSD$

BUILDLINK_TREE+=	xfce4-settings

.if !defined(XFCE4_SETTINGS_BUILDLINK3_MK)
XFCE4_SETTINGS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-settings+=	xfce4-settings>=4.6.0
BUILDLINK_PKGSRCDIR.xfce4-settings?=	../../x11/xfce4-settings

.endif	# XFCE4_SETTINGS_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-settings
