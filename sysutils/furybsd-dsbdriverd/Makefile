# Created by: Marcel Kaiser <mk@nic-nac-project.org>
# $FreeBSD: head/sysutils/dsbdriverd/Makefile 517085 2019-11-08 18:27:22Z tcberner $
# Added master port for testing with FuryBSD J.M.

PORTNAME=	dsbdriverd
PORTVERSION=	0.6.0
PORTREVISION=	1
CATEGORIES=	sysutils

MAINTAINER=	mk@nic-nac-project.org
COMMENT=	Hardware detecting, device driver loading daemon

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=     yes
GH_ACCOUNT=     furybsd
GH_PROJECT=     DSBDriverd
GH_TAGNAME=     44205bc719c0d8f4ed9517503756639597bd9f10

OPTIONS_DEFINE=	PCIIDS USBIDS

PCIIDS_DESC=	Use pci.ids database to show PCI device information
USBIDS_DESC=	Use usb.ids database to show USB device information

OPTIONS_DEFAULT=PCIIDS USBIDS

PCIIDS_RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:misc/pciids
USBIDS_RUN_DEPENDS=	${LOCALBASE}/share/usbids/usb.ids:misc/usbids

MAKE_ARGS+=	DBDIR=${DATADIR}
PCIIDS_MAKE_ARGS=	PCIDB0=${LOCALBASE}/share/pciids/pci.ids
USBIDS_MAKE_ARGS=	USBDB=${LOCALBASE}/share/usbids/usb.ids

PORTDATA=	drivers.db

USE_RC_SUBR=	dsbdriverd

PLIST_FILES=	libexec/dsbdriverd man/man8/dsbdriverd.8.gz

.include <bsd.port.mk>
