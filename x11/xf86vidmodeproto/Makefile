# $NetBSD: Makefile,v 1.4 2012/06/03 18:40:01 wiz Exp $
#

DISTNAME=		xf86vidmodeproto-2.3.1
CATEGORIES=		x11
MASTER_SITES=		${MASTER_SITE_XORG:=proto/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		joerg@NetBSD.org
HOMEPAGE=		http://xorg.freedesktop.org/
COMMENT=		XF86VidMode extension headers from modular X.org

GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE+=	xf86vidmodeproto.pc.in

.include "../../x11/xproto/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
