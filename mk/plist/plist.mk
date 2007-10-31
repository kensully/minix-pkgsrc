# $NetBSD: plist.mk,v 1.35 2007/10/25 22:02:18 jlam Exp $
#
# This Makefile fragment handles the creation of PLISTs for use by
# pkg_create(8).
#
# The following variables affect the PLIST generation:
#
#    PLIST_TYPE specifies whether the generated PLIST is derived
#	automatically from the installed files, or if the PLIST entries
#	are listed in files.  Valid values are "dynamic" and "static",
#	and the default value is "static".
#
#    PLIST_SRC is the list of source files from which the PLIST file of
#	the binary package will be generated. By default, its value is
#	constructed from the PLIST.* files within the package directory,
#	in the following order (if the files are present):
#
#	PLIST.common
#	PLIST.${OPSYS}			(e.g., PLIST.NetBSD)
#	PLIST.${MACHINE_ARCH}		(e.g,, PLIST.macppc)
#	PLIST.${OPSYS}-${MACHINE_ARCH}	(e.g., PLIST.NetBSD-macppc)
#	PLIST
#	PLIST.common_end
#
#    GENERATE_PLIST is a sequence of commands, terminating in a semicolon,
#	that outputs contents for a PLIST to stdout and is appended to
#	the contents of ${PLIST_SRC}.
#
#    IGNORE_INFO_DIRS is a list of ${PREFIX}-relative paths that do
#	*not* contain info files.
#

_VARGROUPS+=		plist
_USER_VARS.plist=	# none
_PKG_VARS.plist=	PLIST_SUBST PLIST_SRC GENERATE_PLIST
_SYS_VARS.plist=	PLIST_TYPE PLIST

.if ${PKG_INSTALLATION_TYPE} == "pkgviews"
PLIST_TYPE?=	dynamic
.endif
PLIST_TYPE?=	static

######################################################################

.if exists(${PKGDIR}/PLIST.common)
PLIST_SRC_DFLT+=	${PKGDIR}/PLIST.common
.endif
.if exists(${PKGDIR}/PLIST.${OPSYS})
PLIST_SRC_DFLT+=	${PKGDIR}/PLIST.${OPSYS}
.endif
.if exists(${PKGDIR}/PLIST.${MACHINE_ARCH:C/i[3-6]86/i386/g})
PLIST_SRC_DFLT+=	${PKGDIR}/PLIST.${MACHINE_ARCH:C/i[3-6]86/i386/g}
.endif
.if exists(${PKGDIR}/PLIST.${OPSYS}-${MACHINE_ARCH:C/i[3-6]86/i386/g})
PLIST_SRC_DFLT+=	${PKGDIR}/PLIST.${OPSYS}-${MACHINE_ARCH:C/i[3-6]86/i386/g}
.endif
.if defined(EMUL_PLATFORM) && exists(${PKGDIR}/PLIST.${EMUL_PLATFORM})
PLIST_SRC_DFLT+=	${PKGDIR}/PLIST.${EMUL_PLATFORM}
.endif
.if exists(${PKGDIR}/PLIST)
PLIST_SRC_DFLT+=	${PKGDIR}/PLIST
.endif
.if exists(${PKGDIR}/PLIST.common_end)
PLIST_SRC_DFLT+=	${PKGDIR}/PLIST.common_end
.endif

#
# If the following 3 conditions hold, then fail the package build:
#
#    (1) The package doesn't set PLIST_SRC.
#    (2) The package doesn't set GENERATE_PLIST.
#    (3) There are no PLIST files.
#
.if !defined(PLIST_SRC) && !defined(GENERATE_PLIST)
.  if !defined(PLIST_SRC_DFLT) || empty(PLIST_SRC_DFLT)
PKG_FAIL_REASON+=      "Missing PLIST file or PLIST/GENERATE_PLIST definition."
.  endif
.endif

PLIST_SRC?=		${PLIST_SRC_DFLT}

# This is the path to the generated PLIST file.
PLIST=		${WRKDIR}/.PLIST
_PLIST_NOKEYWORDS=${PLIST}_nokeywords

######################################################################

.if (defined(USE_IMAKE) || !empty(USE_TOOLS:Mimake))
_IMAKE_MANINSTALL=	${IMAKE_MANINSTALL}
.else
_IMAKE_MANINSTALL=	# empty
.endif

_LIBTOOL_EXPAND=							\
	${SETENV} ECHO=${TOOLS_ECHO:Q} GREP=${TOOLS_GREP:Q}		\
		SORT=${TOOLS_SORT:Q} TEST=${TOOLS_TEST:Q}		\
	${SH} ${.CURDIR}/../../mk/plist/libtool-expand

