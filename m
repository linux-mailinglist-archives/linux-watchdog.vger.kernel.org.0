Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CB839CA11
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Jun 2021 19:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhFERGs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 5 Jun 2021 13:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhFERGr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 5 Jun 2021 13:06:47 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C27AC061766;
        Sat,  5 Jun 2021 10:04:49 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id r13so7211085wmq.1;
        Sat, 05 Jun 2021 10:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMAviFGUdQ730F6Q+HNCqv4PBNG+qYb32j7SS7VdG80=;
        b=T4YcfwlFx/bNv2XRve4QVU+8Px8MmC85/qLW6/NqgmyEGAU0J+csP45R1Az+wZBqKc
         nsz+ouuW2wnmh09bcst7pLFZDVn2CYrZ/N2wkWzgoi1HjMhKfPnDvmBehUFEro1jgFMu
         ldWvHYGqq7tITc1kncdLMD12khzerRMpJmr9bU4QlzTjNFudcxkLV4zgLZ8DEQime1lS
         acD5DAy3m5+QTsI2KZn0dhY76zN3CZS00N0MT+bzIH+3jOOUzGq0VYhKurmjqLXQZ7l6
         i80TN+wkBDCNx4z/b+jVMzUF6M0n3ivvmc7nrYhUx0AYkziVjL8lQCbZIm1kD3rX/o+0
         Bcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMAviFGUdQ730F6Q+HNCqv4PBNG+qYb32j7SS7VdG80=;
        b=pSsKByLDjKxnKeqRajs8IxSWRHT0V6DLMyODc/lEFOYHgVZ+b74neysosePMikrt4u
         j8zNQYxCh7F7+m7qpMSG3+tKwSwY+/T6r/dXGpheGstrCT40jCEB1X0WsJJC2jeoQBHG
         hV2+OTohYdvQvw1p7eTEotXolPFFpjfQsjQNvXNG86wuhn/B9TD5aXmlM5OcbI8gOlIu
         +dxAOybAp7OH9HW6FGsehtxe9Ov29Z+08q8Tv+RzPCSfmow9Uo4UUtu9dttWqwtKWkIz
         sK2Z+2Ky8K6o3egCPR/m/ZHigcqFdzMCW/8/EyeOVgDIFVv79mrTCpguF+mcMVo8chit
         UOaA==
X-Gm-Message-State: AOAM531zKynon7GhWyYrg4w84ScRy5BY8tX6aB986JbjBp+Gy05DiUgs
        UJWH92IuWBjrgx34QpTiLqrFBocjrb0=
X-Google-Smtp-Source: ABdhPJz9ttxsRiszpElW2T+klCpdvZGzurgBYu4mcaVfbcjKn2K576/AGqoxjsy3M7WG51sOXPLruw==
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr9111010wmc.114.1622912687664;
        Sat, 05 Jun 2021 10:04:47 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id w13sm9053230wmi.4.2021.06.05.10.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 10:04:47 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: watchdog: Add Mstar MSC313e WDT devicetree bindings documentation
Date:   Sat,  5 Jun 2021 19:04:39 +0200
Message-Id: <20210605170441.33667-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210605170441.33667-1-romain.perier@gmail.com>
References: <20210605170441.33667-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds the documentation for the devicetree bindings of the Mstar
MSC313e watchdog driver, found from MSC313e SoCs and newer.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 .../bindings/watchdog/mstar,msc313e-wdt.yaml  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mstar,msc313e-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/mstar,msc313e-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mstar,msc313e-wdt.yaml
new file mode 100644
index 000000000000..e3e8b86dbf63
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/mstar,msc313e-wdt.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/mstar,msc313e-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar Watchdog Device Tree Bindings
+
+maintainers:
+  - Daniel Palmer <daniel@0x0f.com>
+  - Romain Perier <romain.perier@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mstar,msc313e-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@6000 {
+        compatible = "mstar,msc313e-wdt";
+        reg = <0x6000 0x1f>;
+        clocks = <&xtal_div2>;
+    };
-- 
2.30.2

