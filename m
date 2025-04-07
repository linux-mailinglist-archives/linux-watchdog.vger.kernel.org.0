Return-Path: <linux-watchdog+bounces-3218-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126FA7E5C8
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 18:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7D11890C70
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 16:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650052066F3;
	Mon,  7 Apr 2025 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZ0gSQ+k"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C60B2066D6
	for <linux-watchdog@vger.kernel.org>; Mon,  7 Apr 2025 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041822; cv=none; b=e92kN6pWAbucGsGaEyOAOZG2u0DaYhU64OwoTU4MhAvbygS5USiIP6gyG87WMUdqALf7+MC8mNEjFgpbx3SpIA/oSMSUMA07aNHPhzOvMnXvKCLFpLUl6P45U4L/xAxXnAUcX1fu6CjFeWPU+3sHWztBYC1eiT3xEZIdGUfJ+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041822; c=relaxed/simple;
	bh=cwUg5LduXXZcufnnSzBfEonNlCK2lmvkVORVQf2hbvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5ZBUIPgiiZCtas/q8V4tN3BvFMWjIv2a96xBu/DrCf3InpCPRL2w5X+9FvYEkDlCr68fyfjlE2OQn5lAPDuBPLSHB0t4SHjgVGbYI03JewjV1V4XZCwtsRvT8sMSI1EXlnbL6Bxp6qh4m4PTaKFiFJE2NTGn7eJi6YwUUwRLTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZ0gSQ+k; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391342fc1f6so4074094f8f.1
        for <linux-watchdog@vger.kernel.org>; Mon, 07 Apr 2025 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041818; x=1744646618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbL55eomgr//IZJoFaosxxTA80M3t+xWAEMNMsogd4o=;
        b=dZ0gSQ+k/qITe+teA4mXmxNx0O6eTsggoiImqwRIx3eJDpQTV5I/d6mSdXVOxAKU1c
         M7pK4DjGxjPzk9PKe/DbzaYLGzIbyNFhbYIQl78Ur5FPC5OymDvdQwXkvc7U57Wpn7Mw
         ZvvO5swq6FpOuMjP95lAhxvHptKO7jqOwri0A+xxQLoMjzgorBdOQ/pPvtgGN9Q8YQup
         DLxcz4mGgcZwu52aSEqIJpU7ul+Clsod/A1k+BUVhw/YE1UF1mfhu3Skv7TSTW19Z6iZ
         FNwoQZSb46qNZuFQdcP896RnHiXdPMQFA84P+gX/ULYgWW20/hRZslfnB+ChMm92lXIB
         sX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041818; x=1744646618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbL55eomgr//IZJoFaosxxTA80M3t+xWAEMNMsogd4o=;
        b=uCfMyMx1qgdQgKHHKIcg7Oe935rPABsyMjNPRQ5OyVgmGZki5KvavwPBM2Xpdjggya
         qir7QVz3ex7f+eiHgtbp6IpGdF6WZADQBQN8XqkCRDgCA+15De9lYrwIuuiDcYPAeB6w
         sOGruptPen0CEJn+6eGg0RbS7XHcHdEUOom78Z8FJAiM5x7c4jPlI6SaFCK7THjG1MiV
         WEmzYK36jJLskCld1btslvooiLHCuH/u+96kz9/6dZNEYAHGUSi3LsxTuSEJQVHoGPid
         wquD0Z3/LXpBqAecY5SyD7bqHuaoLriQWkvG4g9ga9ZdIkxLuLajicSH2EskJ75m5qaO
         riuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlbGNnCTSxuW8TDVvOmvQa9KyWP0pSZiPpyyJF8PT8Mf3ywvL5Z1UJHLRqmlnwAofAN30bSzex0c+McOcZAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLXs6vAkUsaq4t4VRhZTFHOh/RswscXYnXqVHqm1bnJ0juzWbf
	J13Ykhafe38iWFIavTpZ9eNb7mZt2IihWS+Rs2+TdgDvMboNOKTEWnUQCMSZk1Y=
X-Gm-Gg: ASbGncspr94yvaJfjOto12b+CaSOkclZLNEM0acgS887H6IRXQmh4zyectE+amNsxef
	ym2yxGX1kl4xOuAXnVD6SMXIV+GJzzOnqIxDZhJn78VITZSU9sq79aXPRwD2W1yZzr905NhQNKf
	ypFDkI1+B9hUywJ057SOHg+FKKHFvV4bK+4U5b/YNDeSeXfLxhbMlGHFB2PDZhMR2xOhaH+YR92
	pdWO56Z2VXHsqSbYafE/sa3RlDMn1GvwkuRjnS/l71JJfryONGXZvb/bGxJ+alD9F3HWyPZRqwr
	Q7iABpcfevoLeIPoIdQZwWeaEOTp1WlUyg2Z90RDmxyHUpbybLw7I0Gi0TRmlAsM7PNUq/Y=
X-Google-Smtp-Source: AGHT+IGz+Q5GGF73nsTcrEA6hA6PV9lyUFIqD+pbjsmX9Oz/pnvq3IzYO9Cy6F+x+KrU3yJohdTA8Q==
X-Received: by 2002:a05:6000:1a87:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-39d1475794amr11311063f8f.53.1744041817603;
        Mon, 07 Apr 2025 09:03:37 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b3572sm137701205e9.39.2025.04.07.09.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:03:33 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: watchdog: Add NXP Software Watchdog Timer
Date: Mon,  7 Apr 2025 18:03:16 +0200
Message-ID: <20250407160318.936142-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407160318.936142-1-daniel.lezcano@linaro.org>
References: <20250407160318.936142-1-daniel.lezcano@linaro.org>
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
 .../bindings/watchdog/nxp,s32g2-swt.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
new file mode 100644
index 000000000000..48ba9e9979ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
@@ -0,0 +1,56 @@
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
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
+    minItems: 1
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
+        clocks = <&clks 0x3a>, <&clks 0x3b>;
+        clock-names = "counter", "module";
+        timeout-sec = <10>;
+    };
-- 
2.43.0


