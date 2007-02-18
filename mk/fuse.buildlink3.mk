# $NetBSD$
#
# Makefile fragment for packages using the FUSE framework.
#

.if !defined(FUSE_BUILDLINK3_MK)
FUSE_BUILDLINK3_MK=	# defined

.include "../../mk/bsd.prefs.mk"

# NetBSD
.if (!empty(OPSYS:MNetBSD) && exists(/usr/include/fuse.h))

.  if !empty(USE_TOOLS:C/:.*//:Mpkg-config)
do-configure-pre-hook: override-fuse-pkgconfig

BLKDIR_PKGCFG=	${BUILDLINK_DIR}/lib/pkgconfig
FUSE_PKGCFGF=	fuse.pc

override-fuse-pkgconfig: override-message-fuse-pkgconfig
override-message-fuse-pkgconfig:
	@${STEP_MSG} "Magical transformations for fuse on NetBSD."

override-fuse-pkgconfig:
	${_PKG_SILENT}${_PKG_DEBUG}set -e;		\
	${MKDIR} ${BLKDIR_PKGCFG};			\
	{						\
	${ECHO} "prefix=/usr";				\
	${ECHO} "exec_prefix=\$${prefix}";		\
	${ECHO} "libdir=\$${exec_prefix}/lib";		\
	${ECHO} "includedir=\$${prefix}/include";	\
	${ECHO}	"";					\
	${ECHO} "Name: FuSE";				\
	${ECHO} "Description: Filesystem USEr Space";	\
	${ECHO} "Version: 2.6.0";			\
	${ECHO} "Libs: -Wl,-R\$${libdir} -L\$${libdir} -lrefuse";	\
	${ECHO} "Cflags: -I\$${includedir}";		\
	} >> ${BLKDIR_PKGCFG}/${FUSE_PKGCFGF};

.  endif # pkg-config

# To make sure
BUILDLINK_TRANSFORM+=	l:fuse:refuse

# Undefined reference to fuse_main()... use fuse_exit() for now.
.  if defined(GNU_CONFIGURE)
SUBST_CLASSES+=		refuse
SUBST_STAGE.refuse=	pre-configure
SUBST_FILES.refuse=	configure
.    for _f_ in configure.in configure.ac
.      if exists(${WRKSRC}/${_f_})
SUBST_FILES.refuse+=	${_f_}
.      endif
.    endfor
SUBST_SED.refuse=	-e "s|fuse_main|fuse_exit|g"
.  endif

.  endif # NetBSD - pkg-config

.else # Linux

.include "${PKGSRCDIR}/filesystems/fusefs/buildlink3.mk"

.endif
