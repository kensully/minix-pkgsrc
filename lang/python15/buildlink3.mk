# $NetBSD: buildlink3.mk,v 1.3 2004/01/25 14:10:29 recht Exp $
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PYTHON15_BUILDLINK3_MK:=	${PYTHON15_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	python15
.endif

.if !empty(PYTHON15_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=			python15
BUILDLINK_DEPENDS.python15?=		python15>=1.5.2
BUILDLINK_PKGSRCDIR.python15?=		../../lang/python15

.if defined(BUILDLINK_DEPMETHOD.python)
BUILDLINK_DEPMETHOD.python15?=	${BUILDLINK_DEPMETHOD.python}
.endif

BUILDLINK_TRANSFORM+=		l:python:python1.5

BUILDLINK_CPPFLAGS.python15+= \
	-I${BUILDLINK_PREFIX.python15}/include/python1.5
BUILDLINK_LDFLAGS.python15+= \
	-L${BUILDLINK_PREFIX.python15}/lib/python1.5/config		\
	-Wl,-R${BUILDLINK_PREFIX.python15}/lib/python1.5/config

.endif # PYTHON15_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
