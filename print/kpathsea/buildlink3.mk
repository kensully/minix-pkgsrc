# $NetBSD: buildlink3.mk,v 1.1.1.1 2009/01/03 22:12:42 minskim Exp $

BUILDLINK_TREE+=	kpathsea

.if !defined(KPATHSEA_BUILDLINK3_MK)
KPATHSEA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kpathsea+=	kpathsea>=3.5.7
BUILDLINK_PKGSRCDIR.kpathsea?=	../../print/kpathsea
BUILDLINK_FILES.kpathsea+=	bin/kpsewhich
.endif # KPATHSEA_BUILDLINK3_MK

BUILDLINK_TREE+=	-kpathsea
