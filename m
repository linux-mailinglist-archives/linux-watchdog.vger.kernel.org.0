Return-Path: <linux-watchdog+bounces-268-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4DF80E5D2
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 09:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC9A21C2092D
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 08:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56D8219FB;
	Tue, 12 Dec 2023 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1Nnda6V"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9601A261;
	Tue, 12 Dec 2023 08:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21814C4167E;
	Tue, 12 Dec 2023 08:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702369325;
	bh=7ExsGWYEQIIInuR7uJ4VrJxxLfA/5YuhSMVK8oL9Zmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d1Nnda6VhkKmfYMJfecIjMksEIX+vj8wGpnQS5QJ/9a1Nyxi4zK5Ex8e4Z+4no0Qi
	 WRCcqNnqlR+bmlMxGsju/1QsH3qEY60t+cZVt0wUUfj6CfxFNm48vQexqN+r+7EWXv
	 Fxtx5dzS/dswBQr2HT17KMGyQTP3KybBbdianbg9zlYaMS7SSo2TJwDofp4dlHciNs
	 T72d2Jp+pmYZEElRRboQxDmRv2Dq+jG6xVU1Y3NbzKkcTz6MT+u9uDlRKmLDEwnNwn
	 lkRWx1XlXFl2fkuDIMbB2EB9YnX8UIZUs47g9AfeRoRLcnlibbuuXGmx2FXCXd0u/U
	 QCELNbofAKhrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F354C4332F;
	Tue, 12 Dec 2023 08:22:05 +0000 (UTC)
From:
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Tue, 12 Dec 2023 11:20:28 +0300
Subject: [PATCH v6 11/40] dt-bindings: watchdog: Add Cirrus EP93x
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-ep93xx-v6-11-c307b8ac9aa8@maquefel.me>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
In-Reply-To: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nikita Shubin <nikita.shubin@maquefel.me>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702369322; l=1622;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=oi1524pxijJgURrfk58fykAJeXaA1N46ukZR7iTBG5Q=; =?utf-8?q?b=3D1wvmNqEe4dJ6?=
 =?utf-8?q?m1vZAkH2IIRofHEZn1td8hyqdvJqtBQl6YeUFbCcYiIV3gR6k/3CTq6CFs0eCUa2?=
 aGyZzxmcDA6S8Hvg/zpwuLnKZq0IJlfws6DTYOIv8fVYN/G6FCNS
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received:
 by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: <nikita.shubin@maquefel.me>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add device tree bindings for the Cirrus Logic EP93xx watchdog block
used in these SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../bindings/watchdog/cirrus,ep9301-wdt.yaml       | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml b/Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml
new file mode 100644
index 000000000000..5dbe891c70c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/cirrus,ep9301-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic EP93xx Watchdog Timer
+
+maintainers:
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: cirrus,ep9301-wdt
+      - items:
+          - enum:
+              - cirrus,ep9302-wdt
+              - cirrus,ep9307-wdt
+              - cirrus,ep9312-wdt
+              - cirrus,ep9315-wdt
+          - const: cirrus,ep9301-wdt
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@80940000 {
+        compatible = "cirrus,ep9301-wdt";
+        reg = <0x80940000 0x08>;
+    };

-- 
2.41.0


