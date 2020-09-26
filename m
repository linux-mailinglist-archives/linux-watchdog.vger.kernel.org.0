Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65DD2279AB3
	for <lists+linux-watchdog@lfdr.de>; Sat, 26 Sep 2020 18:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbgIZQXP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 26 Sep 2020 12:23:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIZQXP (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 26 Sep 2020 12:23:15 -0400
Received: from localhost.localdomain (unknown [194.230.155.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 937DF21527;
        Sat, 26 Sep 2020 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601137395;
        bh=XIeshJvYebNZ/vaBtAcXiowSKRhbbm96/BOwZKBD3uQ=;
        h=From:To:Cc:Subject:Date:From;
        b=kz/FYfcI+zfHIU0bS0BVeKe+8JzH7HGbKxBgJXrOeuwmEmA4anVUQcJjDXTXJnZzh
         krJVL5OtRqtBnw0184bp3mISTRDAu06Hy4PjEEG1x2RHKcVr3b+fH0TokhflArA2H0
         uXT2viSrHz0IxcVurC4jqPtIjv54f49hZk19Of2A=
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
Subject: [PATCH 1/3] dt-bindings: watchdog: fsl-imx: document i.MX compatibles
Date:   Sat, 26 Sep 2020 18:23:00 +0200
Message-Id: <20200926162302.32525-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Document all ARMv5, ARMv6 and ARMv7 i.MX compatibles used in DTSes (even
though driver binds only to fsl,imx21-wdt) to fix dtbs_check warnings
like:

  arch/arm/boot/dts/imx53-qsb.dt.yaml: gpio@53fe0000: compatible:
    ['fsl,imx53-gpio', 'fsl,imx35-gpio'] is not valid under any of the given schemas

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 991b4e33486e..a06e70f44fd0 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -18,10 +18,24 @@ properties:
       - const: fsl,imx21-wdt
       - items:
           - enum:
+              - fsl,imx25-wdt
+              - fsl,imx27-wdt
+              - fsl,imx31-wdt
+              - fsl,imx35-wdt
+              - fsl,imx50-wdt
+              - fsl,imx51-wdt
+              - fsl,imx53-wdt
+              - fsl,imx6q-wdt
+              - fsl,imx6sl-wdt
+              - fsl,imx6sll-wdt
+              - fsl,imx6sx-wdt
+              - fsl,imx6ul-wdt
+              - fsl,imx7d-wdt
               - fsl,imx8mm-wdt
               - fsl,imx8mn-wdt
               - fsl,imx8mp-wdt
               - fsl,imx8mq-wdt
+              - fsl,vf610-wdt
           - const: fsl,imx21-wdt
 
   reg:
-- 
2.17.1

