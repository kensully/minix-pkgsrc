# $NetBSD: Makefile,v 1.10 2012/09/11 23:04:32 asau Exp $

DISTNAME=	scipy-0.7.2
PKGNAME=	${PYPKGPREFIX}-scipy-0.7.2
PKGREVISION=	1
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=scipy/}

MAINTAINER=	markd@NetBSD.org
HOMEPAGE=	http://www.scipy.org/
COMMENT=	Scientific Algorithms Library for Python
LICENSE=	modified-bsd

PYDISTUTILSPKG=	yes
PLIST_SUBST+=   PYPKGPREFIX=${PYPKGPREFIX}
USE_LANGUAGES+=	c c++ fortran
MAKE_ENV+=	ATLAS=None

# XXX Avoid picking up other compilers when installed
.include "../../mk/compiler.mk"

.if defined(PKGSRC_FORTRAN) && !empty(PKGSRC_FORTRAN:Mg95)
PYSETUPBUILDARGS+= --fcompiler=g95
.elif defined(PKGSRC_FORTRAN) && !empty(PKGSRC_FORTRAN:Mgfortran)
PYSETUPBUILDARGS+= --fcompiler=gnu95
.else
BROKEN=		Requires fortran 95
.endif

CPPFLAGS+=	-D__STDC_FORMAT_MACROS
FFLAGS+=	-fPIC

