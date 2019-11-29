# $FreeBSD$

PORTNAME=	furybsd-common-settings
PORTVERSION=	%%CHGVERSION%%
CATEGORIES=	x11

MAINTAINER=	jmaloney@furybsd.org
COMMENT=	FuryBSD Common settings

LICENSE=	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	furybsd
GH_PROJECT=	furybsd-common-settings
GH_TAGNAME=	%%GHTAG%%

NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}/${PREFIX}/share/furybsd/common-settings/etc
	${CP} -R   ${WRKSRC}/etc/* ${STAGEDIR}/${PREFIX}/share/furybsd/common-settings/etc
.include <bsd.port.mk>
