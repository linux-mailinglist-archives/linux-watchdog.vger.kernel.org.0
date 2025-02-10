Return-Path: <linux-watchdog+bounces-2896-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C46A2F7D4
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1069167784
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E98257AD0;
	Mon, 10 Feb 2025 18:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVvtSqL+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CD3257437;
	Mon, 10 Feb 2025 18:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213375; cv=none; b=qFUhbDAPx5YaGmS0Lf5lwO+ABWmWwvYXJ55yzRbE1kTf0lEb7wgyejNRfvhT9O4X1TD1eqsiemU9pMP8S06asXwFzQ5jxoTi02CEOZdOYUt7xTAAhOoitZVKjhizlO1yCZpfDL8s0TiSahAPM5iBTeNHDuOrZ2GGDFCYPyRw1dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213375; c=relaxed/simple;
	bh=ZSyMERHAzLIZIbHy+dEZlPGNcdcHxhTrT7QlcMYqiBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqni1BwTtpxugSi3Bqz61QkxpJ8TqujqXrNxrmHKy/3fgVXsQmmbBmyf4LlvT69+iEpn6HfEP8UKDupZNFU2jhTyr9NHdL3hGN0mgoAcdWQTTdPUpoexmcIrKySZ4VwEgIViDmXqHxhsLxtSmUECG/LBN/sHNAJMnWvPmFGjj2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVvtSqL+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43946b5920cso7761535e9.1;
        Mon, 10 Feb 2025 10:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213372; x=1739818172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zswZy48TMWPGIzPZRX1JPRsnwLmfpDNzb8dnWU/5LnQ=;
        b=cVvtSqL+V96o9mLe9rGOhoklL/GrnOg65JqSbU+TefNOxZpFfFxIyO/SKeXYWHRJ6C
         SnJqC4Lj8O7hqCsLAg6yULbqZS0y3VTjiASfWmIgju7OWTzJXhSz+rJScARSbcqfRHUv
         fhxOpbzopUPGtlp7G/ZjDMlTpDeLl9wcGKrOgrRUoq2lHdIczBQOf7ev99QVizWlC7oF
         ekUQHejRFS7UorFJBNghYFsjaeiAwoqwwYKwJ1fLPXYQPET/pSbgNrgSyE3GWMeeAc2o
         u49hf1+Nzb2UlXNUrlyDO3ckaVbWD8P9dIFNTZyIgNGt52W3jitis3Ew8x8Ka641beLo
         WBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213372; x=1739818172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zswZy48TMWPGIzPZRX1JPRsnwLmfpDNzb8dnWU/5LnQ=;
        b=QOmR3dajE0yUOE5PIGRkXGL2+BnBEH/OHHVfWsoDFHbk4NvGWJHHDfNJSxOgzVxFUX
         aQ0vcs39m4hNI+2KOXZUH1/YN88sGIA/dW9r3b/KiaO6YeXWP9bcOp1ZkTZisgyFRjZ+
         T9w5FDLIOVV16oEza4Mt/+AUgj0/K4lRYmcZJfv6sHSJA+63hs53VrhXTEELGQNFYGpv
         aJQNiYJCDcCZtf/LBJrySv9O/h2J+fTMHLfamGNaZoGv/p7BEx7Oet1xV98og0gFuOsJ
         Trb13tauRrHQQhcmbW7l9At2GNKbHg7ueDIgLBDwiqbRiMOmJ4Rt/zWBAtreil8Tf7pD
         lIzw==
X-Forwarded-Encrypted: i=1; AJvYcCUuBfnLqq/K8pUwWs++N9t4CjHaM/OzGxG5AKOw5uZnQSCRwsIA5732SCIJ34BUomOYmWCUTEZJnDkZ@vger.kernel.org, AJvYcCVGK5F61XZ8KQx8bqEzjzJKzpfQeHO6BYNEq5fHxqjYTRiw3Tc/oxCZNMYXCGD/RV5wdxN1s299NhULa0qt@vger.kernel.org, AJvYcCVvz8wnJt6RBGiRtn2VXFS35gopBWQA3dmPfwGhTy0ISGB/znjfHoIV+3nYTqRzqr3QTogBObENrsqcuXTGZ5o=@vger.kernel.org, AJvYcCXa6qvhRFyG+NhBNTdNlAYRnrUE6DXWfCRk9CIw3ME1Qi7pWwI/J4g1C2jumKVratk62DJn5Zkcn55e@vger.kernel.org
X-Gm-Message-State: AOJu0YzuuwkRLfLJrQRuPaBDpoxr9Yfbe1eg10tDaS42Iqevcrx5t7uN
	+CrKndO3CMnrs3RzO5f7ltkJVxPvQJmcAfqlaCNBIB0gTDjf5WFA
X-Gm-Gg: ASbGncuMebIamRhw/SZ5MeInllD3ptTeZJqCVo3ugbQrGuRVAH1LNMmYUUQ/+7+kYEI
	9yBHS8YvrtQOp111V+KG/brP9kfppD710k9YHkp+92zv9DAit46phr47th7qUVNDMIe+BW00I1N
	41bpiGgTnLLBqVcfQgVkprOSQFD59/Zld4smVBb61xnnZlFgCxGgj+uJ7ERL0AwAjkKkb20vSGf
	Bk1b3h2YcLG3UxtvgVPckaqxf5oj1VSMbk2UEZaUgEpZLUNzAgfXrNIDSsAdnhHhrpZLpqde4GT
	KSqgCFSFbCWmaEiLW7OpKvYQ1yzn1yReJdrEZHXeabJa
X-Google-Smtp-Source: AGHT+IERSYBxiRbnAivqRd8qJlWgtrbtRXeEFGgep54bAjDoBHrEWjEbaF2gj+m48JPa3LSNuaXiLg==
X-Received: by 2002:a05:600c:a0a:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-439249abea0mr101165235e9.21.1739213372048;
        Mon, 10 Feb 2025 10:49:32 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:30 -0800 (PST)
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
Subject: [PATCH v4 4/9] arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
Date: Mon, 10 Feb 2025 18:49:05 +0000
Message-ID: <20250210184910.161780-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add `syscon` compatible for CPG node to allow the IP blocks to interact
with the CPG registers as needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- No change

v2->v3
- No change

v1->v2
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 0cd00bb05191..acc9c512fbab 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -264,7 +264,7 @@ pinctrl: pinctrl@10410000 {
 		};
 
 		cpg: clock-controller@10420000 {
-			compatible = "renesas,r9a09g057-cpg";
+			compatible = "renesas,r9a09g057-cpg", "syscon";
 			reg = <0 0x10420000 0 0x10000>;
 			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
 			clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


