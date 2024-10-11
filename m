Return-Path: <linux-watchdog+bounces-2191-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DBB99A1D5
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 12:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D4761F22664
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 10:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4269210C34;
	Fri, 11 Oct 2024 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSsDMCGN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DCE1E379F;
	Fri, 11 Oct 2024 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728643490; cv=none; b=r96wGM8m5VmNVn/og1AeUwqOWQxxcs9pnkOoCFcBuKvwZiy19uj1U95YT5TmYZcFd/X0/wO++wO/B1TRouBjqI6MlysvtvxSJxvIdhDWntQrQjf7p1E7xog46q9J+8eNwh95G0uwJ0kg8zt0WNpX7ShalqCbUmhpKRue9xxxJfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728643490; c=relaxed/simple;
	bh=8YftU+J2X9J13YWxNurwa6s8iQGMItBydkLmUXRoHyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOqJ0/8NLTiPCORNh7ahN5X3s68+IdqWLMpXbdxr9l4SW1k/Uwen3K5bkE1QbWsBgDzuq3ZsPRuT/V+2Z622n0pjg/Q7rzTAPoRbqSIloQrQ9H49tmwK0axk7UG1475EU4sUCiGSEWK1+eX4yWOSVXHnsfCqbl7UdCaLYsaqmuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSsDMCGN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431137d12a5so16827635e9.1;
        Fri, 11 Oct 2024 03:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728643487; x=1729248287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/gVA7B3KjKp4bEd5fzh7WW3A8WX1CDjfsltZdIaACE=;
        b=fSsDMCGNPK0MQNaV34ORKwbAsvPzWDvmcZLbzFux6lam3mBknVuYdbU05fNFILSpiw
         MQ+uW7kZoBNuAODtMvnfmIrErhTHuH8RUw8tumPw3WI8yzRYRiCU8M+8ge5+eXT0cR/n
         VBGgfgn4xx6Ve7fK5uH9Sqyp9BSrx1b3OK8MmK1uco00zHktJc2L6k2Y6u+oUIuGRSts
         EfWZjhgEZfIokQb4YVA2nVRp4nZrbbBhiDmzaSWSSGM9EkP24OuC/3oDrRryCbQ1sYPd
         y8zqAAiU4R4tXI0TLVRgJqbBrJWocKqbhIu5py9/Onjd81yBAimrZobgZgDdrcJLbusE
         Ve0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728643487; x=1729248287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/gVA7B3KjKp4bEd5fzh7WW3A8WX1CDjfsltZdIaACE=;
        b=fmyrQd1cpZXpdHhnptHLHTIMdsGBenFoG7HDK2lcCNcTsm1TbbbsnOr9uWyPLZcdSc
         t/udDB+u4HKfvKeLf7gqYwoeBU9IMVP9IbFrpwUQ2donrMFJaiy2Mgi9yB7IldxCUwSC
         1Kvh+0m7PC8QtMcX0lqWsurzO6nvjXEfnSFrTRWPQbr7oqcm4cGrZjooMpR0e1IK2NoS
         llNa1z8v9QPAR5LaZpxgkoR5KADpFV3oQ09d0vO5eNl5ZaZM3qWHwiP8++hbF/HKtrKq
         enCQtbCRTXpyXp435Wnfs1uC/plaW/D0zvN6D+04Pb+hru/trGrnIdrlOb/Q8kncziNr
         yEyA==
X-Forwarded-Encrypted: i=1; AJvYcCW9WYu9ARpH/OHB/+RqlvNPHiv3CKTKItYesNRTdC6rl0pKHnDvrWtAWT8VSwXqeGbRXHyEhwffiuKS@vger.kernel.org, AJvYcCWx7MUETfj/flqpN/SbqLzYZuQGzJX7F1xcLlEW992Km/yucK+zlmO0+r1yOwObwRZZGV+850zKsMyTZvap@vger.kernel.org, AJvYcCX/rc2Q4mrMcaYm6EZFODSP5Fh4lp2gWFQS5SfLJUqB8EbNbBZr8Mq3Lgaf8l6fIsrL4rOqg8FSupyrR7kCle0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTpwnkBv3IXucZPWBaq8PwGztEGZQSC2rI4cKF3xN7hLS+2bxh
	nc64VF8ymnqYR3x9YZ5iO2egUSj9Art83AlnIOptXPh+rrbP8ie5
X-Google-Smtp-Source: AGHT+IFibIrxXU3f201xBoh5E0+sJzyf4HsP7kGrZdhtjtQviMQx/+xX4KH2Zfr06Ihw5/kRTUCvCw==
X-Received: by 2002:a05:600c:3b0d:b0:428:10d7:a4b1 with SMTP id 5b1f17b1804b1-4311df56e7bmr17577355e9.25.1728643486956;
        Fri, 11 Oct 2024 03:44:46 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd23esm3642375f8f.44.2024.10.11.03.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:44:46 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: watchdog: airoha: document watchdog for Airoha EN7581
Date: Fri, 11 Oct 2024 12:43:52 +0200
Message-ID: <20241011104411.28659-1-ansuelsmth@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
Changes v3:
- Add Reviewed-by tag
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


