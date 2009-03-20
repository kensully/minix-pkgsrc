# $NetBSD: buildlink3.mk,v 1.30 2009/03/06 14:28:53 wiz Exp $

BUILDLINK_TREE+=	mono

.if !defined(MONO_BUILDLINK3_MK)
MONO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mono+=	mono>=2.2
BUILDLINK_PKGSRCDIR.mono?=	../../lang/mono
ALL_ENV+=			MONO_SHARED_DIR=${WRKDIR:Q}

PRINT_PLIST_AWK+=	/^@dirrm lib\/mono\/gac$$/ \
				{ print "@comment in mono: " $$0; next; }
PRINT_PLIST_AWK+=	/^@dirrm lib\/mono$$/ \
				{ print "@comment in mono: " $$0; next; }

.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.endif # MONO_BUILDLINK3_MK

BUILDLINK_TREE+=	-mono
