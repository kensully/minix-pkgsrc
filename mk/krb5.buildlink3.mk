# $NetBSD$

KRB5_BUILDLINK3_MK:=	${KRB5_BUILDLINK3_MK}+

.include "../../mk/bsd.prefs.mk"

.if !empty(KRB5_BUILDLINK3_MK)
KRB5_DEFAULT?=	# empty
KRB5_ACCEPTED?=	${_KRB5_PKGS}

# This is an exhaustive list of all of the Kerberos 5 implementations
# that may be used with krb5.buildlink3.mk, in order of precedence.
#
_KRB5_PKGS?=	heimdal #mit-krb5

_KRB5_DEFAULT=	${KRB5_DEFAULT}
_KRB5_ACCEPTED=	${KRB5_ACCEPTED}

# Mark the acceptable Kerberos 5 packages and check which, if any, are
# already installed.
#
.  for _krb5_ in ${_KRB5_ACCEPTED}
_KRB5_OK.${_krb5_}=	yes
.    if !defined(_KRB5_INSTALLED.${_krb5_})
_KRB5_INSTALLED.${_krb5_}!=	\
	if ${PKG_INFO} -qe ${_krb5_}; then				\
		${ECHO} "yes";						\
	else								\
		${ECHO} "no";						\
	fi
MAKEFLAGS+=	_KRB5_INSTALLED.${_krb5_}="${_KRB5_INSTALLED.${_krb5_}}"
.    endif
.  endfor

.  if !defined(_KRB5)
#
# Prefer the default one if it's accepted,...
#
.    if !empty(_KRB5_DEFAULT) && \
	defined(_KRB5_OK.${_KRB5_DEFAULT}) && \
	!empty(_KRB5_OK.${_KRB5_DEFAULT}:M[yY][eE][sS])
_KRB5=		${_KRB5_DEFAULT}
.    endif
#
# ...otherwise, use one of the installed Kerberos 5 packages,...
#
.    for _krb5_ in ${_KRB5_ACCEPTED}
.      if !empty(_KRB5_INSTALLED.${_krb5_}:M[yY][eE][sS])
_KRB5?=		${_krb5_}
.      else
_KRB5_FIRSTACCEPTED?=	${_krb5_}
.      endif
.    endfor
#
# ...otherwise, just use the first accepted Kerberos 5 package.
#
.    if defined(_KRB5_FIRSTACCEPTED)
_KRB5?=		${_KRB5_FIRSTACCEPTED}
.    endif
_KRB5?=		none
MAKEFLAGS+=	_KRB5="${_KRB5}"
.  endif

KRB5_TYPE=	${_KRB5}
BUILD_DEFS+=	KRB5_TYPE

.  if ${KRB5_TYPE} == "none"
PKG_FAIL_REASON=	"No acceptable Kerberos 5 implementation found."
.  elif ${KRB5_TYPE} == "heimdal"
KRB5BASE=	${BUILDLINK_PREFIX.heimdal}
.    include "../../security/heimdal/buildlink3.mk"
.  elif ${KRB5_TYPE} == "mit-krb5"
KRB5BASE=	${BUILDLINK_PREFIX.mit-krb5}
.    include "../../security/mit-krb5/buildlink3.mk"
.  endif
BUILD_DEFS+=	KRB5BASE

.endif	# KRB5_BUILDLINK3_MK
