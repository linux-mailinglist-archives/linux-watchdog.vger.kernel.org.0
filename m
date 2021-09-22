Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B014153C3
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Sep 2021 01:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238404AbhIVXNW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 22 Sep 2021 19:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238389AbhIVXNW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 22 Sep 2021 19:13:22 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCABC061574
        for <linux-watchdog@vger.kernel.org>; Wed, 22 Sep 2021 16:11:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u18so17937707lfd.12
        for <linux-watchdog@vger.kernel.org>; Wed, 22 Sep 2021 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LXrbDHPFbLNfw7aqFMhZysQCuGl8i7wEipi1H6MoIeg=;
        b=e2ZGk9t3fIF55m6TCjuRyJ+kVyKL8xNgPSZuLe6emtzWGgIO3a4f4ZpxbwGdeAEyZ8
         LAaH1F/jv5NQ8t7/7W8kwuce19EJ9s0fTYyIr55k4Otiqo1r7h0q76AcYF8MpLc5NrTE
         BmWmZp864JT1CZ5ss+76qxHD0gupUE/rDprQiNBzSrtofDsgZYquWM6aX//ZGKglptt6
         I8LBF5l9+nVvbKz2duAtsPBJSo/dtDF227DgFhNo+beA4PKBPmcbHDz3A57N3TlJZneJ
         gR0jBIYZb62gbvHme/VzCDnaoJICpSBLwJAG1hHwdk2Y5iZgCLB4iPA7iYrUJQhCceDb
         sfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LXrbDHPFbLNfw7aqFMhZysQCuGl8i7wEipi1H6MoIeg=;
        b=Y+/pzVrgeaHscTvGK+jNfPOR7CDRjxsrxX3En5KcWb28F3P+xXqVfHtmqAo4jD/QDG
         970CGfZ3XoHKsFO2xc++wpLd/QzCyt3eazokUlGRz7OHgYVB+4JlAvXCdXns2hfwgY2L
         mbCGMh4geiasWhCZtXfDI0vX0brA9OBTqG/pxstOOPLmUZZQmB7JbxJJY9VyJmVExpML
         sXJs7M+xrUqj9DgMOQr5gLi4eanrq3UVgQxjMKVYaZECm6i2tnGp7oTRh1jSXfrmLKVF
         s6Kl6kQ67NaC/WHvBBT3xT78r3vvkkh8klYEAUiRf/WTJ+fqQwloZDjAYy+kUGatYUq7
         SNsg==
X-Gm-Message-State: AOAM530OfptfzZeP/HXBFUXmjcX7YW1G1aRk4x68jg2LZUDewwtGiG+v
        iDoNclVCDRzsiM+WlnEjbf95Kg==
X-Google-Smtp-Source: ABdhPJyFLweLwcrt1j+irutQlYb59s4/pZEbUO3rBNteQNknTIa5/erb34P0hINyJGKqheuwwIHDsg==
X-Received: by 2002:a2e:58c:: with SMTP id 134mr1909870ljf.269.1632352309508;
        Wed, 22 Sep 2021 16:11:49 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id u28sm288044lfo.47.2021.09.22.16.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 16:11:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/3] watchdog: ux500_wdt: Drop platform data
Date:   Thu, 23 Sep 2021 01:09:45 +0200
Message-Id: <20210922230947.1864357-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Drop the platform data passing from the PRCMU driver. This platform
data was part of the ambition to support more SoCs, which in turn
were never mass produced.

Only a name remains of the MFD cell so switch to MFD_CELL_NAME().

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee: it'd be prefect if you could ACK this so the watchdog people
can merge it, it shouldn't collide with any other changes to
the PRCMU driver.
---
 drivers/mfd/db8500-prcmu.c              | 13 +------------
 drivers/watchdog/ux500_wdt.c            | 13 ++-----------
 include/linux/platform_data/ux500_wdt.h | 18 ------------------
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 include/linux/platform_data/ux500_wdt.h

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index c1d3e7c116cf..ccf6be922b39 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -36,7 +36,6 @@
 #include <linux/mfd/abx500/ab8500.h>
 #include <linux/regulator/db8500-prcmu.h>
 #include <linux/regulator/machine.h>
-#include <linux/platform_data/ux500_wdt.h>
 #include "db8500-prcmu-regs.h"
 
 /* Index of different voltages to be used when accessing AVSData */
@@ -2939,18 +2938,8 @@ static struct regulator_init_data db8500_regulators[DB8500_NUM_REGULATORS] = {
 	},
 };
 
-static struct ux500_wdt_data db8500_wdt_pdata = {
-	.timeout = 600, /* 10 minutes */
-	.has_28_bits_resolution = true,
-};
-
 static const struct mfd_cell common_prcmu_devs[] = {
-	{
-		.name = "ux500_wdt",
-		.platform_data = &db8500_wdt_pdata,
-		.pdata_size = sizeof(db8500_wdt_pdata),
-		.id = -1,
-	},
+	MFD_CELL_NAME("ux500_wdt"),
 	MFD_CELL_NAME("db8500-cpuidle"),
 };
 
diff --git a/drivers/watchdog/ux500_wdt.c b/drivers/watchdog/ux500_wdt.c
index 072758106865..40f8cf1cb234 100644
--- a/drivers/watchdog/ux500_wdt.c
+++ b/drivers/watchdog/ux500_wdt.c
@@ -15,7 +15,6 @@
 #include <linux/uaccess.h>
 #include <linux/watchdog.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/ux500_wdt.h>
 
 #include <linux/mfd/dbx500-prcmu.h>
 
@@ -23,7 +22,6 @@
 
 #define WATCHDOG_MIN	0
 #define WATCHDOG_MAX28	268435  /* 28 bit resolution in ms == 268435.455 s */
-#define WATCHDOG_MAX32	4294967 /* 32 bit resolution in ms == 4294967.295 s */
 
 static unsigned int timeout = WATCHDOG_TIMEOUT;
 module_param(timeout, uint, 0);
@@ -80,22 +78,15 @@ static struct watchdog_device ux500_wdt = {
 	.info = &ux500_wdt_info,
 	.ops = &ux500_wdt_ops,
 	.min_timeout = WATCHDOG_MIN,
-	.max_timeout = WATCHDOG_MAX32,
+	.max_timeout = WATCHDOG_MAX28,
 };
 
 static int ux500_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int ret;
-	struct ux500_wdt_data *pdata = dev_get_platdata(dev);
-
-	if (pdata) {
-		if (pdata->timeout > 0)
-			timeout = pdata->timeout;
-		if (pdata->has_28_bits_resolution)
-			ux500_wdt.max_timeout = WATCHDOG_MAX28;
-	}
 
+	timeout = 600; /* Default to 10 minutes */
 	ux500_wdt.parent = dev;
 	watchdog_set_nowayout(&ux500_wdt, nowayout);
 
diff --git a/include/linux/platform_data/ux500_wdt.h b/include/linux/platform_data/ux500_wdt.h
deleted file mode 100644
index de6a4ad41e76..000000000000
--- a/include/linux/platform_data/ux500_wdt.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) ST Ericsson SA 2011
- *
- * STE Ux500 Watchdog platform data
- */
-#ifndef __UX500_WDT_H
-#define __UX500_WDT_H
-
-/**
- * struct ux500_wdt_data
- */
-struct ux500_wdt_data {
-	unsigned int timeout;
-	bool has_28_bits_resolution;
-};
-
-#endif /* __UX500_WDT_H */
-- 
2.31.1

