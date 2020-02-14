Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 359B215D213
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2020 07:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbgBNG05 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Feb 2020 01:26:57 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38983 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgBNG05 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Feb 2020 01:26:57 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so3343314plp.6
        for <linux-watchdog@vger.kernel.org>; Thu, 13 Feb 2020 22:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZfNOx9egLbAQLBCqcGowPLvDDsbitGpqyuG8vdVwiMo=;
        b=d69kMwpSmTtFJP/1FqRQEGClRQOMAiQIW8PkbgXbrVM2erzoClA8jtUS1mkxvgC1+1
         pxXWqlW7CeDMLzCHYj0G07DGRgpmJlmj+nkvV4+k6mKCcoRBjhmn+isK6pR/BjXXrG3L
         JWqrVKbRFTtyteHeIgYUFXW5X5evlBbNFrHdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZfNOx9egLbAQLBCqcGowPLvDDsbitGpqyuG8vdVwiMo=;
        b=fJnj/YIAMLEFDDw1jRRnFFMc84fhwb3mXY7WViIjLEQYAr2/3/sZt7GSAbqvi7ECdZ
         0vkav4Tyy4u9quOZsGGbkIskoY0DNO8Cb6C3FoGBfi50As69W82qoIOIVS+TMs72xrUp
         dnGBju7U47qR1reTDKI5GrYfb7TgKMiJkGGBA58C7/iSj1t/RTpZ1Zxs49r4AXGqtlkt
         tsEjBjj2wR20LpB0JUNDnq3XuwPzg4J1mcD3fSY+bV+g6lf8ZeODoBXqqg9AzsymAHIZ
         SNBNwv41iWCiq93I6gdoORkn6M9n8u1ybu9JCwT/1+q9s/TeQe9xCvAap2XcKKYd65nj
         i2LA==
X-Gm-Message-State: APjAAAUG1wVW+C7HDSlmQd7fH1wW0zMq2Fsu1rKYVqnIuDnmfPxmItkx
        iS+f/BX2FRRF5xZarRNeZi59HA==
X-Google-Smtp-Source: APXvYqyvc9phth6DVXD9Fm2fhndiDgJIEAfiLXapVfRf8xXPKrjsq6pDOxmhci9u/EHubDa0/Y0eVw==
X-Received: by 2002:a17:902:7046:: with SMTP id h6mr1650483plt.231.1581661616431;
        Thu, 13 Feb 2020 22:26:56 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id e16sm5233151pgk.77.2020.02.13.22.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 22:26:56 -0800 (PST)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     jwerner@chromium.org, Evan Benn <evanbenn@chromium.org>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog arm,smc-wdt compatible
Date:   Fri, 14 Feb 2020 17:26:36 +1100
Message-Id: <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200214062637.216209-1-evanbenn@chromium.org>
References: <20200214062637.216209-1-evanbenn@chromium.org>
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

 .../bindings/watchdog/arm,smc-wdt.yaml        | 30 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm,smc-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/arm,smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm,smc-wdt.yaml
new file mode 100644
index 000000000000..5170225b0c98
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/arm,smc-wdt.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/arm,smc-wdt.yaml#
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
+
+required:
+  - compatible
+
+examples:
+  - |
+    watchdog {
+      compatible = "arm,smc-wdt";
+      timeout-sec = <15>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e48ab79879ac..5c45536e1177 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1421,6 +1421,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
 F:	drivers/irqchip/irq-al-fic.c
 
+ARM SMC WATCHDOG DRIVER
+M:	Julius Werner <jwerner@chromium.org>
+R:	Evan Benn <evanbenn@chromium.org>
+S:	Maintained
+F:	devicetree/bindings/watchdog/arm,smc-wdt.yaml
+
 ARM SMMU DRIVERS
 M:	Will Deacon <will@kernel.org>
 R:	Robin Murphy <robin.murphy@arm.com>
-- 
2.25.0.265.gbab2e86ba0-goog

