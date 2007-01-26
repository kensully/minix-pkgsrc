# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBOPENSPC_BUILDLINK3_MK:=	${LIBOPENSPC_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libopenspc
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibopenspc}
BUILDLINK_PACKAGES+=	libopenspc
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libopenspc

.if ${LIBOPENSPC_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libopenspc+=	libopenspc>=0.3.99.20050926
BUILDLINK_PKGSRCDIR.libopenspc?=	../../audio/libopenspc
.endif	# LIBOPENSPC_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
