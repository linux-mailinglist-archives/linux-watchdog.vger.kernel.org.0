Return-Path: <linux-watchdog+bounces-535-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A969843C1E
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jan 2024 11:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360F21C22C78
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jan 2024 10:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87D269D14;
	Wed, 31 Jan 2024 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KDm5AY0u"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B569D0E
	for <linux-watchdog@vger.kernel.org>; Wed, 31 Jan 2024 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696433; cv=none; b=k1SbMnudlAdSS/K0YPnD6M5ZPJIf5i+ldmHXbqsTHejrVCSRP2AwooPLsW492F8QXO2VUkBEeF3x1hpuAyY/hm17NP4BakLImJOxYzD9/2BCfdFA8DRdcVFqPIq5BR+0FgISMxtZP96bdPzuPLXUdgzVjHFPfEK5Qj1MlsBCg+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696433; c=relaxed/simple;
	bh=NzPPNEy00n6/NLoSK6YZsJgd1KrQZGAMBgH5ckRJBJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kz2wKYY7hqDh4Lj2njzSlPjf2sfsPto53QvLcMoCKwaHzGnoL1xKBwT9sHuBniAKDgqRLkmc/QOdMHFdENJ6DotLCrJji2GfK6iIaIEERrLkBy583w81au/oXHaSpwbGmu427Tzjwe53o0uALrTlgy6BXwfKcbb6UowtpWXg5NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KDm5AY0u; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3566c0309fso447953966b.1
        for <linux-watchdog@vger.kernel.org>; Wed, 31 Jan 2024 02:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696428; x=1707301228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sccW02Yo8K+lpKyBO44V8P8/wJBKTY6GrI2k9Gcc9OY=;
        b=KDm5AY0ue+aSH3O3y5tNaFluMNkzAEPIT1Ndks8KaHnXqd8uO6jFmbrbKil3CJ1J5Y
         QTEJ38fuYBE7lzjsCA+Q2M6Vwa5cKg5ro0jT3xyg5LtPG34fcIdgRl78EXSxmxd1CoFq
         y9//rQvLSIXnvw3FPYr3T3fObQJQ6irsJToL70kQ3L2GtpVGnwGIPEsDLtKJ5ac0VXyy
         /c+e/Xm8r//mF7S+cASIKhY4Jz+tNzBWeH8Mzt9DO7GtIgXd6+hTA9n/4QpcSvvxgXqT
         L8T0h3HpqxAIVYJHqKMmS5JnMC/UwdnZs0cmvk+ZNn5dBCWKBRmYZ2F/9qN51w2MU2YY
         5yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696428; x=1707301228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sccW02Yo8K+lpKyBO44V8P8/wJBKTY6GrI2k9Gcc9OY=;
        b=TaA+tulxtYUnr9EirKmFQv8loQnJS9QOkyeViKVDPN/4D+agXR6IRdR0Y2I1buu03f
         2Zv/U/8noMZaPOHiWRCYqx60rsa2pGD7oOdviqRa/4Ldu7+o1tCQ1wFkfiiiSqsVRCls
         qGqiUK+J2k5WKPB2MxGY15N3kM6CKfTRmBAU1a+IYfQJfCT4X57xwash8KTc7/F1NhUw
         yqD9cdxxx4yfrH1QOPZg65u20XEqiIeVexL5E6sfhlfe9OHlZ/IlAVWWj+CvdehswnMH
         aZ6NLYwemaHRtTGGQLc52q97LbdDTx+W0TSVSptgFXBuFygDGnVQJysc0PdVLvwWCXXk
         5Jeg==
X-Gm-Message-State: AOJu0Yz5Bfky1r6K1SFtwPSgoLWil1fmOyiGSBz25Esgdj1N/2u77eJc
	2A7YX2yySdCqtYPd2gzJnD7yRATQgwNMtTlAua449aRbZ2FYbeNyyrQ16jSe6WS2F1w4khjTNdU
	B
