# $NetBSD: buildlink3.mk,v 1.11 2006/07/08 23:11:13 jlam Exp $

BUILDLINK_TREE+=	blt

.if !defined(BLT_BUILDLINK3_MK)
BLT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.blt+=		blt>=2.4z
BUILDLINK_ABI_DEPENDS.blt?=	blt>=2.4znb2
BUILDLINK_PKGSRCDIR.blt?=	../../x11/blt

.include "../../lang/tcl/buildlink3.mk"
.include "../../x11/tk/buildlink3.mk"
.endif # BLT_BUILDLINK3_MK

BUILDLINK_TREE+=	-blt
