Return-Path: <linux-watchdog+bounces-3189-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4EAA7926B
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 17:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C2F3B5EC7
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 15:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3665B187325;
	Wed,  2 Apr 2025 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q1texYzu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CF41E511
	for <linux-watchdog@vger.kernel.org>; Wed,  2 Apr 2025 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608998; cv=none; b=BIHUAr6j89bF5PXWDg0ZY7cNrWgxalx17GRv79v5B27Cqrs9C4DsOAw95PZqEsAX8SbHuGutkA7vU9tr9VHxQIWIiLg3UM4XKtBBwL9h+FKOqxhOr2PKY41+jlRZHHg7a4b6R6FkwXve/crYTespeE8TSKuRKSNBtR3JCKkzxvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608998; c=relaxed/simple;
	bh=R1vtErKl2BzedEvjhWWXJCdtLNjDCmhp/prRalj0xAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVAKDFGvru17ItR7dRL/pmSseYbyH2QjLrkXn/3JeDNMaQ+4kvB2oUmdBAjhe9cARb0FBaRP5/3vPFHgCXod3TYXP4h7zHQN1D6HjH3SZUcFssvMfpArLyN1Myofj2DduQVLO/Si5dAuozzToLL0gVuGqHJE3a/O0HQxl+XNxDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q1texYzu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a823036so64742735e9.0
        for <linux-watchdog@vger.kernel.org>; Wed, 02 Apr 2025 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743608995; x=1744213795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f19WgeQ78sxdiIjTFJ2APJJGvVw1dxzyTwQ7DYBPLY0=;
        b=Q1texYzumRcfQRVNQeYCYZgZR6eWmf8PbQi/d259wQVf19ZERezxIvI2d/QoLlLjdK
         YUtPC7l4Q50GsAvmmG5q7bK0d8EXRT9UBjHBhUW/V8N55TBi9SJqWLUgc+GISkCOHnYp
         TW8C8ZfOl2LrCx3nMLj5njeZdhBP9ix8ll/RLgwQgERKCuY9+ZUySdKqdxhLbQrEDhcj
         RIS8PZuVJ9egjJ0an7TgEtZIBZJ5lmwo6pJ5BIy8p9M5my5v13LnBsAK3eSGH9Wtlbwe
         6LTONMopPFe5GEIB/ApoTuq6rIi0XyRFn4YOeisRP2OeAHwXa1viVQiZU88hgR+iKEC1
         Cb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608995; x=1744213795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f19WgeQ78sxdiIjTFJ2APJJGvVw1dxzyTwQ7DYBPLY0=;
        b=HY0+of4OEpUis1jCWfbwhRXV9TJchaw771SxdorabWZ3jm5J74iI3cy3/2BquQnFMM
         vwlHsQN9RiNkt/AU1VpjaCWIRkym+RngMkPHZFAb2kf3ru1k/750u8b5nO5heUoqvZaf
         SF7dS6fLiSzPJUGLiXiYezrmM11iOMyRbgJIGOHrAiYxrHdxklqB7o/xvYmBXJAply7u
         C/rck985XvDR1uYli0A8ympWjt1NYUd1xO0cMV279ZFtIwH6gUx/d+AaksagCF0QRBAL
         4wpqSXcJdBvtSARFOXvwx3Am++FU9dGNDDPxfVGUOoStLaF/6t26DrMrnYIfIP31SfM2
         LAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEw2lrxkUfVbctI/m6s3WbwEkiKx6o/6cTLBD1w8z4C3qR0cCkvbLwLGKHm+vBQgEyj59/lNAcbtC8lbL3iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1pLBYJGvdUdg1Uecr0uq+XiNWvj5uIIqxlfJha2j0IoNexZf
	OCHXOuTMsxx4Ubz6tfu6mpaXiV6g4fFNtwzZyoDb5nEH59bvkBQ558nRRfT3aVM=
X-Gm-Gg: ASbGncvVOyI/O8l0xnBg4P0kzTFC6EU+MO99eceSG9vvddiJXB3Y3Qq5LbcMjhBZXDP
	fiLT9TRCGQxaCf4UNw0gaAFzX6CVM75lb4RWCnohjawA9S7sBGTV9iYSLCnPnRL89gPeZe/BEXq
	k0GA9qI60cry+/JwiUmXsSdVRugUvcxdlVsleUqp9ptJ45BY0Aj9zyr8sdqRzAdjBbzMeO/TIJB
	mHjtLKhQiilQk/EFnJ4SYPpHQZWHysD06yGmFX6vcPP0wHOonUiNjTI0mmEFOYlJE7frQOCe6dL
	VJsRQNZCQxRwvi/cZXEGvWIwJWeQxEcur97jdv7B9IlbLfqtgvvveDkNpi1MPrV3FPRhkaA=
X-Google-Smtp-Source: AGHT+IGqxQcz+/0qde9VdZYOmDlRDKSETydjHtHNN863PVRigirhEFS9zdQVnVdG4C0KFu+Or92Y4g==
X-Received: by 2002:a05:600c:444b:b0:43c:f184:2e16 with SMTP id 5b1f17b1804b1-43eb5c18428mr23351285e9.5.1743608994610;
        Wed, 02 Apr 2025 08:49:54 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd1194sm24674555e9.11.2025.04.02.08.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:49:54 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog Timer
Date: Wed,  2 Apr 2025 17:49:39 +0200
Message-ID: <20250402154942.3645283-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
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
 .../bindings/watchdog/nxp,s32g2-swt.yaml      | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
new file mode 100644
index 000000000000..d5f2513c4e8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
@@ -0,0 +1,42 @@
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
+      - const: nxp,s32g2-swt
+      - items:
+          - const: nxp,s32g3-swt
+          - const: nxp,s32g2-swt
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@0x40100000 {
+        compatible = "nxp,s32g2-swt";
+        reg = <0x40100000 0x1000>;
+        clocks = <&clks 0x3a>;
+        timeout-sec = <10>;
+    };
-- 
2.43.0


