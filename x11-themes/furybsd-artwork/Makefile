# $FreeBSD$

PORTNAME=	furybsd-artwork
PORTVERSION=	12.1
CATEGORIES=	x11-themes

MAINTAINER=	jmaloney@furybsd.org
COMMENT=	FuryBSD wallpaper colection

LICENSE=	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	furybsd
GH_PROJECT=	furybsd-artwork
GH_TAGNAME=	master

NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/backgrounds/furybsd
	${CP} -PR ${WRKSRC}/*.jpg ${STAGEDIR}${PREFIX}/share/backgrounds/furybsd
	# ${CP} -PR ${WRKSRC}/*.png ${STAGEDIR}${PREFIX}/share/backgrounds/furybsd
.include <bsd.port.mk>
