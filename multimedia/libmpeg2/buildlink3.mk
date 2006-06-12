# $NetBSD: buildlink3.mk,v 1.6 2006/04/12 10:27:28 rillig Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBMPEG2_BUILDLINK3_MK:=	${LIBMPEG2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libmpeg2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibmpeg2}
BUILDLINK_PACKAGES+=	libmpeg2

.if !empty(LIBMPEG2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libmpeg2+=	libmpeg2>=0.4.0
BUILDLINK_ABI_DEPENDS.libmpeg2+=	libmpeg2>=0.4.0bnb5
BUILDLINK_PKGSRCDIR.libmpeg2?=	../../multimedia/libmpeg2
.endif	# LIBMPEG2_BUILDLINK3_MK

.include "../../devel/SDL/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
