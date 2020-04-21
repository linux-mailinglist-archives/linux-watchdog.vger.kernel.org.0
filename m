Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F7E1B248A
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Apr 2020 13:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgDULFv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Apr 2020 07:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbgDULFu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Apr 2020 07:05:50 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494D7C061A10
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Apr 2020 04:05:50 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f20so373380pgl.12
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Apr 2020 04:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YQowLReDtrDqWyEJqghrzNfGRqjMiBQBGzRSAxJByhg=;
        b=SbdGbC/IZ+waY6GcW1FEvdinhHukPVmS1p6/7X2InvP61zjhI4qpd7hLtKztakfwBW
         K/WjnxqclzbwymHpj7ms7y45VRWSoPlhGP1GQNDXoz4U/3RUj4IGyl74e3+eK1/slIgX
         VzvDNsEsz+ucIetAZgKyCrnP39XwSe2Myt7Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YQowLReDtrDqWyEJqghrzNfGRqjMiBQBGzRSAxJByhg=;
        b=U9g9y4P4KBLoXh1y8rbKhdHAlAt09D0C2O4lQv7a9YWeIlj3CDhR6ihYpQv4fS6MSy
         ToPSitaIOeavjkX0UeCCvYEbB4qk0RNDTUHr9nucIE1bdFn2yTbJYmV76YHA9R2tZX1i
         ivbnDKc9TCPZuIiTUv2gj0URzTms/5h+XJg5OcNH/m8+fGopfouWidq/U1uINib7Zbjl
         4A564cdv9Fpt7Wi4IdQ6+f+OUh8waAbelZdHFnOJ60FOteSK/3v433ec77MERAxa3V44
         malEzbVjRqSyhnb+XeflveCj38d8EW9YvoS9bJICJVxpA/mNVy8qaTphqQS6D1J/mAf4
         Ybaw==
X-Gm-Message-State: AGi0PubKcDNaOhWxyHrEVQBHKJ/Mj6xYNkxLXG7SDPvmbe0ejpA23O91
        pSths3fSa/BjmjKWAXGNc7I5fg==
X-Google-Smtp-Source: APiQypI1YwJmHmSy0x0sI6jBe5ajdThi9X2rhSR2zjbZmeUsSjXpy1kYTU95kpNEOJjKxjiOS0aNBA==
X-Received: by 2002:a63:6f4c:: with SMTP id k73mr1751689pgc.241.1587467149882;
        Tue, 21 Apr 2020 04:05:49 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id c84sm2258841pfb.153.2020.04.21.04.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 04:05:49 -0700 (PDT)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     xingyu.chen@amlogic.com, jwerner@chromium.org,
        Evan Benn <evanbenn@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog
Date:   Tue, 21 Apr 2020 21:05:19 +1000
Message-Id: <20200421210403.v2.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421110520.197930-1-evanbenn@chromium.org>
References: <20200421110520.197930-1-evanbenn@chromium.org>
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

Changes in v4:
- Add arm,smc-id property

Changes in v3:
- Change name back to arm

Changes in v2:
- Change name arm > mt8173

 .../bindings/watchdog/arm-smc-wdt.yaml        | 36 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
new file mode 100644
index 0000000000000..5379d9f798d84
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
@@ -0,0 +1,36 @@
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
+  arm,smc-id:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - default: 0x82003D06
+    description:
+      The ATF smc function id used by the firmware.
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
2.26.1.301.g55bc3eb7cb9-goog

