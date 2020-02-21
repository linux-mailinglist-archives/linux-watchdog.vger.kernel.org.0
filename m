Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27FA0166F44
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2020 06:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgBUFic (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 Feb 2020 00:38:32 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39127 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgBUFib (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 Feb 2020 00:38:31 -0500
Received: by mail-pj1-f66.google.com with SMTP id e9so235800pjr.4
        for <linux-watchdog@vger.kernel.org>; Thu, 20 Feb 2020 21:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CapMNX7pjr8MkESV5PbFvA3nh0aG4lhz0SRP146DeOk=;
        b=NHBlsLvEzhPsV9lVrqrxLfj46dzf+dfvYfal/9H20MGjw4nLWWSVa8v81TGtfCiHGG
         UNImlkJ6xyOWAA6l1H1xA2JqGLXbVDYYjArPqkFMKmwUZffHJaGPMeXaVTJX8lG24W7Z
         1BH97JwtFsJ//+S0hygIEpEECdThBP537UmUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CapMNX7pjr8MkESV5PbFvA3nh0aG4lhz0SRP146DeOk=;
        b=k/ANmarl3Ui3zLOaeZiWeesSpYzYafdbxse696oylijWQHx63YOIiG7wPb+80qEJ2b
         1jwb6xVpjhEc0Ui3RS3Abhiqe/tpDmCGLbCfh5SJeHugNmhlTX5/i0Re+SSbGoA70uEX
         C5WxMD4tR5Yzwh2DIeFbWAzSDal+44B1KHXldiyhEN1WEX02g8jbXv9VgowoqUhsuHLh
         nxc+3a1ANX2EdttpO2zyE4EFPfe+lYC6TGB9ncr7fWbXJ+cyR3H5y6QDceMCe33ruZmS
         i6Z0KKKC+dlrAYqVq+x3f8WmrWW4u634qx0dnRN4LRm+yY+yvj3cWCMJLpqX0EpKQ26T
         AqSg==
X-Gm-Message-State: APjAAAU95SfWBzXR/YgmBMP/yXQgxnGLiA84XDWZZHbIydUfkOAGbuaE
        dHtC4IqhKaKRS+m2g723EuXfLA==
X-Google-Smtp-Source: APXvYqz+fNCi7RyQICRTNgU9IYDRlA2CBQL0xzTHdNzESzxk/Lp56MofgOU6MTmKnMrgVqSEjK8ojg==
X-Received: by 2002:a17:90a:804a:: with SMTP id e10mr1046782pjw.41.1582263510005;
        Thu, 20 Feb 2020 21:38:30 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id m12sm1324157pfh.37.2020.02.20.21.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 21:38:29 -0800 (PST)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     jwerner@chromium.org, Evan Benn <evanbenn@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173,smc-wdt watchdog
Date:   Fri, 21 Feb 2020 16:38:01 +1100
Message-Id: <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200221053802.70716-1-evanbenn@chromium.org>
References: <20200221053802.70716-1-evanbenn@chromium.org>
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

Changes in v2:
- Change name arm > mt8173

 .../bindings/watchdog/mt8173,smc-wdt.yaml     | 30 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
new file mode 100644
index 0000000000000..ff45e13bc548b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/mt8173,smc-wdt.yaml#
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
+      - mt8173,smc-wdt
+
+required:
+  - compatible
+
+examples:
+  - |
+    watchdog {
+      compatible = "mt8173,smc-wdt";
+      timeout-sec = <15>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e48ab79879ace..59e8779363c12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1421,6 +1421,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
 F:	drivers/irqchip/irq-al-fic.c
 
+ARM SMC WATCHDOG DRIVER
+M:	Julius Werner <jwerner@chromium.org>
+R:	Evan Benn <evanbenn@chromium.org>
+S:	Maintained
+F:	devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
+
 ARM SMMU DRIVERS
 M:	Will Deacon <will@kernel.org>
 R:	Robin Murphy <robin.murphy@arm.com>
-- 
2.25.0.265.gbab2e86ba0-goog

