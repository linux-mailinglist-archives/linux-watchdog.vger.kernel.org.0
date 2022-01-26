Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5980549D55C
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jan 2022 23:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbiAZWUp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Jan 2022 17:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiAZWUo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Jan 2022 17:20:44 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5666EC06161C;
        Wed, 26 Jan 2022 14:20:44 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e9so1613977ljq.1;
        Wed, 26 Jan 2022 14:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ViD0j19dHef/zxX98qfPF+km5BPG0kg59ySbOeuNW+U=;
        b=KGSd6IOK0bfDwRYKeFHEH4Z3IGs/2ZGUUYT2BzeclZobE4Tx8TLI8l84f7p4r6njKM
         T0NPADtZN/S0yUbfd2cpJcCgt8UTJAecVoLEy+A1f6yCUgbB5m5lJFgOycFR53doNsiz
         4IADPCQ/Oz9BxhxvmQ9J6DpRunORI+DcWQ+ddABCT0TZQ6Shk6PPQtnddNAEcHkLh6Hz
         JVZpROVCASPeuIn35QHfSL/ub9Lzr2FIivBb4XphfMm3DlQ3NlaLaK/AecRCL5MfPe8n
         5VbVfz7ytfWl2zkxiHWcc1Ay08nJWQmx0DgWpYGb6Yt1Y9Mo2OeHfe6FRtkSHs9lAay/
         Lq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ViD0j19dHef/zxX98qfPF+km5BPG0kg59ySbOeuNW+U=;
        b=SJRSMXWaIrkvTO5+oAeUbBCJ25ZhbwoEND64JmSMJcd7JcXPBVweBnm5AXfEVVLXhi
         Gk84bPHR01TdT5eg0baj/gfhrvfNHBK1Cf1hbk0VhSexd4RkQtyo/vS3Gs+XQbFoTUPs
         zF/xaB1ExFzvHTpdR1VfT7RUXzXvqHAiwx/i8Tp1IC1Smkjb44FA6DJqPQIPGW4x1c5Z
         y63nHO5hrkhdGlfAzRW5KeUhmgEAoANOYIczdRedBHV3KVbIzHc4/mqq5U7rtruiWoMx
         0Zz3LS8KnutBETfTOYYFp3lHPEbeCaL78Ol1m8SE3KhIOJurbf9wLvQi1mNY5hGLz0d6
         JvAg==
X-Gm-Message-State: AOAM5335hAlJ+gZOXl0+7xrs6NTGmOffXzOpgHecbEDuCyQENpLWwh/C
        Y8RFFbOTpDolp4G9wfonfYM=
X-Google-Smtp-Source: ABdhPJyg4kvoA6GP7aZiAZQFNBQJuCF03pPCjpStrURQGY9lXF/mmHU+jNdAl/UXUjKw0U7lIshcwA==
X-Received: by 2002:a2e:9915:: with SMTP id v21mr807913lji.299.1643235642502;
        Wed, 26 Jan 2022 14:20:42 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id k17sm1966499lfb.147.2022.01.26.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:20:42 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] dt-bindings: watchdog: brcm,bcm7038: add more compatible strings
Date:   Wed, 26 Jan 2022 23:20:34 +0100
Message-Id: <20220126222034.16889-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126132116.11070-1-zajec5@gmail.com>
References: <20220126132116.11070-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This hardware block is used on almost all BCM63xx family chipsets and
BCM4908 which reuses a lot of BCM63xx parts. Add relevant compatible
strings and also include a generic one.

The only SoC with a different block I found is BCM6838 (thus not included
in this change).

It may be worth noting that BCM6338, BCM6345, BCM6348 and BCM63268 don't
include "SoftRst" register but that can be handled by drivers based on
precise compatible string.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Sort enum entries & update brcm,twd.yaml
---
 .../devicetree/bindings/mfd/brcm,twd.yaml     |  2 +-
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 21 +++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
index 634526f790b8..3f5db1990aba 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
@@ -55,7 +55,7 @@ examples:
         #size-cells = <1>;
 
         watchdog@28 {
-            compatible = "brcm,bcm7038-wdt";
+            compatible = "brcm,bcm4908-wdt", "brcm,bcm63xx-wdt";
             reg = <0x28 0x8>;
         };
     };
diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
index a926809352b8..4d848442913c 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -16,9 +16,22 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - brcm,bcm6345-wdt
-      - brcm,bcm7038-wdt
+    items:
+      - enum:
+          - brcm,bcm4908-wdt
+          - brcm,bcm6338-wdt
+          - brcm,bcm6345-wdt
+          - brcm,bcm6348-wdt
+          - brcm,bcm6848-wdt
+          - brcm,bcm6858-wdt
+          - brcm,bcm7038-wdt
+          - brcm,bcm60333-wdt
+          - brcm,bcm63138-wdt
+          - brcm,bcm63148-wdt
+          - brcm,bcm63268-wdt
+          - brcm,bcm63381-wdt
+          - brcm,bcm68360-wdt
+      - const: brcm,bcm63xx-wdt
 
   reg:
     maxItems: 1
@@ -37,7 +50,7 @@ required:
 examples:
   - |
     watchdog@f040a7e8 {
-      compatible = "brcm,bcm7038-wdt";
+      compatible = "brcm,bcm7038-wdt", "brcm,bcm63xx-wdt";
       reg = <0xf040a7e8 0x16>;
       clocks = <&upg_fixed>;
     };
-- 
2.31.1

