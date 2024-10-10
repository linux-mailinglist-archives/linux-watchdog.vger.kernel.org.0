Return-Path: <linux-watchdog+bounces-2186-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85F9993C3
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 22:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06AC2287D1E
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 20:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2D31E00AC;
	Thu, 10 Oct 2024 20:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DARP2+Nk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC401E1A10
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 20:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728592605; cv=none; b=OjZspEyh6TPoSAhJgkUKTZl0IbUInQF4HtJjS8oIw57mZ8oNw/XVVYosgJbEBWorLWIz5Iu0737nYl01WSAUjWllUqZhRvMTe+5cefyR5CI2dYubT/10s5NrepGzDJHhoW14ubKw2i6IphFtkuRU0ifcDeYeicTUb4U7tXwqdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728592605; c=relaxed/simple;
	bh=Mt1mC1iMLDcmMywAeAbVsK80P2PEI2TKdAabiv0fOX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ooh573GaFHuCHj3ZGjXW5+OL8qkLIv/w+pe+BBBc/kcFbhLshDuGJEmj9LlFxBIcGmMOe2GVQ7BfzL+zheEObcCfUhJKUM8BC49aSObu516OZVSHfQ99thP/lu0S9WDAcx36nSgZurG4yOreVtNRqsMRhrgPTzLaI4MqTKeaWsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DARP2+Nk; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a99650da839so229184766b.2
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 13:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728592600; x=1729197400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C4yu/A7J/MP2dkmeYyh0t+nZcIgchTA/0lLPfzWo8FE=;
        b=DARP2+Nk2mwH7/I2amW9V5NaZgHYhRUuKhqRaCgSrWEbFZEteTNbrcJEKKyn1kaTFV
         QkYmIjM3aEpJ2seFarvctvkaEHglyjbdlyenPsiSdHrPgzbseVmrUaEdn4UW0DWeYyw7
         W0OSIX9WDSA5UGPAPdfpa1sBNr2lne7rzoof35TUgwpmnqop3VslbOW+HCwH278rcC5z
         2KCDfjZEE4c4GmEKUdSl0nf/8AqA4IbHeHfusPnpzFBiuPFPn4UvIcb0TPx2AJwni1GA
         zZsfNcVt6MmFNtIB3apQjDSIkQ5wiFad8W3QxiYTo3xDeFlJ46xP1YxSRGm/zgNndoW4
         Jiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728592600; x=1729197400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4yu/A7J/MP2dkmeYyh0t+nZcIgchTA/0lLPfzWo8FE=;
        b=pqu8ezQFn4YvU58SYgbxQuuKm0PbXOUqfMgxJMaS+/1XTxcRjaqdg0ZkohLpwBz9PB
         dIRlz6BE3N3XlkPkf4YB/oU9BhDot5+6oFBIsuT1J2CtUIadSSKLwYgk+gP6DEWLu81t
         nx6RjExGkRiyLzMUQryDqG2vuZ/P255XwzvExEFcO84BemZrTqm7g5ia++lkO9wBvuMu
         q3T1F2Ry0KnWMwh59GsUd5NAlIP/mJR62+xDKzCZinXw9m5/aco8IvuC2vHjXaDSrvuq
         TVLEv71I8Wc6eKpptto41rIb2Ij5j8maynDqV2KPDKnktkRLvob9vCAjJUj6FcgplR38
         OLnQ==
X-Gm-Message-State: AOJu0YxYVYlAQU4aEBkaNfPLA6U0+SwtIumZ/7pCA8Oak1y0nouUR+Sp
	uLVZpFrdXRL2OPxyMQYR3FfwX1K6YhB+tBwWYGXkTuEUKytAaiXOc6iBrXM72nE=
X-Google-Smtp-Source: AGHT+IGKAL88SwTZ03aM7nb5yqZIyl95gkbwbmYFS8sHFjcTRm2yU7UVsYRldqd5gsayaUZD1ehUdA==
X-Received: by 2002:a17:907:9719:b0:a99:b2c5:86e9 with SMTP id a640c23a62f3a-a99b930236dmr21083266b.11.1728592600115;
        Thu, 10 Oct 2024 13:36:40 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec5697sm134935066b.22.2024.10.10.13.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 13:36:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS)
