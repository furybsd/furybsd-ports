# $FreeBSD$

PORTNAME=	furybsd-xorg-tool
PORTVERSION=	%%CHGVERSION%%
CATEGORIES=	x11

MAINTAINER=	jmaloney@furybsd.org
COMMENT=	FuryBSD Xorg Tool

LICENSE=	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	furybsd
GH_PROJECT=	furybsd-xorg-tool
GH_TAGNAME=	%%GHTAG%%

NO_BUILD=	yes

do-install:
	${CP} -PR ${WRKSRC}/bin/* ${STAGEDIR}${PREFIX}/bin
.include <bsd.port.mk>
