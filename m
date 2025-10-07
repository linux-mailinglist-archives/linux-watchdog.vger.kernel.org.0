Return-Path: <linux-watchdog+bounces-4339-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E24BC0C52
	for <lists+linux-watchdog@lfdr.de>; Tue, 07 Oct 2025 10:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97B0E3ABDC6
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Oct 2025 08:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DC12D7D47;
	Tue,  7 Oct 2025 08:42:04 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C542D738B;
	Tue,  7 Oct 2025 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826524; cv=none; b=AN7gM1FIhg/DBg+QjjNXYdFhQv+PW399f+9xLKN3NsswlkD5LOX9V8pNLEUhBeGmsWNyj+daOqcCiDO048d0AQ6YHaC4OGSbvUcMj+dFsD0T0U2mNpMcDYnhwU8V3yHz8rLkk54QxZYwbJpYmlu40PGBH9EoXuAorRaDLcpLn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826524; c=relaxed/simple;
	bh=APmK2L6UrCQl6NgaHDMaUchVqQPcMFMu3uXKur2UfA8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4HibE721iqKeIBin0yVuudwsUUjC0HJXTA/rMAUPMawy+sWM9xQSaPzU43/64a97Bya6YUwLyh4K7kHvZYMiR+4Y9dvSzllCOk+NYVol5dc8Ao5FFwJNocsAXvmlE4HgWYcGUWZ0Ke/dQQXukuS3idxP7eo3+hLowa/F/5PvsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 7 Oct
 2025 16:36:50 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 7 Oct 2025 16:36:50 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH 1/3] dt-bindings: watchdog: aspeed,ast2400-wdt: Add support for AST2700
Date: Tue, 7 Oct 2025 16:36:48 +0800
Message-ID: <20251007083650.2155317-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
References: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support for the AST2700 SoC in the ASPEED watchdog device tree
bindings. This includes:

- Adding "aspeed,ast2700-wdt" to the compatible string list.
- Extending the "aspeed,reset-mask" property description for AST2700.
- Defining AST2700-specific reset mask bits in aspeed-wdt.h,
  covering RESET1 to RESET5.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 .../bindings/watchdog/aspeed,ast2400-wdt.yaml |   8 +-
 include/dt-bindings/watchdog/aspeed-wdt.h     | 138 ++++++++++++++++++
 2 files changed, 144 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
index be78a9865584..9322cb5b462a 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
@@ -15,6 +15,7 @@ properties:
       - aspeed,ast2400-wdt
       - aspeed,ast2500-wdt
       - aspeed,ast2600-wdt
+      - aspeed,ast2700-wdt
 
   reg:
     maxItems: 1
@@ -87,13 +88,15 @@ properties:
   aspeed,reset-mask:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 1
-    maxItems: 2
+    maxItems: 5
     description: >
       A bitmask indicating which peripherals will be reset if the watchdog
       timer expires. On AST2500 SoCs this should be a single word defined using
       the AST2500_WDT_RESET_* macros; on AST2600 SoCs this should be a two-word
       array with the first word defined using the AST2600_WDT_RESET1_* macros,
-      and the second word defined using the AST2600_WDT_RESET2_* macros.
+      and the second word defined using the AST2600_WDT_RESET2_* macros; on
+      AST2700 SoCs, this should be five-word array from AST2700_WDT_RESET1_*
+      macros to AST2700_WDT_RESET5_* macros.
 
 required:
   - compatible
@@ -114,6 +117,7 @@ allOf:
           enum:
             - aspeed,ast2500-wdt
             - aspeed,ast2600-wdt
+            - aspeed,ast2700-wdt
   - if:
       required:
         - aspeed,ext-active-high
diff --git a/include/dt-bindings/watchdog/aspeed-wdt.h b/include/dt-bindings/watchdog/aspeed-wdt.h
index 7ae6d84b2bd9..89fa31ffce2d 100644
--- a/include/dt-bindings/watchdog/aspeed-wdt.h
+++ b/include/dt-bindings/watchdog/aspeed-wdt.h
@@ -89,4 +89,142 @@
 
 #define AST2600_WDT_RESET2_DEFAULT 0x03fffff1
 
