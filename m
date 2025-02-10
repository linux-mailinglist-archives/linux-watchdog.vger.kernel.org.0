Return-Path: <linux-watchdog+bounces-2901-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE943A2F7EA
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3636D18846E2
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B03425A2CA;
	Mon, 10 Feb 2025 18:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHpMYp8l"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292E125A2A7;
	Mon, 10 Feb 2025 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213382; cv=none; b=gO/17Qa5QOuvlVfabQnpAC2gFBMk3IrnYXh8dPtXOk23eHEYCbJYcyZzQRGwY5YM41l1QTgewOM9+ssqZn0tXk1kArLIvFCpVm55P/FM5v2y7ENodZVCT/Xj3vSV9XHe2sCKKAMllTmF2MAusOxBABSPpB9JyIftx8JRW/hTStw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213382; c=relaxed/simple;
	bh=k38V+jXxgn0GoVBcVBbF5ntBNRE28teJ9MO2dFSdiXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxmb+CaF3WQz63Nbckc84d5KMPqovWemnjSbJmZld7tnmKpIXRsKUu8KLFcZD6vRRKuEt1M11r8pRjC6G7x/Veouxa9PTKT90w+H2ucLIFgDSne4Chxka0EfBaHjOYC0JivzshcKjAUKCf3VcZm1sHSlNeTSGqPAeNDpUBxKMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHpMYp8l; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-439307d83f0so14543035e9.3;
        Mon, 10 Feb 2025 10:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213379; x=1739818179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8b7IQZlv8qmqmi8EZCZagpGi+bugYSxp9YD0b1kLR4=;
        b=eHpMYp8lwst1lqRWSc2TAOIQJX+Imj+8SC251YpChPB32eTsGqnkOFrEhcXa4wSpHz
         9/bcVRQo5dHGAYEs10JfNtnbVoDw5BHpPBK1BPHbLZTnEgKBKqCnGN3l1V6pOI3NSrmk
         FLd2XyoTwHh+DtZnRsfO6gda/6PQlOF897IbAbqSfOjXkiaV+s7PM3MeBWiCn6GqfEJs
         sLuAsMMCJiKmltd8fZcakp4aEOw4JKS8WSAjGQAAp7CLCtS40bG9rB1iDk38c146043u
         Nvpa6s4uJTfs7CDqdLzh9kLHZhvrQ8VOuR+zxYYUE3kt41X1tpE9b+bhNt1zzwCY+aIG
         jZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213379; x=1739818179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8b7IQZlv8qmqmi8EZCZagpGi+bugYSxp9YD0b1kLR4=;
        b=f425lAwLNNF0wEOTt3A4ekFWPB44yD9/15I8VrlzRC/FL8KLQStDmD4rbOhiTzuQgz
         BjNeToUSXoyKbo43N2Ic4lO/NZCcRQZWNM3NJZRXbjN3Pw7FelOJ8YhKBHGrp1fnz9h0
         eujWCQyMWfMRy/Mc7odPqYb+EqTO1eC9mveiB0oMxpLMSkvEOqJsQUGgGtGx8QQDAXD8
         F7+SpSpnf0e40rrJvVFAS9kWEXyQXj8HFJoaxliJzRs4hesTQniLgdbg72EntkUg+vvy
         1W7dLnfIqFvMe+SquhhVRn4LW654237AFFUSNC+sSlTk+p1Til7yN1+79xOd0UwhcPIq
         6X+w==
X-Forwarded-Encrypted: i=1; AJvYcCVjusg8serfRphBIiJh2mNWf5Bdl/UMfCwnbgAKEntq6RxtturCky8fWQdsgo8Bs5YeyBAFfgQ7syLES/kE@vger.kernel.org, AJvYcCVxqqc77cZu2NuweWccTaBnki1qLdRHeNkIJyZs84MWxnVWDddqln2A3HhfLRVaAqn4LFdJOpeXDRKh@vger.kernel.org, AJvYcCWMeYRWy/IaYJZaEkqBwEWUn4ocLbgxy9oSlhuxxBdsW/BTAV8tTJGJk6z8RaDqesM0aUAyQGth6CqanDvigqo=@vger.kernel.org, AJvYcCWpEFwfUWWlynpnR08WAZf7RHCa/Vo5xwjw/e2L9hJ49w09RRV7HMvbQdTLgzEGDhGVC0mXwtkl5t7f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7nGfnquKMW38qfSIGoyKoMH8pGvCvBihNd0JFZMiUgt8LdAYd
	Zlp1vlOA6yXicwUlFxmusvJZNSCpvHZBAYwMTssyPcJ2A+5EbOr3
X-Gm-Gg: ASbGncsewDpZQmPxS6dsQlt8t8GEecE6fjWeoKPUrtr7Jvkl3fWOXVNI7l/qZzftpOX
	Non0lSoWh0/fhFE2uaNF60/SZAnOK4GKhUp1G2NfGJ++3++oL3AXJaxW3YQaNC9CLCsiNXyQdIH
	m+c9KZ1SyqPFq8Zh1C21lo28QPMKcptupVv/iUTduiSav3WhKFYIYknBq8uldmhFIa4NRWabR79
	WjuQvRHCx6umE+AJjykloUaWEc2jd24P2dmKjO6PrD8S2c/qLl1evZmMioLsZSmVpDjKt3+t2La
	b81iiNfm3jV4HrMYLxxHxB7rcZ3rxMwi9G0XRBRQYVOk
X-Google-Smtp-Source: AGHT+IE/mOnkpqBaeuLtkMcUXOGjBJGy3u2cASTxZFKh+PKUDu39uiZqrLZqJgNMIiNIjZjghKLfgQ==
X-Received: by 2002:a05:600c:4f90:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-439249b04f8mr114951105e9.20.1739213379301;
        Mon, 10 Feb 2025 10:49:39 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:38 -0800 (PST)
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
Subject: [PATCH v4 9/9] arm64: dts: renesas: r9a09g047: Add `renesas,syscon-cpg-error-rst` property to WDT node
Date: Mon, 10 Feb 2025 18:49:10 +0000
Message-ID: <20250210184910.161780-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add `renesas,syscon-cpg-error-rst` property to WDT node, to determine
whether the current boot resulted from a `Power-on Reset` or a
`Watchdog Reset`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index c366bd2667ff..d5d7b390fac9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -189,6 +189,7 @@ wdt1: watchdog@14400000 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x76>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 1>;
 			status = "disabled";
 		};
 
@@ -199,6 +200,7 @@ wdt2: watchdog@13000000 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x77>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 2>;
 			status = "disabled";
 		};
 
@@ -209,6 +211,7 @@ wdt3: watchdog@13000400 {
 			clock-names = "pclk", "oscclk";
 			resets = <&cpg 0x78>;
 			power-domains = <&cpg>;
+			renesas,syscon-cpg-error-rst = <&cpg 0xb40 3>;
 			status = "disabled";
 		};
 
-- 
2.43.0


