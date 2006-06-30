# $NetBSD$

# GCC 4.1.x complains about a NULL argument to memcpy() because it gets
# confused by the definition of the ar_tha() macro under NetBSD.
.include "../../mk/compiler.mk"

.if ${OPSYS} == "NetBSD" && !empty(CC_VERSION:Mgcc-4.1.*)
PKG_HACKS+=		gcc41-null-warning
BUILDLINK_TRANSFORM+=	rm:-Wall
.endif
