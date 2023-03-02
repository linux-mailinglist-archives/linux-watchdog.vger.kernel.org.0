Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4504B6A7D26
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Mar 2023 09:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjCBI7X (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Mar 2023 03:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjCBI7V (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Mar 2023 03:59:21 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539B6392BC;
        Thu,  2 Mar 2023 00:59:19 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p26so10170774wmc.4;
        Thu, 02 Mar 2023 00:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677747557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/Yn1LByFKwTiREbT5mICUxCRHDVOtqCXqSo309z0jY=;
        b=I8n8dBoaiF93Or2i+maeiKZkmB6WtFvWDpLguCDpKtsIqvFWQ+pXblCx1u9T/Tt1Ik
         9vaf+swHejK9ntokwrLPtXMkQCOJXegkpRIuD4TYSE8+v3WtWqT1jKPMo8wa9Izcwbhd
         FEOpVPZyT35ouf/XK3eF3LHeV1d1SzS0E0UmDU+gYwm8in3eiZdeXoH2xBYmba5QblAk
         oYw6pt08uuQE/KOoqP3O8XdicFRldyZdUzffAcW9Y3+tK3q/ubtGmpBARRb2rSvma8TL
         THuCmwNMdEDbcmWInC/iYeI4VBH99ZogTLRExOB/1dVNd3X7C4maZm/CtoDPyOhy+iaf
         711w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677747557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/Yn1LByFKwTiREbT5mICUxCRHDVOtqCXqSo309z0jY=;
        b=3F1KE3gDtB5uy3H8d/TnjHtpwHE95+8Xv0pcsYLALgfEiawFbXrQj20jwauNK8yV40
         jkE1MMuowmpMb0X3hgF+o15Dyy+BHeqTPYnndHjphnCOEUT4OgfhRjR+3BPy52DS7gCU
         DwvclRxSKjB5rKcw0VCUr8AcFSvBTknd7RACkWUShF2c5B8vJZ2gIjAoJbUQRPuv78EE
         +kJ50AKUw9XrF09ERNOuejhzjoWABG20+7yPlbwPWBRpxkGKDxOF5XvpTAyy8TV0uOm1
         yN5R+lGjIg3lsrXztByVZynwJiATip7vA+fNzSjcVtKYKcG4HGWAJrdZ4+yfbr2nLYvF
         VDrA==
X-Gm-Message-State: AO0yUKX954TX++X8TzIEocPRJWAvGkJd9W3/qEYaDAvrfYeLb1pNFY+v
        ga1JHFYGPgfM7gJft42hTvND/qaDDpk=
X-Google-Smtp-Source: AK7set9n9AM64jalsqoGMZj994O5eaakG6Mns16vnFk8EWtoIKz48CflPO65y7p4tYlYkbvDoh8/aw==
X-Received: by 2002:a05:600c:3319:b0:3e8:490b:e28b with SMTP id q25-20020a05600c331900b003e8490be28bmr6673148wmp.25.1677747557402;
        Thu, 02 Mar 2023 00:59:17 -0800 (PST)
Received: from localhost.localdomain (106.red-88-13-29.dynamicip.rima-tde.net. [88.13.29.106])
        by smtp.gmail.com with ESMTPSA id q6-20020a1ce906000000b003e0015c8618sm2209489wmc.6.2023.03.02.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 00:59:16 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3] dt-bindings: watchdog: migrate rt2880 text bindings to YAML
Date:   Thu,  2 Mar 2023 09:59:14 +0100
Message-Id: <20230302085914.2858645-1-sergio.paracuellos@gmail.com>
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
and MT7620 SoCs. To properly align binding with driver code we need to add
to the schema 'clocks' and 'resets' properties.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Changes in v3:
 - Re-do commit message.
 - add 'clocks' property and update example using it.
 - drop 'reset-names'.
 - Use 'unevaluatedProperties' instead of 'additionalProperties'.

Changes in v2:
 - Fix reg address and size in example.

 .../bindings/watchdog/ralink,rt2880-wdt.yaml  | 46 +++++++++++++++++++
 .../bindings/watchdog/rt2880-wdt.txt          | 18 --------
 2 files changed, 46 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
new file mode 100644
index 000000000000..51e00de947e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
@@ -0,0 +1,46 @@
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
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@100 {
+      compatible = "ralink,rt2880-wdt";
+      reg = <0x120 0x10>;
+      clocks = <&clkref>;
+      resets = <&rstctrl 8>;
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

