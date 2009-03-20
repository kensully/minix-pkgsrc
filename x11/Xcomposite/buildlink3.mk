# $NetBSD: buildlink3.mk,v 1.12 2008/01/07 13:59:35 tron Exp $

.include "../../mk/bsd.fast.prefs.mk"

BUILDLINK_TREE+=	Xcomposite

.if !defined(XCOMPOSITE_BUILDLINK3_MK)
XCOMPOSITE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.Xcomposite+=		Xcomposite>=1.0.1
BUILDLINK_ABI_DEPENDS.Xcomposite?=	Xcomposite>=1.0.1nb2
BUILDLINK_PKGSRCDIR.Xcomposite?=	../../x11/Xcomposite

.include "../../x11/libXfixes/buildlink3.mk"
.include "../../x11/compositeproto/buildlink3.mk"
.include "../../x11/fixesproto/buildlink3.mk"
.endif # XCOMPOSITE_BUILDLINK3_MK

BUILDLINK_TREE+=	-Xcomposite
