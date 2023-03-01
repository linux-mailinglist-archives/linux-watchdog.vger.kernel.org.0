Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673FA6A69A8
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Mar 2023 10:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjCAJUD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Mar 2023 04:20:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCAJUC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Mar 2023 04:20:02 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2CB2DE74;
        Wed,  1 Mar 2023 01:20:01 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id az36so8086588wmb.1;
        Wed, 01 Mar 2023 01:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677662400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2v2Z5ZAJAE3AkqP3wTiWZfs6czfSMkDVDFA1arlPKdk=;
        b=YOSWz2zNyQ+o4XYLOZ08BdKzxKhMce0VbkPb95cCeL5PDT+gO+vHFVoaCfgGzr20ZB
         Z7/bXmxv2I30+5fgb9Q7llOleQzV5fD9bZbcBA2EzBZPY5neQVWlJMxn4FEowtks09c1
         X9B1elevpXdY2nGY8ehshXIYMwdE3/J/CLqmsx2JpUlhESQ/oEfHLH1TXGA5B+hDJAUZ
         ydpPLS8Z7Fs3k3SsHN+xNq+08mG0VQYQzTFoJTtehXDPzLmKpuh0ACL7g2RiZ32C8s9y
         aMLS7Ijy2KLCIcvy/GD5lH1mxjaI/dULRBB3OMUO6cmpeuXBg4RR9vH2C8sbBgiQUg5Z
         2o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677662400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2v2Z5ZAJAE3AkqP3wTiWZfs6czfSMkDVDFA1arlPKdk=;
        b=unntgKJxVPu5MeV9YJxkDBdHYYxBIn3fY0aLMprxjkGtkldpPhAs2eTHATAewkrZgK
         hNjUXmsfiAd43AHEsp9x6bFxmXzh9PfJ68G4Z6zKidesp+ZwVE17t2dxZw96HBgBQzy2
         VOwN/CCswTXwhZuk4sdMYtk/qGfG2Tn9E6iUtkpImEGoKurJ3X9iVQHB01uqayv6udQ7
         oJPUREMHoNnTJZ82u4NK/g19zbqzygvKGIGlcDgFCoY1KYlAGQFnD/wEGWA4flZihMw8
         hyO9deRPfYY883BFF18Yhn1cb1q1CpwXrwpA65/jPhWi8t+n+OPhIYkJ5GbTTVf0+3AM
         yNzw==
X-Gm-Message-State: AO0yUKUztQW1KE3/t7PbneK8DTvW6RHE9X4EuoipfmggUxhFD0fgHtrd
        OEYtDYwjzs6ifquhiCMOG2Jk7SuskF4=
X-Google-Smtp-Source: AK7set+hb4i9vLUbmrGfnHE1crI0InRYGxZ/woMKdlusPWa2L3J2HoIc7b/dTDcoG2ZV1SaG9brkzA==
X-Received: by 2002:a05:600c:1898:b0:3dc:58a2:3900 with SMTP id x24-20020a05600c189800b003dc58a23900mr4373844wmp.29.1677662399860;
        Wed, 01 Mar 2023 01:19:59 -0800 (PST)
Received: from localhost.localdomain (106.red-88-13-29.dynamicip.rima-tde.net. [88.13.29.106])
        by smtp.gmail.com with ESMTPSA id h16-20020adff4d0000000b002c70851fdd8sm12137908wrp.75.2023.03.01.01.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 01:19:59 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH] dt-bindings: watchdog: migrate rt2880 text bindings to YAML
Date:   Wed,  1 Mar 2023 10:19:57 +0100
Message-Id: <20230301091957.2824172-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Ralink RT2880 Watchdog bindings used text format, so migrate them to YAML.
There are some additions to the binding that were not in the original
txt file. This binding is used in RT2880, RT3050, RT3352, RT3883, RT5350,
and MT7620 SoCs. To properly match all dts nodes included in openWRT git
trees we need to add to the schema 'reset' and 'reset-names'. 'reset-names'
property is always string 'wdt' so maintain that as const in the schema.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/watchdog/ralink,rt2880-wdt.yaml  | 47 +++++++++++++++++++
 .../bindings/watchdog/rt2880-wdt.txt          | 18 -------
 2 files changed, 47 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
new file mode 100644
index 000000000000..c96bf2e61364
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/ralink,rt2880-wdt.yaml#
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
+    const: ralink,rt2880-wdt
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: wdt
+
+  interrupts:
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
+      compatible = "ralink,rt2880-wdt";
+      reg = <0x100 0x100>;
+      resets = <&rstctrl 8>;
+      reset-names = "wdt";
+      interrupt-parent = <&intc>;
+      interrupts = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt b/Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt
deleted file mode 100644
index 05b95bfa2a89..000000000000
--- a/Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Ralink Watchdog Timers
-
-Required properties:
-- compatible: must be "ralink,rt2880-wdt"
-- reg: physical base address of the controller and length of the register range
-
-Optional properties:
-- interrupts: Specify the INTC interrupt number
-
-Example:
-
-	watchdog@120 {
-		compatible = "ralink,rt2880-wdt";
-		reg = <0x120 0x10>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <1>;
-	};
-- 
2.25.1

