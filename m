Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A299A1C4C86
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 May 2020 05:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgEEDNx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 4 May 2020 23:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727820AbgEEDNx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 4 May 2020 23:13:53 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69392C061A0F
        for <linux-watchdog@vger.kernel.org>; Mon,  4 May 2020 20:13:53 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 207so400887pgc.6
        for <linux-watchdog@vger.kernel.org>; Mon, 04 May 2020 20:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+PbPJJpEILx1ocyOWNOOvEa1Mky7Djw1fch1bGYJADM=;
        b=JxUB27jUj8xlfXqkbTQnXVABbcJmQ+9sAi9+ktDvOdTQ8+4aj6a22vPjldwemWHXI8
         BT9aUgTgcoiRRKuFj7OU2R0HToujCVwgRSyu2SKmA22dJByEVOlG3QQv3cHrmjDIDyMp
         dVCZ/mI3flyAsf8TiMb5grQDjqNZ8DK1Ja/dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+PbPJJpEILx1ocyOWNOOvEa1Mky7Djw1fch1bGYJADM=;
        b=a2G709Vt2wBnhbWqaRTiLsoetq167/XWwDztSEluJUhwUHO0UIv+5Nlwy1TuK692J9
         hu/Yt/koReQPIUs97cRpYyWyfBKZBiYsbWjE7OP8byeh+wUxHzuJuJT2WLTXI/pRhSRu
         Myj+TgKMhgHYu0sbPL3Sd1NXujmMjoAAHo3ADyAlGlM27RmORgVvsX4kNYeww09E4cAY
         os+FGpbVjr+oTYzlREh0sVTmjvqjTBKwda1xbHVoTQq/D2adzrz3x43XxURSGEBL6RK+
         BwYoFdD7pqJDWbXkYFi2B1g/szoxP5VKlnoFAC0K/QjOw6ONs3x2v9MzL62eaW1Oy9GU
         e+sw==
X-Gm-Message-State: AGi0PuZtj6eaK8eVHr0pfPwSCRP5SVHTVbUNshu8xqbwlCOIiuoZn9nn
        8qG1b8QXpO1AeuGnkr1znbeDeg==
X-Google-Smtp-Source: APiQypJCnyF5JL13Hmnm+DYS16ZaSojlEtOIqivZXiCvHH4rD5RvsO8R57gsVKGHLk+nRx8bZWKJrQ==
X-Received: by 2002:a65:5a47:: with SMTP id z7mr1181189pgs.229.1588648432946;
        Mon, 04 May 2020 20:13:52 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id cm14sm373578pjb.31.2020.05.04.20.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 20:13:52 -0700 (PDT)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     jwerner@chromium.org, xingyu.chen@amlogic.com,
        Evan Benn <evanbenn@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog
Date:   Tue,  5 May 2020 13:13:30 +1000
Message-Id: <20200505131242.v6.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200505031331.122781-1-evanbenn@chromium.org>
References: <20200505031331.122781-1-evanbenn@chromium.org>
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

Changes in v6:
- Don't use dt default

Changes in v5:
- Change compatible to arm,smc-wdt

Changes in v4:
- Add arm,smc-id property

Changes in v3:
- Change name back to arm

Changes in v2:
- Change name arm > mt8173

 .../bindings/watchdog/arm-smc-wdt.yaml        | 37 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
new file mode 100644
index 0000000000000..bec651541e0c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
@@ -0,0 +1,37 @@
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
+      - arm,smc-wdt
+  arm,smc-id:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The ATF smc function id used by the firmware.
+      Defaults to 0x82003D06 if unset.
+
+required:
+  - compatible
+
+examples:
+  - |
+    watchdog {
+      compatible = "arm,smc-wdt";
+      arm,smc-id = <0x82003D06>;
+      timeout-sec = <15>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b816a453b10eb..0f2b39767bfa9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1457,6 +1457,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
 F:	drivers/irqchip/irq-vic.c
 
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
2.26.2.526.g744177e7f7-goog

