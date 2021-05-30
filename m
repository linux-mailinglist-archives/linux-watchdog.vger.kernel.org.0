Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD524394FF1
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 09:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhE3H2r (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 03:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE3H2q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 03:28:46 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730D3C061574;
        Sun, 30 May 2021 00:27:07 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id j14so7514078wrq.5;
        Sun, 30 May 2021 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VR1JWU4nW1DmUrTHeiF6/6cj0vIS4fC0uA+HnyAg+8M=;
        b=nfQyXGynWV5qx3p236HjiMJZbTrBjzjcj90dibObqRZhKXbi2SBB3O6t9YVyfzigwf
         KiQsb+atjC1B5neqnXnzmoWHxEL3S/xfSBDS9eNj3LWAWOKLcMh1LnFI/lJbrQuRo+3i
         TYoXYYR1OP7XDkP0FD4r2RtbXYEDV5OT6/kFgccGxiQVb+1VuB6Mfzi2DVSvW9C62+DI
         TD4tcCLCJp1ySwXSVxAwNu5NIGHSJ19I82+PGY7jQVV8i6aFojCJYKIASdj3oajgky3Y
         Cva0q/z2UQ/CxCZMBCRbs/QLQ5AumYFR87xw71Set7bOZK2Gb0Y2BROMdR2MsDkrA8s2
         rngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VR1JWU4nW1DmUrTHeiF6/6cj0vIS4fC0uA+HnyAg+8M=;
        b=j6wH6ZGYnAmNWHJ+ioOL2MGjmBT4XqVdK+dcYEkhfUeU2ykeGJ1fvT1TCGGml8twvG
         IHVei91CkMBcDHE32S2oFhYopU/0SPVeIxfMcnkPCbWUVae4b0VbJJEQCDt2a1RqC06G
         CUuGUMbBxmQ16QDOh+LiQifKbGG6XIEZc1h2e+ja+6QXF6fVr8JPz0nsiu+5FZ9yIZSu
         D+08qGlu9zmOQKVp77+ISNlPouvX6P9EobfifzLMFzOHL03aEfJBkkjfA1lWskJqu4qK
         MZs5lHLLPbAIB9ZRJ21/imzcVAFZakg8JskOBg0jOa4NaHSlJmxd8mg8CNh+/ibq29eU
         0ctw==
X-Gm-Message-State: AOAM531JaLQlf/MYAz83S86tjKHcWyLDkxHT71MHxlbHQa6ydC8fzNfJ
        UahbxLzyr3oS1S9oVOd+rWm3ngl87IDXRg==
X-Google-Smtp-Source: ABdhPJzJPaqMTzCmSATP2Vsc2WhP/KoRTsQczXH9z8vZkNUUNQlMN/64A+6g+MRUEvYeX7D4gBE4Lw==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr13915446wrn.398.1622359625655;
        Sun, 30 May 2021 00:27:05 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id e8sm12700797wrt.30.2021.05.30.00.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 00:27:05 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] Documentation: watchdog: Add Mstar MSC313e WDT devicetree bindings documentation
Date:   Sun, 30 May 2021 09:26:43 +0200
Message-Id: <20210530072645.10379-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530072645.10379-1-romain.perier@gmail.com>
References: <20210530072645.10379-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds the documentation for the devicetree bindings of the Mstar
MSC313e watchdog driver, found from MSC313e SoCs and newer.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 .../bindings/watchdog/msc313e-wdt.yaml        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml b/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
new file mode 100644
index 000000000000..70b8e1be5e8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/msc313e-wdt.yaml#
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
+    watchdog: watchdog@6000 {
+        compatible = "mstar,msc313e-wdt";
+        reg = <0x6000 0x1f>;
+        clocks = <&xtal_div2>;
+    };
-- 
2.30.2

