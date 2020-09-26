Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3542B279ABA
	for <lists+linux-watchdog@lfdr.de>; Sat, 26 Sep 2020 18:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbgIZQXZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 26 Sep 2020 12:23:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:59696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIZQXY (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 26 Sep 2020 12:23:24 -0400
Received: from localhost.localdomain (unknown [194.230.155.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB84321D7F;
        Sat, 26 Sep 2020 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601137404;
        bh=23S8PlmoizwoDDCnCcCrWFCxtImXsCXRd9SYnjug7u4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=toF7ShKescNDouGdXJ3ukzImtXw9kCEOA+T0vXe5Sd2sxB5M0Zs/wI5Z8YjS4DJ4q
         WGtMXeJpG0xW8SPaxlz4vDtI/NUgAJNJeTxyDUdB8e1a5s+56NcrmQUooO7vToScUN
         fNfEuk59n7jyFr4i+32j2vNcNZkVAl+85vmQWcHA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/3] ARM: dts: vf: align watchdog node name with dtschema
Date:   Sat, 26 Sep 2020 18:23:02 +0200
Message-Id: <20200926162302.32525-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926162302.32525-1-krzk@kernel.org>
References: <20200926162302.32525-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The dtschema expects watchdog device node name to be "watchdog":

  arch/arm/boot/dts/vf500-colibri-eval-v3.dt.yaml: wdog@4003e000:
    $nodename:0: 'wdog@4003e000' does not match '^watchdog(@.*|-[0-9a-f])?$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/vfxxx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 2259d11af721..0c8d15fd9253 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -293,7 +293,7 @@
 				status = "disabled";
 			};
 
-			wdoga5: wdog@4003e000 {
+			wdoga5: watchdog@4003e000 {
 				compatible = "fsl,vf610-wdt", "fsl,imx21-wdt";
 				reg = <0x4003e000 0x1000>;
 				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1

