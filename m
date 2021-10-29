Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B1943FE66
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 16:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhJ2O1P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Oct 2021 10:27:15 -0400
Received: from ixit.cz ([94.230.151.217]:52454 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230036AbhJ2O1P (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Oct 2021 10:27:15 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 89DE524E6A;
        Fri, 29 Oct 2021 16:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635517484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZihQDNGeVUfBNdMC0gYQ+olf4OatioTG3mWnhlOyNBY=;
        b=uwAEk4LJbEI40INmmQSf+gxuew37xokCcggJTtnLOe4f3ECBrWxo0DGr1SqVBttULrVA7l
        09Z3CSCrEZlxHOGTlBBD9v1GrV05LLcT1x8UV7LAjN+NMllYnx2vnOdWaK9TOo3F0wM5B5
        OVeBw8BqldeMCBMbCQSm63CelKzwjOQ=
From:   David Heidelberg <david@ixit.cz>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: sunxi: fix error in schema
Date:   Fri, 29 Oct 2021 16:24:42 +0200
Message-Id: <20211029142443.68779-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

"maxItems" is not needed with an "items" list

Fixes:
$ DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml make dtbs_check
Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml: properties:clocks: {'required': ['maxItems']} is not allowed for {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'High-frequency oscillator input, divided internally'}, {'description': 'Low-frequency oscillator input, only found on some variants'}]}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
...

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 44cad9427ae6..43afa24513b9 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -40,14 +40,12 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
     items:
       - description: High-frequency oscillator input, divided internally
       - description: Low-frequency oscillator input, only found on some variants
 
   clock-names:
     minItems: 1
-    maxItems: 2
     items:
       - const: hosc
       - const: losc
-- 
2.33.0

