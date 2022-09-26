Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 199895EADD4
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Sep 2022 19:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbiIZROj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Sep 2022 13:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiIZRN5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Sep 2022 13:13:57 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9B872EF3;
        Mon, 26 Sep 2022 09:25:53 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id r3-20020a05600c35c300b003b4b5f6c6bdso4014231wmq.2;
        Mon, 26 Sep 2022 09:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=uWxIDWo6d6ulV7u+9oTtUmVeA5PW8v4AGU7/1jgCws0=;
        b=elMkguhmGNDT1kZRFOSErvKdPaU+bXjz8+ahPxiocT7Wabt2J/Jj9PoN/xYN/vu5TT
         7owQ0AHiapjiS3YcFVZ75aG34FO2dJmHC/CigM+6xF8V2YGyp5qDDXpY3jiv2gsFbo8A
         Y+IEpTDkg1nCmYpZslbIpqGFZoBTHbU+iWO9GfO7KM7a4b/LZ9WFf6yOsUAJOPdHgoQe
         ofj+n7FhVEj9jVY5sEDpgMSEMMb5L3CnpT00KItuF27n6i0XNGFfSt0AhlmK74Z09PWf
         9worzrnfhIQyemjWX7JOPnVSLm5XPLFH4WnFKR33iCnnSgib/YhlRjkZL+uH51qYhy5A
         IwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=uWxIDWo6d6ulV7u+9oTtUmVeA5PW8v4AGU7/1jgCws0=;
        b=5gifwDYyOdtmKfu15NA9BxSCKshQbG5U4h8jZ5WSd3vEv5kR7syt+/PdexCT10LFEU
         4deo4Z1TfHvZk+ZpA/7QKzyKAHcY1sLYbH2CCtelzRYeF7+vHeY8MfDnHPTQau8RkSZH
         Ygqp4JWZhwllJcpegXPgeH9nbgk3E00hw0k8i5xyPQ36tfuVgqEnT/pn2bmlbaT+RrBx
         NKs1tzjoKPxXIhw3DkTxKJ7n3Z3kmqocN+4+l4sOXlqvAFyQpPmlY0qeEVb5sCNHDwnc
         FXYEFcyEp0iuWiLF/dOaT4yCUHQINMtY8glY8+0ujO/ng8JQGVhlQ8mVpGVQnSI75XCz
         IyUQ==
X-Gm-Message-State: ACrzQf3DdyV8tnJdJFWDpLiatDh5AhB0lc9loNiVEqS6Kf/gXwwoD3B1
        LWmhao0xQi6+9HE9ROIf0Fu10xrZJ1+gFw==
X-Google-Smtp-Source: AMsMyM6tLzVjQR4YOogCHp2eaBc7im1wIuOS+nPZmZHWjVHJNbwtKtg3/zgLp6qjtQuaG2GLqEAYrA==
X-Received: by 2002:a05:600c:4f06:b0:3b4:b67c:68bb with SMTP id l6-20020a05600c4f0600b003b4b67c68bbmr23052757wmq.36.1664209551982;
        Mon, 26 Sep 2022 09:25:51 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c35d200b003a5ffec0b91sm12346155wmq.30.2022.09.26.09.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 09:25:51 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, matthias.bgg@gmail.com, arinc.unal@arinc9.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v2] dt-bindings: watchdog: migrate mt7621 text bindings to YAML
Date:   Mon, 26 Sep 2022 18:25:49 +0200
Message-Id: <20220926162549.805108-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Soc Mt7621 Watchdog bindings used text format, so migrate them to YAML.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Changes in v2 RESEND:
- Resent sending also to watchdog maintainers.

Changes in v2:
 - Rebase onto last kernel version.
 - Add Krzysztof Reviewed-by tag.º

 .../watchdog/mediatek,mt7621-wdt.yaml         | 33 +++++++++++++++++++
 .../bindings/watchdog/mt7621-wdt.txt          | 12 -------
 2 files changed, 33 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
new file mode 100644
index 000000000000..b2b17fdf4e39
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/mediatek,mt7621-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink Watchdog Timers
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt7621-wdt
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    watchdog@100 {
+      compatible = "mediatek,mt7621-wdt";
+      reg = <0x100 0x100>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt b/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt
deleted file mode 100644
index c15ef0ef609f..000000000000
--- a/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Ralink Watchdog Timers
-
-Required properties:
-- compatible: must be "mediatek,mt7621-wdt"
-- reg: physical base address of the controller and length of the register range
-
-Example:
-
-	watchdog@100 {
-		compatible = "mediatek,mt7621-wdt";
-		reg = <0x100 0x10>;
-	};
-- 
2.25.1