REPLACE_PYTHON+=	scipy/cluster/setup.py
REPLACE_PYTHON+=	scipy/cluster/setupscons.py
REPLACE_PYTHON+=	scipy/cluster/tests/test_hierarchy.py
REPLACE_PYTHON+=	scipy/cluster/tests/test_vq.py
REPLACE_PYTHON+=	scipy/fftpack/setup.py
REPLACE_PYTHON+=	scipy/fftpack/setupscons.py
REPLACE_PYTHON+=	scipy/fftpack/tests/test_basic.py
REPLACE_PYTHON+=	scipy/fftpack/tests/test_helper.py
REPLACE_PYTHON+=	scipy/fftpack/tests/test_pseudo_diffs.py
REPLACE_PYTHON+=	scipy/integrate/setup.py
REPLACE_PYTHON+=	scipy/integrate/setupscons.py
REPLACE_PYTHON+=	scipy/interpolate/fitpack.py
REPLACE_PYTHON+=	scipy/interpolate/setup.py
REPLACE_PYTHON+=	scipy/interpolate/setupscons.py
REPLACE_PYTHON+=	scipy/interpolate/tests/test_fitpack.py
REPLACE_PYTHON+=	scipy/interpolate/tests/test_rbf.py
REPLACE_PYTHON+=	scipy/io/arff/arffread.py
REPLACE_PYTHON+=	scipy/io/arff/setup.py
REPLACE_PYTHON+=	scipy/io/arff/utils.py
REPLACE_PYTHON+=	scipy/io/matlab/setup.py
REPLACE_PYTHON+=	scipy/io/matlab/tests/test_mio.py
REPLACE_PYTHON+=	scipy/io/setup.py
REPLACE_PYTHON+=	scipy/io/setupscons.py
REPLACE_PYTHON+=	scipy/io/tests/test_array_import.py
REPLACE_PYTHON+=	scipy/io/tests/test_mmio.py
REPLACE_PYTHON+=	scipy/lib/blas/setup.py
REPLACE_PYTHON+=	scipy/lib/blas/setupscons.py
REPLACE_PYTHON+=	scipy/lib/blas/tests/test_blas.py
REPLACE_PYTHON+=	scipy/lib/lapack/setup.py
REPLACE_PYTHON+=	scipy/lib/lapack/setupscons.py
REPLACE_PYTHON+=	scipy/lib/lapack/tests/test_lapack.py
REPLACE_PYTHON+=	scipy/lib/setup.py
REPLACE_PYTHON+=	scipy/lib/setupscons.py
REPLACE_PYTHON+=	scipy/linalg/setupscons.py
REPLACE_PYTHON+=	scipy/linalg/tests/test_atlas_version.py
REPLACE_PYTHON+=	scipy/linalg/tests/test_basic.py
REPLACE_PYTHON+=	scipy/linalg/tests/test_blas.py
REPLACE_PYTHON+=	scipy/linalg/tests/test_decomp.py
REPLACE_PYTHON+=	scipy/linalg/tests/test_lapack.py
REPLACE_PYTHON+=	scipy/linalg/tests/test_matfuncs.py
REPLACE_PYTHON+=	scipy/maxentropy/examples/bergerexample.py
REPLACE_PYTHON+=	scipy/maxentropy/examples/bergerexamplesimulated.py
REPLACE_PYTHON+=	scipy/maxentropy/examples/conditionalexample2.py
REPLACE_PYTHON+=	scipy/maxentropy/setup.py
REPLACE_PYTHON+=	scipy/maxentropy/setupscons.py
REPLACE_PYTHON+=	scipy/maxentropy/tests/test_maxentropy.py
REPLACE_PYTHON+=	scipy/misc/ppimport.py
REPLACE_PYTHON+=	scipy/odr/setup.py
REPLACE_PYTHON+=	scipy/odr/setupscons.py
REPLACE_PYTHON+=	scipy/optimize/setup.py
REPLACE_PYTHON+=	scipy/optimize/setupscons.py
REPLACE_PYTHON+=	scipy/optimize/tests/test_zeros.py
REPLACE_PYTHON+=	scipy/signal/setup.py
REPLACE_PYTHON+=	scipy/signal/setupscons.py
REPLACE_PYTHON+=	scipy/sparse/linalg/dsolve/setup.py
REPLACE_PYTHON+=	scipy/sparse/linalg/dsolve/setupscons.py
REPLACE_PYTHON+=	scipy/sparse/linalg/dsolve/umfpack/setup.py
REPLACE_PYTHON+=	scipy/sparse/linalg/dsolve/umfpack/setupscons.py
REPLACE_PYTHON+=	scipy/sparse/linalg/dsolve/umfpack/tests/test_umfpack.py
REPLACE_PYTHON+=	scipy/sparse/linalg/dsolve/umfpack/tests/try_umfpack.py
REPLACE_PYTHON+=	scipy/sparse/linalg/eigen/arpack/setup.py
REPLACE_PYTHON+=	scipy/sparse/linalg/eigen/arpack/setupscons.py
REPLACE_PYTHON+=	scipy/sparse/linalg/eigen/arpack/tests/test_arpack.py
REPLACE_PYTHON+=	scipy/sparse/linalg/eigen/arpack/tests/test_speigs.py
REPLACE_PYTHON+=	scipy/sparse/linalg/eigen/lobpcg/setup.py
REPLACE_PYTHON+=	scipy/sparse/linalg/eigen/lobpcg/setupscons.py
REPLACE_PYTHON+=	scipy/sparse/linalg/eigen/lobpcg/tests/test_lobpcg.py
REPLACE_PYTHON+=	scipy/sparse/linalg/eigen/setup.py
REPLACE_PYTHON+=	scipy/sparse/linalg/eigen/setupscons.py
REPLACE_PYTHON+=	scipy/sparse/linalg/isolve/setup.py
REPLACE_PYTHON+=	scipy/sparse/linalg/isolve/setupscons.py
REPLACE_PYTHON+=	scipy/sparse/linalg/isolve/tests/test_iterative.py
REPLACE_PYTHON+=	scipy/sparse/linalg/setup.py
REPLACE_PYTHON+=	scipy/sparse/linalg/setupscons.py
REPLACE_PYTHON+=	scipy/sparse/setup.py
REPLACE_PYTHON+=	scipy/sparse/setupscons.py
REPLACE_PYTHON+=	scipy/sparse/sparsetools/setup.py
REPLACE_PYTHON+=	scipy/sparse/sparsetools/setupscons.py
REPLACE_PYTHON+=	scipy/spatial/setup.py
REPLACE_PYTHON+=	scipy/spatial/setupscons.py
REPLACE_PYTHON+=	scipy/spatial/tests/test_distance.py
REPLACE_PYTHON+=	scipy/special/gendoc.py
REPLACE_PYTHON+=	scipy/special/setup.py
REPLACE_PYTHON+=	scipy/special/setupscons.py
REPLACE_PYTHON+=	scipy/special/spfun_stats.py
REPLACE_PYTHON+=	scipy/stats/setup.py
REPLACE_PYTHON+=	scipy/stats/setupscons.py
REPLACE_PYTHON+=	scipy/weave/setup.py
REPLACE_PYTHON+=	scipy/weave/setupscons.py

.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"
.include "../../math/fftw/buildlink3.mk"
.include "../../math/py-numpy/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
