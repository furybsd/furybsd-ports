# $FreeBSD$

PORTNAME=	furybsd-xfce-desktop
PORTVERSION=	%%CHGVERSION%%
CATEGORIES?=	x11

MAINTAINER=	jmaloney@furybsd.org
COMMENT?=	"meta-port" for the XFCE integrated FuryBSD desktop

RUN_DEPENDS?=	furybsd-xorg-tool:x11-drivers/furybsd-xorg-tool \
		${LOCALBASE}/share/backgrounds/furybsd/fury_road.png:x11-themes/furybsd-wallpapers \
		${LOCALBASE}/share/furybsd/common-settings/etc/doas.conf:x11/furybsd-common-settings \
		${LOCALBASE}/share/furybsd/xfce-settings/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml:x11/furybsd-xfce-settings


CONFLICTS?=	furybsd-gnome-desktop-[0-9]* \
		furybsd-kde-desktop-[0-9]*

USES=		metaport

.include <bsd.port.options.mk>
.include <bsd.port.mk>
