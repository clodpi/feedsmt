# Author: Daniel Knox <d.knox@kent.ac.uk>

include $(TOPDIR)/rules.mk

PKG_NAME:=lora_packet_forwarder_legacy
PKG_VERSION:=4.0.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Dan Knox <d.knox@kent.ac.uk>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/danielknox/lora_packet_forwarder_legacy.git
PKG_SOURCE_VERSION:=master
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/lora_packet_forwarder_legacy
  TITLE:=Lora Packet Forwarder Legacy
	DEPENDS:=+lora_gateway
	SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Lora
endef

define Package/lora_packet_forwarder_legacy/description
	LoRa Packet forwarder for Linux based gateways
endef

TARGET_CFLAGS += $(FPIC) -O2 -Wall -Wextra -std=c99 -Iinc -I.

define Package/lora_packet_forwarder_legacy/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lora_pkt_fwd/lora_pkt_fwd $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/lora
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/lora_pkt_fwd/global_conf.json $(1)/etc/lora/global_legacy_conf.json
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/lora_pkt_fwd/local_conf.json $(1)/etc/lora/local_legacy_conf.sample.json
endef

$(eval $(call BuildPackage,lora_packet_forwarder_legacy))
