# $NetBSD: Makefile,v 1.25 2012/10/03 21:57:55 wiz Exp $
#

DISTNAME=	PDF-Create-1.06
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
SVR4_PKGNAME=	p5pcr
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=PDF/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/PDF-Create/
COMMENT=	Perl5 module for creating pdf documents
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/PDF/Create/.packlist

REPLACE_PERL=	sample.pl sample-cgi.pl

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
