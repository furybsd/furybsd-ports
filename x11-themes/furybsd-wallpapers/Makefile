# $FreeBSD$

PORTNAME=	furybsd-wallpapers
PORTVERSION=	%%CHGVERSION%%
CATEGORIES=	x11-themes

MAINTAINER=	jmaloney@furybsd.org
COMMENT=	FuryBSD wallpaper colection

LICENSE=	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	furybsd
GH_PROJECT=	furybsd-wallpapers
GH_TAGNAME=	%%GHTAG%%

NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/backgrounds/furybsd
	${CP} -PR ${WRKSRC}/*.jpg ${STAGEDIR}${PREFIX}/share/backgrounds/furybsd
	${CP} -PR ${WRKSRC}/*.png ${STAGEDIR}${PREFIX}/share/backgrounds/furybsd
.include <bsd.port.mk>
