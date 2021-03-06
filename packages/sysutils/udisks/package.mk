################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="udisks"
PKG_VERSION="1.0.4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.freedesktop.org/wiki/Software/udisks"
PKG_URL="http://hal.freedesktop.org/releases/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS="systemd glib dbus parted polkit libatasmart"
PKG_BUILD_DEPENDS_TARGET="toolchain sg3_utils systemd glib dbus dbus-glib parted polkit libatasmart"
PKG_PRIORITY="optional"
PKG_SECTION="system"
PKG_SHORTDESC="udisks: a modular hardware abstraction layer designed for use in Linux systems that is designed to simplify device management."
PKG_LONGDESC="Udisks is a modular hardware abstraction layer designed for use in Linux systems that is designed to simplify device management and replace the current monolithic Linux HAL. Udisks includes the ability to enumerate system devices and send notifications when hardware is added or removed from the computer system."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--datadir=/usr/share \
                           --libexecdir=/usr/lib/udisks \
                           --disable-man-pages \
                           --disable-gtk-doc \
                           --disable-gtk-doc-html \
                           --disable-gtk-doc-pdf \
                           --disable-lvm2 \
                           --disable-dmmp \
                           --disable-remote-access \
                           --enable-nls"

post_makeinstall_target() {
  rm -rf $INSTALL/etc/profile.d
  rm -rf $INSTALL/lib/udev/rules.d
}
