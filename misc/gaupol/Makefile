# $NetBSD: Makefile,v 1.20 2012/10/04 07:08:07 wiz Exp $
#

DISTNAME=	gaupol-0.19.2
PKGREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	http://download.gna.org/gaupol/0.19/

MAINTAINER=	wiz@NetBSD.org
HOMEPAGE=	http://home.gna.org/gaupol/index.html
COMMENT=	Subtitle editor
LICENSE=	gnu-gpl-v3

DEPENDS+=	iso-codes-[0-9]*:../../textproc/iso-codes
DEPENDS+=	${PYPKGPREFIX}-chardet-[0-9]*:../../converters/py-chardet
DEPENDS+=	${PYPKGPREFIX}-enchant>=1.4:../../textproc/py-enchant
DEPENDS+=	${PYPKGPREFIX}-gtk2>=2.16:../../x11/py-gtk2

PYDISTUTILSPKG= 		yes
USE_LANGUAGES=			# none
USE_TOOLS+=			intltool msgfmt

PYSETUPARGS=		--mandir=${PREFIX}/${PKGMANDIR}

.include "../../lang/python/extension.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
