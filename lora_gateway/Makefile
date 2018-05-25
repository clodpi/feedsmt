# Author: Daniel Knox <d.knox@kent.ac.uk>

include $(TOPDIR)/rules.mk

PKG_NAME:=lora_gateway
PKG_VERSION:=5.0.1
PKG_RELEASE:=v1.0.0
PKG_MAINTAINER:=Dan Knox <d.knox@kent.ac.uk>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/danielknox/lora_gateway.git
PKG_SOURCE_VERSION:=master
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
# We override "packagename-packageversion", because
# other packages reference to the build dir of this package
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/lora_gateway
  TITLE:=Lora Gateway Package
	DEPENDS:=+librt
	SECTION:=libs
  CATEGORY:=Libraries
endef

define Package/lora_gateway/description
  Lora Gateway is an interface library to build a gateway based on
  a concentrator board e.g. IC880A or RAK831 .
  Note: currently this package is hardcoded to Mediatek MT76xx,
  and thus dependent on that target.
endef

TARGET_CFLAGS += $(FPIC) -O2 -Wall -Wextra -std=c99 -Iinc -I.

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/$(PKG_NAME)
	$(CP) $(PKG_BUILD_DIR)/libloragw/inc/* $(1)/usr/include/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libloragw/libloragw.a $(1)/usr/lib/
endef

define Package/lora_gateway/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libloragw/test* $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_pkt_logger/util_pkt_logger $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_continuous/util_tx_continuous $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_spi_stress/util_spi_stress $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_test/util_tx_test $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/reset_lgw.sh $(1)/usr/bin
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,lora_gateway))
