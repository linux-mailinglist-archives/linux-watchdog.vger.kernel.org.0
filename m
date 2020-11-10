Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27FE2ACFD2
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Nov 2020 07:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730217AbgKJGg7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Nov 2020 01:36:59 -0500
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:36840 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726010AbgKJGg7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Nov 2020 01:36:59 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4385088|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_system_inform|0.00646372-0.000493263-0.993043;FP=11946349065999613887|1|1|17|0|-1|-1|-1;HT=ay29a033018047209;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.Iup7tB7_1604990210;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.Iup7tB7_1604990210)
          by smtp.aliyun-inc.com(10.147.40.2);
          Tue, 10 Nov 2020 14:36:54 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     tiny.windzz@gmail.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yangtao Li <frank@allwinnertech.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [RESEND PATCH 10/19] dt-bindings: watchdog: sun4i: Add A100 compatible
Date:   Tue, 10 Nov 2020 14:36:48 +0800
Message-Id: <cd080363346d5019658afecfb251b019b4e25049.1604988979.git.frank@allwinnertech.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604988979.git.frank@allwinnertech.com>
References: <cover.1604988979.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Yangtao Li <frank@allwinnertech.com>

Add a binding for A100's watchdog controller.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index e8f226376108..5ac607de8be4 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -21,6 +21,9 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-wdt
           - const: allwinner,sun6i-a31-wdt
+      - items:
+          - const: allwinner,sun50i-a100-wdt
+          - const: allwinner,sun6i-a31-wdt
       - items:
           - const: allwinner,sun50i-h6-wdt
           - const: allwinner,sun6i-a31-wdt
-- 
2.28.0

