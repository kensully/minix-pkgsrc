# $NetBSD: buildlink2.mk,v 1.3 2003/05/12 14:56:20 jmc Exp $

.if !defined(PYGTK2_BUILDLINK2_MK)
PYGTK2_BUILDLINK2_MK=	# defined

PYTHON_VERSION_REQD=	22pth
.include "../../lang/python/pyversion.mk"

BUILDLINK_PACKAGES+=			pygtk2
BUILDLINK_DEPENDS.pygtk2?=		${PYPKGPREFIX}-gtk2>=1.99.16nb1
BUILDLINK_PKGSRCDIR.pygtk2?=		../../x11/py-gtk2

EVAL_PREFIX+=	BUILDLINK_PREFIX.pygtk2=${PYPKGPREFIX}-gtk2
BUILDLINK_PREFIX.pygtk2_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.pygtk2+=	include/pygtk-2.0/pygtk/pygtk.h
BUILDLINK_FILES.pygtk2+=	include/pygtk-2.0/pygobject.h
BUILDLINK_FILES.pygtk2+=	lib/pkgconfig/pygtk-2.0.pc

.include "../../devel/libglade2/buildlink2.mk"
.include "../../math/py-Numeric/buildlink2.mk"
.include "../../x11/gtk2/buildlink2.mk"
.include "../../x11/gtkglarea2/buildlink2.mk"

BUILDLINK_TARGETS+=	pygtk2-buildlink

pygtk2-buildlink: _BUILDLINK_USE

.endif	# PYGTK2_BUILDLINK2_MK
