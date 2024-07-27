Return-Path: <linux-watchdog+bounces-1435-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 499DE93DD5E
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Jul 2024 07:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2F001F233AB
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Jul 2024 05:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C2917BDC;
	Sat, 27 Jul 2024 05:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNNar1S6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64217997;
	Sat, 27 Jul 2024 05:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722056983; cv=none; b=PD0y2C7jm3pYkXWAS21mUwXgWoU0wQFYa91rCauokGVT2vgTzdD7EaqJnpMMWlP0V2IGY/cr7d/OS/7E7yY5y/BAuG1DvtyMdnnxCQ2J3q3E2ExB19AfqEA/vH7yrV2lEuOTw4WcazR43FqCosovT/0zqy/LhW8izyeiLs/Ogd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722056983; c=relaxed/simple;
	bh=MVCNgo/Tp7CPMuz2EaO2D4HISot9pdW8thVWBAuPGLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnnN2s1/x0ZywnZ2A0p93dFTj2oNDreJJym1T6cVr4r1T+BjgOYfFMMdZAcXuiWbvXIwGtX1501oTCTkSthDSsqyZWGhaX/60CDJwJtFgze/3iF2sxd3pPFvOQASsB/BsbZcfKSG/YkKeSVhkCzwdHjpCUodSsHSp6sNr36isHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNNar1S6; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-816d9285ebdso78126439f.0;
        Fri, 26 Jul 2024 22:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722056981; x=1722661781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KezRWlMHWppL4zDjD2L8NB3GYvurHynswjzScsZDOBQ=;
        b=nNNar1S6EZ7o2UW85zh/D9SdXcGwxHSAD78Ki+OeXOmzKN/c0L+vWzdAk3FZni1ETG
         XBCR9rTarps9ZUjAk4oBmwGLKjZZLC07w+DNCVrYt+MPzBAX4qCCrUMTsbIVwheNDDeJ
         CQ2ifngeMUnC4sCnjoa6OUQr7DiwpkcGcU8qBjY6SmQi5vYqjYwWWywxvjC8kt3C9bcV
         ZGOtUvUHS5qEMWbNdsELKqXAJRq1MHe0+7y54seBkV6MbVOTk6kGR/RWDck9TJ7dsSYU
         gC8ic9zU1pVd/ITUPbg0OEOR0OVHdzo1L2HcEpuZsyEqiJL8qNj1CU1xMolUfG3PsYFJ
         AxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722056981; x=1722661781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KezRWlMHWppL4zDjD2L8NB3GYvurHynswjzScsZDOBQ=;
        b=tWYsIHa8f4c/0ZbxPRzWDk+mnEf260UlNHb5PkYIr03yjxuTh1IOUwgCunav6xE/H8
         Wtuny2NHjmooh7RoHvEU/aRg1U+PtFGQMMD0c+R66kQrviccEBB2TmMUED8K/li4r/7I
         1UY39EoMS2gn7LMrktZUpHt2BMQHNlZpVdMNV7mpuMHjxSKqzRSx2BPjL+lqB6WUXrSQ
         dFORmWcd+RYeoItgV9XsgXZ/tEZtkvg16BKl69DrIaLGF2l0baCprzxlJqQU2e20p+Ax
         j27bYwKw4/+w8pvYQDS7/W+b75Sk6OlznrpEDf+sbq6PrWWwExFgOANRP5JQI+W2OAhZ
         Antw==
X-Forwarded-Encrypted: i=1; AJvYcCVC35IhZgLlXGNLOonihp5p1sp+d1r6fBTPe8PBWPIQlW2i6be+HEUS6wMRBU3eutITh/89p0bxnKqzygiiMkW01GVMT3AtNeKKhKgd4TIFJ6mBMrFuh6PuamRIaNoWCs5iT95181fFoJ3/1sg=
X-Gm-Message-State: AOJu0YzpXsRvf33r4MQQvVXGn9857YuqVrIPIWnyUIgpHffB3L1UzLaC
	Pm1urjv1ilD+5zflcJQCEgc4tL9MrAhY7EZ3Q2WJgTjt5fycWwOd
X-Google-Smtp-Source: AGHT+IFrE3LREyqcAs7/KPl5AAviFhVqzqIOA7QvMmY4zsw3vjnMqCvoEFnvIdPkOa4KqSxO5JBhnQ==
X-Received: by 2002:a05:6e02:20e9:b0:396:e92:851f with SMTP id e9e14a558f8ab-39aec2d1682mr17264685ab.4.1722056980850;
        Fri, 26 Jul 2024 22:09:40 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:380f:4245:58a3:6108:fcf0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead87a372sm3495756b3a.166.2024.07.26.22.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 22:09:40 -0700 (PDT)
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kousik Sanagavarapu <five231003@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/2] dt-bindings: watchdog: ti,davinci-wdt: convert to dtschema
Date: Sat, 27 Jul 2024 10:34:44 +0530
Message-ID: <20240727050736.4756-3-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
In-Reply-To: <20240727050736.4756-1-five231003@gmail.com>
References: <20240727050736.4756-1-five231003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert txt bindings of TI's DaVinci/Keystone Watchdog Timer Controller
to dtschema to allow for validation.

While at it,
- Change the order of the compatibles.
- Add "power-domains" to represent that the power domain maybe managed by
  TI-SCI controller if found on the SoC (for example, Keystone based K2G).

w.r.t. to the txt binding to stay in sync with existing DTS.

Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/watchdog/davinci-wdt.txt         | 24 --------
 .../bindings/watchdog/ti,davinci-wdt.yaml     | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
deleted file mode 100644
index aa10b8ec36e2..000000000000
--- a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Texas Instruments DaVinci/Keystone Watchdog Timer (WDT) Controller
-
-Required properties:
-- compatible : Should be "ti,davinci-wdt", "ti,keystone-wdt"
-- reg : Should contain WDT registers location and length
-
-Optional properties:
-- timeout-sec : Contains the watchdog timeout in seconds
-- clocks : the clock feeding the watchdog timer.
-	   Needed if platform uses clocks.
-	   See clock-bindings.txt
-
-Documentation:
-Davinci DM646x - https://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
-Keystone - https://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
-
-Examples:
-
-wdt: wdt@2320000 {
-	compatible = "ti,davinci-wdt";
-	reg = <0x02320000 0x80>;
-	timeout-sec = <30>;
-	clocks = <&clkwdtimer0>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml
new file mode 100644
index 000000000000..3c78f60f5f48
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci/Keystone Watchdog Timer Controller
+
+maintainers:
+  - Kousik Sanagavarapu <five231003@gmail.com>
+
+description: |
+  TI's Watchdog Timer Controller for DaVinci and Keystone Processors.
+
+  Datasheets
+
+    Davinci DM646x - https://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
+    Keystone - https://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: ti,keystone-wdt
+          - const: ti,davinci-wdt
+      - items:
+          - const: ti,davinci-wdt
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
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
+    wdt: watchdog@22f0080 {
+        compatible = "ti,keystone-wdt", "ti,davinci-wdt";
+        reg = <0x022f0080 0x80>;
+        clocks = <&clkwdtimer0>;
+    };
+
+...
-- 
2.45.2.827.g557ae147e6.dirty


