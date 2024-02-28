Return-Path: <linux-watchdog+bounces-735-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCA686A9FC
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 09:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D88A1C21378
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 08:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9944E2D04F;
	Wed, 28 Feb 2024 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="J16Q8i0x"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59C82C85D
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109199; cv=none; b=iXlBQp1xMvP5rgXZ4DaOSwezTgtwrIev8nEU/R2KoIwyjWQEN9RgIT0ivzBVtHREobDjIsG+JFm6BiyLetoaSoLgF3QyKyS8uLDaJkqTFClKCKtYWin1VMMaZKH5gPpEW+WIhrMpgcMhfjBd+iCMlin5awn8ErxvXo3YrY5+uzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109199; c=relaxed/simple;
	bh=qRdpfk5Ha5yzYO5Ffb0oUgH+XsXzgPdGsR48Popkr3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pIiC9pedcn/TniKnN9AsOPSkq6e92p5fgkueGCK+g3Zb4ox8XUvMv8s2TeSljtrdt9IRK66ue4Xe4ghL0GXvskd/FgZ3w20RtJgzDvPtFB2w5cIS+DPRfA7NhKFcWhU1FPstRUulp83ffywMnuYm/HY4oUz9YD7ieLwT28tduZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=J16Q8i0x; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso641460066b.2
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 00:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709109196; x=1709713996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hw7ydcgUBd5LwNKiG4K3Ih2x5T3tP6tTtIvBkv4Whkc=;
        b=J16Q8i0xRh+SbKIA6IMiSbakLuI2eeHZ26s/Ieubf31IyWZVzGcScgk5ORv4qBJiW4
         KhGG3yOqkUAaj9CrHmr3jfhzbhF/9GH7Oun11e5rKQ6dDZ+1mn/0ngc5LH6AjYu5bXlc
         brhw6fMYvzwV/19mNe9kiokvDi9HcP5iER+Wvqv39T2SyDmQdxaCA0L9Ib2arsO0gP7u
         im3R7bOkDER8JcN6bHAKPCfOONTkGWKXlx0B2Zq4Jc+HOt8Y9kKT2lRxnb1YWgrexiUe
         XrOHClUT8KOUFyo9SzrwmBHGReHw9izYdPUMx+vGigxkBp5wrkLLC50nPrK3TSOLzgug
         wIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109196; x=1709713996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw7ydcgUBd5LwNKiG4K3Ih2x5T3tP6tTtIvBkv4Whkc=;
        b=fhd6iW+G0zKJYuY6KCXsEAMFhh+buVc+gN0ScXF47x4OHLlbTG43RZkX4YLsQskaeM
         I8eyxL9+aUERXlWwBwSP2MdnC0HvPbAA/MEjyniKWnH1vJwjMSRHnprQUFiL+wgbPvaO
         Kbxs4nJdZGTuTkI+v0l7YrIJ/X/qMd5ks53SfND8Idd9PW8SafmHzOCZkb8/nOt3VGU/
         hm1wgpK72ewTM2FUJRIXaZSk//B6hjk9betjfMYs2tA7fPvAUsROBwfYKvH7wMoIStYN
         ceRO2segikQ+1jhtj639mV3wwTExviJB+OpdLdoU6N5w4XCnK7g4loOPTEagqqs4AV/4
         4nKw==
X-Gm-Message-State: AOJu0YzouYxBuREnjQEwra0jQR26IYTKXMtDEsPtl868kto09NAOSXTI
	Z2/j3XNZylmnHmdt37dVcdWK2LuGLD9vt2luYhiNO+K3dBE8doVKP9REUvKt8yA=
X-Google-Smtp-Source: AGHT+IE+ZYBJO+nUTkCUCO4+ZaoHAnC9PBSZbLSNIC0v1Cs+hzgFP8HkmnpuxHUiwTIjMvbrhWKHRw==
X-Received: by 2002:a17:906:64b:b0:a3f:bcff:18b8 with SMTP id t11-20020a170906064b00b00a3fbcff18b8mr8577267ejb.27.1709109195897;
        Wed, 28 Feb 2024 00:33:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id qh16-20020a170906ecb000b00a432777eb77sm1593987ejb.60.2024.02.28.00.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:33:15 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v8 01/10] watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and ARCH_R9A09G011
Date: Wed, 28 Feb 2024 10:32:44 +0200
Message-Id: <20240228083253.2640997-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt driver is used only by ARCH_RZG2L and ARCH_R9A09G011
micro-architectures of Renesas. Thus, limit it's usage only to these.

Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none; this patch is introduced in v4

 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 4700b218340f..bdd1527bb916 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -921,7 +921,7 @@ config RENESAS_RZN1WDT
 
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


