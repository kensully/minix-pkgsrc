# $NetBSD: buildlink3.mk,v 1.10 2006/07/26 20:00:27 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
IMAP_UW_BUILDLINK3_MK:=	${IMAP_UW_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	imap-uw
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nimap-uw}
BUILDLINK_PACKAGES+=	imap-uw
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}imap-uw

.if !empty(IMAP_UW_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.imap-uw+=	imap-uw>=2004
BUILDLINK_ABI_DEPENDS.imap-uw+=	imap-uw>=2006j2nb1
BUILDLINK_PKGSRCDIR.imap-uw?=	../../mail/imap-uw
.endif	# IMAP_UW_BUILDLINK3_MK

.include "../../security/openssl/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
