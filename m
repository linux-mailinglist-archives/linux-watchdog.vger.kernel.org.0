Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3747E49CAA4
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jan 2022 14:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238730AbiAZNVW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Jan 2022 08:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238674AbiAZNVV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Jan 2022 08:21:21 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B40C06161C;
        Wed, 26 Jan 2022 05:21:21 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id u6so31277024lfm.10;
        Wed, 26 Jan 2022 05:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YPco95DK76ST2okLDtvmb7ONmjJ60F5CP6XpsCcLwEE=;
        b=IiwOaRq8UgqtFuGmvEUmBRFvzl4BBBZJfV/2aA546FBj9RjSy5YriWH8Ij/uPxhlMF
         GzkZIMFVgve2fjbpSsLCzDu3xVVwd36KxD0A4AiHKopeH3GTbYNxtceBuVbJ5Hssy1+o
         CrfrsN0ivl1qp3bfKsd7XYjUKcl1fKueaGXmIbdY4C4Xyx5JE6YXY4070PdeThkvEiz4
         TIBQGX2wD7f7UkF1MucshaM6LDHL9krimC+ZXIF8OKmckCfwQpVXxy942rZEqtRRD+PK
         EydeayvTc3XzS/6+X+hxTxO2DNo49vMu8uqr0L0lYuXU4Ek9dGxBrfAZ0xgJeRECXQm4
         WPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YPco95DK76ST2okLDtvmb7ONmjJ60F5CP6XpsCcLwEE=;
        b=iAKnjvnWJ5XGqt4ICgOztDu/BopFXSMISk9z00TpkxF6dOetsb6QdMK/QizVdR9RcW
         KD+s15Kx4DKmdYMb98ay2/4W6Z1WtfRMlzJPq4pN4qOvWprPE5r8v3eDi9flt2YGw6KO
         J+9m5KeyA1vKUacXYnPCXLm2Tv3VoJ1qJSVDtjZaRWG/FGP2X//1exGFpeRgstmL7xE5
         UJnST3NxIpqpM0gZbc6yq4qhW/IuAI0VVASF6eRCJ+FPWD32WUpQ4fr1PTSQyhh/jGKT
         56TSAUnq2rK7s9TLPRS6yRH3WvvQb3HgznBKm5YMbg1t/SG4NgYBmWOsYAKy5sVKPWWJ
         t18Q==
X-Gm-Message-State: AOAM533bi/T4qpdVXt/+iLLFd7XBhzh0mPIeecwX/4y8wJChFE9RA1A2
        eFyzocNWJHblwX3X8e2Fn9M=
X-Google-Smtp-Source: ABdhPJwvfYIYlhGineRB2Z3R2kzRKdspRIwhE1w0KrCVXzH3SX98//6P4de2AQYB1GKHUM16b8graA==
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr19745236lfa.40.1643203279647;
        Wed, 26 Jan 2022 05:21:19 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id x20sm1234483lfa.252.2022.01.26.05.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 05:21:19 -0800 (PST)
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
Subject: [PATCH] dt-bindings: watchdog: brcm,bcm7038: add more compatible strings
Date:   Wed, 26 Jan 2022 14:21:16 +0100
Message-Id: <20220126132116.11070-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
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
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
index a926809352b8..b663f360f571 100644
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
+          - brcm,bcm60333-wdt
+          - brcm,bcm63138-wdt
+          - brcm,bcm63148-wdt
+          - brcm,bcm63268-wdt
+          - brcm,bcm63381-wdt
+          - brcm,bcm6848-wdt
+          - brcm,bcm6858-wdt
+          - brcm,bcm68360-wdt
+          - brcm,bcm6338-wdt
+          - brcm,bcm6345-wdt
+          - brcm,bcm6348-wdt
+          - brcm,bcm7038-wdt
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

