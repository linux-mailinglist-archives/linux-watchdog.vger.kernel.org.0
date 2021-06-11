Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6D73A49EC
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 22:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhFKULL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 16:11:11 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:42510 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhFKULK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 16:11:10 -0400
Received: by mail-wr1-f43.google.com with SMTP id c5so7242899wrq.9;
        Fri, 11 Jun 2021 13:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BHBbXj0saU1Vaw4JqK7Je4dxMplQYjzAt0k/ahqfX4Y=;
        b=E5VhXFB5Rb1OChxoPmPQIzO6OH2yfLRi616Pmb2lLT+vL2QSsOxDRcByVJpp603lnQ
         oP9IsUSToAauQseMlhNMMX13Mzd9ZvtU8/f1fxoK8NSFa0PHWTJ4DlCTzvCRa1srfma3
         5UNs8dKGOMbeUod/qmtfKqFT5WRY49qTGXZEWLgRTqI7gs7nXVtmkPXxxSlXzm8miWWd
         7n3odudFtC7tXOld93A9l84drIXzl/Wml5UXpyYtL2od1pwtQT+vXclQHe+r54poI+6p
         sD7Uiv/lbHA2Ljqeca9E1XxJOebfynevJEB7xGY6E50fmX+gzdve1QOwIIyGf60OyIaw
         IMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BHBbXj0saU1Vaw4JqK7Je4dxMplQYjzAt0k/ahqfX4Y=;
        b=mjm1fgOql+xWKHuJT2AezWpSsVXRlrcVpDtOtwM2iNm7RRYbdAlGLMUg6DO2KFnExE
         p0ADO99KmR9hsqa77WIVfQWXPSlfS/AfgpRHuDC6z4NS9Bvpj67IlbrM/4ETcn4aJkH2
         KoXAPQbsVaLxOZZrLvVcsvzmF0b9Of1IGc9qZXAwDe5zHU02fvWt6SGKtlyxYYsTgUgg
         YQfQL88wtn/d2uFLLV7mzBSqGMu20CDgY7nEeveA+pGD0lEE4bqzAFBCTV7hV5oq2j1P
         lVZl7jaj2/UajM2Cm4xrl/9BYB3TeCPLnD0lFq9Y269vl1fCdgy3MJzSYo9aWysSNbvN
         3GGQ==
X-Gm-Message-State: AOAM532jFGWhZEcXEe+RjBnWCRYB3ULnRxtkDyX1UidmRj/dHKQwiL2g
        GEtf1ou4Fzxd8rlsEcjyu1k=
X-Google-Smtp-Source: ABdhPJx/PabXC72MhuhmsA5z8xFsuvOIURqNaSkBIC6fGJgFaQPwyf1YPuF14rQ80Fao2F6xrtLuyw==
X-Received: by 2002:a05:6000:10e:: with SMTP id o14mr5919290wrx.76.1623442090967;
        Fri, 11 Jun 2021 13:08:10 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id h11sm6836182wmq.34.2021.06.11.13.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 13:08:10 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: watchdog: Add Mstar MSC313e WDT devicetree bindings documentation
Date:   Fri, 11 Jun 2021 22:07:59 +0200
Message-Id: <20210611200801.52139-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611200801.52139-1-romain.perier@gmail.com>
References: <20210611200801.52139-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds the documentation for the devicetree bindings of the Mstar
MSC313e watchdog driver, found from MSC313e SoCs and newer.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

