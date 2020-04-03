Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F01E19CFC5
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Apr 2020 07:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732763AbgDCF3f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Apr 2020 01:29:35 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:36428 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733184AbgDCF3f (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Apr 2020 01:29:35 -0400
Received: by mail-pj1-f68.google.com with SMTP id nu11so2470345pjb.1
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Apr 2020 22:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KLw94QzOfrSlneIl66aJeqE3HkANlVSekWIjkWzxQvY=;
        b=PKt+VBA+Nj5QZwvU3VoVz05hn4VqZW6gsQSaHWePw1hDrG4uF2wyEYHvoL9axac+UT
         /SJjESrKpWKeoKV1kosEcWp57JDwWud2EhlhbUcvhu7yikFnAgLxg4CfGiHupmpsLtpj
         vUaLYeq+JaOBPdA4aX0sEgFpn/+obLlbfQDXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KLw94QzOfrSlneIl66aJeqE3HkANlVSekWIjkWzxQvY=;
        b=CFCADZqkQZ0X9qdbmjTi6mL9oJswxJXeDlxre+jxU36Y9TIKhhhvRveTCjT4H4rKyi
         4ORVAvqTtcHtwnkVBbrQC7DoQZR/40M/h4SVVxUhbzTl4x29tbC7H8pnvLYgoP3+jZuM
         fkB7UrZt2qGPww0159mw8KYcsHPQRjyoZN/HhJ4KSr51AwJqcAuJyYPlHS2uzeFPS0OY
         84fIjvm5CnqCs+78kPXOwIbaX4eBynf0dDKwrv9iqbtdY7HH9/s1Lrun6RoORXkm7CyF
         0eonIX9o/+0Q8DdVUpCfq9Ety7IAWx1Pgi2GT7Mt+B9f5YvYMMnzM4d7MT/l51P+rfro
         umyg==
X-Gm-Message-State: AGi0PuaKTno+i5gmbRoEAyMeCWrmcHfrUvHrZRHmFx4iFEpHPljrGY3r
        BcEbwBSfVIxHjMBZyuWCgfEJOQ==
X-Google-Smtp-Source: APiQypKFrq1hzvYHu1Gx2CYehefEsIunfver6DV/APN1vij1JYePG7Mnfe62OlzktNTKKCAUvDcPkg==
X-Received: by 2002:a17:902:ff14:: with SMTP id f20mr6049293plj.206.1585891774509;
        Thu, 02 Apr 2020 22:29:34 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id c21sm4452156pgn.84.2020.04.02.22.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 22:29:34 -0700 (PDT)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     xingyu.chen@amlogic.com, jwerner@chromium.org,
        Evan Benn <evanbenn@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog
Date:   Fri,  3 Apr 2020 16:28:59 +1100
Message-Id: <20200403162742.v2.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200403052900.258855-1-evanbenn@chromium.org>
References: <20200403052900.258855-1-evanbenn@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This watchdog can be used on ARM systems with a Secure
Monitor firmware to forward watchdog operations to
firmware via a Secure Monitor Call.

Signed-off-by: Evan Benn <evanbenn@chromium.org>

---

Changes in v3:
- Change name back to arm

Changes in v2:
- Change name arm > mt8173

 .../bindings/watchdog/arm-smc-wdt.yaml        | 30 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
new file mode 100644
index 0000000000000..24968f199413b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/arm-smc-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Secure Monitor Call based watchdog
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Julius Werner <jwerner@chromium.org>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8173-smc-wdt
+
+required:
+  - compatible
+
+examples:
+  - |
+    watchdog {
+      compatible = "mediatek,mt8173-smc-wdt";
+      timeout-sec = <15>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a6fbdf354d343..af8842b998a93 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1421,6 +1421,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
 F:	drivers/irqchip/irq-al-fic.c
 
+ARM SMC WATCHDOG DRIVER
+M:	Julius Werner <jwerner@chromium.org>
+R:	Evan Benn <evanbenn@chromium.org>
+S:	Maintained
+F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
+
 ARM SMMU DRIVERS
 M:	Will Deacon <will@kernel.org>
 R:	Robin Murphy <robin.murphy@arm.com>
-- 
2.26.0.292.g33ef6b2f38-goog

