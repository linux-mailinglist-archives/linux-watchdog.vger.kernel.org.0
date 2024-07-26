Return-Path: <linux-watchdog+bounces-1431-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D490D93D595
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jul 2024 17:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0390A1C21C89
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jul 2024 15:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4F717B4E8;
	Fri, 26 Jul 2024 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJmf91YZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F7D7494;
	Fri, 26 Jul 2024 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722006377; cv=none; b=jkgFTGHbX5qYvyS4Aip7dsdHG9zVPtomg8KIvm8MY8I9Sp2+gSsLHXWN1zSU/7QMxjWInYoLYCV2NuDnlsAoIkR09TsF0dP0y+TSVUAw5U8MJ/Q3FAeMKEwjGj97BY1D3hxWUZh+DGWwoA01MNz6fs+KLgnu4iTeZ2vHwzHi9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722006377; c=relaxed/simple;
	bh=zNegDs7IixATjoGPAa30JjWGOk+4DNZnIDt30qizHp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6H1M3V3qxnejtoeQTuZGbo/1UwtQuY8HM5o+vRbo76aW2EuCVVWsA6qW6fgQOKyfA2z5ffht4yAP9c7ijlQ82hwFabMJarDhmirWnP3xZZtPip5c20+h+EDcMCAdKELXfk8BVkltRtYhUnN9c7BjD4jwKyrCvbOHKbOSgCzmrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJmf91YZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d1a74a43bso882291b3a.1;
        Fri, 26 Jul 2024 08:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722006375; x=1722611175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VrbZNbmJ7JMtH+xNH73DHYvvEhCGE7dQA589fsSrmM=;
        b=cJmf91YZ8vq0RdMO3Z6DQ0ukzUJT6Ms+qgprLw0br8kASJh6JAWv+W6/a6LojEpoL1
         Z86PcLelcfpqSj+oAa69Srah2gO/9NOnzPkxtmzcvHIunKnp2MKgh4x+ToK/XPloIFEs
         vK76f3dgm3M91BOAqLlwKw0kRPfLQi5s1R6bg5a05xCyFBew8diNlXz37IC8glAyeSwu
         JObd0YJjBWfB7kekylIbvA1Fin8OmS0MKjSffj2rct+OncZWB/LlXL59rlKaUSTn76l1
         v2tnu8AMpOFPYZ9wkoyXk1G3u/rokjwgwSl10dd94nsXzKzZrcTYW1lxiaV+xW4H7rRB
         1RVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722006375; x=1722611175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VrbZNbmJ7JMtH+xNH73DHYvvEhCGE7dQA589fsSrmM=;
        b=gOLjy4huOcDKUm9u6ANgRSVAeEUB9Z01jv+YyA0bH2wXAc6bqGLfHKQTr63yk3t7O4
         JhBDa1ivvyA5VtBww3BG8nUDeNuNTSyrauyrUu3U8K5DvjyJCtlwClbC+NHK5/qf4MPw
         sUivSY9HpjOvFy5yZoB63talGNIPC6MsyUKqe+4dklynLmBxj2+wPu3ycleuCinEaMvk
         pF9pp3qrqfZ6EfxfXtJDHU9OTbmZW/6n4Xx7DZ/q8u6k+0NrYZHUZQMTp0nJ8AjX9UmB
         MWlEDKUxkcUkvRvA31PK4tNlUHVRSsVe8pF1nVuOxl1+lDhNuAS2yYOjyLpYRSK+bN7P
         B85g==
X-Forwarded-Encrypted: i=1; AJvYcCVjU9L/VtbRy1qdKO4shoMK7ifxLHp1tFUcHju4e25nXfk8YmN1WvEwRrqh5Q19tYOVNREzY4K5Cc5QI8GBBd5B9Ff7tjx1CvgTvttVJp2yRHVsuBrCynOLrd1mVeKaMHDTiKxfTdzeHbtAD0U=
X-Gm-Message-State: AOJu0Yz56mTPcjkRu6bM6tqMMi6nqROzTKFCp6jMainDcDP/6Iiup04X
	u69qYnyg87xBKoLwqK7LYIB9BvvDYHniFByXjdlil7Z9f0RHZIB/
X-Google-Smtp-Source: AGHT+IH0QfbgwfW0oSDbSO/JNs7TLWJD2TXmUuRaCnguOGKxIMZlk5QVHAXdKAQE953U85VOygHVSw==
X-Received: by 2002:a05:6a20:c88d:b0:1c2:8ece:97ae with SMTP id adf61e73a8af0-1c47b2d72c5mr6389057637.34.1722006375078;
        Fri, 26 Jul 2024 08:06:15 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:380f:8948:e4a2:69fb:4168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7aa9b184139sm2357653a12.75.2024.07.26.08.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 08:06:14 -0700 (PDT)
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
	Kousik Sanagavarapu <five231003@gmail.com>
Subject: [PATCH v3 2/2] dt-bindings: watchdog: ti,davinci-wdt: convert to dtschema
Date: Fri, 26 Jul 2024 20:27:50 +0530
Message-ID: <20240726150537.6873-3-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
In-Reply-To: <20240726150537.6873-1-five231003@gmail.com>
References: <20240726150537.6873-1-five231003@gmail.com>
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
- Add "power-domains", which is a phandle to the associated power
  domain.

w.r.t. to the txt binding to stay in sync with existing DTS.

Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
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


