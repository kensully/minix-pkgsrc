# $NetBSD: Makefile,v 1.9 2012/10/03 21:58:12 wiz Exp $
#

DISTNAME=	XML-SemanticDiff-1.0000
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=XML/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/XML-SemanticDiff/
COMMENT=	Perl extension for comparing XML documents
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-XML-Parser-[0-9]*:../../textproc/p5-XML-Parser

PERL5_PACKLIST=	auto/XML/SemanticDiff/.packlist
PERL5_MODULE_TYPE=	Module::Build

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
