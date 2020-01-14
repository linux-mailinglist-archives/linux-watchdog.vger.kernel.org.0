Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1F013A025
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2020 04:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgANDvC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jan 2020 22:51:02 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:60371 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgANDvC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jan 2020 22:51:02 -0500
Received: from droid12-sz.software.amlogic (10.28.8.22) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Tue, 14 Jan 2020
 11:51:28 +0800
From:   Xingyu Chen <xingyu.chen@amlogic.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
CC:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v6 5/5] arm64: dts: a1: add secure watchdog controller
Date:   Tue, 14 Jan 2020 11:50:58 +0800
Message-ID: <1578973858-10189-1-git-send-email-xingyu.chen@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.28.8.22]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Enable secure watchdog controller for Meson-A1 SoC

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 4dec518..d89a44b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -60,6 +60,12 @@
 
 	sm: secure-monitor {
 		compatible = "amlogic,meson-gxbb-sm";
+
+		watchdog {
+			compatible = "amlogic,meson-sec-wdt";
+			timeout-sec = <60>;
+			status = "okay";
+		};
 	};
 
 	soc {
-- 
2.7.4

