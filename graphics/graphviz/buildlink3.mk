# $NetBSD: buildlink3.mk,v 1.16 2009/03/06 07:36:34 wiz Exp $

BUILDLINK_TREE+=	graphviz

.if !defined(GRAPHVIZ_BUILDLINK3_MK)
GRAPHVIZ_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.graphviz+=	graphviz>=1.12
BUILDLINK_ABI_DEPENDS.graphviz+=	graphviz>=2.6nb5
BUILDLINK_PKGSRCDIR.graphviz?=	../../graphics/graphviz

.include "../../converters/libiconv/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"
.endif # GRAPHVIZ_BUILDLINK3_MK

BUILDLINK_TREE+=	-graphviz
