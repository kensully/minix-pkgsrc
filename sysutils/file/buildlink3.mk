# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 23:11:08 jlam Exp $
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
FILE_BUILDLINK3_MK:=	${FILE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	file
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfile}
BUILDLINK_PACKAGES+=	file
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}file

.if !empty(FILE_BUILDLINK3_MK:M+)

.  include "../../mk/bsd.fast.prefs.mk"

BUILDLINK_API_DEPENDS.file+=	file>=4.17
BUILDLINK_ABI_DEPENDS.file+=	file>=4.17
BUILDLINK_PKGSRCDIR.file?=	../../sysutils/file
.endif	# FILE_BUILDLINK3_MK
pkgbase := file
.include "../../mk/pkg-build-options.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
