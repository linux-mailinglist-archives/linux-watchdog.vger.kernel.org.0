Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5B79899E
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Aug 2019 04:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730419AbfHVC4f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Aug 2019 22:56:35 -0400
Received: from inva021.nxp.com ([92.121.34.21]:45622 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730337AbfHVC4f (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Aug 2019 22:56:35 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6E7882005AD;
        Thu, 22 Aug 2019 04:56:33 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 69406200116;
        Thu, 22 Aug 2019 04:56:24 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5CBA4402A2;
        Thu, 22 Aug 2019 10:56:13 +0800 (SGT)
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
Subject: [PATCH V4 1/4] dt-bindings: watchdog: Add i.MX7ULP bindings
Date:   Wed, 21 Aug 2019 22:37:40 -0400
Message-Id: <1566441463-11911-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add the watchdog bindings for Freescale i.MX7ULP.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 .../bindings/watchdog/fsl-imx7ulp-wdt.txt          | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
new file mode 100644
index 0000000..d83fc5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
@@ -0,0 +1,22 @@
+* Freescale i.MX7ULP Watchdog Timer (WDT) Controller
+
+Required properties:
+- compatible : Should be "fsl,imx7ulp-wdt"
+- reg : Should contain WDT registers location and length
+- interrupts : Should contain WDT interrupt
+- clocks: Should contain a phandle pointing to the gated peripheral clock.
+
+Optional properties:
+- timeout-sec : Contains the watchdog timeout in seconds
+
+Examples:
+
+wdog1: wdog@403d0000 {
+	compatible = "fsl,imx7ulp-wdt";
+	reg = <0x403d0000 0x10000>;
+	interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
+	assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
+	assigned-clocks-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
+	timeout-sec = <40>;
+};
-- 
2.7.4

