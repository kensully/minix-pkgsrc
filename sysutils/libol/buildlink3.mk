# $NetBSD: buildlink3.mk,v 1.4 2005/03/06 11:10:29 adrianp Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBOL_BUILDLINK3_MK:=	${LIBOL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libol
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibol}
BUILDLINK_PACKAGES+=	libol

.if !empty(LIBOL_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libol+=	libol>=0.3.17
BUILDLINK_PKGSRCDIR.libol?=	../../sysutils/libol
.endif	# LIBOL_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
