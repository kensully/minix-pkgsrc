# $NetBSD: buildlink3.mk,v 1.16 2010/09/14 11:00:57 wiz Exp $

BUILDLINK_TREE+=	gtk2-engines

.if !defined(GTK2_ENGINES_BUILDLINK3_MK)
GTK2_ENGINES_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gtk2-engines+=	gtk2-engines>=2.6.0
BUILDLINK_ABI_DEPENDS.gtk2-engines?=	gtk2-engines>=2.20.2nb1
BUILDLINK_PKGSRCDIR.gtk2-engines?=	../../x11/gtk2-engines

.include "../../x11/gtk2/buildlink3.mk"
.endif # GTK2_ENGINES_BUILDLINK3_MK

BUILDLINK_TREE+=	-gtk2-engines
