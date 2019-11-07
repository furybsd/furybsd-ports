# $FreeBSD$

PORTNAME=	furybsd-xfce-settings
PORTVERSION=	%%CHGVERSION%%
CATEGORIES=	x11

MAINTAINER=	jmaloney@furybsd.org
COMMENT=	FuryBSD XFCE settings

LICENSE=	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	furybsd
GH_PROJECT=	furybsd-xfce-settings
GH_TAGNAME=	%%GHTAG%%

NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}/${PREFIX}/share/furybsd/xfce-settings/etc/xdg
	${CP} -R   ${WRKSRC}/etc/xdg/* ${STAGEDIR}/${PREFIX}/share/furybsd/xfce-settings/etc/xdg
.include <bsd.port.mk>
