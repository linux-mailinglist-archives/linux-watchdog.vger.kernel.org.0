Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2193C87C7
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Jul 2021 17:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239571AbhGNPiL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Jul 2021 11:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239567AbhGNPiL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Jul 2021 11:38:11 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0BEC06175F
        for <linux-watchdog@vger.kernel.org>; Wed, 14 Jul 2021 08:35:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i5so4336107lfe.2
        for <linux-watchdog@vger.kernel.org>; Wed, 14 Jul 2021 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eJaKL3ISTdN+YsCpp2uZ/iZyyKrQcH2+/HmeVpNKc+k=;
        b=YNM5znqWLu/ak5ElXJ7+tVvApRP533MCiRC/c9M1ul0cQEDdgq5WTuQoibx/TQarn5
         454GxKvs4QRRAGX1iqDJerVBNSlRNgolsmnqmsvTIbX3gAOVhGSNpjH0O7qAMM4S9JzI
         KhDTJWUZ0DRvOto8XqImUb/rqzjUnPyVVwFR5AnUOpqlCZqXPoTYR9fLkhYerVp63ThE
         dduGnV7umYqO/iHXGajnR2sk7K+FKKDRAwe0RfV7pP4+MQiXH0FxKtbD1ZlO3lnEYlMv
         +kBo+/iasD+B8thv91hyORAyslGjWw5lLvJJnCWKR6BaeJ21Gm/I3w5zKCNuJbxJFChI
         Gs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eJaKL3ISTdN+YsCpp2uZ/iZyyKrQcH2+/HmeVpNKc+k=;
        b=iYF8leBdzT05LUKF9VCAL9sH0Vw22faKDGMP9vKo7cLVIZA7PWp3C/rS5kK8FoxKe3
         G/2zbvzJe+V9giZO5+TYITwk4rgggCMBpyMulSlSpe+zyIO0Wc6MQCPYv8x4PaovfG6q
         rDEoPLLgHvKVvuVGXJKMcXz0/4WVd56aZAs66SNx1ABpOsKrg4FIJ7lTewOmeicXQ26t
         PzJyOUZALYMGtKYYrGAETOWd5Iz229x24JIss1Kp+4jOee2IhhgOOMMKAd60iOtwQ/0I
         eljR+ULKZ9n3Nf5hySzcv0eQcdQfxq+RQ0yzB/MbDd6EYgcdLrTs6Qv9phW/L9cqjYXq
         gswg==
X-Gm-Message-State: AOAM531t3slRc5T4JkQdhdiKTwkxS2D3Snk0JsBhl/UG/RyHgJnOJ3Yv
        zj3Uo+vD8vaH6o4x/XWmoQgibg==
X-Google-Smtp-Source: ABdhPJwEQOZlZOb/n6TqWTOOheo4WuwJ08Xi6CcwgCqMETjN5RHcrIqQ2n1/DGS8mYOsFxnrKuj7uQ==
X-Received: by 2002:a05:6512:714:: with SMTP id b20mr8349664lfs.488.1626276917236;
        Wed, 14 Jul 2021 08:35:17 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id y3sm269984ljj.121.2021.07.14.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 08:35:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: [PATCH 1/2] dt-bindings: watchdog: Add Maxim MAX63xx bindings
Date:   Wed, 14 Jul 2021 17:33:13 +0200
Message-Id: <20210714153314.1004147-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds devicetree bindings for the Maxim MAX63xx watchdog
timers.

Cc: devicetree@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/watchdog/maxim,max63xx.yaml      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
new file mode 100644
index 000000000000..f2105eedac2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/maxim,max63xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim 63xx Watchdog Timers
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Marc Zyngier <maz@kernel.org>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: maxim,max6369
+      - const: maxim,max6370
+      - const: maxim,max6371
+      - const: maxim,max6372
+      - const: maxim,max6373
+      - const: maxim,max6374
+
+  reg:
+    description: This is a 1-byte memory-mapped address
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
+    wdt: watchdog@50000000 {
+        compatible = "maxim,max6369";
+        reg = <0x50000000 0x1>;
+        timeout-sec = <10>;
+    };
+
+...
-- 
2.31.1

