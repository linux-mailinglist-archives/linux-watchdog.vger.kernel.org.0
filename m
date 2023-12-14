Return-Path: <linux-watchdog+bounces-337-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED368125EE
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 04:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B41C282261
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 03:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A43615C0;
	Thu, 14 Dec 2023 03:32:12 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3647F2;
	Wed, 13 Dec 2023 19:32:07 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A239224E2B0;
	Thu, 14 Dec 2023 11:32:03 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 11:32:03 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 11:31:58 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Samin Guo
	<samin.guo@starfivetech.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/1] dt-bindings: watchdog: starfive,jh7100-wdt: Add compatible for JH8100
Date: Thu, 14 Dec 2023 11:30:56 +0800
Message-ID: <20231214033056.3953143-2-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214033056.3953143-1-jisheng.teoh@starfivetech.com>
References: <20231214033056.3953143-1-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
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
 .../watchdog/starfive,jh7100-wdt.yaml         | 48 ++++++++++++++++---
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-w=
dt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.=
yaml
index 68f3f6fd08a6..79082c5f9971 100644
--- a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
@@ -19,14 +19,17 @@ description:
   isn't cleared, the watchdog will reset the system unless the watchdog
   reset is disabled.
=20
-allOf:
-  - $ref: watchdog.yaml#
-
 properties:
   compatible:
-    enum:
-      - starfive,jh7100-wdt
-      - starfive,jh7110-wdt
+    oneOf:
+      - items:
+          - enum:
+              - starfive,jh7100-wdt
+              - starfive,jh7110-wdt
+      - items:
+          - enum:
+              - starfive,jh8100-wdt
+          - const: starfive,jh7110-wdt
=20
   reg:
     maxItems: 1
@@ -45,10 +48,33 @@ properties:
       - const: core
=20
   resets:
+    minItems: 1
     items:
       - description: APB reset
       - description: Core reset
=20
+allOf:
+  - $ref: watchdog.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - starfive,jh8100-wdt
+    then:
+      properties:
+        resets:
+          description: |
+            Must contain Core reset entry.
+          maxItems: 1
+    else:
+      properties:
+        resets:
+          description: |
+            Must contain APB reset and Core reset entry.
+          minItems: 2
+
 required:
   - compatible
   - reg
@@ -69,3 +95,13 @@ examples:
         resets =3D <&rst 99>,
                  <&rst 100>;
     };
+
+  - |
+    watchdog@12270000 {
+        compatible =3D "starfive,jh8100-wdt", "starfive,jh7110-wdt";
+        reg =3D <0x12270000 0x10000>;
+        clocks =3D <&clk 78>,
+                 <&clk 79>;
+        clock-names =3D "apb", "core";
+        resets =3D <&rst 15>;
+    };
--=20
2.25.1


