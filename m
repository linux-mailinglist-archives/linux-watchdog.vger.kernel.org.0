Return-Path: <linux-watchdog+bounces-4019-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2470FB2E670
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 22:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9C101BA57F5
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 20:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714232D24A5;
	Wed, 20 Aug 2025 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzXpHUCI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765682C11E2;
	Wed, 20 Aug 2025 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721412; cv=none; b=oTbV5wukjOR6tF1Fip4LrH9NT3+MA/UYCUwxFCvBOa93wmZZXD5eCCbVfN0zhQcsHKii07mjPrpME/f+j7DaMovQD/3yE6opQljE+HROdMHD42T9UFj27pKrBMzqEvgZVVIgKagdWjM1UHyiY3DzXre2EeVCzx0R82KCWC+qh44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721412; c=relaxed/simple;
	bh=PC4x+STpG+FigmJ17CobwvQnk7nqQUBlV/yUkwR4Rcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4IlfX2bkrTgdrOkM150YMXqSQWuv+Q03SJOcA1kvUiYdrtTEncAgvxyj+jIH+4LtKxqG0I3uAtXwPrmFOdmMo535eV+F7ANSN2zH5pX/n6wgehb/5l8HQYSF0PNBqwJ4vLic+LWLsCVyCZuLuxjn8HUX0AEYGaq8vBuKq7cMnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzXpHUCI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9d41baedeso188477f8f.0;
        Wed, 20 Aug 2025 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755721409; x=1756326209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuPMCINMdbRi/5rFniGwyqBe1yF8/C9cfZ1DcZQg/Og=;
        b=jzXpHUCIoRwV7P7hkOmnmYmFFvGNvVCsob0C3yZnw59UAvFF8YCSQtAdyUZTZo+OT+
         BnSmchC/jXcbirYIPF5/x1VTqk4K3lt6ZfsFoXrklWZM6aTA4SiTvHIQlI2mdFjlxUsW
         l/k7EBCMUUw95jfOzzvc2/p4PQGEUkYGG1mvNqN8ITZNUDRwObBkQQEozxaz/9DBjsU/
         mFdyHOgp+mEJ9cqGHcDLmDRL5hs6fSvg7BQEDPT6xKMtldEHosm5lfGMNj2f1iZr0fwh
         h8n5F6yvdUcOGhJdfbq85waaYN76TyseepqSYWjEqvcBiNXeMcFJQ28h8assAyIc4cN7
         V60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755721409; x=1756326209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuPMCINMdbRi/5rFniGwyqBe1yF8/C9cfZ1DcZQg/Og=;
        b=VTthfmWnK4YfrfYLTCAZKP3f+hGjFmhdWeon8eT+qgTt8C/s3Ar0iMm2g1qPDmAayK
         BFjubh1bzp8XpXYLpEgu3YhlgYKxeOVpsI2GLrxjcQzYEDFv95+49c/mrcf4vdAfuHsS
         diJwd1IHMgzro3nRnQad/LoBQdV4QIXNe/vlSwURzB7PU0xUg5V5vBEJmj8eZHkM71Nz
         PjNRsMj1EmWMuXukwTjv+/KCptCpCj96sHUAogeXyZE2sFkx+YWwsGdQdsUzSjcD1Fyb
         6AcMrf0pI7fQHHquBTwP/yqKO1lwyjw9TO3n0JVlIICtv04X5GH83PeCtH1bY6o7sK5N
         XCkw==
X-Forwarded-Encrypted: i=1; AJvYcCURZdFcqry7m+UcPCEqk/DnGdpwDCLeMRovm0/iikQMsrJ2VLtcNobhIs+Z6wvtpjGqMsSrd1PILyvV88aOLA62Sro=@vger.kernel.org, AJvYcCWbkdVeT/k5pmp3LoNloDl5MfRiKAe73PP2G5dE6IT75jETAeEeNye55ZRIifOkz8LirFeXfMzC5QMbbHVk@vger.kernel.org, AJvYcCWr7RjTHsFi7esTaMFhjYII+I8Ygb0472dd0KpENH8/BFYbm32xiwpSWHwVc4nqUgjnT5ViLtQFnwl6@vger.kernel.org
X-Gm-Message-State: AOJu0YxXSSxPn5Zvb8O5iqdl/t0885HZeiMe27wwE8TbJZCCH/AzyQ/O
	2TjXheCuz6F53dUs0kCJqsE9THVzOJS0BAPx3YVvg/V3h1HBdAssRXQx
X-Gm-Gg: ASbGncs77+dDe29jKzHmz/B0oTFHWxHP4jBFK1xLEQnU9TzTLjy5zueG7DJMHJJarQt
	eBPCuoo6ZPsWzMh3G2L1lBChabnSOtlT3IIXMBAc+PR/jLY6rtEotoaaFiYF6OQ3MX73h97ZW39
	FP4JxZGvc6y+Z6IdooAW6L6HmuwbO4+bqKS2uqD5/hMAtgdzsoThwknvfCpmg4/gXRAWE59e4IL
	dhieBSr5yyinKleoR4lKxt8H8IiHpizMJBPztynCKh36X9SQia+qtP7/wXpHPHVy9Y694Pu23Si
	L52XgA6jEncyJkzAChXaJMSMgWoMKOrIMIFrt7jCA6vA2ATE/zow0dhgoEowkNX4C6mIfj5AUC5
	r6XolZBTN2BIWJc5Ia0DO+OiNAtRTKCw0AySdmosoXeZwmx+5SxZxXCaE
X-Google-Smtp-Source: AGHT+IEbxUVRo4T0WBgmP2vZ9//v01l0J9WT/f3JriL/+QgBzLcYUCG/Krqow5P48TvrG8wIAu4f5Q==
X-Received: by 2002:a05:6000:2586:b0:3b8:d902:e200 with SMTP id ffacd0b85a97d-3c49480f2eamr117864f8f.24.1755721408653;
        Wed, 20 Aug 2025 13:23:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0754f3b7esm8471059f8f.30.2025.08.20.13.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:23:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
Subject: [PATCH v4 3/6] watchdog: rzv2h: Make "oscclk" and reset controller optional
Date: Wed, 20 Aug 2025 21:23:19 +0100
Message-ID: <20250820202322.2051969-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the rzv2h_wdt driver to make the "oscclk" clock and reset
controller optional.

Use devm_clk_get_optional_prepared() to obtain the "oscclk" clock,
allowing the driver to work on platforms that do not provide this clock,
such as the RZ/T2H SoC.

Similarly, use devm_reset_control_get_optional_exclusive() to allow the
driver to function on platforms that lack a reset controller.

These changes are preparatory steps for supporting the RZ/T2H SoC, which
does not provide an "oscclk" clock or a reset controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3->v4:
- No changes.

v2->v3:
- Merged with the patch "watchdog: rzv2h_wdt: Make reset controller optional"
- Updated commit message to clarify that both "oscclk" and reset controller
  are made optional.
- Added reviewed-by from Wolfram.

v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 755067800ebb..3c02960b65cf 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -230,11 +230,11 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->pclk))
 		return dev_err_probe(dev, PTR_ERR(priv->pclk), "no pclk");
 
-	priv->oscclk = devm_clk_get_prepared(dev, "oscclk");
+	priv->oscclk = devm_clk_get_optional_prepared(dev, "oscclk");
 	if (IS_ERR(priv->oscclk))
 		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "no oscclk");
 
-	priv->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	priv->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
-- 
2.51.0


