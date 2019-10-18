Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E822DC005
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2019 10:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632894AbfJRId5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Oct 2019 04:33:57 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:35600 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387458AbfJRId4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Oct 2019 04:33:56 -0400
Received: from droid12-sz.software.amlogic (10.28.8.22) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 18 Oct 2019
 16:33:54 +0800
From:   Xingyu Chen <xingyu.chen@amlogic.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
CC:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 4/4] arm64: dts: a1: add secure watchdog controller
Date:   Fri, 18 Oct 2019 16:33:41 +0800
Message-ID: <1571387622-35132-5-git-send-email-xingyu.chen@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571387622-35132-1-git-send-email-xingyu.chen@amlogic.com>
References: <1571387622-35132-1-git-send-email-xingyu.chen@amlogic.com>
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
index 7210ad0..047c323 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -93,6 +93,12 @@
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			watchdog {
+				compatible = "amlogic,meson-sec-wdt";
+				secure-monitor = <&sm>;
+				status = "okay";
+			};
 		};
 
 		gic: interrupt-controller@ff901000 {
-- 
2.7.4

