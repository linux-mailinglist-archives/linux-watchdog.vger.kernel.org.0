Return-Path: <linux-watchdog+bounces-3169-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD685A74D91
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 16:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87EAD189D1AE
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 15:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACD11CC89D;
	Fri, 28 Mar 2025 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MaCBo4c5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E1C14D70E
	for <linux-watchdog@vger.kernel.org>; Fri, 28 Mar 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174955; cv=none; b=elI0A0kRLnmgtdI3TQMi49esUnhgHe0Qo49HosXSdF0FEJeID2Ukef+TIKpUpXNJLTmQUApLZcDFFV3EyuLia0xll5ntb1BhLUFps+cljLyAlvIU1Wwp4lUEBUwp/xk1z5vhJ/ws4N52BS24ZlHCt48dNxlfflkwbQGVXU/h5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174955; c=relaxed/simple;
	bh=UTt732wJ9n8PLRvrT1PCargeNlx14cqXwsCi/u96O9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBxlbA9ERg5ebHxc/Vp/JrZ+lCRpxA7crTsqEvPaiTZSbwueyk8ax9aCTyiaIIUXQWFucWySKxNCsbP2iSzAGCGfUjJgu5/10/j35Wyv2PotKsayIXBQDqtl3tClOTxAYl5W7+WCZ8FvF2+BH59fDGoUdcWGnWRsHqDqTqTElzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MaCBo4c5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43948021a45so22828935e9.1
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Mar 2025 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743174952; x=1743779752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7iMl7ipkwOPC7e3j6qlBN0GX/yfrn6BNcMk907xgyr8=;
        b=MaCBo4c5bpLNWOhHg33JD5CmlPvocBrCHyHxaXQ+UFz4WUfg/D+tAWB2MZA3RiV1RG
         CZw/KaKhdJS3gd1XrD/y3ndUGqn8TfRQ7W/ufqf4++m68XqztpsS9ez7d+f4BQZOJDXj
         z7kMnKwxHcQchlMuwfilcn+Yr3ENGFjPGsC9BbX8y1ACJGAxcNpBBTJkQLHRNmaUlwet
         23Wrwt1B8mdlM8ZO9NkgWUNuRfnr47b6tP8Rr+5Won1xfZggQDAFJ4M7N487GNCnkIEC
         IoC17ZLukahqT2OHqMEITw1WSk+jHwLXN8YoRa3q/7/DLM/8OPthJltJ+lVW2akY8Hhl
         Hj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174952; x=1743779752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iMl7ipkwOPC7e3j6qlBN0GX/yfrn6BNcMk907xgyr8=;
        b=wE99JbwIWNzMYAZ1RhANKVoNUM4mf55SWJZjsM1pKLg4Hi8JdYykLu+z+wUceZqNIe
         b2jr3uVObhH5O1bhu0VMTsIKuiJp+G4Lf8uWVRA0G5YRPpo5atjRVESnEazM7qY5Rquj
         fbPxVxdUPe4Fvn4FR16pukGICilx0S3LfuI0Y1PWvgME8Nng+jeltp1J2jCuh7JA+HmY
         NOkb808fphAcCFzvxL/P9BsrgZ5Mtr01GL76GNuUk72p1ndeYuFbaA6bmWYqweWFmvGR
         RXwzS3xCYOkmvGAgvE5It9BgXNdYfwUzI6WhLFZSI1ZkUvWmy2WGEZRFBbGzaxV6ohD1
         OJdA==
X-Forwarded-Encrypted: i=1; AJvYcCUVzGavw3Xb6ISZP6Z0oAAOezzhmWYOkTeWXhlqWMD4b/JWcCMKaetd1P2dqr/KMeh0pXvWF11yd6aj0jutWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPnthpv9zKF9R0CLMEvtAWfeE1EE/ODPVjVCWcKmrz+lNl5qw
	ELmznXgSOjR1knIxHZPrW7dCyR1HB9VcmVR7WiobZxOZmoE8oYB7K4sQtb0qasw=
X-Gm-Gg: ASbGncvwe/Z6514SexMPFlys/G2b3DQFLwlklUOVakRnWm6NAZYSNzyBsr4wz4Enh8E
	0DyQhMNL4KF9Ot3AYTRMUF3eN+YmYXTCBhr1rvTo55hSnWelnGpkyBxrXES2fE2bILIHiOZK+qQ
	AaMRvnbJGkuZUFt2apE5KUHpzIHme89Vp9CZbMYD1tVSiLKHNSg64pU2EVIctPiHY0ahbqbQ1hB
	V4sUs/NC2wsY0E9XwCph/Sx7CqDL9p2hhV2FQ8ZjojO0XGW9qyzkom0aX0mZvT4PnCNmwQy+3pu
	w+PC/2RosC9mHMvSuWWjemnzR3fqejvWSrxZZfjzjQGYtNioWUA8O47wZo8eRfK55EiWkpc=
X-Google-Smtp-Source: AGHT+IGrvdqns/KyfFdg9NaFSTKqJeDUYv3jAEEnoDUOD84kdMdf7zIggJoC/R5v670HU7RhL5LOHw==
X-Received: by 2002:a7b:cbd8:0:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43d866d3e2dmr60639945e9.4.1743174952199;
        Fri, 28 Mar 2025 08:15:52 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d830f5b41sm75979335e9.27.2025.03.28.08.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:15:51 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.lezcano@linaro.org,
	S32@nxp.com,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 1/2] dt-bindings: watchdog: Add NXP Software Watchdog Timer
Date: Fri, 28 Mar 2025 16:15:13 +0100
Message-ID: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
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
 .../bindings/watchdog/nxp,s32g-wdt.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml
new file mode 100644
index 000000000000..06ead743d5c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nxp,s32g-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Software Watchdog Timer
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The System Timer Module supports commonly required system and
+  application software timing functions. STM includes a 32-bit
+  count-up timer and four 32-bit compare channels with a separate
+  interrupt source for each channel. The timer is driven by the STM
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,s32g-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    watchdog@0x40100000 {
+        compatible = "nxp,s32g-wdt";
+        reg = <0x40100000 0x1000>;
+        clocks = <&clks 0x3a>;
+        timeout-sec = <10>;
+    };
-- 
2.43.0


