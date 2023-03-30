Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B726D0DAF
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Mar 2023 20:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjC3SY4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Mar 2023 14:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjC3SYy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Mar 2023 14:24:54 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6BDD517;
        Thu, 30 Mar 2023 11:24:53 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id h8so80075232ede.8;
        Thu, 30 Mar 2023 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680200692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vOmbHXxgl5AIX4hLwyDtng0AW8nkrnwi8e/O7fTQX2I=;
        b=UlzQKSnTOcb/dH8AASCRMK8obXyE/Y+zy8xNqxm4Pbq18AQHfXoneaLQHzt2o4Esa5
         mG5WTba90pRPp+/wXKfuMpMFN1aahy5Az682K8EJ9jeQNt438a2TDvh4AnM4qI9ehils
         7MMxZP7M3j3TP9PZ6uKOnW53bQtz2cOYDRaT/RCLZ6fqrbj/4plvkCyM/xzX4W62NaB6
         whXHrvc/JYdqr4znDnvZETXnpkh8DQGIEa2AQOO4Koy2JOz7bfGgT3WYRz2ddBhgpiIp
         /tN1LJC2AXbmP4cZdsi6Z+FWBQEfrfcBM30cp8u6qLDOUO+VchyeubKS0Y+ciZfPmQb0
         wohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680200692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOmbHXxgl5AIX4hLwyDtng0AW8nkrnwi8e/O7fTQX2I=;
        b=TedFq56na0ILOkVfI9R0Lk8SghaNnCwHVWZIRacR1xkTtCvaZoR0E3eJycIZL7QrwW
         02Jk47J3/ze3we1j2HLnFYNHkRH6clKe0AreQ7QfXBftkxvXGH1p/hnllTUS6noa+nna
         7L5bhQHUId6tGNXRC7mVKw1H0MbZTfGZmpQXuwrQtTpX68rsC8iqCdBOgeWes4S3WpkC
         5tHZOLqd1s4Q/zz0GkukNgMVDiI84UxQAThcA5MzjyQt7Hr/lFRKLV7wZHRg16pt9lMP
         TDv3VVgf1hrsSJiUiWoo58G4Q9vlWhFMuyN1yycwsRi9wEr4j/SdGZRutE/vb5pozvxZ
         ZUvA==
X-Gm-Message-State: AAQBX9d0Jo4gRThXtDEP5DiPUo3Cqqo7DU7ZH+X44YYZOCZWeeEjYiJi
        bt5e3uuJM/g8/Jt/z1/nI50=
X-Google-Smtp-Source: AKy350YBrOqbBAi66TRuaaQ1mnLn7kuv/imUBVsaeduC4hdggeZjE1wQf+b8FXAy+ZMjBDAVtqBJ2A==
X-Received: by 2002:aa7:c7cf:0:b0:500:50f6:dd27 with SMTP id o15-20020aa7c7cf000000b0050050f6dd27mr20835611eds.26.1680200692048;
        Thu, 30 Mar 2023 11:24:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8109:8c00:3b40:1039:1167:a648:b315])
        by smtp.gmail.com with ESMTPSA id i24-20020a508718000000b005024aff3bb5sm202714edb.80.2023.03.30.11.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 11:24:51 -0700 (PDT)
From:   Nikita Bondarenko <n2h9z4@gmail.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com
Cc:     Nikita Bondarenko <n2h9z4@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] Convert brcm,kona-wdt.txt to brcm,kona-wdt.yaml
Date:   Thu, 30 Mar 2023 20:24:47 +0200
Message-Id: <20230330182447.51674-1-n2h9z4@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Signed-off-by: Nikita Bondarenko <n2h9z4@gmail.com>
---
 .../bindings/watchdog/brcm,kona-wdt.txt       | 15 -------
 .../bindings/watchdog/brcm,kona-wdt.yaml      | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
deleted file mode 100644
index 2b86a00e351d..000000000000
--- a/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Broadcom Kona Family Watchdog Timer
------------------------------------
-
-This watchdog timer is used in the following Broadcom SoCs:
-  BCM11130, BCM11140, BCM11351, BCM28145, BCM28155
-
-Required properties:
-  - compatible = "brcm,bcm11351-wdt", "brcm,kona-wdt";
-  - reg: memory address & range
-
-Example:
-	watchdog@35002f40 {
-		compatible = "brcm,bcm11351-wdt", "brcm,kona-wdt";
-		reg = <0x35002f40 0x6c>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml
new file mode 100644
index 000000000000..ffc4870bdb57
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/brcm,kona-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Kona Family Watchdog Timer
+
+description: |
+  This watchdog timer is used in the following Broadcom SoCs:
+  BCM11130, BCM11140, BCM11351, BCM28145, BCM28155
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm11351-wdt
+      - brcm,kona-wdt
+
+  reg:
+    maxItems: 1
+    description: memory address & range
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@35002f40 {
+      compatible = "brcm,bcm11351-wdt";
+      reg = <0x35002f40 0x6c>;
+    };
+  - |
+    watchdog@35002f40 {
+      compatible = "brcm,kona-wdt";
+      reg = <0x35002f40 0x6c>;
+    };
-- 
2.34.1

