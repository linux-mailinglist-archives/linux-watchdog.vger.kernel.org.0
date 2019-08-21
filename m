Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2086496F72
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2019 04:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfHUC1D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 22:27:03 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57822 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727090AbfHUC05 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 22:26:57 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3A07A2004DF;
        Wed, 21 Aug 2019 04:26:55 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E2DEF20007F;
        Wed, 21 Aug 2019 04:26:46 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 96E7A40319;
        Wed, 21 Aug 2019 10:26:36 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux@armlinux.org.uk,
        otavio@ossystems.com.br, leonard.crestez@nxp.com,
        schnitzeltony@gmail.com, u.kleine-koenig@pengutronix.de,
        jan.tuerk@emtrion.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 4/4] ARM: dts: imx7ulp: Add wdog1 node
Date:   Tue, 20 Aug 2019 22:07:58 -0400
Message-Id: <1566353278-1884-4-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566353278-1884-1-git-send-email-Anson.Huang@nxp.com>
References: <1566353278-1884-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add wdog1 node to support watchdog driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 arch/arm/boot/dts/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index 6859a3a..1fdb5a35 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -264,6 +264,16 @@
 			#clock-cells = <1>;
 		};
 
+		wdog1: wdog@403d0000 {
+			compatible = "fsl,imx7ulp-wdt";
+			reg = <0x403d0000 0x10000>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
+			assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
+			assigned-clocks-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
+			timeout-sec = <40>;
+		};
+
 		pcc2: clock-controller@403f0000 {
 			compatible = "fsl,imx7ulp-pcc2";
 			reg = <0x403f0000 0x10000>;
-- 
2.7.4

