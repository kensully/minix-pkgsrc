# $NetBSD: buildlink2.mk,v 1.3 2003/07/09 08:09:04 itojun Exp $
#

.if !defined(APR_BUILDLINK2_MK)
APR_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		apr
BUILDLINK_DEPENDS.apr?=		apr>=0.9.4.2.0.47
BUILDLINK_PKGSRCDIR.apr?=	../../devel/apr

EVAL_PREFIX+=			BUILDLINK_PREFIX.apr=apr
BUILDLINK_PREFIX.apr_DEFAULT=	${LOCALBASE}

BUILDLINK_FILES.apr+=	bin/apr-config
BUILDLINK_FILES.apr+=	bin/apu-config
BUILDLINK_FILES.apr+=	include/apr-0/*
BUILDLINK_FILES.apr+=	lib/apr.exp
BUILDLINK_FILES.apr+=	lib/aprutil.exp
BUILDLINK_FILES.apr+=	lib/libapr-0.*
BUILDLINK_FILES.apr+=	lib/libaprutil-0.*

.include "../../databases/db4/buildlink2.mk"
.include "../../textproc/expat/buildlink2.mk"

BUILDLINK_TARGETS+=	apr-buildlink

apr-buildlink: _BUILDLINK_USE

.endif	# APR_BUILDLINK2_MK
