# $NetBSD: buildlink3.mk,v 1.17 2008/12/07 15:16:53 wiz Exp $

BUILDLINK_TREE+=	nautilus-cd-burner

.if !defined(NAUTILUS_CD_BURNER_BUILDLINK3_MK)
NAUTILUS_CD_BURNER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.nautilus-cd-burner+=	nautilus-cd-burner>=2.24.0
BUILDLINK_PKGSRCDIR.nautilus-cd-burner?=	../../sysutils/nautilus-cd-burner

.include "../../devel/glib2/buildlink3.mk"
.include "../../sysutils/hal/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # NAUTILUS_CD_BURNER_BUILDLINK3_MK

BUILDLINK_TREE+=	-nautilus-cd-burner
