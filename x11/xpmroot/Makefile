# $NetBSD: Makefile,v 1.62 2012/10/23 10:24:22 wiz Exp $
#

DISTNAME=	fvwm-${PKG_VERSION}
PKGNAME=	xpmroot-${PKG_VERSION}
#PKGREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	ftp://ftp.fvwm.org/pub/fvwm/version-2/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.fvwm.org/documentation/manpages/stable/xpmroot.php
COMMENT=	Sets the root window to an Xpm pixmap
LICENSE=	gnu-gpl-v2

PKG_VERSION=	2.4.20
USE_X11BASE=	YES
GNU_CONFIGURE=	YES
BUILD_DIRS=	libs utils

MAKE_ENV+=	VERSION=${PKG_VERSION:Q}
CONFIGURE_ARGS+=	--without-extras --disable-dmalloc --without-gnome

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/utils/xpmroot ${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/utils/xpmroot.1 \
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1

.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
