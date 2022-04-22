Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 654E750B298
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Apr 2022 10:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445436AbiDVIFU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Apr 2022 04:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445443AbiDVIFT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Apr 2022 04:05:19 -0400
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37E1527D1;
        Fri, 22 Apr 2022 01:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=cZWm1q63rwYi32f1VKD80rczQVSL9KwMkpmg6YC11cM=; b=PSkCcqo0nrud4oXCPvekf/9txM
        5q7ZlWXBzBOIdJ2TETKLOitv6M9pNEhPzeYA9+2BWPVKj5KSh4VGKx7TDGrapMquJQVK3FMKiqHRS
        HNVbmv4KKEF4po2JmQ/Jp6WQSoK72cxnrPQjghMvNhwl7uhQLANud0gxI1oBrxoo6qVf56OgW7QVV
        HD5jM2n9TO0fANCHzZlJEK9pRUBMkZhUlg6WBvE7N2E3p7TZlEgHW4H+rVXeiv0SHWsh3JsGNrpZA
        2h8nZ7tfFiePi8x6QhSGF8WKsi51rV1eAq+ebU5z0+1rI1X8fgyK8pRJk+vvmNBP1FEI0SmQnvJRj
        1s1KCSCg==;
Received: from [89.212.21.243] (port=36186 helo=localhost.localdomain)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <primoz.fiser@norik.com>)
        id 1nhnh2-007P6W-Qh;
        Fri, 22 Apr 2022 09:27:12 +0200
From:   Primoz Fiser <primoz.fiser@norik.com>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Primoz Fiser <primoz.fiser@norik.com>,
        Andrej Picej <andrej.picej@norik.com>, upstream@phytec.de
Subject: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend disable option
Date:   Fri, 22 Apr 2022 09:27:11 +0200
Message-Id: <20220422072713.3172345-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Document the watchdog disable option which can be used if the hardware
automatic suspend option is broken.

Based on commit c514430c51ee8 ("dt-bindings: watchdog: da9062: add
suspend disable option").

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 Documentation/devicetree/bindings/mfd/da9063.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
index 91b79a21d403..aa8b800cc4ad 100644
--- a/Documentation/devicetree/bindings/mfd/da9063.txt
+++ b/Documentation/devicetree/bindings/mfd/da9063.txt
@@ -64,10 +64,13 @@ Sub-nodes:
     and KEY_SLEEP.
 
 - watchdog : This node defines settings for the Watchdog timer associated
-  with the DA9063 and DA9063L. There are currently no entries in this
-  binding, however compatible = "dlg,da9063-watchdog" should be added
-  if a node is created.
+  with the DA9063 and DA9063L. The node should contain the compatible property
+  with the value "dlg,da9063-watchdog".
 
+  Optional watchdog properties:
+  - dlg,use-sw-pm: Add this property to disable the watchdog during suspend.
+  Only use this option if you can't use the watchdog automatic suspend
+  function during a suspend (see register CONTROL_B).
 
 Example:
 
-- 
2.25.1

