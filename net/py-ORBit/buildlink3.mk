# $NetBSD$
#
# This Makefile fragment is included by packages that use py-ORBit.
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PY_ORBIT_BUILDLINK3_MK:=	${PY_ORBIT_BUILDLINK3_MK}+

.include "../../lang/python/pyversion.mk"

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	${PYPKGPREFIX}-ORBit
.endif

.if !empty(PY_ORBIT_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=			pyorbit
BUILDLINK_DEPENDS.pyorbit+=		${PYPKGPREFIX}-ORBit>=2.0.0nb1
BUILDLINK_PKGSRCDIR.pyorbit?=		../../net/py-ORBit

.include "../../net/ORBit2/buildlink3.mk"

.endif # PY_ORBIT_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
