# $NetBSD: options.mk,v 1.6 2007/10/25 21:45:42 ghen Exp $

PKG_OPTIONS_VAR=		PKG_OPTIONS.spamprobe
PKG_SUPPORTED_OPTIONS=		bdb gif png jpeg
PKG_SUGGESTED_OPTIONS=		gif png jpeg

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mbdb)
BDB_ACCEPTED=		db4 db5 # db3 db2 (not tested)
BUILDLINK_TRANSFORM+=	l:db:${BDB_TYPE}
.include "../../mk/bdb.buildlink3.mk"
CONFIGURE_ARGS+=	--with-db=${BDBBASE}
.endif

.if !empty(PKG_OPTIONS:Mgif)
.include "../../graphics/libungif/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mpng)
.include "../../graphics/png/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mjpeg)
.include "../../graphics/jpeg/buildlink3.mk"
.endif
