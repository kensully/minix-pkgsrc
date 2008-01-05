# $NetBSD: buildlink3.mk,v 1.9 2007/10/31 21:15:19 rillig Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PYQT2SIP_BUILDLINK3_MK:=	${PYQT2SIP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pyqt2sip
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npyqt2sip}
BUILDLINK_PACKAGES+=	pyqt2sip
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}pyqt2sip

.if !empty(PYQT2SIP_BUILDLINK3_MK:M+)
.include "../../lang/python/pyversion.mk"
BUILDLINK_API_DEPENDS.pyqt2sip+=	${PYPKGPREFIX}-qt2-sip-[0-9]*
BUILDLINK_ABI_DEPENDS.pyqt2sip+=	${PYPKGPREFIX}-qt2-sip>=3.1nb3
BUILDLINK_PKGSRCDIR.pyqt2sip?=	../../x11/py-qt2-sip
.endif	# PYQT2SIP_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
