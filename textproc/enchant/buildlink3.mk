# $NetBSD: buildlink3.mk,v 1.11 2008/04/14 11:35:50 wiz Exp $

BUILDLINK_TREE+=	enchant

.if !defined(ENCHANT_BUILDLINK3_MK)
ENCHANT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.enchant+=	enchant>=1.1.3
BUILDLINK_ABI_DEPENDS.enchant+=	enchant>=1.1.6nb1
BUILDLINK_PKGSRCDIR.enchant?=	../../textproc/enchant

# spelling libraries are loaded dynamically and do not need
# to be included here
.include "../../devel/glib2/buildlink3.mk"
.endif # ENCHANT_BUILDLINK3_MK

BUILDLINK_TREE+=	-enchant
