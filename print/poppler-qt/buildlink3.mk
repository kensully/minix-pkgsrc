# $NetBSD: buildlink3.mk,v 1.3 2006/02/05 23:10:38 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
POPPLER_QT_BUILDLINK3_MK:=	${POPPLER_QT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	poppler-qt
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npoppler-qt}
BUILDLINK_PACKAGES+=	poppler-qt

.if !empty(POPPLER_QT_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.poppler-qt+=	poppler-qt>=0.4.5nb1
BUILDLINK_PKGSRCDIR.poppler-qt?=	../../print/poppler-qt
.endif	# POPPLER_QT_BUILDLINK3_MK

.include "../../print/poppler/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
