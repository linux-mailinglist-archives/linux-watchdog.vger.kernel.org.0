Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF5A89936
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 11:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfHLJDX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 05:03:23 -0400
Received: from inva021.nxp.com ([92.121.34.21]:41688 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbfHLJDW (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 05:03:22 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 314A920020D;
        Mon, 12 Aug 2019 11:03:21 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DC5D62002FB;
        Mon, 12 Aug 2019 11:03:12 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8424B40313;
        Mon, 12 Aug 2019 17:03:02 +0800 (SGT)
From:   Anson.Huang@nxp.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux@armlinux.org.uk,
        otavio@ossystems.com.br, leonard.crestez@nxp.com,
        u.kleine-koenig@pengutronix.de, schnitzeltony@gmail.com,
        jan.tuerk@emtrion.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 4/4] ARM: dts: imx7ulp: Add wdog1 node
Date:   Mon, 12 Aug 2019 16:53:21 +0800
Message-Id: <20190812085321.13823-4-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190812085321.13823-1-Anson.Huang@nxp.com>
References: <20190812085321.13823-1-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

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

