# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 23:10:56 jlam Exp $

BUILDLINK_TREE+=	sun-jdk15

.if !defined(SUN_JDK15_BUILDLINK3_MK)
SUN_JDK15_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.sun-jdk15+=	sun-jdk15-[0-9]*
BUILDLINK_ABI_DEPENDS.sun-jdk15?=	sun-jdk15>=5.0.6nb1
BUILDLINK_PKGSRCDIR.sun-jdk15?=	../../lang/sun-jdk15
BUILDLINK_DEPMETHOD.sun-jdk15?= build

BUILDLINK_PASSTHRU_DIRS+=	${BUILDLINK_JAVA_PREFIX.sun-jre15}

BUILDLINK_CPPFLAGS.sun-jdk15=						\
	-I${BUILDLINK_JAVA_PREFIX.sun-jre15}/include			\
	-I${BUILDLINK_JAVA_PREFIX.sun-jre15}/include/linux

.include "../../lang/sun-jre15/buildlink3.mk"
.endif # SUN_JDK15_BUILDLINK3_MK

BUILDLINK_TREE+=	-sun-jdk15
