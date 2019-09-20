Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE3E9B9531
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2019 18:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405397AbfITQVk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Sep 2019 12:21:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405393AbfITQVk (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Sep 2019 12:21:40 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD0C921835;
        Fri, 20 Sep 2019 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568996499;
        bh=v/zuTY1CTu5pjJWBeLdx5nTGCDOWK5lV4Zyj61Aiqc8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Byi0omnX5o2Qp0B6SzzhVdu6PlbwMX3v0dgJ1MqC72BVGsehtYXYjZXHdYcRGg/JK
         99OOpaD+dGT4BIlJSZHTJ+52+mZAyntx2bl0nbD/hLKuZgTywL5kGZNSJR4dB94iPP
         FQzjfxQyaMZ2TXKtmRnpQT185uFjy62anyBL4uzM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: watchdog: Add missing clocks requirement in Samsung SoC watchdog
Date:   Fri, 20 Sep 2019 18:21:23 +0200
Message-Id: <20190920162124.7036-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920162124.7036-1-krzk@kernel.org>
References: <20190920162124.7036-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The Samsung SoC watchdog driver always required providing a clock
(either through platform data or from DT).  However when bindings were
added in commit 9487a9cc7140 ("watchdog: s3c2410: Add support for device
tree based probe"), they missed the requirement of clock.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Indent example with four spaces (more readable),
2. Add also missing required entries for clocks.
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 5a3a3cec8e20..2fa40d8864b2 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -26,6 +26,13 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: watchdog
+
   interrupts:
     maxItems: 1
 
@@ -37,6 +44,8 @@ properties:
 
 required:
   - compatible
+  - clocks
+  - clock-names
   - interrupts
   - reg
 
-- 
2.17.1

