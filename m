Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220B26A69BC
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Mar 2023 10:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjCAJYg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Mar 2023 04:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjCAJYe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Mar 2023 04:24:34 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD2B36469;
        Wed,  1 Mar 2023 01:24:27 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso10897185wmi.4;
        Wed, 01 Mar 2023 01:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677662665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AUnzVCWDu3lRbeGs+FSxn4Fag1muzI50SJEiMaHulbI=;
        b=m9Cv9DcPyZNfzELTtb2jIy4w1Gvf/B6hnYAjz9fBXbEvDuKrhZeV/HY+zL6A0mgSvB
         EpIBkEQcYfEkc0b3LaduI/+YpJD0Nne+Lh++lqltBRqtlQIcXN2NcPS7ZK1FnK+ugq9B
         8r6jUuzIrn5SRwngoLj/FMf61hpTD1leFk64QJ/Gv/+ccj3+TLZUlaqgf2lfWBhQA88v
         QJzWk0X6cBLNEO611+J+QYjTTZ00sd/nidiJ66EvF0qoszIzOPtv/6g3IqofyxHrOQ4l
         Xo07LKyNjzO2Liy/Kfemz0bU5zKqRRYVrS71vCUvn/urYk8VTJoDWrc3w3WH0wE2YJ7F
         0EDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677662665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUnzVCWDu3lRbeGs+FSxn4Fag1muzI50SJEiMaHulbI=;
        b=TFoTuGsEiWmL5RZC1/jygFxX29jbA+Ag4g+NtnVxZdcqxXoA7Sx/9JZ++jcC7gEAfx
         ftHQKOf8I157tE4jLD8BXu3e1B8WpAsrzanIE+nnUUS3gUhwIZ3KyD1+FLv8JxQJGhV5
         Kmpfn2pUyH3e+8JWdusiRZ+Xn4GIui+La82UMys9VCurJy+Mmbkhq5jxEMsNacry4cAq
         KCiCNfy/QTKuDwstLWOG9omUNRuXPI+ZhIwZxOa6JeiBP4d3sjwPbsvN3upZHBoUcBhL
         kVCvtcKGAoKfG9iUtxVWJMq1bDl7QPW8/bfq3/ka7c3hMIEG1pCgK2l01XcJ3n44rXTu
         nd+A==
X-Gm-Message-State: AO0yUKUuY23wH8Q8mUXHHi3l5yIlKlhwaLaPg7vE8glkdvnivDwdP3/p
        qxqT7D/JZm59aX+Ir47SgKdT26XUO9A=
X-Google-Smtp-Source: AK7set9bVkHz9uAs+RA2DOnhCDZNYyP3u2piu8xNpfyUZr8xaLZFnb4KeCaQKKl9uLn9nTsGtfPNtQ==
X-Received: by 2002:a05:600c:4fd3:b0:3eb:36fa:b791 with SMTP id o19-20020a05600c4fd300b003eb36fab791mr4372517wmq.31.1677662665405;
        Wed, 01 Mar 2023 01:24:25 -0800 (PST)
Received: from localhost.localdomain (106.red-88-13-29.dynamicip.rima-tde.net. [88.13.29.106])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c358400b003dc5b59ed7asm16460892wmq.11.2023.03.01.01.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 01:24:24 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2] dt-bindings: watchdog: migrate rt2880 text bindings to YAML
Date:   Wed,  1 Mar 2023 10:24:22 +0100
Message-Id: <20230301092422.2824609-1-sergio.paracuellos@gmail.com>
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
Changes in v2:
 - Fix reg address and size in example.

 .../bindings/watchdog/ralink,rt2880-wdt.yaml  | 47 +++++++++++++++++++
 .../bindings/watchdog/rt2880-wdt.txt          | 18 -------
 2 files changed, 47 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
new file mode 100644
index 000000000000..744b4c513c85
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
+      reg = <0x120 0x10>;
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

