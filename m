Return-Path: <linux-watchdog+bounces-2637-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EDB9FD735
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 20:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6AA118858AD
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 19:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0601F942F;
	Fri, 27 Dec 2024 19:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+0OrFKG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5431F8AD8;
	Fri, 27 Dec 2024 19:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326188; cv=none; b=YBbXscigG0vwQU6mzYfwbVzG9+5KQkwpIxkuJ+i3JXkGm9n1xfv1j3qX9olTPqlv5sslRC69UKUXI7IjCR0euyRmgh7VO3qGHWiJfN4unkabhkHCAJjj7aQLe0ZOh7eHiJCWtOUXCS+U+idZB6gaLcrinTIgJUc7kXo5/xYkCTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326188; c=relaxed/simple;
	bh=/IAGnTy2IYyK4HHK19qpN0BQgEWU57aHh+40aFZGiPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyCZ1dSwqINJFVgjhTsmP1Nk8dfvTRJAe4FNt+vCDVVQafwlXHmvT/3ZFbwg5GFHzGfpfzPbbsd2TxV66AytsmUN7DE4wOlEjHWL8aozrtxR8B72YMrrkO/y2KxV1DcDVZwrCEQh2zW/IXw2ixQ6urrLV74zFlpXWg6lI1M6wRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+0OrFKG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21680814d42so81540885ad.2;
        Fri, 27 Dec 2024 11:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735326186; x=1735930986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1J2dnV8brqVh/DdliqC6kZPsixqWVPm/rUxD17Pm08=;
        b=L+0OrFKG/MkzWHLnb9liXkz1WBi5vztIpe70fzdk9AaRtI4MaWHMDOb0/lDpiEcaNr
         Le2Igr4p6XsEz2l42sfjm8dVIQUjG6/7D/nJ9F52sGy2lDIHOxhgqH2MAv2eM5OZw3m2
         +TBVyRwolYiLEvlbECDCZjqxVoxmwiqrjjTD18h5EX9U2rW9B3sIwVJGhgIF8D3biCM0
         jizhnaqgc97X4H8J3q9B0rfahw5Ak9gZgJKoHp5WTzjMpZsjTX/nuoaLjL17NmogxCXx
         UrPP8j/QgwEXtNsbFw1vxLC6HUlPcl+2iP7k7zOavypIghrHSMpzQgxvAB8wuRC9wTen
         2HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735326186; x=1735930986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1J2dnV8brqVh/DdliqC6kZPsixqWVPm/rUxD17Pm08=;
        b=jMqQshAHz1MEAAjqPPm0b8J4WLmy4HVLFWUFKm8IwWyoz2skY6uEIM0rpjZq8A0v5T
         LtRv5xFUA4IOkBjM0AzGUhvAVj8FG9PRHiQ6LVblX/WI48gqSD1Zlils5KUlIFC3oJee
         Axsn0kx79YGEmQClnovBzSUlbMaYXui09999oWXD+Z7UI7MPqOE3ZDhZrd2PPPRXURTu
         Fpulm3FMKeswP/6uS/cXHpRc5GckEQB6xD7wPn8/GoSRJ3Zew7VVapi/i7ig7YQ2jSR1
         30936zNCwkg5WRUyvEGfPfrjrjyIOm3f924mpWamzclfQNWkTOvS8gwnljMDRdPkYiTh
         Vukg==
X-Forwarded-Encrypted: i=1; AJvYcCVWKW+EB4lOuqmUAnJIyPhbFFMMfATSccaQ9QtcKXZLOHJUnCcWvSSxu4jnBC6vKTs1MiJy2PDKS9TWC7ErEIE=@vger.kernel.org, AJvYcCWanYzLNLWQu3QZkxRZLohzDTkzQjWt4BJOBC0nOJKyuiAl0yTURLonnitSWJrl904eg/rTHd/SGscTtShL@vger.kernel.org, AJvYcCXUxCGq0rHxbAfxM5ByL/Rb9PNos6fAPQDafkehe4MrgHEvUBCZnZxcrDczVWWM1byrKmwEqJsig0FL@vger.kernel.org, AJvYcCXePSuh53spRKqZO7II9YmjIWOdW761SbFyP4HMaaHhgfRpKM8NqDRGeNGK8XYSnefGqRmsjNaAkozs@vger.kernel.org
X-Gm-Message-State: AOJu0YzgvOr1uKLwc/DHEVMIzv70ZTAU8bidl/8g+dEYHGMMot485vFj
	fEY0iQ+elyeCj1vQi8wYb4JYQgRQAjxtK0p7AA2CrNtgclMsGfcW
X-Gm-Gg: ASbGncs2mE8az1VOhfbMzHA1XMgvd3gwQfSwSjQadsv3XuW2gBCQWY1PTcLrk41DqQO
	nOdUlkVUIqncEs4d4th2ccgCOiy9lGyMWJW8M/oZV5HNWsNdcevVbluX1M+93lFEE3nN/2NoznV
	wAy12bbaZRchu+3+cwrCUb2uSRZcWsvCVjeW8br1OLUpZDobcZvKLS+983YoIPWQGjRvBvvUfGY
	Ym3gAlNCiouX7fThNK71q1xoJMZ00fq2TxGzBGnCTsucPkL4tK94QN3AIPxveanSKpZvNz+5OAZ
	3sWQjIM=
X-Google-Smtp-Source: AGHT+IFL+M73myxJNmX1bGIfrW37yeUdq+u1cotILMeODj/VRZzE/LPIf1prAWoT2pg7kdjxJshCMw==
X-Received: by 2002:a05:6a20:d48f:b0:1e1:9fef:e974 with SMTP id adf61e73a8af0-1e5e04a3040mr44538890637.24.1735326186240;
        Fri, 27 Dec 2024 11:03:06 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbd3sm14877943b3a.110.2024.12.27.11.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 11:03:05 -0800 (PST)
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
Subject: [PATCH v2 6/6] arm64: dts: renesas: r9a09g057: Add `renesas,syscon-cpg-error-rst` property to WDT node
Date: Fri, 27 Dec 2024 19:02:10 +0000
Message-ID: <20241227190210.69025-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add `renesas,syscon-cpg-error-rst` property to WDT node, to
determine whether the current boot resulted from a `Power-on Reset`
or a `Watchdog Reset`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 69de6c302b17..efc3fd582e12 100644
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