X-Google-Smtp-Source: AGHT+IGY2eFu5vK1YG9Oq3IZh+BqPLj99nJ+JYdKaxKcJwHWkCS76yZXcB0Thx3b3tQ8p3aNvWRLew==
X-Received: by 2002:a17:906:c29a:b0:a35:fbc4:4c20 with SMTP id r26-20020a170906c29a00b00a35fbc44c20mr673787ejz.6.1706696428463;
        Wed, 31 Jan 2024 02:20:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWj/VdHtk+M0M86HFo/oBx9tdBLc3Ymnrmn1HzwS+AL+quDYDP80yBe1Z+uHY93wTD8TU1WdW8Xwf3yK1ddYcSjYbpXpXavKZUTmSbVfRUJXHB12XHKtK8XFViqz8dEoI1I8p0hNUTC8PMb+FYaaxhnXE/KiTthw0Yqm/rYk1ctPAkXO/DLcRZPuvwyNjzMYsNVokOVqztofbycJpnB8vKifwXjq2E1GSH9KCjaBM7N5/H2D6/XCNt+I/TQMeke7mNM7pZTTlZ8iMfQGbXiTYxI3WTNOAweVddqM2gD3FuEmDePi4/mMfLMdgfcjKmZ67/ah975Z+m/Br0G+Qg1jjt8ZAL1Uk1BsheFIpMi3VdfYHPjnjoEtwPIt3FHhudcKVOEJMIxZ8NA/PGvD/l+uZQMShzJQW7dKRKpG9utw0PRQm1FUhayffj1RSPPiWTR8DQoEG0Wzjyo9Qklx0Goacvjnb9YSPaJirWzp1m6eoYLuDXhvdAElUL5rRcqdNddSu04A5CmyznfAFKSA4z03w3FfxiK1v4kiTnJDZzXLUtY9vbtbI9eO8LBp+hrKeNhsHvX5OVMpvSWA183i6+4YjIEsdqyoxE/m/uGbN1pHl7o+II=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:28 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 01/11] clk: renesas: r9a08g045: Add clock and reset support for watchdog
Date: Wed, 31 Jan 2024 12:20:07 +0200
Message-Id: <20240131102017.1841495-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

RZ/G3S has a watchdog module accessible by the Cortex-A core. Add clock
and reset support for it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/clk/renesas/r9a08g045-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 2582ba95256e..c3e6da2de197 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -193,6 +193,8 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("ia55_pclk",		R9A08G045_IA55_PCLK, R9A08G045_CLK_P2, 0x518, 0),
 	DEF_MOD("ia55_clk",		R9A08G045_IA55_CLK, R9A08G045_CLK_P1, 0x518, 1),
 	DEF_MOD("dmac_aclk",		R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0),
+	DEF_MOD("wdt0_pclk",		R9A08G045_WDT0_PCLK, R9A08G045_CLK_P0, 0x548, 0),
+	DEF_MOD("wdt0_clk",		R9A08G045_WDT0_CLK, R9A08G045_OSCCLK, 0x548, 1),
 	DEF_MOD("sdhi0_imclk",		R9A08G045_SDHI0_IMCLK, CLK_SD0_DIV4, 0x554, 0),
 	DEF_MOD("sdhi0_imclk2",		R9A08G045_SDHI0_IMCLK2, CLK_SD0_DIV4, 0x554, 1),
 	DEF_MOD("sdhi0_clk_hs",		R9A08G045_SDHI0_CLK_HS, R9A08G045_CLK_SD0, 0x554, 2),
@@ -219,6 +221,7 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_GIC600_GICRESET_N, 0x814, 0),
 	DEF_RST(R9A08G045_GIC600_DBG_GICRESET_N, 0x814, 1),
 	DEF_RST(R9A08G045_IA55_RESETN, 0x818, 0),
+	DEF_RST(R9A08G045_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A08G045_SDHI0_IXRST, 0x854, 0),
 	DEF_RST(R9A08G045_SDHI1_IXRST, 0x854, 1),
 	DEF_RST(R9A08G045_SDHI2_IXRST, 0x854, 2),
-- 
2.39.2


