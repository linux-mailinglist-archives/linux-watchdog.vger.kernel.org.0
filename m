Return-Path: <linux-watchdog+bounces-1069-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 413C18CF900
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 May 2024 08:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE27281DD9
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 May 2024 06:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607ED10979;
	Mon, 27 May 2024 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HghwV+WQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E41184E;
	Mon, 27 May 2024 06:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716790897; cv=none; b=EoDnroQlqSYZ0H7EEDSTmNUyrT+MSLclkuP1Qi7xjivzejuAkQovEJ2JyKqz3c34mLC/1hzSqvP+cog5wEUSCZH9LH1t2R2wcmPOnEoU9BJb9xTeFGEksXMJYawVQpj7xCuxUWE1BfRToqGXMAES+W0k4Nd8kKKO3Z1Q9rWixeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716790897; c=relaxed/simple;
	bh=dpE2HlfRkKb0DLeLWGLVLyay4xnMktyTzs9M/wjQ4ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lY5GRWvbfBrVFvEKnWCjQ4z1DvOezniAzpBOtWRjeKA7jgB2a790t0jeYURkp8uD58j2ZRGReNxLz4aPKIT6g/FwMwN7z6NKsuJosUfbv47iJ+lgJm7QeBg+AokaDqKpNVDb05i7clFaIFjbAxjvIDd7IPN3AlRYQ2ATmqNk6yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HghwV+WQ; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f8d688ba3cso1314101a34.3;
        Sun, 26 May 2024 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716790895; x=1717395695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YvSiz0zQERHcAfsNur3dKA1ZbSTkh+Qxqa0oHiQYJWg=;
        b=HghwV+WQIsvIPNc0VLnce3fWl0A/AW+6VzQlaxjiYKlx0Ba7V5lFJTYnmQCM2WMtEn
         SslVqpTI/i6Gj1rCc7A8TVWqVXDlxtSnffnadzfR8ZsgYelsJejwwfPUWHmR8tL+iwaF
         y0DBXO3jIsGSM8MSQ1R3Zz9mjHgrFKGoSBZhy9dijD9Dns1S4DF//A2raFNt4tuZEZ/u
         y2RkyPAcl15kvpZYeOuV9AtGzumd771GfemJ1gbAYfFGWN2st7tmLwSHVL2hELR83z0A
         qwX6xQw53Sb+y7H7FXGm2AR9K/4ghD9lLMgX9sMVOEeL10KpVKFUsI9nipAI1D+PqZ3+
         nS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716790895; x=1717395695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvSiz0zQERHcAfsNur3dKA1ZbSTkh+Qxqa0oHiQYJWg=;
        b=oZSe//k78w7Oj0DCEBz8B5iWmHjEhy5r+Cw+gPO1imWq/jxAPLIiAyTT3CCrMqjEFJ
         8oPawQvwwuu33jEMqLemLbLnxO3MSIWF5BMcMZfvkX+PteudNP2liX7mhVLRRZJEfgu+
         0yfZO1EUUzjEHR4qUyszTNkubteTkppkuNnmkkxDjmco68/qlclBN+/dSU0SFnl48I6t
         I2BUDHt0c5tOuzVm4Mr1mTjM3LNrDBX3pL5E3elK25SKzPjnlGNqj0HK9SgHuQyDCxeU
         vblGknqp8l+JmKKw4Knlrz747vI7iDiFWXzEySC5h3iEJ1o+GFwTrxduD9vrqJhnR2dW
         bzwA==
X-Forwarded-Encrypted: i=1; AJvYcCU0+XUFuDivXbxppaTO24TZPvMCwPJKJOz92v8bAbQShMSPIoepVTDGzIEUl9rrcE0ingAOn+/K/SkaC2XoHoryHmghNIGjPDlIkUf5ct/+/Wm6n/b3Mm7Az4x0kCQsTy1TxGdjilWinw==
X-Gm-Message-State: AOJu0YzUag5AiYeNccny1ui3oMaEWEo/3MKnpnkxvClQ+4MUKn1GZV+B
	KjhnKVPugDwpcM8aPQ15kXNUHYVa97zEhsXb2CSl72HXIUd4lL/6
X-Google-Smtp-Source: AGHT+IHU4P45YQAZO0KWR6MN2FjxKvMFIH3S78MCIuLEGKiCzlvXGH5BxquSlFWU3q0vdFe3XezASA==
X-Received: by 2002:a05:6870:2cc:b0:24c:54cf:f39 with SMTP id 586e51a60fabf-24ca1471c9bmr8603286fac.52.1716790894516;
        Sun, 26 May 2024 23:21:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8099:c268:61a8:1d83:f7a2:365])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4d87a4sm4258777b3a.207.2024.05.26.23.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 23:21:34 -0700 (PDT)
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
	Shresth Prasad <shresthprasad7@gmail.com>
Subject: [PATCH] dt-bindings: watchdog: img,pdc-wdt: Convert to dtschema
Date: Mon, 27 May 2024 11:51:03 +0530
Message-ID: <20240527062102.3816-2-shresthprasad7@gmail.com>
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

Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
---
The binding has been checked and tested against `img/pistachio_marduk.dts`
with no errors or warnings.
---
 .../bindings/watchdog/img,pdc-wdt.yaml        | 62 +++++++++++++++++++
 .../bindings/watchdog/imgpdc-wdt.txt          | 19 ------
 2 files changed, 62 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/img,pdc-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/img,pdc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/img,pdc-wdt.yaml
new file mode 100644
index 000000000000..8aecbcbd700f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/img,pdc-wdt.yaml
@@ -0,0 +1,62 @@
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
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: wdt
+      - const: sys
+
+  interrupts:
+    description:
+      Should contain WDT interrupt
+    maxItems: 1
+
+  assigned-clocks:
+    maxItems: 2
+
+  assigned-clock-rates:
+    maxItems: 2
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


