Return-Path: <linux-watchdog+bounces-3918-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60657B150A0
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 18:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBE9418A22DC
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 16:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7C0298CAF;
	Tue, 29 Jul 2025 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTBNnFQy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1876E298277;
	Tue, 29 Jul 2025 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804767; cv=none; b=U+9/NMIHNDKPAF0maKy4Oe7P6UMg1GlZ7+5KS9+DQPp4FsPRnhz4YkAer5/koBjktpH8UhHiecex3WUqLigVbeO5DNAtJz5yyPFi5GeoWSr2898jecozpxtRusfAIEQJXs/IBabrtBnkD5ESvCRM1A+OFvQWorB/o3n2onYCilA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804767; c=relaxed/simple;
	bh=1gBp0fXVVpyz2GQBkaWUE7Iy/13JxiP/8autQYFe6rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEKWRRIAcc7ZNWWuoPcF/jdz33MZxU3uszTkVZgAsk8py3BFRBiTexIUHq7EKKULA7J7738COaHQTV4NxB5AOkPllnoH6PTLtOyLERBNYk8rXpuipuX0esXqavUXvLRwiPsXdUqe+NWPGT2BplJQPGwJU1/YFwJ2LgDDReOfEUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTBNnFQy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so59411005e9.3;
        Tue, 29 Jul 2025 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804764; x=1754409564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+jmtG7iFxHE/nqzrv+t01mCdmD4ucJR0QhI+mOxTrg=;
        b=bTBNnFQyT4bK6VNuCDAgaFQCSV6rwT4yx80+Ex6Y8kVl4HOukDuTRqH8Eya6FbspeX
         gTG2IqQ5PQmaUJtdySZ3q+EnopyiR58EwHh4euM10KOzwIVohXdkFh8sAbjOoeHhNUxE
         GNHjc/Yge7Ohlp5S+tXDqRb+6FJIGq2kaHDuhynW+bvytIs+QiqpQcksQwL2iUR/6Z5g
         psUYCzVcM/FI6lOBg2EWuHub+l0+ZrW+KteJ/twZvrQux0kV1tlNaUitzmNCXFNXK/KN
         Voy+HcfxPa0M/NrD5rkRauKro1XZtJmzTaHW2Rdc5/UG5kvS1678lhZ7msLeb6gRRf9t
         L/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804764; x=1754409564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+jmtG7iFxHE/nqzrv+t01mCdmD4ucJR0QhI+mOxTrg=;
        b=ZnYRbBFKCwbN+SKKe4RkH/aC7GeckItpPoB6SJg8ZAERN8cVn7aEGgLKj+Zhdlc3cG
         KDCGx1C7W2yd4otMxIB0x8oJkMMi/IXkIm4V56ZXCuvqV/BcNHDCE5ZB4VlDWQcz1gWP
         AfWIHCpqK7zFAjMpBbWyuypb6+jpVk0+jbqBqZFO9fJjICtFHYl+zA2rwOzwRo0gsqkX
         Lw5E1UbJFUk6b6Mf8qye1tUtrDtzHeGOgJ5Fi/7ZPJlzdo7RfFjmiRJlomlo7OECW4vc
         ++r0GztMNMbr8h/80DaI9Isvd9RlD3azghVbG0MLJN40HSoj0lndO95qBYeeLxiC4+oU
         qQvg==
X-Forwarded-Encrypted: i=1; AJvYcCUUjytCkDh5IDU+kdJsYZfkkzUxwoui8/OIHVc26/1EwZI0onBeEl/v3e7j6NzcPVJFwoXnYb2tcMrn@vger.kernel.org, AJvYcCVU0BKdnDaadZyPtmhT6c+V67Eu6+tZiyNtWe6OShTSwEoa363hjXb4JzNkdwfmiq/4AXfYVCRLKzxoyXnQ@vger.kernel.org, AJvYcCXhigH3PRocWEbm3be74j5P8HY/90ZOwSb39b6a9CcfABY4A1nliUv8ef6gfhBN5TPoxU6cAy2iGpJJ+Te+s0Q+M8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtdPOqCqWxS6TwN+kBJTVWIDU06wI8+cyg8DazYB2Tl+1s+ArX
	rw1gqiGH4/lr8tVe5Qha0CtwXpdxiy8ais1eP5wzk9dbyh6MulE42ysV