Subject: [PATCH] watchdog: Switch back to struct platform_driver::remove()
Date: Thu, 10 Oct 2024 22:36:22 +0200
Message-ID: <20241010203622.839625-4-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=17288; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Mt1mC1iMLDcmMywAeAbVsK80P2PEI2TKdAabiv0fOX4=; b=owGbwMvMwMXY3/A7olbonx/jabUkhnQOq+O7ky5vuHqXvSxp8RK9izZiMwVaN0Ymc2XIOZw7O oVVZ8GNTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmMquF/X+GZ3fM63WFQaE2 PZdOWFnsm8Qj4ic5Zb7KqqPvT7fw1m/6/WWCWvb3z6aRooF9VXmqR5fOLRd5vKHs32Ou8uTT/dJ t7vpHSlhkUvY729jY525hKvy0NtM2XIBF/c2Bh1Pj7yk+NlNSa0htv+e6fw77r+CK4Ps2ryJljZ utinZzrq5+tp3/eV0d9yWBMO1EyzhVrnDD+axv64+UBServmWyVkjt/PvirWXl24qWdP5g66xJE 5cdduP+uFplv+zXSSzPeFcqcPr0a0te3l9QzNavX714j1LfruucJ8Rs9e7l3lkfksj5Sr+b50Vw q+zzba+nLLE/y/50W8fESbPumUSVnCv4K7FBiPEoB/tFAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/watchdog/ to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

