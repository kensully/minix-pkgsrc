# $NetBSD$

.if !defined(QT1_BUILDLINK2_MK)
QT1_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		qt1
BUILDLINK_DEPENDS.qt1?=		qt1>=1.44
BUILDLINK_PKGSRCDIR.qt1?=	../../x11/qt1

EVAL_PREFIX+=		BUILDLINK_PREFIX.qt1=qt1
BUILDLINK_PREFIX.qt1_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.qt1+=		qt1/include/*.h
BUILDLINK_FILES.qt1+=		qt1/lib/libqt.*

QTDIR=		${BUILDLINK_PREFIX.qt1}/qt1

BUILDLINK_CPPFLAGS.qt1=		-I${QTDIR}/include
BUILDLINK_LDFLAGS.qt1=		-L${QTDIR}/lib -Wl,-R${QTDIR}/lib

CONFIGURE_ENV+=		QTDIR="${QTDIR}"
CONFIGURE_ENV+=		MOC="${QTDIR}/bin/moc"
MAKE_ENV+=		QTDIR="${QTDIR}"
MAKE_ENV+=		MOC="${QTDIR}/bin/moc"
LDFLAGS+=		-Wl,-R${QTDIR}/lib

BUILDLINK_TARGETS+=	qt1-buildlink

qt1-buildlink: _BUILDLINK_USE

.endif	# QT1_BUILDLINK2_MK