X-Gm-Gg: ASbGncsV9zXd7rMkgT3EX1H7jc2KpWN3PNe8roq78CfX1HZJMMOJQhIaiF8wpORJuyR
	mnemKfApFa3R51ruyWKL2i/iPWIfr+vqagRciWHXfsFgG1BkLzsHYhQTX5P8TLeJe3hefVsIPq1
	LDxltv9vN6P3dSITjL3YXUtpAT8M3pEZLZAh4z5ryDkqZYVg3eGisCp9VOvptzg9oF+cI1UZdkB
	PZzqyFBGCyi5LvWA5sRr79uFsE4QsXN7yj4B01B+cybyEc9Ra4DUYVEsEG67wGY2+kP/jgab6au
	DBSc2YQoybhqe1McannUP1IGxdyrwxPBwoYbLdiaXFkn5kJqSUuPQ9h5PM6IFZJBaSFiteHSrOX
	1pXd00cto0ne0UI2/+5RhVO9WzGQQ1rv8KO15Mw7nPyA8B180AtdAFpr2jzgn720Mgn6wylMaZs
	JlKZepsB2J
X-Google-Smtp-Source: AGHT+IHzzmsgGr2z5ijjROHnLnd1HI6ShcM6Q6zKZuVYFbS3VMjMdWfryWOjZPuyIxJgDjxFJ7wjog==
X-Received: by 2002:a05:600c:1c9b:b0:455:eda0:8a8e with SMTP id 5b1f17b1804b1-45892bdf3camr3000375e9.27.1753804764156;
        Tue, 29 Jul 2025 08:59:24 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/9] watchdog: rzv2h_wdt: Obtain CKS divider via OF data
Date: Tue, 29 Jul 2025 16:59:09 +0100
Message-ID: <20250729155915.67758-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the rzv2h_wdt driver to obtain the clock division ratio (`cks_div`)
from OF match data instead of using a hardcoded value. This allows the
driver to support SoCs where the clock divider differs from the default
value of 256.

This change is a preparatory step for supporting the RZ/T2H SoC, which
requires a divider value of 8192.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index d64d29709160..c2f39dd56687 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -36,7 +36,6 @@
 #define WDTRCR_RSTIRQS		BIT(7)
 
 #define MAX_TIMEOUT_CYCLES	16384
-#define CLOCK_DIV_BY_256	256
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
@@ -48,6 +47,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 struct rzv2h_of_data {
 	u8 cks_min;
 	u8 cks_max;
+	u16 cks_div;
 };
 
 struct rzv2h_wdt_priv {
@@ -238,7 +238,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
-	priv->wdev.max_hw_heartbeat_ms = (MILLI * MAX_TIMEOUT_CYCLES * CLOCK_DIV_BY_256) /
+	priv->wdev.max_hw_heartbeat_ms = (MILLI * MAX_TIMEOUT_CYCLES * priv->of_data->cks_div) /
 					 clk_get_rate(priv->oscclk);
 	dev_dbg(dev, "max hw timeout of %dms\n", priv->wdev.max_hw_heartbeat_ms);
 
@@ -265,6 +265,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 static const struct rzv2h_of_data rzv2h_wdt_of_data = {
 	.cks_min = WDTCR_CKS_CLK_1,
 	.cks_max = WDTCR_CKS_CLK_256,
+	.cks_div = 256,
 };
 
 static const struct of_device_id rzv2h_wdt_ids[] = {
-- 
2.50.1


