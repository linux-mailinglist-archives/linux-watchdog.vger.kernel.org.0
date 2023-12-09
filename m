Return-Path: <linux-watchdog+bounces-176-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D880B4E4
	for <lists+linux-watchdog@lfdr.de>; Sat,  9 Dec 2023 15:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F17A1C20B7E
	for <lists+linux-watchdog@lfdr.de>; Sat,  9 Dec 2023 14:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953DB156D1;
	Sat,  9 Dec 2023 14:28:09 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB37310E7;
	Sat,  9 Dec 2023 06:28:04 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B9A6524E03E;
	Sat,  9 Dec 2023 22:28:03 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 9 Dec
 2023 22:28:03 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 9 Dec
 2023 22:27:59 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Samin Guo
	<samin.guo@starfivetech.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] dt-bindings: watchdog: starfive,jh7100-wdt: Add compatible for JH8100
Date: Sat, 9 Dec 2023 22:27:23 +0800
Message-ID: <20231209142723.2060196-3-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231209142723.2060196-1-jisheng.teoh@starfivetech.com>
References: <20231209142723.2060196-1-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
watchdog.
Since JH8100 watchdog only has 1 reset signal, update binding
document to support one reset for "starfive,jh8100-wdt" compatible.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
---
 .../watchdog/starfive,jh7100-wdt.yaml         | 29 ++++++++++++++-----
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-w=
dt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.=
yaml
index 68f3f6fd08a6..eec182317219 100644
--- a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
@@ -19,14 +19,12 @@ description:
   isn't cleared, the watchdog will reset the system unless the watchdog
   reset is disabled.
=20
-allOf:
-  - $ref: watchdog.yaml#
-
 properties:
   compatible:
     enum:
       - starfive,jh7100-wdt
       - starfive,jh7110-wdt
+      - starfive,jh8100-wdt
=20
   reg:
     maxItems: 1
@@ -44,11 +42,6 @@ properties:
       - const: apb
       - const: core
=20
-  resets:
-    items:
-      - description: APB reset
-      - description: Core reset
-
 required:
   - compatible
   - reg
@@ -56,6 +49,26 @@ required:
   - clock-names
   - resets
=20
+allOf:
+  - $ref: watchdog.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - starfive,jh8100-wdt
+    then:
+      properties:
+        resets:
+          items:
+            - description: Watchdog reset
+    else:
+      properties:
+        resets:
+          items:
+            - description: APB reset
+            - description: Core reset
+
 unevaluatedProperties: false
=20
 examples:
--=20
2.25.1


