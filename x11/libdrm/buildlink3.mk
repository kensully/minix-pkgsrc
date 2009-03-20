# $NetBSD: buildlink3.mk,v 1.3 2008/07/16 06:41:17 bjs Exp $

BUILDLINK_TREE+=	libdrm

.if !defined(LIBDRM_BUILDLINK3_MK)
LIBDRM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libdrm+=	libdrm>=2.3.0
###
### XXX Explicitly required by (at least) Mesa 7.1, which is nearing release.
###	Upon updating pkgsrc Mesa to 7.1 and/orr xorg-server to a version which
###	requires libdrm-2.3.1, BUILDLINK_API_DEPENDS should be increased
###	and a recursive dependency bump performed.
###	[bjs 20080714]
###
#BUILDLINK_API_DEPENDS.libdrm+=	libdrm>=2.3.1
BUILDLINK_PKGSRCDIR.libdrm?=	../../x11/libdrm
.endif # LIBDRM_BUILDLINK3_MK

BUILDLINK_TREE+=	-libdrm
