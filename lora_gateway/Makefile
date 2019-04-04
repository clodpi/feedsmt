# Author: Karthi ClodPi

include $(TOPDIR)/rules.mk

PKG_NAME:=lora_gateway
PKG_VERSION:=1.1
PKG_RELEASE:=v0.2.2
PKG_MAINTAINER:=Karthi ClodPi

PKG_SOURCE_PROTO:=git
#PKG_SOURCE_URL:=https://github.com/danielknox/lora_gateway.git
PKG_SOURCE_URL:=git@github.com:Lora-net/picoGW_hal.git
PKG_SOURCE_VERSION:=master
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
# We override "packagename-packageversion", because
# other packages reference to the build dir of this package
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/lora_gateway_pico
  TITLE:=Lora Gateway Package
	DEPENDS:=+librt
	SECTION:=libs
  CATEGORY:=Libraries
endef

define Package/lora_gateway_pico/description
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

define Package/lora_gateway_pico/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libloragw/test* $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_pkt_logger/util_pkt_logger $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_continuous/util_tx_continuous $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_com_stress/util_com_stress $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_test/util_tx_test $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_boot/util_boot $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_chip_id/util_chip_id $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lora_indent.sh $(1)/usr/bin
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,lora_gateway_pico))
