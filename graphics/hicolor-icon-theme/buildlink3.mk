# $NetBSD: buildlink3.mk,v 1.14 2009/01/13 16:27:24 wiz Exp $

BUILDLINK_TREE+=	hicolor-icon-theme

.if !defined(HICOLOR_ICON_THEME_BUILDLINK3_MK)
HICOLOR_ICON_THEME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hicolor-icon-theme+=	hicolor-icon-theme>=0.4
BUILDLINK_ABI_DEPENDS.hicolor-icon-theme+=	hicolor-icon-theme>=0.9nb1
BUILDLINK_PKGSRCDIR.hicolor-icon-theme?=../../graphics/hicolor-icon-theme

.include "../../mk/bsd.fast.prefs.mk"

dirs!=	${GREP} "^@dirrm" ${.CURDIR}/../../graphics/hicolor-icon-theme/PLIST | \
	${CUT} -d ' ' -f 2
.  for d in ${dirs}
PRINT_PLIST_AWK+=	/^@exec ..MKDIR. %D\/${d:S/\//\\\//g}$$/ { next; }
PRINT_PLIST_AWK+=	/^@dirrm ${d:S/\//\\\//g}$$/ \
			{ print "@comment in hicolor-icon-theme: " $$0; next; }
.  endfor
.  undef dirs

.if !defined(HICOLOR_ICON_THEME_DEPEND_ONLY)
EVAL_PREFIX+=		PREFIX.gtk2=gtk2+
FILES_SUBST+=		GTK_UPDATE_ICON_CACHE="${PREFIX.gtk2}/bin/gtk-update-icon-cache"
FILES_SUBST+=		ICON_THEME_DIR="${BUILDLINK_PREFIX.hicolor-icon-theme}/share/icons/hicolor"
INSTALL_TEMPLATES+=	../../graphics/hicolor-icon-theme/files/icon-cache.tmpl
DEINSTALL_TEMPLATES+=	../../graphics/hicolor-icon-theme/files/icon-cache.tmpl

# The icon-theme cache file generated by gtk-update-icon-cache should
# never be in any PLIST.
#
PRINT_PLIST_AWK+=	/^share\/icons\/hicolor\/icon-theme.cache$$/ { next; }
CHECK_FILES_SKIP+=	${PREFIX}/share/icons/hicolor/icon-theme.cache

BUILDLINK_TARGETS+=	guic-buildlink-fake
_GUIC_FAKE=		${BUILDLINK_DIR}/bin/gtk-update-icon-cache

.PHONY: guic-buildlink-fake
guic-buildlink-fake:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if [ ! -f ${_GUIC_FAKE} ]; then					\
		${ECHO_BUILDLINK_MSG} "Creating ${_GUIC_FAKE}";	\
		${MKDIR} ${_GUIC_FAKE:H};				\
		${ECHO} "#!${SH}" > ${_GUIC_FAKE};			\
		${CHMOD} +x ${_GUIC_FAKE};				\
	fi
.endif	# HICOLOR_ICON_THEME_DEPEND_ONLY
.endif # HICOLOR_ICON_THEME_BUILDLINK3_MK

BUILDLINK_TREE+=	-hicolor-icon-theme