+#define AST2700_WDT_RESET1_CPU		(1 << 0)
+#define AST2700_WDT_RESET1_DRAM		(1 << 1)
+#define AST2700_WDT_RESET1_SLI0		(1 << 2)
+#define AST2700_WDT_RESET1_EHCI		(1 << 3)
+#define AST2700_WDT_RESET1_HACE		(1 << 4)
+#define AST2700_WDT_RESET1_SOC_MISC0	(1 << 5)
+#define AST2700_WDT_RESET1_VIDEO	(1 << 6)
+#define AST2700_WDT_RESET1_2D_GRAPHIC	(1 << 7)
+#define AST2700_WDT_RESET1_RAVS0	(1 << 8)
+#define AST2700_WDT_RESET1_RAVS1	(1 << 9)
+#define AST2700_WDT_RESET1_GPIO0	(1 << 10)
+#define AST2700_WDT_RESET1_SSP		(1 << 11)
+#define AST2700_WDT_RESET1_TSP		(1 << 12)
+#define AST2700_WDT_RESET1_CRT		(1 << 13)
+#define AST2700_WDT_RESET1_USB20_HOST	(1 << 14)
+#define AST2700_WDT_RESET1_USB11_HOST	(1 << 15)
+#define AST2700_WDT_RESET1_UFS		(1 << 16)
+#define AST2700_WDT_RESET1_EMMC		(1 << 17)
+#define AST2700_WDT_RESET1_AHB_TO_PCIE1	(1 << 18)
+#define AST2700_WDT_RESET1_XDMA0	(1 << 22)
+#define AST2700_WDT_RESET1_MCTP1	(1 << 23)
+#define AST2700_WDT_RESET1_MCTP0	(1 << 24)
+#define AST2700_WDT_RESET1_JTAG0	(1 << 25)
+#define AST2700_WDT_RESET1_ECC		(1 << 26)
+#define AST2700_WDT_RESET1_XDMA1	(1 << 27)
+#define AST2700_WDT_RESET1_DP		(1 << 28)
+#define AST2700_WDT_RESET1_DP_MCU	(1 << 29)
+#define AST2700_WDT_RESET1_AHB_TO_PCIE0	(1 << 31)
+
+#define AST2700_WDT_RESET1_DEFAULT 0x8207ff71
+
+#define AST2700_WDT_RESET2_USB3_A_HOST	(1 << 0)
+#define AST2700_WDT_RESET2_USB3_A_VHUB3	(1 << 1)
+#define AST2700_WDT_RESET2_USB3_A_VHUB2	(1 << 2)
+#define AST2700_WDT_RESET2_USB3_B_HOST	(1 << 3)
+#define AST2700_WDT_RESET2_USB3_B_VHUB3	(1 << 4)
+#define AST2700_WDT_RESET2_USB3_B_VHUB2	(1 << 5)
+#define AST2700_WDT_RESET2_SM3		(1 << 6)
+#define AST2700_WDT_RESET2_SM4		(1 << 7)
+#define AST2700_WDT_RESET2_SHA3		(1 << 8)
+#define AST2700_WDT_RESET2_RSA		(1 << 9)
+
+#define AST2700_WDT_RESET2_DEFAULT 0x000003f6
+
+#define AST2700_WDT_RESET3_LPC0		(1 << 0)
+#define AST2700_WDT_RESET3_LPC1		(1 << 1)
+#define AST2700_WDT_RESET3_MDIO		(1 << 2)
+#define AST2700_WDT_RESET3_PECI		(1 << 3)
+#define AST2700_WDT_RESET3_PWM		(1 << 4)
+#define AST2700_WDT_RESET3_MAC0		(1 << 5)
+#define AST2700_WDT_RESET3_MAC1		(1 << 6)
+#define AST2700_WDT_RESET3_MAC2		(1 << 7)
+#define AST2700_WDT_RESET3_ADC		(1 << 8)
+#define AST2700_WDT_RESET3_SDC		(1 << 9)
+#define AST2700_WDT_RESET3_ESPI0	(1 << 10)
+#define AST2700_WDT_RESET3_ESPI1	(1 << 11)
+#define AST2700_WDT_RESET3_JTAG1	(1 << 12)
+#define AST2700_WDT_RESET3_SPI0		(1 << 13)
+#define AST2700_WDT_RESET3_SPI1		(1 << 14)
+#define AST2700_WDT_RESET3_SPI2		(1 << 15)
+#define AST2700_WDT_RESET3_I3C0		(1 << 16)
+#define AST2700_WDT_RESET3_I3C1		(1 << 17)
+#define AST2700_WDT_RESET3_I3C2		(1 << 18)
+#define AST2700_WDT_RESET3_I3C3		(1 << 19)
+#define AST2700_WDT_RESET3_I3C4		(1 << 20)
+#define AST2700_WDT_RESET3_I3C5		(1 << 21)
+#define AST2700_WDT_RESET3_I3C6		(1 << 22)
+#define AST2700_WDT_RESET3_I3C7		(1 << 23)
+#define AST2700_WDT_RESET3_I3C8		(1 << 24)
+#define AST2700_WDT_RESET3_I3C9		(1 << 25)
+#define AST2700_WDT_RESET3_I3C10	(1 << 26)
+#define AST2700_WDT_RESET3_I3C11	(1 << 27)
+#define AST2700_WDT_RESET3_I3C12	(1 << 28)
+#define AST2700_WDT_RESET3_I3C13	(1 << 29)
+#define AST2700_WDT_RESET3_I3C14	(1 << 30)
+#define AST2700_WDT_RESET3_I3C15	(1 << 31)
+
+#define AST2700_WDT_RESET3_DEFAULT 0x000093ec
+
+#define AST2700_WDT_RESET4_FMC		(1 << 0)
+#define AST2700_WDT_RESET4_SOC_MISC1	(1 << 1)
+#define AST2700_WDT_RESET4_AHB		(1 << 2)
+#define AST2700_WDT_RESET4_SLI1		(1 << 3)
+#define AST2700_WDT_RESET4_UART0	(1 << 4)
+#define AST2700_WDT_RESET4_UART1	(1 << 5)
+#define AST2700_WDT_RESET4_UART2	(1 << 6)
+#define AST2700_WDT_RESET4_UART3	(1 << 7)
+#define AST2700_WDT_RESET4_I2C_MONITOR	(1 << 8)
+#define AST2700_WDT_RESET4_HOST_TO_SPI1	(1 << 9)
+#define AST2700_WDT_RESET4_HOST_TO_SPI2	(1 << 10)
+#define AST2700_WDT_RESET4_GPIO1	(1 << 11)
+#define AST2700_WDT_RESET4_FSI		(1 << 12)
+#define AST2700_WDT_RESET4_CANBUS	(1 << 13)
+#define AST2700_WDT_RESET4_MCTP		(1 << 14)
+#define AST2700_WDT_RESET4_XDMA		(1 << 15)
+#define AST2700_WDT_RESET4_UART5	(1 << 16)
+#define AST2700_WDT_RESET4_UART6	(1 << 17)
+#define AST2700_WDT_RESET4_UART7	(1 << 18)
+#define AST2700_WDT_RESET4_UART8	(1 << 19)
+#define AST2700_WDT_RESET4_BOOT_MCU	(1 << 20)
+#define AST2700_WDT_RESET4_IO_MCU	(1 << 21)
+#define AST2700_WDT_RESET4_LTPI0	(1 << 22)
+#define AST2700_WDT_RESET4_VGA_LINK	(1 << 23)
+#define AST2700_WDT_RESET4_LTPI1	(1 << 24)
+#define AST2700_WDT_RESET4_LTPI_PHY	(1 << 25)
+#define AST2700_WDT_RESET4_ACE		(1 << 26)
+#define AST2700_WDT_RESET4_LTPI_GPIO0	(1 << 28)
+#define AST2700_WDT_RESET4_LTPI_GPIO1	(1 << 29)
+#define AST2700_WDT_RESET4_AHB_TO_PCIE1	(1 << 30)
+#define AST2700_WDT_RESET4_I3C_DMA	(1 << 31)
+
+#define AST2700_WDT_RESET4_DEFAULT 0x40303803
+
+#define AST2700_WDT_RESET5_I2C_GLOBAL	(1 << 0)
+#define AST2700_WDT_RESET5_I2C0		(1 << 1)
+#define AST2700_WDT_RESET5_I2C1		(1 << 2)
+#define AST2700_WDT_RESET5_I2C2		(1 << 3)
+#define AST2700_WDT_RESET5_I2C3		(1 << 4)
+#define AST2700_WDT_RESET5_I2C4		(1 << 5)
+#define AST2700_WDT_RESET5_I2C5		(1 << 6)
+#define AST2700_WDT_RESET5_I2C6		(1 << 7)
+#define AST2700_WDT_RESET5_I2C7		(1 << 8)
+#define AST2700_WDT_RESET5_I2C8		(1 << 9)
+#define AST2700_WDT_RESET5_I2C9		(1 << 10)
+#define AST2700_WDT_RESET5_I2C10	(1 << 11)
+#define AST2700_WDT_RESET5_I2C11	(1 << 12)
+#define AST2700_WDT_RESET5_I2C12	(1 << 13)
+#define AST2700_WDT_RESET5_I2C13	(1 << 14)
+#define AST2700_WDT_RESET5_I2C14	(1 << 15)
+#define AST2700_WDT_RESET5_I2C15	(1 << 16)
+#define AST2700_WDT_RESET5_UHCI		(1 << 17)
+#define AST2700_WDT_RESET5_USB2_C_UART	(1 << 18)
+#define AST2700_WDT_RESET5_USB2_C	(1 << 19)
+#define AST2700_WDT_RESET5_USB2_D_UART	(1 << 20)
+#define AST2700_WDT_RESET5_USB2_D	(1 << 21)
+
+#define AST2700_WDT_RESET5_DEFAULT 0x00320000
+
 #endif
-- 
2.34.1


