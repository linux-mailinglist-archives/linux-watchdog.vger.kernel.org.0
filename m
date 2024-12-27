Return-Path: <linux-watchdog+bounces-2632-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E29FD71B
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 20:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 800F13A2184
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 19:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0771F8AF2;
	Fri, 27 Dec 2024 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaIis1mQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A21F5F6;
	Fri, 27 Dec 2024 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326160; cv=none; b=WSePisGOlOxrk9eV6Eqx62j3umaHUnnUBt5Rzqz5Fv2mK8U0h5LQWziL3xLDQ9annTuLs2mg21AVZ5gRlybhlIeSDHOTATlduUfON2P3MaOElmje9DDyt8dg3kpYJ+k+crHbfi1q2j2nt2EUrBS8c3aingspIUt0ou5zeq3ZWd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326160; c=relaxed/simple;
	bh=7X1ANz5QmKa8yb5TGfKr9j5q8L3vHDkeHuLMSTNDSRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ubinGhQBsFhhb98iamBHpbVwirI8hlOORE3AUV3F29ufMwEvAodIE90AvLSCaMTzrOM28IaLuvkzDfzfS5JnWLKAVIMlIPjJCPy9B7+D/eOGMQSHGR+CWuSIicgyChXOkav3RRpB+JNxhekks0rADTj24pZ92uyPK5GHURrVxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaIis1mQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21680814d42so81535495ad.2;
        Fri, 27 Dec 2024 11:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735326158; x=1735930958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lYfiICVuztv0XWEcUnkQBsWsWAcQmwDfz9bNEruOWs=;
        b=LaIis1mQK/5cfkvCfAIKik89oxYb+xUgH5Qkx7jzTc9z1ObfP6SX3PTmF9gR692OgB
         nyEVj2N40zRZMQgZFTQXshxmM5nI/ZtX+AHcsISljoto+pSmZw14HruRF2M5Gkh7cfZC
         XTdVvUsHFBX/yIR1vLdxAV2V9xlKXusnZuBilMm5fXtBvqVektkxpd/t1Uj/dZFxGYt7
         bQ2pdFMGm8n5tlDXrgsNmk/rqRVSgW66rh32g4CqkNFCSb59caw1SApNLBkfnItmlzZB
         MCy37s1mtDCMbun34J+TUgBFLyCrlY2Vun5dKKBIg5Y39s3EZePAaXsXe0YFvbk04cdD
         qAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735326158; x=1735930958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lYfiICVuztv0XWEcUnkQBsWsWAcQmwDfz9bNEruOWs=;
        b=N4tuCooILVt+nzVkJQw5uqy5Uae14dqyjT6goSEE2T75BUg2aCk22K+3Fx86IeNJwd
         UQTU4EbE/mAaexldZD3HYNCQIxJV3g8Q9X0y4wquk0iVxeJwuB+cVNLglY3cI+MImcn6
         bSKaccFAmuBBbaZxRNULXbUOhrVyh/JW3elJCgZA/jpZo63Qo9bLdHGPSc6gxGLdXvLz
         KeATcrpz2VD5DkyINmhvRji8LXpIPvKxKAUiVA2o9pXMCyLl6K94QXLpN58F6ZfsZKcA
         4P4XfvGkPMeP8p+PW7zKeaV+I1RbAbFfRO2pSyWs2vKG6acDer1k7dk/sntmXvo2ZccZ
         2HhA==
X-Forwarded-Encrypted: i=1; AJvYcCUQi/UmX8gOP31kh5m+xYwuUCrO8cXa+KpYmEqfr3W8SdBalV4UQbO/S0V+0RmKzS0ENyMCBtnRQsLtdOkB@vger.kernel.org, AJvYcCVJ29/ZRp+8jGLquOjAbTrV6a1EQsZlvqZfdb4ScydRkkwZW0hcZbl532BBHVWkCcdiQ2mer7buwyfe@vger.kernel.org, AJvYcCVmZ9WHlkVnR4s5uSpUbRTst0UVBUbtkBV5uDxtT224gzuQEwe+CzGWxeezhSdMXJp68fJVaXHS4WTQ@vger.kernel.org, AJvYcCXOarPZSNhhslqyegA8Hp84Pi+M5z4oFXycBOCbWSzsPV0vnIPEmQyt7m6E/dmZq8woZa6eOKVaV9RS4p809bI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDenGRdx/wnr3QTQ6Rr45X6Ty7dooxF388uiy1zIiQqu5Rj3+w
	7Ii8s3BOI5dB9G4qnufTSg9/RGS0AK7FUGk9pRZjHLU3GjGrOCMWydQdhLWx
X-Gm-Gg: ASbGnctvNkbuAaM4aJmwH+qHYhX64jw5mXGuluVxS/x4DMo26XbBKNdGOFwAOXEcJWh
	Oxkl4oxc12WoqIpSzPEq3UjWRw6hR/r89qIrY9GxlI4/Yu7SVFxSqxNA/oTEZRxYcE87NSeWgae
	wiG64uSEOUKqbyWoSuIa+KyJjGhYyy7K/9AQzrb5F/XhY5fAgd0dc1U9/YbBdasw6pTq0FcGxCQ
	oXYM4MSlKhvoDDLiyVLyHAaVFLwFU7znx1KpBJDIb0mMejuOI0EWxH8G4NlBygY2ifbti/hqk8q
	8w3qcj0=
X-Google-Smtp-Source: AGHT+IHHEwWRQtQejTaxjFZQHp3M9BTM2vGbgLd8wB34v28GScLQqCrginTSds3r7uSzkWoY/rxowA==
X-Received: by 2002:a05:6a20:e68e:b0:1e1:becc:1c9c with SMTP id adf61e73a8af0-1e5e0802b15mr42959985637.28.1735326157819;
        Fri, 27 Dec 2024 11:02:37 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbd3sm14877943b3a.110.2024.12.27.11.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 11:02:37 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/6] dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG block
Date: Fri, 27 Dec 2024 19:02:05 +0000
Message-ID: <20241227190210.69025-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CPG block in the RZ/V2H(P) and RZ/G3E SoCs includes Error Reset
Registers (CPG_ERROR_RSTm). A system reset is triggered in response to
error interrupt factors, and the corresponding bit is set in the
CPG_ERROR_RSTm register. These registers can be utilized by various IP
blocks as needed.

For example, specific bits in these registers indicate resets caused by
events such as underflow or overflow of the watchdog timer. This
functionality allows the watchdog driver to determine whether the current
boot resulted from a `Power-on Reset` or a `Watchdog Reset`.

Add the syscon-compatible property to the RZ/V2H(P) and RZ/G3E CPG block,
allowing drivers to interact with the CPG_ERROR_RSTm registers as required.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- No change
---
 .../devicetree/bindings/clock/renesas,rzv2h-cpg.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index c3fe76abd549..f42d79e73e70 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -17,9 +17,11 @@ description:
 
 properties:
   compatible:
-    enum:
-      - renesas,r9a09g047-cpg # RZ/G3E
-      - renesas,r9a09g057-cpg # RZ/V2H
+    items:
+      - enum:
+          - renesas,r9a09g047-cpg # RZ/G3E
+          - renesas,r9a09g057-cpg # RZ/V2H
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -73,7 +75,7 @@ additionalProperties: false
 examples:
   - |
     clock-controller@10420000 {
-        compatible = "renesas,r9a09g057-cpg";
+        compatible = "renesas,r9a09g057-cpg", "syscon";
         reg = <0x10420000 0x10000>;
         clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
         clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


