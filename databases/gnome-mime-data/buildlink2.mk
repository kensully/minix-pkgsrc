# $NetBSD: buildlink2.mk,v 1.2 2002/09/22 09:52:33 jlam Exp $

.if !defined(GNOME_MIME_DATA_BUILDLINK2_MK)
GNOME_MIME_DATA_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			gnome-mime-data
BUILDLINK_DEPENDS.gnome-mime-data?=	gnome-mime-data>=2.2.0nb3
BUILDLINK_PKGSRCDIR.gnome-mime-data?=	../../databases/gnome-mime-data
#BUILDLINK_DEPMETHOD.gnome-mime-data?=	build

EVAL_PREFIX+=	BUILDLINK_PREFIX.gnome-mime-data=gnome-mime-data
BUILDLINK_PREFIX.gnome-mime-data_DEFAULT=	${LOCALBASE}

.include "../../devel/gettext-lib/buildlink2.mk"
.include "../../devel/pkgconfig/buildlink2.mk"

BUILDLINK_TARGETS+=	gnome-mime-data-buildlink

gnome-mime-data-buildlink: _BUILDLINK_USE

.endif	# GNOME_MIME_DATA_BUILDLINK2_MK