While touching these files, make indention of the struct initializer
consistent in several files.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on todays's next, feel free to drop changes that result
in a conflict when you come around to apply this. I'll care for the
fallout at a later time then. (Having said that, if you use b4 am -3 and
git am -3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/watchdog/acquirewdt.c       | 2 +-
 drivers/watchdog/advantechwdt.c     | 2 +-
 drivers/watchdog/at91rm9200_wdt.c   | 2 +-
 drivers/watchdog/at91sam9_wdt.c     | 2 +-
 drivers/watchdog/ath79_wdt.c        | 2 +-
 drivers/watchdog/bcm2835_wdt.c      | 2 +-
 drivers/watchdog/bcm_kona_wdt.c     | 2 +-
 drivers/watchdog/cpwd.c             | 2 +-
 drivers/watchdog/dw_wdt.c           | 2 +-
 drivers/watchdog/gef_wdt.c          | 2 +-
 drivers/watchdog/geodewdt.c         | 2 +-
 drivers/watchdog/ib700wdt.c         | 2 +-
 drivers/watchdog/ie6xx_wdt.c        | 2 +-
 drivers/watchdog/lpc18xx_wdt.c      | 2 +-
 drivers/watchdog/mtx-1_wdt.c        | 2 +-
 drivers/watchdog/nic7018_wdt.c      | 2 +-
 drivers/watchdog/nv_tco.c           | 2 +-
 drivers/watchdog/omap_wdt.c         | 2 +-
 drivers/watchdog/orion_wdt.c        | 2 +-
 drivers/watchdog/rc32434_wdt.c      | 2 +-
 drivers/watchdog/rdc321x_wdt.c      | 2 +-
 drivers/watchdog/renesas_wdt.c      | 2 +-
 drivers/watchdog/riowd.c            | 2 +-
 drivers/watchdog/rti_wdt.c          | 2 +-
 drivers/watchdog/sa1100_wdt.c       | 4 ++--
 drivers/watchdog/sch311x_wdt.c      | 2 +-
 drivers/watchdog/shwdt.c            | 2 +-
 drivers/watchdog/st_lpc_wdt.c       | 2 +-
 drivers/watchdog/starfive-wdt.c     | 2 +-
 drivers/watchdog/stmp3xxx_rtc_wdt.c | 2 +-
 drivers/watchdog/txx9wdt.c          | 2 +-
 31 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/watchdog/acquirewdt.c b/drivers/watchdog/acquirewdt.c
index 08ca18e91124..052f65c48a70 100644
--- a/drivers/watchdog/acquirewdt.c
+++ b/drivers/watchdog/acquirewdt.c
@@ -285,7 +285,7 @@ static void acq_shutdown(struct platform_device *dev)
 }
 
 static struct platform_driver acquirewdt_driver = {
-	.remove_new	= acq_remove,
+	.remove		= acq_remove,
 	.shutdown	= acq_shutdown,
 	.driver		= {
 		.name	= DRV_NAME,
diff --git a/drivers/watchdog/advantechwdt.c b/drivers/watchdog/advantechwdt.c
index e41cd3ba4e0e..42d3f3771781 100644
--- a/drivers/watchdog/advantechwdt.c
+++ b/drivers/watchdog/advantechwdt.c
@@ -293,7 +293,7 @@ static void advwdt_shutdown(struct platform_device *dev)
 }
 
 static struct platform_driver advwdt_driver = {
-	.remove_new	= advwdt_remove,
+	.remove		= advwdt_remove,
 	.shutdown	= advwdt_shutdown,
 	.driver		= {
 		.name	= DRV_NAME,
diff --git a/drivers/watchdog/at91rm9200_wdt.c b/drivers/watchdog/at91rm9200_wdt.c
index 17382512a609..1795aaf1ec45 100644
--- a/drivers/watchdog/at91rm9200_wdt.c
+++ b/drivers/watchdog/at91rm9200_wdt.c
@@ -295,7 +295,7 @@ MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
 
 static struct platform_driver at91wdt_driver = {
 	.probe		= at91wdt_probe,
-	.remove_new	= at91wdt_remove,
+	.remove		= at91wdt_remove,
 	.shutdown	= at91wdt_shutdown,
 	.suspend	= pm_ptr(at91wdt_suspend),
 	.resume		= pm_ptr(at91wdt_resume),
diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index 2c6474cb858b..7be70b98d091 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -392,7 +392,7 @@ MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
 
 static struct platform_driver at91wdt_driver = {
 	.probe		= at91wdt_probe,
-	.remove_new	= at91wdt_remove,
+	.remove		= at91wdt_remove,
 	.driver		= {
 		.name	= "at91_wdt",
 		.of_match_table = of_match_ptr(at91_wdt_dt_ids),
diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
index d16b2c583fa4..7df703e9852a 100644
--- a/drivers/watchdog/ath79_wdt.c
+++ b/drivers/watchdog/ath79_wdt.c
@@ -305,7 +305,7 @@ MODULE_DEVICE_TABLE(of, ath79_wdt_match);
 
 static struct platform_driver ath79_wdt_driver = {
 	.probe		= ath79_wdt_probe,
-	.remove_new	= ath79_wdt_remove,
+	.remove		= ath79_wdt_remove,
 	.shutdown	= ath79_wdt_shutdown,
 	.driver		= {
 		.name	= DRIVER_NAME,
diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
index bb001c5d7f17..9fcfee63905b 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -227,7 +227,7 @@ static void bcm2835_wdt_remove(struct platform_device *pdev)
 
 static struct platform_driver bcm2835_wdt_driver = {
 	.probe		= bcm2835_wdt_probe,
-	.remove_new	= bcm2835_wdt_remove,
+	.remove		= bcm2835_wdt_remove,
 	.driver = {
 		.name =		"bcm2835-wdt",
 	},
diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
index 49e12d47b073..66bd0324fd68 100644
--- a/drivers/watchdog/bcm_kona_wdt.c
+++ b/drivers/watchdog/bcm_kona_wdt.c
@@ -328,7 +328,7 @@ static struct platform_driver bcm_kona_wdt_driver = {
 			.of_match_table = bcm_kona_wdt_of_match,
 		  },
 	.probe = bcm_kona_wdt_probe,
-	.remove_new = bcm_kona_wdt_remove,
+	.remove = bcm_kona_wdt_remove,
 };
 
 module_platform_driver(bcm_kona_wdt_driver);
diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 8ee81f018dda..4fb92c9e046a 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -653,7 +653,7 @@ static struct platform_driver cpwd_driver = {
 		.of_match_table = cpwd_match,
 	},
 	.probe		= cpwd_probe,
-	.remove_new	= cpwd_remove,
+	.remove		= cpwd_remove,
 };
 
 module_platform_driver(cpwd_driver);
diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 84dca3695f86..26efca9ae0e7 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -684,7 +684,7 @@ MODULE_DEVICE_TABLE(of, dw_wdt_of_match);
 
 static struct platform_driver dw_wdt_driver = {
 	.probe		= dw_wdt_drv_probe,
-	.remove_new	= dw_wdt_drv_remove,
+	.remove		= dw_wdt_drv_remove,
 	.driver		= {
 		.name	= "dw_wdt",
 		.of_match_table = of_match_ptr(dw_wdt_of_match),
diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
index d854fcfbfa5b..bf6f733dfb5f 100644
--- a/drivers/watchdog/gef_wdt.c
+++ b/drivers/watchdog/gef_wdt.c
@@ -305,7 +305,7 @@ static struct platform_driver gef_wdt_driver = {
 		.of_match_table = gef_wdt_ids,
 	},
 	.probe		= gef_wdt_probe,
-	.remove_new	= gef_wdt_remove,
+	.remove		= gef_wdt_remove,
 };
 
 static int __init gef_wdt_init(void)
diff --git a/drivers/watchdog/geodewdt.c b/drivers/watchdog/geodewdt.c
index 4ed6d139320b..5b80ade1c681 100644
--- a/drivers/watchdog/geodewdt.c
+++ b/drivers/watchdog/geodewdt.c
@@ -248,7 +248,7 @@ static void geodewdt_shutdown(struct platform_device *dev)
 }
 
 static struct platform_driver geodewdt_driver = {
-	.remove_new	= geodewdt_remove,
+	.remove		= geodewdt_remove,
 	.shutdown	= geodewdt_shutdown,
 	.driver		= {
 		.name	= DRV_NAME,
diff --git a/drivers/watchdog/ib700wdt.c b/drivers/watchdog/ib700wdt.c
index b041ad90a62c..5ce6101d236d 100644
--- a/drivers/watchdog/ib700wdt.c
+++ b/drivers/watchdog/ib700wdt.c
@@ -331,7 +331,7 @@ static void ibwdt_shutdown(struct platform_device *dev)
 }
 
 static struct platform_driver ibwdt_driver = {
-	.remove_new	= ibwdt_remove,
+	.remove		= ibwdt_remove,
 	.shutdown	= ibwdt_shutdown,
 	.driver		= {
 		.name	= DRV_NAME,
diff --git a/drivers/watchdog/ie6xx_wdt.c b/drivers/watchdog/ie6xx_wdt.c
index e5cbb409df25..5a7bb7e84653 100644
--- a/drivers/watchdog/ie6xx_wdt.c
+++ b/drivers/watchdog/ie6xx_wdt.c
@@ -280,7 +280,7 @@ static void ie6xx_wdt_remove(struct platform_device *pdev)
 
 static struct platform_driver ie6xx_wdt_driver = {
 	.probe		= ie6xx_wdt_probe,
-	.remove_new	= ie6xx_wdt_remove,
+	.remove		= ie6xx_wdt_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 	},
diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
index 19535f4a2fd2..f19580e1b318 100644
--- a/drivers/watchdog/lpc18xx_wdt.c
+++ b/drivers/watchdog/lpc18xx_wdt.c
@@ -281,7 +281,7 @@ static struct platform_driver lpc18xx_wdt_driver = {
 		.of_match_table	= lpc18xx_wdt_match,
 	},
 	.probe = lpc18xx_wdt_probe,
-	.remove_new = lpc18xx_wdt_remove,
+	.remove = lpc18xx_wdt_remove,
 };
 module_platform_driver(lpc18xx_wdt_driver);
 
diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
index 11f05024a181..f75426cfa425 100644
--- a/drivers/watchdog/mtx-1_wdt.c
+++ b/drivers/watchdog/mtx-1_wdt.c
@@ -233,7 +233,7 @@ static void mtx1_wdt_remove(struct platform_device *pdev)
 
 static struct platform_driver mtx1_wdt_driver = {
 	.probe = mtx1_wdt_probe,
-	.remove_new = mtx1_wdt_remove,
+	.remove = mtx1_wdt_remove,
 	.driver.name = "mtx1-wdt",
 };
 
diff --git a/drivers/watchdog/nic7018_wdt.c b/drivers/watchdog/nic7018_wdt.c
index c3f0a4926667..44982b37ba6f 100644
--- a/drivers/watchdog/nic7018_wdt.c
+++ b/drivers/watchdog/nic7018_wdt.c
@@ -236,7 +236,7 @@ MODULE_DEVICE_TABLE(acpi, nic7018_device_ids);
 
 static struct platform_driver watchdog_driver = {
 	.probe = nic7018_probe,
-	.remove_new = nic7018_remove,
+	.remove = nic7018_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.acpi_match_table = ACPI_PTR(nic7018_device_ids),
diff --git a/drivers/watchdog/nv_tco.c b/drivers/watchdog/nv_tco.c
index f8eb1f65a59e..f16cee5173d5 100644
--- a/drivers/watchdog/nv_tco.c
+++ b/drivers/watchdog/nv_tco.c
@@ -466,7 +466,7 @@ static void nv_tco_shutdown(struct platform_device *dev)
 
 static struct platform_driver nv_tco_driver = {
 	.probe		= nv_tco_init,
-	.remove_new	= nv_tco_remove,
+	.remove		= nv_tco_remove,
 	.shutdown	= nv_tco_shutdown,
 	.driver		= {
 		.name	= TCO_MODULE_NAME,
diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index b6e0236509bb..d523428a8d22 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -357,7 +357,7 @@ MODULE_DEVICE_TABLE(of, omap_wdt_of_match);
 
 static struct platform_driver omap_wdt_driver = {
 	.probe		= omap_wdt_probe,
-	.remove_new	= omap_wdt_remove,
+	.remove		= omap_wdt_remove,
 	.shutdown	= omap_wdt_shutdown,
 	.suspend	= pm_ptr(omap_wdt_suspend),
 	.resume		= pm_ptr(omap_wdt_resume),
diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 1fe583e8a95b..0e145f762f6f 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -665,7 +665,7 @@ static void orion_wdt_shutdown(struct platform_device *pdev)
 
 static struct platform_driver orion_wdt_driver = {
 	.probe		= orion_wdt_probe,
-	.remove_new	= orion_wdt_remove,
+	.remove		= orion_wdt_remove,
 	.shutdown	= orion_wdt_shutdown,
 	.driver		= {
 		.name	= "orion_wdt",
diff --git a/drivers/watchdog/rc32434_wdt.c b/drivers/watchdog/rc32434_wdt.c
index efadbb9d7ce7..0e5c5c96af58 100644
--- a/drivers/watchdog/rc32434_wdt.c
+++ b/drivers/watchdog/rc32434_wdt.c
@@ -309,7 +309,7 @@ static void rc32434_wdt_shutdown(struct platform_device *pdev)
 
 static struct platform_driver rc32434_wdt_driver = {
 	.probe		= rc32434_wdt_probe,
-	.remove_new	= rc32434_wdt_remove,
+	.remove		= rc32434_wdt_remove,
 	.shutdown	= rc32434_wdt_shutdown,
 	.driver		= {
 			.name = "rc32434_wdt",
diff --git a/drivers/watchdog/rdc321x_wdt.c b/drivers/watchdog/rdc321x_wdt.c
index 80490316a27f..8955177072fa 100644
--- a/drivers/watchdog/rdc321x_wdt.c
+++ b/drivers/watchdog/rdc321x_wdt.c
@@ -268,7 +268,7 @@ static void rdc321x_wdt_remove(struct platform_device *pdev)
 
 static struct platform_driver rdc321x_wdt_driver = {
 	.probe = rdc321x_wdt_probe,
-	.remove_new = rdc321x_wdt_remove,
+	.remove = rdc321x_wdt_remove,
 	.driver = {
 		.name = "rdc321x-wdt",
 	},
diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 12c41d6e5cd6..c0b2a9c5250d 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -337,7 +337,7 @@ static struct platform_driver rwdt_driver = {
 		.pm = &rwdt_pm_ops,
 	},
 	.probe = rwdt_probe,
-	.remove_new = rwdt_remove,
+	.remove = rwdt_remove,
 };
 module_platform_driver(rwdt_driver);
 
diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
index f47d90d01c19..83806ccf06d1 100644
--- a/drivers/watchdog/riowd.c
+++ b/drivers/watchdog/riowd.c
@@ -238,7 +238,7 @@ static struct platform_driver riowd_driver = {
 		.of_match_table = riowd_match,
 	},
 	.probe		= riowd_probe,
-	.remove_new	= riowd_remove,
+	.remove		= riowd_remove,
 };
 
 module_platform_driver(riowd_driver);
diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 4895a69015a8..bfad78eb94a3 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -380,7 +380,7 @@ static struct platform_driver rti_wdt_driver = {
 		.of_match_table = rti_wdt_of_match,
 	},
 	.probe = rti_wdt_probe,
-	.remove_new = rti_wdt_remove,
+	.remove = rti_wdt_remove,
 };
 
 module_platform_driver(rti_wdt_driver);
diff --git a/drivers/watchdog/sa1100_wdt.c b/drivers/watchdog/sa1100_wdt.c
index 6e91ee3fbfb5..729a8508b31d 100644
--- a/drivers/watchdog/sa1100_wdt.c
+++ b/drivers/watchdog/sa1100_wdt.c
@@ -236,8 +236,8 @@ static void sa1100dog_remove(struct platform_device *pdev)
 
 static struct platform_driver sa1100dog_driver = {
 	.driver.name = "sa1100_wdt",
-	.probe	  = sa1100dog_probe,
-	.remove_new	  = sa1100dog_remove,
+	.probe = sa1100dog_probe,
+	.remove = sa1100dog_remove,
 };
 module_platform_driver(sa1100dog_driver);
 
diff --git a/drivers/watchdog/sch311x_wdt.c b/drivers/watchdog/sch311x_wdt.c
index 76053158d259..9670a1ea57cb 100644
--- a/drivers/watchdog/sch311x_wdt.c
+++ b/drivers/watchdog/sch311x_wdt.c
@@ -445,7 +445,7 @@ static void sch311x_wdt_shutdown(struct platform_device *dev)
 
 static struct platform_driver sch311x_wdt_driver = {
 	.probe		= sch311x_wdt_probe,
-	.remove_new	= sch311x_wdt_remove,
+	.remove		= sch311x_wdt_remove,
 	.shutdown	= sch311x_wdt_shutdown,
 	.driver		= {
 		.name = DRV_NAME,
diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
index 10f1fba78ec2..7f0150c39421 100644
--- a/drivers/watchdog/shwdt.c
+++ b/drivers/watchdog/shwdt.c
@@ -297,7 +297,7 @@ static struct platform_driver sh_wdt_driver = {
 	},
 
 	.probe		= sh_wdt_probe,
-	.remove_new	= sh_wdt_remove,
+	.remove		= sh_wdt_remove,
 	.shutdown	= sh_wdt_shutdown,
 };
 
diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
index 4c5b8d98a4f3..d206452072ae 100644
--- a/drivers/watchdog/st_lpc_wdt.c
+++ b/drivers/watchdog/st_lpc_wdt.c
@@ -286,7 +286,7 @@ static struct platform_driver st_wdog_driver = {
 		.of_match_table = st_wdog_match,
 	},
 	.probe = st_wdog_probe,
-	.remove_new = st_wdog_remove,
+	.remove = st_wdog_remove,
 };
 module_platform_driver(st_wdog_driver);
 
diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index 19a2620d3d38..5e8ad576073d 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -597,7 +597,7 @@ MODULE_DEVICE_TABLE(of, starfive_wdt_match);
 
 static struct platform_driver starfive_wdt_driver = {
 	.probe = starfive_wdt_probe,
-	.remove_new = starfive_wdt_remove,
+	.remove = starfive_wdt_remove,
 	.shutdown = starfive_wdt_shutdown,
 	.driver = {
 		.name = "starfive-wdt",
diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3xxx_rtc_wdt.c
index 4b2caa9807ac..060447101f48 100644
--- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
+++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
@@ -143,7 +143,7 @@ static struct platform_driver stmp3xxx_wdt_driver = {
 		.pm = &stmp3xxx_wdt_pm_ops,
 	},
 	.probe = stmp3xxx_wdt_probe,
-	.remove_new = stmp3xxx_wdt_remove,
+	.remove = stmp3xxx_wdt_remove,
 };
 module_platform_driver(stmp3xxx_wdt_driver);
 
diff --git a/drivers/watchdog/txx9wdt.c b/drivers/watchdog/txx9wdt.c
index 8d5f67acbff2..305349844b4f 100644
--- a/drivers/watchdog/txx9wdt.c
+++ b/drivers/watchdog/txx9wdt.c
@@ -159,7 +159,7 @@ static void txx9wdt_shutdown(struct platform_device *dev)
 
 static struct platform_driver txx9wdt_driver = {
 	.probe = txx9wdt_probe,
-	.remove_new = txx9wdt_remove,
+	.remove = txx9wdt_remove,
 	.shutdown = txx9wdt_shutdown,
 	.driver = {
 		.name = "txx9wdt",

base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
-- 
2.45.2


