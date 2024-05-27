Return-Path: <linux-watchdog+bounces-1072-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C318D0E73
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 May 2024 21:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10F1B282DA7
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 May 2024 19:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BFA1CAA9;
	Mon, 27 May 2024 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USf5Xh2X"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C98161336;
	Mon, 27 May 2024 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716839943; cv=none; b=e3X4hWUJKvyc0fgWZcbX1W8NwuepHmieiAoK+UtI7BpfMHWVNcNwBQzZdbWY6Kf4WLtIbFaNZj/3wgirPeWalq6+mxNiZYnzNACd6ChhpytSBmCVl+1m0i51RImz4mAc/4YXGm8evyHGBJ93XB88QkSxUrkXZwTNi85wifYS5ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716839943; c=relaxed/simple;
	bh=7HwlJsTk7wTCHlcGXASmOSkMO2SL/hHsk/04XDmFPUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UTiONIIttninCRJxR/0Qf4FbrtSJCsWCyLTW4W8RNZi+OKT3lQaRun/f4SK5At9daJNy+CXIJUV8IqdPxcHPKL3xSJpUofvem3tDI0gleCyGIs67JYl1dmo3pZuDXqvaO7v6X+VTTvg3BscJ5fNpmHDJIT+Vi5OJJWLd+YQDWUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USf5Xh2X; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f44b5b9de6so1075725ad.3;
        Mon, 27 May 2024 12:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716839942; x=1717444742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7aZbVHWf8PRPM9u8We9otI6H/hby/EBBNdp17XPutA0=;
        b=USf5Xh2X9HOs7GftdY9No9RwUnyBY1YGDhlcudTAxxNFAvoyICGFlTyqdHuYINzXzD
         kxYQ+t3IZezEFccakPmZ77hajVz0NYFjiSJpAAlvu/lLrWaj0QwbKWTBHpCQymyf+G9t
         Ww3pZHOzThpBAfBgP7yjOJqifmRc1lps+xhj0nmjdIa6MZ2OWwkzZe35L9UmaE/ct8VW
         179xQE2ehS54XecoBee/jK+wXIQVzGlI87I0rwz6BaNCqjtG1zEGCMB/XoC/JKU29bSE
         2eU5dH+QM5kgCIsVb6dH605K+L4OMAOy/cxpERGCydClIon87/CNUWEd42OaR47RHXU3
         kTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716839942; x=1717444742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aZbVHWf8PRPM9u8We9otI6H/hby/EBBNdp17XPutA0=;
        b=N4BKbibrcq51tSatdOdcq+TCHl+nTZmTokboYe3Bnx4rkwgUAAry5IMkwdpg4x9qtl
         TC/D5y79vVtYLWLjqEyIfggs/HqtBZ+Xkx3cY0hWh4g8jxDDykHkZpDUB2R8aqv/wrGO
         7zGzjQnSn9j35ocR2uF8vzmOqDl18idnZUok6S6HPg2MxghoHZzmFN43/J3gkIja/AZp
         ENniJCasiKzj7SRRgb2M4Rs86lVYzI3pmb2jVCdrv5wfVWESuMVGgIqy6xAvm5y3iDCk
         8FyoZtxKJdO9WBeAhPqiN3PUBGcJSNKs1PSE7a2sygnQCz0V11gvoaIO3ofqLo/qmsY3
         Ujrg==
X-Forwarded-Encrypted: i=1; AJvYcCXZCufx/uchB13l2rX2Mjw+ElnHV/J24aZxL44+IDUarEzwakkdkrdpqBHJaAXZ3Nn8HUBseMUvwSGGaqGUXZPfi+sHK+kjyuLxPbC0wsiQMyf6Posapnin+vBLMJ9l+ko4uYuB3Ip9uw==
X-Gm-Message-State: AOJu0YwVgFyMLsbBcmXwtmtCBe6whbOxia1m/5syvNHDFKl76tcKq6ym
	glK/4hsrKb30vpR+ggZSr3AHwWxWSpCcKrN/+DHsJC3fGwTlztnjuNQz5+ta
X-Google-Smtp-Source: AGHT+IH3tzAQC/TIgpUDvGmWELBAnrpcUfWvKnZ7GZyTlAe8ndO1lQPxLG4foCxI+yL6T0kjVP8/oQ==
X-Received: by 2002:a17:903:41cd:b0:1f4:a45b:8429 with SMTP id d9443c01a7336-1f4a45b8a85mr30853005ad.27.1716839941631;
        Mon, 27 May 2024 12:59:01 -0700 (PDT)
Received: from shresth-aspirea71576g.abesec.ac.in ([117.55.241.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f47596cae0sm42664875ad.237.2024.05.27.12.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 12:59:01 -0700 (PDT)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Shresth Prasad <shrestprasad7@gmail.com>
Subject: [PATCH v2] dt-bindings: watchdog: img,pdc-wdt: Convert to dtschema
Date: Tue, 28 May 2024 01:28:12 +0530
Message-ID: <20240527195811.7897-2-shresthprasad7@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert txt bindings of ImgTec's PDC watchdog timer to dtschema to allow
for validation.

Signed-off-by: Shresth Prasad <shrestprasad7@gmail.com>
---
Changes in v2:
    - Remove blank space
    - Add item list with description for clocks
    - Drop description for interrupts
    - Drop properties assigned-clocks and assigned-clock-rates
---
 .../bindings/watchdog/img,pdc-wdt.yaml        | 55 +++++++++++++++++++
 .../bindings/watchdog/imgpdc-wdt.txt          | 19 -------
 2 files changed, 55 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/img,pdc-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/img,pdc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/img,pdc-wdt.yaml
new file mode 100644
index 000000000000..a88a27354505
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/img,pdc-wdt.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/img,pdc-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ImgTec PowerDown Controller (PDC) Watchdog Timer (WDT)
+
+maintainers:
+  - Shresth Prasad <shresthprasad7@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - img,pdc-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: watchdog counter clock
+      - description: register interface clock
+
+  clock-names:
+    items:
+      - const: wdt
+      - const: sys
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    watchdog@18102100 {
+      compatible = "img,pdc-wdt";
+      reg = <0x18102100 0x100>;
+      clocks = <&pdc_wdt_clk>, <&sys_clk>;
+      clock-names = "wdt", "sys";
+      interrupts = <0 52 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt b/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt
deleted file mode 100644
index b2fa11fd43de..000000000000
--- a/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-*ImgTec PowerDown Controller (PDC) Watchdog Timer (WDT)
-
-Required properties:
-- compatible : Should be "img,pdc-wdt"
-- reg : Should contain WDT registers location and length
-- clocks: Must contain an entry for each entry in clock-names.
-- clock-names: Should contain "wdt" and "sys"; the watchdog counter
-               clock and register interface clock respectively.
-- interrupts : Should contain WDT interrupt
-
-Examples:
-
-watchdog@18102100 {
-	compatible = "img,pdc-wdt";
-	reg = <0x18102100 0x100>;
-	clocks = <&pdc_wdt_clk>, <&sys_clk>;
-	clock-names = "wdt", "sys";
-	interrupts = <0 52 IRQ_TYPE_LEVEL_HIGH>;
-};
-- 
2.45.1


