Return-Path: <linux-watchdog+bounces-3274-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F51CA83CD7
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Apr 2025 10:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F51D16C348
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Apr 2025 08:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CF420B801;
	Thu, 10 Apr 2025 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S67htKsN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4EC204687
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Apr 2025 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273609; cv=none; b=gl2yAL4Z/TD53g35ME0uzzoskNYT7OgoPBen8rH+7wm+gH7xikNxBqBkURvDI31xtUCG/u0OltecdxTPL+k+bj60PnJWdVuLZCFHKp+KefCn2OiAexHo31/bxHXC9/OJqkZdgH9g1ifxZ2TsR1F2227g7dE2IHSL+Rdns9iMasw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273609; c=relaxed/simple;
	bh=Qw+ihHzG5xct+geio3rYuIIVhgSwwRDJSCuqYbtpH4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjLqPMLsV0n5K1uG1DTguMZwABiv7laCxR9zY/zQjrtz8P0HtBj6/cpyc+U0xr3HaIuuQNEZoIZeHT+oATfTNmpozpDt45v4uNvqWzNNg2XGbaALHmPTMg4t+xdTlcQYvPUeJp9/3D56Q56bb28tWpilPVkHPSrtiF/fUFK9/pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S67htKsN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so258279f8f.0
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Apr 2025 01:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744273606; x=1744878406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoLuuoO2Fvx4pIGyt5bGUZIVskYzSTtG3IaMJttRhAg=;
        b=S67htKsNjmw9XgntdxzuX+TxJRFXrkBYb2J6hbSnES4mk33LR3Ay3lyy4VuWSeAzSi
         LLAoWcw3OI9JUvD5BR/CknWHTM2OUd8uLXN522Oi2oZCwPDl9ksJeaB9rNGBuVN8y+eq
         3vbvYHhAKpA70zfoYEz6ZAMRh9OqSYRaamrrWtrOLMEDIaqU2LkAcmk7sB2CMYiw5WBF
         MmUHvWbGRaBJ98/I26MnYRgwhBWdAeoQjqoJC/06NvXOGJlX+QbVaMixWFPvWkeE9CH3
         PmY0GZ5drccFuHtX9yDzFxFBvDRpEJ1RP0B/hYkK406od8b1LxRMJNie6Dhfhyi/qwaU
         /cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744273606; x=1744878406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoLuuoO2Fvx4pIGyt5bGUZIVskYzSTtG3IaMJttRhAg=;
        b=Lupl1BDupxbiXVfWHcQP9LFIm4IxggHmMFvlpmzRPBtIQO92lrqCOLSdGaSVDCpHwD
         JVhxxjYkeQSs2BU3Wgc/HPWSsOrORKzPaC7RKDJW89rtSUUBXeiTKP6SBPvIxgAf2O4J
         oWJJv5C7rWgxRA3WdfBx43S7Ds2MRmb+vdhA4gqy+syzaQ0z0Slltqoocgoci8dcKxOY
         l1rY31LsbsDgAy2XO/m+esdLTVW3wn7kCWA/tDh6GF2XJvpuz8MduayzM/RUBHZjlgOi
         c14Z0MGvMuiAbDaR1kq9/fYyf9CLbT+prH3SuMTIdit9iWYib5XJ1edNbz+9SB0p2HDF
         Wg2g==
X-Forwarded-Encrypted: i=1; AJvYcCVjiwEpP9n4XCOe7MnG3Mdx0Ey9WHe2609AVOKe/wZ/ub0fJzxwwiatLRQTLY1qQc+vhULdD/foges8DqJ5Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz72ngqudRE7ft9/b2g5gV0u8htgznNDB+jni4hSXYNIUQORgKe
	oUkgkt0MkZT2kNIxVr+kaQU4x/X72Anl6UKhUyIRBRy8WgmGtG+ustczispkiL8=
X-Gm-Gg: ASbGnctmX/jp5sQNmqSc3AAxml9QKcIt/hyQZfT4iXSCvTQt7akqH9onqj524oii3u9
	Og1zKyJx/r+T2RK1srv4udqZxWx59vb6pkOEzNdue4MXvs9FT1ACGcqhHkW3pHx674X/5gBVA/q
	r7cyAOysjYUIclQzUv0yhZRWWqPhf4KKXQ4BvT7IQC3CtIMnRRMElMxTgQJn1fkV2tKiy1TjPXw
	sOWdIqf19NZ0c7J6Q59At4+fO8r5WhsWw359NseJnqUXzOrGQVoVbdYZ0Q9BA0g4yIxfCvLkSEa
	JmzPLwOGtXvJR5ZsVMH6OoNuKAebvLAzbWMqfwQUI3C0TyMCnTPvL57N/PuNACuGazA=
X-Google-Smtp-Source: AGHT+IFJAAYpm4ch8BzX/j32mCSfuBT0k4tmo3Fc4S6M/p1AIC8JN3xN7HEUUqArc7BN3Wfv8o/vIA==
X-Received: by 2002:a5d:5889:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-39d8fd52397mr1003636f8f.29.1744273606025;
        Thu, 10 Apr 2025 01:26:46 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c84sm42884645e9.11.2025.04.10.01.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:26:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	S32@nxp.com,
	ghennadi.procopciuc@nxp.com,
	thomas.fossati@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	alexandru-catalin.ionita@nxp.com
Subject: [PATCH v4 1/2] dt-bindings: watchdog: Add NXP Software Watchdog Timer
Date: Thu, 10 Apr 2025 10:26:13 +0200
Message-ID: <20250410082616.1855860-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Software Watchdog Timer available on the S32G platforms.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/watchdog/nxp,s32g2-swt.yaml      | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
new file mode 100644
index 000000000000..8f168a05b50c
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nxp,s32g2-swt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Software Watchdog Timer (SWT)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-swt
+      - items:
+          - const: nxp,s32g3-swt
+          - const: nxp,s32g2-swt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Counter clock
+      - description: Module clock
+      - description: Register clock
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@40100000 {
+        compatible = "nxp,s32g2-swt";
+        reg = <0x40100000 0x1000>;
+        clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3c>;
+        clock-names = "counter", "module", "register";
+        timeout-sec = <10>;
+    };
-- 
2.43.0


