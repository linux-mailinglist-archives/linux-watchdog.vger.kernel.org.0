Return-Path: <linux-watchdog+bounces-2589-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B01299F5B87
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 01:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E62E11894382
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 00:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1925C35955;
	Wed, 18 Dec 2024 00:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOehtCzf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321DB1DFF7;
	Wed, 18 Dec 2024 00:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734482062; cv=none; b=DbiNIv9mXtCnaRZUeBLAzP0a2mYlDTM/gkKGfAHQvx9ZGbpiaQTxnyWZS/G8c6vJNCqcG0YvrbmWxJvacYpz8t/oSV6syImFEkbvHzp4IFKynbvlw3snrBNEne5o72swIDhnLBRLty61Kmh+YzKGeV+BJ/fJsYboor7ult31Bic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734482062; c=relaxed/simple;
	bh=aKdB7lLVAE2Q3dAy9et1QMr/50BnzZqoxEzPqUImsC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYKgRWrvh27vj1nY9POoSrKxun3HPcx3I5gAR18MzUkU5exkJ8Nl2IUytgEVGmeq2WhloVC4zqPD2znVYeOwQdE/Ha2SjoOtR+ETGR3ivO5QvcQuVgpIVt9z0393H4X2kGod06Q/F+I3tQckK+BQV61TX6sJQT5Fiku+k8lEeII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOehtCzf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436345cc17bso31234175e9.0;
        Tue, 17 Dec 2024 16:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734482058; x=1735086858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SAvTI9Gsv8CWnyIAt9AdKtkDLtucHzA4DU7OmDHBv4=;
        b=SOehtCzfWwfzTaIhtoOseGgYZtSws+Alye/pX1BOow8VlnB0oJCW/kETC4zKLmEBvn
         NUnYMUXjhhSOkadTb2v7mrBH8WHTxNcAgOLqbZLVdtvP7IIC9RDSTHU5ykETAOalCLWn
         Srk/Oif8SI7Sfa6Ypu/D33I2cu1XJCZzbl7jtGmyp/eF6/Mli22Sku3SoDUNkw05SJEl
         0FB8F9RW6/DxPPTMUdYd8YT/jIjtNaao2mRJ1E8KYmUBeNH2537QHpKePkZ3992ewWyt
         4G+zJN2SRwd21huOKnkMlvImioveUCtrjkB16I7ZakveI9ZxMvIOf8QEEJG0E9qhS7OG
         W0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734482058; x=1735086858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SAvTI9Gsv8CWnyIAt9AdKtkDLtucHzA4DU7OmDHBv4=;
        b=KG8MvPjnl10GXUkWo8DF6O9D0pCDzzghXR0rNVhb3roSAykYpHMHkC0gpWI9VlbVps
         Bt76z8/cyF+PyjZJ+T/JV7lHzppjo2FnV1EJ0VrDBp6kt6MKHkbB3jsUYERpolYRlqCU
         XCJccDQtilGFaxXIEMbOKM/NnYhci5TIltpDohPjg7S05J4A1skubR9ydt4V3M8tl0IN
         gMdqdPbLjH5PvSvmWW8KohaN8yMxMm5bD3fkyBkUbcp3+XnpSCBal879xmM/Qam/bxq3
         39POwyTAie/j5Tz7KADLz2frDyohzuystYFiQ4ojoJQEWUNN6dPFFqc+F/fTjQLNDrlj
         E3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpk08icbsbLIVBrzxtVpsCWAxGupGRbpJYc+t5ndIQwg6vAPIIlJPk2exIs27k4nafH7QoUKuhcAyuMhIi@vger.kernel.org, AJvYcCUwO9GQyc1D7/2vwFkN0knaaREteiqhZRvw42OTEx6tc5v7i5J2rnx+uwmRED/GDdAbI8T/xuZmL2OFcNc+hmY=@vger.kernel.org, AJvYcCV+sy3iwCKdJ6hulIOvHa58AmljlLsnkkVuD44wPLUp7lJvFJ5GA6qKn/NiSA+W7fMa4nAa8R8fXV/X@vger.kernel.org, AJvYcCXqsFh8RBh/SOgTTwAelznd3gkoMDe+/Ry4tZomfkeSCGjhcsykdPxjgOPSHiMeGyHw3Z5UDnxdS4SX@vger.kernel.org
X-Gm-Message-State: AOJu0YwRpLUACWRtSNzVwcjt5HzPdhLhMkIUdmRuhdh/Dzngmp0lrSRf
	LCwVF3hmcbm+fUPJfUkS9+QPMkp8DLxKnKRTH+KrlYmlSCP49Y7oBKpLKg==
X-Gm-Gg: ASbGncuObe9HIYoQ4V6wNkUZ5HOO4bdt9WSPJjQS61tR+bUE4gQQBGcWHFG1u0UOM7z
	ySrbgY0LHSIkqzh4QJOLtPIvwPMNTrHayLEE6DmbjLUEOq42q9QHf+AqLxr7vWrdvE7VV9doqrz
	jkaZCAkQ9m9C7jbK1cp/Z0/GlJe4W8LzprKSsGDzFrhJMQvvhHLn+xOGD9b2whbrng4tniMgTe5
	XrUvIQkgvU2denyK72W8d3wNYpOMkjzkyNLPEnIcdHt+g8nanG93CmOxNSbrS+6EIWhDZezx//p
	5AmOfKSxjA==
X-Google-Smtp-Source: AGHT+IGnh/5jNxS13zaDeyu0cOc8Xr9e2E36LjtKDBEf0LFah6JsJSz2YZ7eAcC0OrxZdBNeThLJGA==
X-Received: by 2002:a05:600c:524b:b0:434:a350:207c with SMTP id 5b1f17b1804b1-436553ecb7cmr4091465e9.23.1734482058227;
        Tue, 17 Dec 2024 16:34:18 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b287sm2365625e9.29.2024.12.17.16.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:34:17 -0800 (PST)
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
Subject: [PATCH 1/6] dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG block
Date: Wed, 18 Dec 2024 00:34:09 +0000
Message-ID: <20241218003414.490498-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


