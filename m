Return-Path: <linux-watchdog+bounces-2048-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBAF985624
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Sep 2024 11:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03ADD286721
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Sep 2024 09:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1669E15B11D;
	Wed, 25 Sep 2024 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imprr0Pn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4879714C5A7;
	Wed, 25 Sep 2024 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727255639; cv=none; b=EgZ1PluYMgdljmQOrCXAxPCWDW23V+i9o5c6BHI0qBmkRdN+lC3363/8ffX3pOlpZ4/fQLEC4YvXH1fDTow28dJXHJBzN8ULcAik5ypdOJ0HLRVJpbhPMvWNiYYnzu4BXayF4Y8sE6SPFENcuaOi4DjwggWnPO8KUbiZJ1rk7ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727255639; c=relaxed/simple;
	bh=Bcqy6qwB88bQtZ81AP70em5WMBS3qUjpTWzEt8AZpMw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=E7pVQHn8wzU5nzjN3Exgtr4rcZ9r49W+2XV0AMTD6yohwxM8G3LaFl0EFJ32ZeQS5BekF85d+W8HQPK3MJ+KK7JtOV/v82QbogFiRhRHgVUVbTgh2NGM3bL0o2wZfqixvwdKFhwK/z/TbWqWl4qkT+hDIU+zCeX0sDBnWmirvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imprr0Pn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so53993475e9.0;
        Wed, 25 Sep 2024 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727255636; x=1727860436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmc4VwRX2yQnWBOFPsHjrta+OlMkLczgUbDlsoVrhM0=;
        b=imprr0PnMXrs6l31N9ep4YWReNx3AImy5BzPaA5vFEJtVDILqYom0gpM8tjKpbZ2zH
         WQs8RIxoWRSsDTMsdDyTueFyY2KEYEijylZBL9ZGgrklQvKFOWTcvHoYJPGf1/z8Viql
         71di4IJSPdt7iRGImdrWV3p978vu/jaDJXxn0X5k56iU6JzMgCcAJYXMVnofljsyeeut
         bdJcE4QiTlPjXm3uCFpxPJBWUWNpZWjNytg1AftLxiv3t2tgY8xgHtDPaunQuNKUW/o4
         W5qgbZfjRb2/ZgGfRLgIdWx4uRqsxVQ7r5MfZ45CvTAIUIkfsV8PXON5WEhuQ5uVvXmJ
         FhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727255636; x=1727860436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmc4VwRX2yQnWBOFPsHjrta+OlMkLczgUbDlsoVrhM0=;
        b=iUbL1Vze0GLoHgztwv4JU/bgbSTYNQoEII5AN9v36NkXYuxlN1MwZyqAleP75ZbVut
         azwigkrHhsRzmaOFJgenaq5ziATz4reoyyLCHq4JufV2oIPRkiLsfM14AjU0dBktddMr
         /MWmXLGXs1yZphVwoMu7vKRx+GfXXd0T7awwlX/QB+TxkHsp8KMzfmLiDuA0T8gg3CG9
         gHmd+j2UuMLA9lNjOBVvkmrl86fe6oK0FqnCvvwbGckqkKpjBqNnUH2wiaKfuZHbpgON
         sy2YV9OIEfSP6ekmqoja8kXYDPEgOQ/F1uaOmV+Av9rFJq2XJGtOmu9l+L9qGq2vARdv
         JoSg==
X-Forwarded-Encrypted: i=1; AJvYcCU5pZPHJo32e0J8haXNPL5eLsNYfFgAKqvczeUSNuJCTVbyZpUjxqS9XzVU+4giI86UIg9xZCsi5ST5wtXj0hY=@vger.kernel.org, AJvYcCUbaJNAf7tAMiHBW1dBgqPCeavR+ZqyYGkgGN4JOmj9z6cJNRQGIkiqIULeOLVZ9ZSFI+qX0tQxXyRfbCag@vger.kernel.org, AJvYcCV8GdTxnnZ4c9vDlJFk/VK5XJnusllMI06DFSC2TKyUfI9R/sx8lodh4QkVyUo0vFeg1LQdmqCqRc+g@vger.kernel.org
X-Gm-Message-State: AOJu0YxpIoDTrN/0JPpMYnjGrIPVNjO/R/eveiFevJAtvhaDHl4dkt1F
	//b6rzRnew9WNPkr4PUK1S4H578JdI+y00gxDGHQ19GLa9juN1Zc
X-Google-Smtp-Source: AGHT+IHcV2OIh+TmcPn8x23oHp3VvS46CXzNfiXUqVSUTW/byV5fg4fBk5Ev366laivt9bC5c0sJNQ==
X-Received: by 2002:a05:600c:3b93:b0:42a:a6aa:4135 with SMTP id 5b1f17b1804b1-42e9611d7c1mr13942035e9.20.1727255636146;
        Wed, 25 Sep 2024 02:13:56 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a16aa3sm12045605e9.39.2024.09.25.02.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:13:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	upstream@airoha.com
Subject: [PATCH v2 1/2] dt-bindings: watchdog: airoha: document watchdog for Airoha EN7581
Date: Wed, 25 Sep 2024 11:13:09 +0200
Message-ID: <20240925091326.2900-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document watchdog for Airoha EN7581. This SoC implement a simple
watchdog that supports a max timeout of 28 seconds.

The watchdog ticks on half the BUS clock and requires the BUS clock to be
referenced.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Drop clock-frequency
- Correctly attach BUS clock

 .../bindings/watchdog/airoha,en7581-wdt.yaml  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
new file mode 100644
index 000000000000..6bbab3cb28e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/airoha,en7581-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 Watchdog Timer
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: airoha,en7581-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: BUS clock (timer ticks at half the BUS clock)
+    maxItems: 1
+
+  clock-names:
+    const: bus
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
+    #include <dt-bindings/clock/en7523-clk.h>
+
+    watchdog@1fbf0100 {
+        compatible = "airoha,en7581-wdt";
+        reg = <0x1fbf0100 0x3c>;
+
+        clocks = <&scuclk EN7523_CLK_BUS>;
+        clock-names = "bus";
+    };
-- 
2.45.2


