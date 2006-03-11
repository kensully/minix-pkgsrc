# $NetBSD: buildlink3.mk,v 1.3 2004/10/03 00:13:31 tv Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBUSB_BUILDLINK3_MK:=	${LIBUSB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libusb
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibusb}
BUILDLINK_PACKAGES+=	libusb

.if !empty(LIBUSB_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libusb+=	libusb>=0.1.7
BUILDLINK_RECOMMENDED.libusb+=	libusb>=0.1.8nb2
BUILDLINK_PKGSRCDIR.libusb?=	../../devel/libusb
.endif	# LIBUSB_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
