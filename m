Return-Path: <linux-watchdog+bounces-2900-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E696A2F7E5
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D65DD3A4005
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BEA25A2BA;
	Mon, 10 Feb 2025 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUeqDZjf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C6A25A2A3;
	Mon, 10 Feb 2025 18:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213382; cv=none; b=f3yFg4J/Ld0js6sOyRndQQU4pxmFw/9Hry/egrh2mn8bH3WBa6MjjoAVfjmLMLQes3G+HJaqvlI2QC6lV8dfogGxi4A3pOoZZOwM0qJrzdwekm4LkzMoEoEH4BWGgQYY9ewV03gWWaQRsxDCwmInKaifFDeGlMmYobAq18CyLoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213382; c=relaxed/simple;
	bh=d3yUIK9fiwVZoC8eDMG/+QqQegvEeowhWbT4UaUXcG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBzXryDOlk04qy1fQtnfvoZAiuroJF8Gh2FyadYbGtRUY0529xFrz1IvgEfIQINPliSdkE1JIcEWMleKlEwAEniT+oqa+tbm+jqjbTQO22Z+eavT6jrK3wlDTWPkbBwMfKDNy0kRiD7ANbp99K2BX1oP8CffzTkuSsZVcMDTXdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUeqDZjf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso32358905e9.0;
        Mon, 10 Feb 2025 10:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213378; x=1739818178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+viOnN6vcnLl9dZhOIuDVGEqsWnlhS/CS2cEXKLaDJU=;
        b=eUeqDZjfzqA8t9a337YDbq0/J1Di4MLl6OjLPFCEP7EofJZxlBWQTiN+pboZgQQAM8
         aTAevNqUr4MUKuKGg6td1CWd97TyexQ2p+mIKr3LS65V1ikp6Y9v2GMOdp27PhYcJXXG
         9qa9fGPTrQlyXyVDx2rX2PoEf/jvKn5GZJailjqb4UE3f/GBVjtYP/nfRyVWf2hrSQDU
         EXKQL/lgPSVDlC/l77RGZiQZwHralzgaukqLE81ei4TCnC8q6hCYRBanCR9w701XXY/q
         sFM6tVILD4fBGz32c+jVmYin22WGzrjxV7s9yxl9PnsxzW6RxuxwhcxKJ1TVZLOG88WF
         nCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213378; x=1739818178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+viOnN6vcnLl9dZhOIuDVGEqsWnlhS/CS2cEXKLaDJU=;
        b=wEz376fL8jEJxaKcfQ95/g2fAAayr9t/5yCsn/rTNFg05NabrpQMUaBTFtmv89UsMW
         o0TF+yGtNY173AuYU5HqcgAx5p7f12XVUeA0az+JuU0sJ4mVjWqz1VCJspbOLtuijZ4l
         PtBp/uSpUebZGrP7jkpXwklvVPfkz2R0wBpxpuyIi823z/Ych1GvsDaCFXlp/Ofs1mXb
         BWVSYPUXhUXvyb4ZF03snsSBVCJyzVM+JoyyexuAWE3KUXj1HsITzVZPQXpEjmrGRY+d
         5ff2YRsyMSMZeMdXCsZz4odmpBYkDSgunmU4SahSCRB1Uj9w//rZ8VPiIauoW6Wsx1xv
         QAYg==
X-Forwarded-Encrypted: i=1; AJvYcCV+UffO5qei9qBCuiUsinMsjjPPJHuk3UHfny3WP0MEcroMlPjV2lJAvGS+5JTM3qEfZZnEJbzjJC5U0SX0@vger.kernel.org, AJvYcCW+t6QNPfoi7ddD2P4YZtx8jt7WP7xs6UQQLNs0z/Rof0484vcJYMDatkfXSWhenmQ17dtW6t/OtxcH@vger.kernel.org, AJvYcCWrNz6oi/uXAdbB7hI90p9ncUiLmigjF9GN2cCNOUbUFiiUf22QGIJsh+0D4u7HmnkFBRNgm1EIRPHnUdQq9io=@vger.kernel.org, AJvYcCXbooPQnUVCgx/AaVSIwXXh+Vx3LNjh4B/lORI7ffmC1XxAfP8omujIycJveAAU+PlEaLvHdRzqXJti@vger.kernel.org
X-Gm-Message-State: AOJu0YyRnyHD9+V1HPQk2s1hCIhamqoCy2Ufes73W5ZJ79+6ibqOxc+d
	AZO+88Y/KQBLw1hxnHCwRCM0/hRJHH/Rans4uUJSRFDbWWJyqtEE
X-Gm-Gg: ASbGncuauBULwx4uNplfGn8H7/Wd38Qa9Itaj6+DnYyjY278zPja1Fw+/cn8ym5M/kL
	67XyiKIM1waLbXLUd8M0ON5s9gcIH/Lj2e+JHROa0XQm1EwwnvDTRNQLLBa/oVdubCzMzwUJFNh
	K6T166YsKM5pxAyL60gRIfi7iNu3Thf/grsqMnefFSIEjbzoXhZo/S5t6NMRGzjXThzb+pgzlYC
	qKp5zlSN2LakSJ9w7VFiMHwMXut5J/0zIdvDCnoNE6JapNA+fOBqhf3JgaRd7n6gzxXSHsbZsW2
	tY4VzLdKXjnbiq9PE8GMKh2XX6Jch0Xyb8UHtwkqPtLp
X-Google-Smtp-Source: AGHT+IHyYLNpHbbjs4AcOuo0o4L1XRFpiCCfjWH6uZzVxWpahPXoaLHSouWtxpK0uWHgFjddkcNrlw==
X-Received: by 2002:a05:6000:1a86:b0:38d:dd8c:51a1 with SMTP id ffacd0b85a97d-38ddd8c542bmr5513640f8f.27.1739213378004;
        Mon, 10 Feb 2025 10:49:38 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:36 -0800 (PST)
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
Subject: [PATCH v4 8/9] arm64: dts: renesas: r9a09g057: Add `renesas,syscon-cpg-error-rst` property to WDT node
Date: Mon, 10 Feb 2025 18:49:09 +0000
Message-ID: <20250210184910.161780-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index acc9c512fbab..4d5baed02fda 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -367,6 +367,7 @@ wdt0: watchdog@11c00400 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x75>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 0>;
 			status = "disabled";
 		};
 
@@ -377,6 +378,7 @@ wdt1: watchdog@14400000 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x76>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 1>;
 			status = "disabled";
 		};
 
@@ -387,6 +389,7 @@ wdt2: watchdog@13000000 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x77>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 2>;
 			status = "disabled";
 		};
 
@@ -397,6 +400,7 @@ wdt3: watchdog@13000400 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x78>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 3>;
 			status = "disabled";
 		};
 
-- 
2.43.0


