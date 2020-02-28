# $FreeBSD$

PORTNAME=	furybsd-gnome-desktop
PORTVERSION=	%%CHGVERSION%%
CATEGORIES?=	x11

MAINTAINER=	jmaloney@furybsd.org
COMMENT?=	"meta-port" for the Gnome integrated FuryBSD desktop

RUN_DEPENDS?=	furybsd-update:sysutils/furybsd-update \
		furybsd-xorg-tool:x11-drivers/furybsd-xorg-tool \
		${LOCALBASE}/share/furybsd/common-settings/etc/doas.conf:x11/furybsd-common-settings \
		${LOCALBASE}/share/backgrounds/furybsd/fury_road.png:x11-themes/furybsd-wallpapers

CONFLICTS?=	furybsd-kde-desktop-[0-9]* \
		furybsd-xfce-desktop-[0-9]*

USES=		metaport

.include <bsd.port.options.mk>
.include <bsd.port.mk>
