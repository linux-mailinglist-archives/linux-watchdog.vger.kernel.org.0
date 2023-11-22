Return-Path: <linux-watchdog+bounces-27-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179657F40E6
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Nov 2023 10:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C74082817A5
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Nov 2023 09:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F123E467;
	Wed, 22 Nov 2023 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nazes9oh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36453B293;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4942C433C9;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700643675;
	bh=7TFUgVNx7MFF4hDvyRsv3aD+KpcwokTV6SI9MQ15bhg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nazes9ohVioahI3s9aFTRGJ4IZIZAJkyg1/Xg7SIckQsvW5FsygLpo3gXbdS+/qp/
	 xEVKHs4I/FGPAnyP8Xd1jPM6ZrrtE9UwpPhPZLxEDwN/wMi8aEkD5AC7vF0dfrGt5t
	 bVt6HNTsqe2NHMIwOILtRy3rOnnd3r41zo5z30VBpOenq3B+6jWDIVtKW34N+KGBwZ
	 IATml9J+zJo3Neb3oS5LmSDds++bbEBsuBKOlET7zfMMPi1+st+D2P9IXNlALK1Zk6
	 TFtz73/Jctxzrgxh4XoiqZGb2WJLuyrIXR4pEBOvLus94dSg5oe4UQGwxU4Me+a/21
	 rF0oF6iFNrHTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917FCC61DA7;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
From:
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Wed, 22 Nov 2023 12:00:02 +0300
Subject: [PATCH v5 24/39] dt-bindings: wdt: Add ts72xx
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-ep93xx-v5-24-d59a76d5df29@maquefel.me>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
In-Reply-To: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700643671; l=1685;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=UEcnhy7lgZdkEHI42LebAodW/RXUiLm6RBsiPTQtgHE=; =?utf-8?q?b=3DQSojl/m+NFg4?=
 =?utf-8?q?GtEJB1brI7RZ2tR0Sr75MFe8/ooCQCRpe/5HZ5v88W3DpkT5tDCap0ins9APHpss?=
 aSxynfCkAh7ezEX2foxJMVR4+Mj//9DaZBAle5Zr9aN7MDoQfT0Z
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received:
 by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: <nikita.shubin@maquefel.me>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add DT binding for Technologic Systems TS-72xx watchdog.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../bindings/watchdog/technologic,ts7200-wdt.yaml  | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/technologic,ts7200-wdt.yaml b/Documentation/devicetree/bindings/watchdog/technologic,ts7200-wdt.yaml
new file mode 100644
index 000000000000..7e4bfef152f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/technologic,ts7200-wdt.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/technologic,ts7200-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems TS-72xx based SBCs watchdog
+
+maintainers:
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: technologic,ts7200-wdt
+      - items:
+          - enum:
+              - technologic,ts7300-wdt
+              - technologic,ts7260-wdt
+              - technologic,ts7250-wdt
+          - const: technologic,ts7200-wdt
+
+  reg:
+    items:
+      - description: control register
+      - description: feed register
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@23800000 {
+      compatible = "technologic,ts7200-wdt";
+      reg = <0x23800000 0x01>, <0x23c00000 0x01>;
+      timeout-sec = <30>;
+    };
+
+...

-- 
2.41.0


