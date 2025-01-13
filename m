Return-Path: <linux-watchdog+bounces-2681-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA626A0B595
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 12:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8AF3A04B8
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 11:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872BA284A6A;
	Mon, 13 Jan 2025 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLsyVzyN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A705C2500B3;
	Mon, 13 Jan 2025 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767448; cv=none; b=VwgrVSLzOLy7eMGV+FFH6cNadm7XjZLAQn63buGlQpIpSEH2a03wpoNrLwFu5ydsG7v5JxkRln5jlyEdeJuCtWUwrXfbVNTyolJ5WHxXg1Aut803tcuGqpAgicBAeAM5f3DgYG9tMWPiBmxo+H8BIovJgNOU+GeCgoKhduOue6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767448; c=relaxed/simple;
	bh=XspZ05IZVNTm1NQ/M5BBZkdQULLT5XRn7YKALCQZGns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpwNgGnPWr8kzAlL+MjsQHjXQ37KWj3HuvKXc921hcKHwBf/DMKpDQ+Gz01ucL+THQ0xnq0Y+UdFVipyVKPYNk0scCkVxiLEZfIiAnq/g9zxQaPulyGXmFGA+DEbe7p2ZRY7YdtKprLXWm6ZRHhi4MSsz0MNIMi8idpR0ncTKpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLsyVzyN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso29595745e9.0;
        Mon, 13 Jan 2025 03:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767445; x=1737372245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywlKhGt5gUaID62FWIDPFXIzDq6q04U4bYSUh8E0K8Y=;
        b=FLsyVzyNL5BewE5WwG8Aq8KLQAlok1vdMtOz6ShePaZf8XR7J6ypzNxDE7xoPOo3Cc
         IAenqekcGYSGMIRgAWtA0bQe5+MRauAlEKF22PpfVSWA93EB4GKBEgv9mP6f1zLE9ort
         darUb3AWotCwEm+xxItyaSc7JRhyB9EPbHKDOL30e7+MPD3j5uiNyFzreeDx0HB5xism
         lqBLQNnoX6McyIWCyzj1AvNUA6wwYmL757nuqT9Z4681Q+k+N4/jVucgEH06g5lYpfpm
         kvbNK+esRuNbDmVavgcU1gwnEohkCQQBYDFI3XzfzL13AI1G2otUvyI1B2vh0tWUCiXC
         hp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767445; x=1737372245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywlKhGt5gUaID62FWIDPFXIzDq6q04U4bYSUh8E0K8Y=;
        b=JOuSTTgIxnpdATYStRV/m9+kxkjRjFcecAcHl4Fn9jPRFwmZvvUZ7qmplGo0bnz4Mh
         FKAHSQS2uK72ZnOxfh2sqJWU07HKnZ6tbr72PCrEDFWPcyAT66AKOFKzt4TnwLDIJ8NK
         W+lHZbMy3sXKvwFGyEFa8BB/T+ZYYjQ4yjjb5ScuaXEpUCoJlk7HB+vQwoS13W3M+iZy
         Xg9Y/CPuG0KK+RyecVIOJ3WCvNxz+nZywnbCD3HvYRTlh+/tW2BnUIxPGbG85w7dRkNQ
         y/32swW82LVUQDACUERBfpHu5njFItCp4iyVWFExAN/sCH3UePiQ4EKM+kOiRX89CslC
         EeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD7/HUcv/S5oEb5aKxP//o4sCY2ED0WhbjpbevpoClgJAzbTqkv5K1J+uReVxnyg4aOm+VLMngyp33r/5oLYE=@vger.kernel.org, AJvYcCW15Bwed+M1V8dr1nHBUweV+gF+KGyr63uM4jey+1ceGwglWo6TjeqyW9Us8Cp+CbiTNtALu2aL3R4cxytm@vger.kernel.org, AJvYcCWJch/SRh7HV17+nT+cHzdrDvi5yqe7L3QyUQDgr+7HuZw7Jk8b6uTP3fKPqz8gxhiI006Fpm6nTtey@vger.kernel.org, AJvYcCXFIAwk/Cby6cLCmuU7N6hSVMOVvAMZAszEMv9EVX/JIjjIGE+aNnD7Pbka4Wvi9keD1Y0t28UU8PN1@vger.kernel.org
X-Gm-Message-State: AOJu0YzMRE/uSXqA7yvKJ7kuGbMDwXKqp/GBzAN4X4F3JgJgAkzG0cJo
	04/BtR0etqqyTntiNgBQaUWFgwKrKpv0Yno+EpVGSmPbBFwz2JV+
X-Gm-Gg: ASbGncvRJ/rlVHiFcv5zxPfl+QaRevzUXCrDcmPIVKkL875UzxjaWSr10HbtpthNqmF
	jvvu7/YswA0X6BIQh+cZzUhmc4S4/8OjIEnWLfdbghydf4bJw9mRPv3Z9muq4Rm9AuTg5le+vxF
	yPUaflmtYOw++nIYUKeAW2ufbYkOrLC/Uw9LXddc4iW+PrAqVmz3Lmuwa1vGE+APRp7FnmmYg4j
	qCTVCLpwIUr0eJFF2F6XUd3x1n5sOQISCe7XEn/wcox77HuTkzGRI/p2CKnQGFTAIABA/6HxaHa
	RIvGLnE9bg==
X-Google-Smtp-Source: AGHT+IE6CocWrtO0ToLT6sMtjNQ+LPB106b5FZefFzVLxNvRIqnJYihS2xXNmOxoUdYOSjy3NGlQnQ==
X-Received: by 2002:a05:6000:1869:b0:38a:8b2c:53ad with SMTP id ffacd0b85a97d-38a8b2c5601mr17252523f8f.39.1736767444504;
        Mon, 13 Jan 2025 03:24:04 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f04df606sm107597115e9.12.2025.01.13.03.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:24:04 -0800 (PST)
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
Subject: [PATCH v3 6/6] arm64: dts: renesas: r9a09g057: Add `renesas,syscon-cpg-error-rst` property to WDT node
Date: Mon, 13 Jan 2025 11:23:49 +0000
Message-ID: <20250113112349.801875-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `renesas,syscon-cpg-error-rst` property to WDT node, to
determine whether the current boot resulted from a `Power-on Reset`
or a `Watchdog Reset`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- No change

v1->v2
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index e7428b80bda2..01b4b4184e5c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -445,6 +445,7 @@ wdt0: watchdog@11c00400 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x75>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 0>;
 			status = "disabled";
 		};
 
@@ -455,6 +456,7 @@ wdt1: watchdog@14400000 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x76>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 1>;
 			status = "disabled";
 		};
 
@@ -465,6 +467,7 @@ wdt2: watchdog@13000000 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x77>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 2>;
 			status = "disabled";
 		};
 
@@ -475,6 +478,7 @@ wdt3: watchdog@13000400 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x78>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 3>;
 			status = "disabled";
 		};
 
-- 
2.43.0


