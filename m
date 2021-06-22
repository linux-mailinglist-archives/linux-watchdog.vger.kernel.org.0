Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B9A3B00D2
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jun 2021 11:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhFVJ7Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 05:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhFVJ7W (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 05:59:22 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA77C061574;
        Tue, 22 Jun 2021 02:57:05 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so1398378pjb.5;
        Tue, 22 Jun 2021 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3QVfQrgRh33gEx5r7I5h3yOocpWLrCLFyDdaL4+1GCE=;
        b=VM5YgDYUgK3990wD5dI7ibB5zuh39GX3+g/li/Q5+fME3BpI1T80vL8QGyh2JQjfY3
         5gyOoe7EVHQ1zRMPbkmJ3oIz5k/9iIjofxixyxaymFazHI4DGflvNfJS5MGjMHNawCCa
         L55G7UVT9rGDrnWqwIP9hiCO3LGtul9yb/d9aaSeq+/LZ15yODiArs/vx0w9MdMt4WU2
         IKbcVV/kCHuWoNXrt1127yfA8w5IkD7PQQmNyATk5iqt27+lkyOenL7hRuZbkmqGkWOG
         WJqqyAnEEuWm5w2u2UDMCg/xso3r/+TaxwL9ir4I9NUkngbcH/WqgPjytQUrRO2GYFoM
         Nnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3QVfQrgRh33gEx5r7I5h3yOocpWLrCLFyDdaL4+1GCE=;
        b=lF8yTxcsIgUeE45lg15CcfyH8DfQZjH+1gL4F0Swf2C9/+rGKDAThNe7iMgi90WD7A
         OkNzXUaf71U53NgnQ9nCUXrgGcWHPu1u8Uztb1CDjbJbbjvTeHOqgkaZ+xJNmVPJdZL/
         Dr2mO7ilKTb2fOvcHsgS1OYdpbXIm69a6KtvnecrdfV5rxdTH5Awan4PIfiEDoGg1BH4
         KjFLPt9SmvsZy22JSxzFTD8CmLUwOqTl7oqHwiG+TzDzZrB8rfPMq5B9vD1zZsTPmJ7C
         wgHyP74iwlcNWq8SuoO7BfsnTJwVjTzI2WigGCavIEB3IhFeTZT6FvMBS1ZJFPU3d2cu
         uMVA==
X-Gm-Message-State: AOAM530cb44+GgGJVxn283ocC3Jh8wzvEpD9gn2MEyOrPihgHoJC17nq
        MHXq6TDXzt9TQLjhsdHZ5Ow=
X-Google-Smtp-Source: ABdhPJxk9rOdpE4HgxiGJpCpV8qAxuDvUDSE2k3P0fdjGxEoRibRvR2T6Nm3YJkS2IVAmQ2EkTF6xA==
X-Received: by 2002:a17:90a:708a:: with SMTP id g10mr3211941pjk.108.1624355824979;
        Tue, 22 Jun 2021 02:57:04 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id c18sm4742498pfo.143.2021.06.22.02.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 02:57:04 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH] watchdog: meson_gxbb_wdt: improve
Date:   Tue, 22 Jun 2021 17:56:39 +0800
Message-Id: <20210622095639.1280774-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Improve meson_gxbb_wdt watchdog driver
1) added module param timeout and nowayout same as other modules
2) print watchdog driver start status
3) add watchdog_stop_on_unregister
4) remove watchdog_stop_on_reboot ( still can be activated by
watchdog.stop_on_reboot=1 ) i think this driver configuration more useful
becouse we can get reboot waranty for abnormal situations on shutdown stage

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fbcfa..15c889932c13 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -35,6 +35,17 @@ struct meson_gxbb_wdt {
 	struct clk *clk;
 };
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+static unsigned int timeout = DEFAULT_TIMEOUT;
+
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
+			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
+			__MODULE_STRING(DEFAULT_TIMEOUT) ")");
+
 static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
 {
 	struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
@@ -174,7 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.ops = &meson_gxbb_wdt_ops;
 	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
 	data->wdt_dev.min_timeout = 1;
-	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
+	data->wdt_dev.timeout = timeout;
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
 	/* Setup with 1ms timebase */
@@ -186,7 +197,12 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 
-	watchdog_stop_on_reboot(&data->wdt_dev);
+	watchdog_set_nowayout(&data->wdt_dev, nowayout);
+	watchdog_stop_on_unregister(&data->wdt_dev);
+
+	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
+		data->wdt_dev.timeout, nowayout);
+
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
 
-- 
2.25.1

