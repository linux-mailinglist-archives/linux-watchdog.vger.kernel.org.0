Return-Path: <linux-watchdog+bounces-1965-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B90097C929
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 14:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC2CF1C20A60
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 12:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DA319DF6A;
	Thu, 19 Sep 2024 12:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="du1W/Xmw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486E61957F8;
	Thu, 19 Sep 2024 12:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726748926; cv=none; b=CoRh2hOEix6cDKODRzDKIpRnM2Dmunrg9i+XF+KnU7ya7p7eMG/Y/PY+SBgmBfVGeBAcCFHH6Ub7sWB4GYpLYz+rSsMlb5ZOZ4NnIYIi6Bl2VGX34TkHh3n38iSzvs7gYSXZ0z4jIBcmMDuRo1dPYkSzCirnz6u195ACkuJViN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726748926; c=relaxed/simple;
	bh=yYlI6tTus0ZiU3Ar9IfNHE31m1w2Fawm/zJ9bxgzhQg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=b4j703gFapTO/uU8tPDC9zmkqwRgKd1Eed8qYWQVQT7z2xFQwQcnIn1F0CbOGavEnHHnKrDstPfRIlISfiz9T/oRh20zxmaOrGrZh6ocPaOS3PcvY2zjNrjrfvvnMnr0detJF1QrwjNtURj/v39wZeXvxCHZ2oXQbjFgon116Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=du1W/Xmw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cbaf9bfdbso6936595e9.0;
        Thu, 19 Sep 2024 05:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726748924; x=1727353724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ9vLOIwefl3iNMuVxcYqoEs8VcLhp7ZSQofYSHIYJU=;
        b=du1W/XmwmMeA596nJHe0MPYjPAbpDMmaYNa0L+qos6IqfIH6jzneeSddECUqZ+M/yN
         qNKRjMUCdoJgFe10bi8aToblceXEEgTc9Hj+EiRxFRek1ptc9qYhjTlOv4CaQyyTu+Dk
         9uz0zGgcbvJQOeI/2pdYoL170Rc9Xza/P/M4XqpPKMTYnL2X7BGEY/TF6eI9Gj1qDeA4
         KPlDPAKnASFW4qTb91ljgvaT9ez8BYDFnHJkVvorz6jZCOCrCabuiJfE+pTGn2/Ya1LJ
         kOGb/d6La8/FnBXRS8f+bfkGDI76SLiLg8k9m2/gwUnNlF0qPjrzaIzfauNEZPkC/ULX
         vO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726748924; x=1727353724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ9vLOIwefl3iNMuVxcYqoEs8VcLhp7ZSQofYSHIYJU=;
        b=KPwTDAPqzcaGMTX20mh7OkpSjFDF67zXn9uu6zU5EL4gCA7V+O5HxzOg3jH/XBtzvw
         ZKAT9c0S+48Mv7FGLXE2SzbfLVMy7akwQRJe++VjCL4mOr0EmDxyrkuJWA2/Ws7Q5RrI
         HOgqe6TnB5S5WiAdom0wFByQipBbmex7iLtSLO9MfjW0SVj2/MDqg9KoViz4b/hOVuE+
         G/IsZJT+NwHeNs+WmgEodzOoTqoEwWnaW/bneILPucOuLRZx04hFAELNTQW84CoGOLdP
         pH+K2qeedHgcc1y72f+n0i7p2Bt9MhtaFenEO3jaV+t6M5D3l6zQTquDiCnCPkPHPcvq
         s2yA==
X-Forwarded-Encrypted: i=1; AJvYcCUpmE6NIBCqwnP+WXoLHyCeijeyfWUO5Kk40eKW+zuB66VmEywCX2o295uirOafID3hhC0U8Dg+h3/Rd5nl@vger.kernel.org, AJvYcCVPqixIggjebsi3Cm1nfT0LB0xnYZGYfhJ+OTATj2tbrzZ7F5dgQKmkaltXbyCiAdk1qL63OsooE9X+@vger.kernel.org, AJvYcCXJfYSWdYnPXPtYBU4kEUNND+Ts91Ag/uFe0w+kFFJEofxwIN8+/LBvg2wlywoiBUtQD3pZ0TqEn9w1by9W8sA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZ3GEnwUMhH74nHf0N4o4FpFy5QGYE04dTf6DjRH3E4SKn9Bb
	zwHxQfqqB5EjNv1IRSrQVeRQB890u8CU9od7sCSiw2tjlXnrGtTq
X-Google-Smtp-Source: AGHT+IE/Io2i6GSdXSw+/wIr/wc5aJW3eYk5lzU37goMz09UdJc4IALbDWG79muCgWJFt7Z4DxwA3A==
X-Received: by 2002:a05:600c:34c2:b0:42c:bad0:6c16 with SMTP id 5b1f17b1804b1-42d9070baa1mr144760475e9.2.1726748923270;
        Thu, 19 Sep 2024 05:28:43 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e754ce37bsm20509115e9.48.2024.09.19.05.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 05:28:42 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: watchdog: airoha: document watchdog for Airoha EN7581
Date: Thu, 19 Sep 2024 14:26:17 +0200
Message-ID: <20240919122759.10456-1-ansuelsmth@gmail.com>
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

The watchdog ticks on half the BUS clock and require the BUS frequency
to be provided.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/watchdog/airoha,en7581-wdt.yaml  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
new file mode 100644
index 000000000000..47210a5990ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
@@ -0,0 +1,39 @@
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
+  clock-frequency:
+    description: BUS frequency in Hz (timer ticks at half the BUS freq)
+    const: 300000000
+
+required:
+  - compatible
+  - reg
+  - clock-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@1fbf0100 {
+        compatible = "airoha,en7581-wdt";
+        reg = <0x1fbf0100 0x3c>;
+        clock-frequency = <300000000>;
+    };
-- 
2.45.2


