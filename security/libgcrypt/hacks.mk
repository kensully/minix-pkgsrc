# $NetBSD: hacks.mk,v 1.3 2008/03/16 20:14:38 seb Exp $

# config.h #defines socklen_t if it is not defined, but libgcrypt does
# not propogate this to the installed gcrypt.h, so packages using it
# subsequently fail.
#
# hack around this by using the same #define (if present) in gcrypt.h.
post-configure:
	socklen=`${GREP} '^#define socklen_t' ${WRKSRC}/config.h || ${TRUE}`; \
		${MV} ${WRKSRC}/src/gcrypt.h ${WRKSRC}/src/gcrypt.h.old; \
		${SED} -e "s,^/\* socklen_t \*/,$$socklen," \
			${WRKSRC}/src/gcrypt.h.old > ${WRKSRC}/src/gcrypt.h
