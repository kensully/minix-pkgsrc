# $NetBSD: Makefile,v 1.6 2012/10/29 05:06:50 asau Exp $
#

DISTNAME=		rgb-1.0.5
CATEGORIES=		x11
MASTER_SITES=		${MASTER_SITE_XORG:=app/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		joerg@NetBSD.org
HOMEPAGE=		http://xorg.freedesktop.org/
COMMENT=		RGB color database

GNU_CONFIGURE=		yes
USE_TOOLS+=		pkg-config

CONFIGURE_ENV+=		APP_MAN_SUFFIX=1

.include "../../x11/xproto/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
