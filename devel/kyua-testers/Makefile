# $NetBSD$
#

DISTNAME=	kyua-testers-0.1
CATEGORIES=	devel
MASTER_SITES=	http://kyua.googlecode.com/files/

MAINTAINER=	jmmv@NetBSD.org
HOMEPAGE=	http://code.google.com/p/kyua/
COMMENT=	Kyua (automated testing framework) - Testers
LICENSE=	modified-bsd

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		yes
MAKE_JOBS_SAFE=		yes
USE_LANGUAGES=		c

PKG_OPTIONS_VAR=	PKG_OPTIONS.kyua-testers
PKG_SUPPORTED_OPTIONS=	tests
PKG_SUGGESTED_OPTIONS=	tests

CONFIGURE_ARGS+=	--without-doxygen

.include "../../mk/bsd.options.mk"

.if $(PKG_OPTIONS:Mtests)
USE_TOOLS+=		pkg-config
CONFIGURE_ARGS+=	--with-atf
PLIST_SUBST+=		TESTS=
.  include "../../devel/atf-libs/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-atf
PLIST_SUBST+=		TESTS=@comment
.endif

.include "../../mk/bsd.pkg.mk"
