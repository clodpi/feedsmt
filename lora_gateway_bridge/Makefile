include $(TOPDIR)/rules.mk

PKG_NAME:=lora_gw_bridge
PKG_VERSION:=1.0.0
PKG_RELEASE=$(PKG_VERSION)

PKG_SOURCE_PROTO:=git
include $(INCLUDE_DIR)/package.mk

define Package/lora_gateway_bridge
	TITLE:=LoRa Gateway Bridge
endef

define Build/Prepare
	true
endef

define Build/Configure
	true
endef

define Build/Compile
	true
endef

define Package/lora_gateway_bridge/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,lora_gateway_bridge))