.if !defined(_IGNORE_INFO_PATH)
.  for _dir_ in ${IGNORE_INFO_DIRS}
_IGNORE_INFO_PATH:=	${_IGNORE_INFO_PATH}:${_dir_}
.  endfor
_IGNORE_INFO_PATH:=	${_IGNORE_INFO_PATH:S/^://}
.endif
MAKEVARS+=		_IGNORE_INFO_PATH

# _PLIST_AWK_ENV holds the shell environment passed to the awk script
# that does post-processing of the PLIST.  See the individual *.awk
# scripts for information on each of the variable set in the environment.
#
_PLIST_AWK_ENV+=	PKGLOCALEDIR=${PKGLOCALEDIR:Q}
_PLIST_AWK_ENV+=	USE_PKGLOCALEDIR=${USE_PKGLOCALEDIR:Dyes:Uno}
_PLIST_AWK_ENV+=	IMAKE_MANINSTALL=${_IMAKE_MANINSTALL:Q}
_PLIST_AWK_ENV+=	IGNORE_INFO_PATH=${_IGNORE_INFO_PATH:Q}
_PLIST_AWK_ENV+=	PKGINFODIR=${PKGINFODIR:Q}
_PLIST_AWK_ENV+=	IGNORE_LIBTOOLIZE=${IGNORE_LIBTOOLIZE:Q}
_PLIST_AWK_ENV+=	LIBTOOLIZE_PLIST=${LIBTOOLIZE_PLIST:Q}
_PLIST_AWK_ENV+=	LIBTOOL_EXPAND=${_LIBTOOL_EXPAND:Q}
_PLIST_AWK_ENV+=	LS=${TOOLS_LS:Q}
_PLIST_AWK_ENV+=	MANINSTALL=${MANINSTALL:Q}
_PLIST_AWK_ENV+=	MANZ=${_MANZ:Q}
_PLIST_AWK_ENV+=	PKGMANDIR=${PKGMANDIR:Q}
_PLIST_AWK_ENV+=	PREFIX=${DESTDIR:Q}${PREFIX:Q}
_PLIST_AWK_ENV+=	TEST=${TOOLS_TEST:Q}

# PLIST_SUBST contains package-settable "${variable}" to "value"
# substitutions for PLISTs
#
PLIST_SUBST+=	OPSYS=${OPSYS:Q}					\
		OS_VERSION=${OS_VERSION:Q}				\
		MACHINE_ARCH=${MACHINE_ARCH:Q}				\
		MACHINE_GNU_ARCH=${MACHINE_GNU_ARCH:Q}			\
		MACHINE_GNU_PLATFORM=${MACHINE_GNU_PLATFORM:Q}		\
		LN=${LN:Q}						\
		LOWER_VENDOR=${LOWER_VENDOR:Q}				\
		LOWER_OPSYS=${LOWER_OPSYS:Q}				\
		LOWER_OS_VERSION=${LOWER_OS_VERSION:Q}			\
		PKGBASE=${PKGBASE:Q}					\
		PKGNAME=${PKGNAME_NOREV:Q}				\
		PKGLOCALEDIR=${PKGLOCALEDIR:Q}				\
		PKGVERSION=${PKGVERSION:C/nb[0-9]*$//:Q}		\
		LOCALBASE=${LOCALBASE:Q}				\
		VIEWBASE=${VIEWBASE:Q}					\
		X11BASE=${X11BASE:Q}					\
		X11PREFIX=${X11PREFIX:Q}				\
		SVR4_PKGNAME=${SVR4_PKGNAME:Q}				\
		CHGRP=${CHGRP:Q}					\
		CHMOD=${CHMOD:Q}					\
		CHOWN=${CHOWN:Q}					\
		MKDIR=${MKDIR:Q}					\
		RMDIR=${RMDIR:Q}					\
		RM=${RM:Q}						\
		TRUE=${TRUE:Q}						\
		PKGMANDIR=${PKGMANDIR:Q}

# Pass the PLIST_SUBST substitutions to the subst.awk script by prepending
# PLIST_" to all of the variable names and adding them into the environment.
#
_PLIST_AWK_ENV+=	${PLIST_SUBST:S/^/PLIST_/}
_PLIST_AWK_ENV+=	PLIST_SUBST_VARS=${PLIST_SUBST:S/^/PLIST_/:C/=.*//:M*:Q}

_PLIST_1_AWK+=		-f ${PKGSRCDIR}/mk/plist/plist-functions.awk
_PLIST_1_AWK+=		-f ${PKGSRCDIR}/mk/plist/plist-subst.awk
_PLIST_1_AWK+=		-f ${PKGSRCDIR}/mk/plist/plist-macros.awk

_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-functions.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-locale.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-info.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-man.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-libtool.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-default.awk

_PLIST_INFO_AWK+=	-f ${.CURDIR}/../../mk/plist/plist-functions.awk
_PLIST_INFO_AWK+=	-f ${.CURDIR}/../../mk/plist/plist-info.awk

_PLIST_SHLIB_AWK=	-f ${_SHLIB_AWKFILE.${SHLIB_TYPE}}
_SHLIB_AWKFILE.ECOFF=	${.CURDIR}/../../mk/plist/shlib-elf.awk
_SHLIB_AWKFILE.ELF=	${.CURDIR}/../../mk/plist/shlib-elf.awk
_SHLIB_AWKFILE.SOM=	${.CURDIR}/../../mk/plist/shlib-som.awk
_SHLIB_AWKFILE.aixlib=	${.CURDIR}/../../mk/plist/shlib-none.awk
_SHLIB_AWKFILE.a.out=	${.CURDIR}/../../mk/plist/shlib-aout.awk
_SHLIB_AWKFILE.dylib=	${.CURDIR}/../../mk/plist/shlib-dylib.awk
_SHLIB_AWKFILE.none=	${.CURDIR}/../../mk/plist/shlib-none.awk

######################################################################

# GENERATE_PLIST is a sequence of commands, terminating in a semicolon,
#	that outputs contents for a PLIST to stdout and is appended to
#	the contents of ${PLIST_SRC}.
#
.if empty(PLIST_SRC)
GENERATE_PLIST?=	${ECHO} "@comment "${PKGNAME:Q}" has no files.";
.else
GENERATE_PLIST?=	${TRUE};
.endif

.if ${PKG_INSTALLATION_TYPE} == "pkgviews"
#
# _PLIST_IGNORE_FILES basically mirrors the list of ignored files found
# in pkg_views(1).  It's used by the dynamic PLIST generator to skip
# adding the named files to the PLIST.
#
_PLIST_IGNORE_FILES+=	+*			# package metadata files
.  if defined(INFO_FILES)
_PLIST_IGNORE_FILES+=	${PKGINFODIR}/dir
.  endif
_PLIST_IGNORE_FILES+=	*[~\#] *.OLD *.orig *,v	# scratch config files
.  if !empty(CONF_DEPENDS)
_PLIST_IGNORE_FILES+=	${PKG_SYSCONFDIR:S,^${PREFIX}/,,}
.  endif
_PLIST_IGNORE_FILES+=	${PLIST_IGNORE_FILES}
.endif
_BUILD_DEFS+=		_PLIST_IGNORE_FILES

.if ${PLIST_TYPE} == "dynamic"
_PLIST_IGNORE_CMD=							\
	( while read i; do						\
		ignore=no;						\
		for p in ${_PLIST_IGNORE_FILES}; do			\
	  		case "$$i" in					\
			$$p)	ignore=yes; break ;;			\
			esac;						\
		done;							\
		[ "$$ignore" = "yes" ] || ${ECHO} "$$i";		\
	  done )
_GENERATE_PLIST=							\
	${FIND} ${DESTDIR}${PREFIX} \! -type d -print | ${SORT} |	\
		${SED} -e "s|^${DESTDIR}${PREFIX}/||" | 		\
		${_PLIST_IGNORE_CMD};					\
	${FIND} ${DESTDIR}${PREFIX} -type d -print | ${SORT} -r |	\
		${GREP} -v "^${PREFIX}$$" |				\
		${_PLIST_IGNORE_CMD} |					\
		${SED} -e "s|^${DESTDIR}${PREFIX}/|@unexec ${RMDIR} -p %D/|"	\
		       -e "s,$$, 2>/dev/null || ${TRUE},";
.else
_GENERATE_PLIST=	${CAT} /dev/null ${PLIST_SRC}; ${GENERATE_PLIST}
.endif

.PHONY: plist
plist: ${PLIST} ${_PLIST_NOKEYWORDS}

.if (${PLIST_TYPE} == "static") && !empty(PLIST_SRC)
${PLIST}: ${PLIST_SRC}
.endif
${PLIST}:
	${RUN} ${MKDIR} ${.TARGET:H}
	${RUN} { ${_GENERATE_PLIST} } > ${.TARGET}-1src
	${RUN} ${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_1_AWK} < ${.TARGET}-1src > ${.TARGET}-2mac
	${RUN} ${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_AWK} < ${.TARGET}-2mac > ${.TARGET}-3mag
	${RUN} ${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_SHLIB_AWK} < ${.TARGET}-3mag > ${.TARGET}

# for list of keywords see pkg_create(1)
${_PLIST_NOKEYWORDS}: ${PLIST}
	${_PKG_SILENT}${_PKG_DEBUG} ${AWK} < ${PLIST} > ${.TARGET} '	\
		BEGIN {							\
			FILTER="@(";					\
			FILTER=FILTER"cd|cwd|src|exec|unexec|mode|option";\
			FILTER=FILTER"|owner|group|comment|ignore";	\
			FILTER=FILTER"|ignore_inst|name|dirrm|mtree";	\
			FILTER=FILTER"|display|pkgdep|blddep|pkgcfl";	\
			FILTER=FILTER")[[:space:]]";			\
		};							\
		$$0 ~ FILTER { next };					\
		{ print }'

.if defined(INFO_FILES)
INFO_FILES_cmd=								\
	${CAT} ${PLIST} |						\
	${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_INFO_AWK} |		\
	${AWK} '($$0 !~ "-[0-9]*(\\.gz)?$$") { print }'
.endif
