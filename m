Return-Path: <linux-watchdog+bounces-2593-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DAB9F5B9A
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 01:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1A5916B834
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 00:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6FD13698E;
	Wed, 18 Dec 2024 00:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laqg6jCj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6951292CE;
	Wed, 18 Dec 2024 00:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734482070; cv=none; b=pIi9iGx85Z5JbL/dRF7uyH9rhRnWbPhG5VdLjPBa6hyCu0fQ6HxiKFVG3fRKfdaauabPvhpLJMX2AwYPB/Kuw8go2YeN45tkJrbYhh8RtZe1+K6O7tgneo7nKHEDhaIMmDTdZ5PLUUXnUszNYaW8TF43LdxoCSqjH6ItSM6nxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734482070; c=relaxed/simple;
	bh=g7CBUVHObfczqvKej4PI7dHfDwEwYeD+gLMKxsADLeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxgRpxX5jXELrOalVCJ0OP+wW3WoCyD8qkXKqf9AHEl0fQA/FtWIxk2diXATH/p49hnMUvOPrJdnjSJv5BxkjQJbYjfvJ0LZHT9jqZK71ZvzPoW9bZO6vM9SPu9u6e+uwOxhXZkYfAklFZc726DTLY10t8ECauDAMLRnUQ6iMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laqg6jCj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-432d86a3085so39503475e9.2;
        Tue, 17 Dec 2024 16:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734482067; x=1735086867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iel7EZTyU471ieceLJn0FpRUk3Ypdff7DrLuP+ux0Y=;
        b=laqg6jCjsfBFahjn+jyK5JBtw2GMkF/nEXX3m/fdJZjlyYJoB9IQI3TWDR1G+fpJ1v
         1MSEPVp8eAKHwf3GA+IvatXahO0fpnysLHt4KHvVoMandqjo6aNjIES4N7kztPzoaeW7
         xDq9srM+0oTzKc2GULWdA6CxWWYw0vQ7D/PJE3lM5hDUFq5hsZ5mxlbOuyS1hpyiTpQz
         DRq4CzhJyUP48hlU55OI7cvmNG6QiXDoU9mWinCYdOf4+fauQdgs0VjE1RTLFf3DBqvI
         JjCGWg+52aaqScPCebOonMoRJrJQmVpEFK8I7IEkToGmWavy8bwzVh6VRcngvUxoHoAq
         tEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734482067; x=1735086867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iel7EZTyU471ieceLJn0FpRUk3Ypdff7DrLuP+ux0Y=;
        b=W1psRU8HxVbapdI0AmMDwIG8cqEw1FRBhiYoJJjKoju+K7OsKybUR+TfztV83jRQtc
         XtN2NznV8OqvNDpLAfmeUAjMMlinlf1Nolp4GdlfB2WkhzWxoqCmx0cumEAWHoVX+0iS
         mynyV0AozT4x0N66EdlliWwvlqruRRFnR4vVHgretC19bnEgtNxO2WLySYV1S8lUV3cx
         l0Y9Njv6wcqBntRs0wWotupvvhS3twTHGIOrFYZI26/9QDN4BaNDgTKLNjiKbk9lQM6b
         FgPhek0r/F7rB3yReCRBric5N/GG9jUCbZFtbiFfJoPaVByfpF2zsF75y71WNpTxYim2
         /bYA==
X-Forwarded-Encrypted: i=1; AJvYcCW7AGGguGgT9oBRYOEe/zGP0XbR6O0AcDQFk9ytpMiAVd8GxBMn/Fx5PiXinyszq/1d66c0a3jmUUvDijh3Ifc=@vger.kernel.org, AJvYcCWYRw595xDuQOdfNiulhogdR8cg0hUEmH3vYyVmh4qOo5xId12Mml0jUirog9SQkbDw6EuS1wERLMvqz+T4@vger.kernel.org, AJvYcCXVWXJwCiyhLlPho86CIp+kRXJYAqxBbQLAnSAqldAIwJawd+s+OuvpkngEhSjHMdgYUXVeanEevjE3@vger.kernel.org, AJvYcCXx7OKOZmngjY6hsrtShgNmGSfKt1rEwJVE0VYqbw9l6P4vAMYsen7LlhK67+/ws3ChY24dpcSKTLVu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vfQw+akuiRkSZd+5jSvLaA3A3KRaSTiH336RQsXiixWPLxFI
	SmnnnK7X4G9AEJbBLK6qdLUN7Gsj8lHtUTi3AlcBJtrsA0xqlbhR
X-Gm-Gg: ASbGncsPwn/9Gtdu01fzMBA5BvDkzmE+DPIIrd/8rGFQrByILayLJQ0No5E+rABQx11
	JAdHQe16H3g5tG8ul+zA+ZneTqI0pR01pjcbtorG48HqTTN32/6igQFlVwccoTZXlQPz+jQSPUq
	a3ozJFRuTmE76ae1c+2nEdjvAZ32oJWtxv6RH+DCYq/EJSOCQ5tUb86i3MIV5mYwDEYvzgF1s0O
	Fib1VUsWxT2EwUbIa5Xq0G+PeQYJN4PTNeSyKtUmT1NQVoihb0f8USkjBp8AE+6YjVEz/u2lqIS
	f4dXjPG9CQ==
X-Google-Smtp-Source: AGHT+IFFpsSC1T1fRG2/2x5iygn+Q/HqLAamb/rsk+LcO1z3tSDGdZKezgL8Id5Hf7+S4CalQZtyPA==
X-Received: by 2002:a05:600c:4fd3:b0:434:fddf:5c13 with SMTP id 5b1f17b1804b1-4365536faa3mr5010715e9.14.1734482066694;
        Tue, 17 Dec 2024 16:34:26 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b287sm2365625e9.29.2024.12.17.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:34:25 -0800 (PST)
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
Subject: [PATCH 6/6] arm64: dts: renesas: r9a09g057: Add `renesas,r9a09g057-syscon-wdt-errorrst` property to WDT node
Date: Wed, 18 Dec 2024 00:34:14 +0000
Message-ID: <20241218003414.490498-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add `renesas,r9a09g057-syscon-wdt-errorrst` property to WDT node, to
determine whether the current boot resulted from a `Power-on Reset`
or a `Watchdog Reset`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 69de6c302b17..44ec54569ce1 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -445,6 +445,7 @@ wdt0: watchdog@11c00400 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x75>;
 			power-domains = <&cpg>;
+			renesas,r9a09g057-syscon-wdt-errorrst = <&cpg 0xb40 0>;
 			status = "disabled";
 		};
 
@@ -455,6 +456,7 @@ wdt1: watchdog@14400000 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x76>;
 			power-domains = <&cpg>;
+			renesas,r9a09g057-syscon-wdt-errorrst = <&cpg 0xb40 1>;
 			status = "disabled";
 		};
 
@@ -465,6 +467,7 @@ wdt2: watchdog@13000000 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x77>;
 			power-domains = <&cpg>;
+			renesas,r9a09g057-syscon-wdt-errorrst = <&cpg 0xb40 2>;
 			status = "disabled";
 		};
 
@@ -475,6 +478,7 @@ wdt3: watchdog@13000400 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x78>;
 			power-domains = <&cpg>;
+			renesas,r9a09g057-syscon-wdt-errorrst = <&cpg 0xb40 3>;
 			status = "disabled";
 		};
 
-- 
2.43.0


