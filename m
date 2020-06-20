Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C9C2025A6
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgFTRfH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:35:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42102 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgFTRfG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:35:06 -0400
Received: by mail-ot1-f67.google.com with SMTP id t6so9786207otk.9
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=arubcjeP8P4OgD7PRFxwikiodHgcbTBKqjnhEpFN4qo=;
        b=qrrpgqW/xxBWrqSLhU+1IzRXmQxtfRzCZOQZuppzZdRhJgDIlK7eTJafH90SBDQU6X
         Lay4LjBZpKRCzaV/klH/kmIRIOEQRMUMQNUAmdOn6Qg0cEApgsR7xZ3Xamln0QDEKNAd
         +hCMiOtDX+pURKs1WV2V87zhjuokOUq3vBPyt9g7qAmsKwl90Rl7+E0mQ5G3eIswQ6l5
         ZN8oV4WT1QDcWA5/rWhJ8jutTa/tfJhbQKRxq4g1E/N4wAtmPMf06zilJc/ee+2MbZN2
         ze8Dm6sTh4bxwRdveeHHWmLBuFlSiUB4mRybGGIZoSpbVL16Woc6yjYQnZRXAr9TLVgG
         hUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=arubcjeP8P4OgD7PRFxwikiodHgcbTBKqjnhEpFN4qo=;
        b=PW6SRMe7TRHAvGRYi9eJesUAlV0sLQpRoISsdsUyCBmmTTrRu1VPb+rAgdAFOPiLgs
         Kgc9aLtfAF6WPJfDR8rKJjfqqJAltHLzq208cbOEzfAgSJ+U/VUfNyMcJgmfLUYyp0u5
         rgIJbn5BPhV9yDqPlRODwVMvW5NsAUGzgKSanPuIJt4sO+jGDK913dXYfeC6CJNl3+0H
         Z43+3M1p+5iB2RG/REJdpCGZm4y3LzWuoXkkUTQiwp+yuq3bgIrvn64OhA9kE5OkqyJN
         YVi2xJ1MBVGxS+IzSoCSoWQryOvcNwVSVHzn10BRBDbpHUU564wUMg39AT7j1qavrOpk
         qKXg==
X-Gm-Message-State: AOAM533ds9rUA8JqTumjNn3BbQ4V/GUo4YtY2g0zJD4J32sM4EnTkOBj
        tgksYO2cIO8YEqhKqGsi8s4ZO+Q=
X-Google-Smtp-Source: ABdhPJw5fsQ3RoCFa1nP/f8vQ2H/0kq6g1FRncqSilrT2QE6GxXwvg6EF2sSsuQKCxdSxG8sTnYy+A==
X-Received: by 2002:a05:6830:1aed:: with SMTP id c13mr8244307otd.78.1592674444846;
        Sat, 20 Jun 2020 10:34:04 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id p9sm2069158ota.24.2020.06.20.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:34:03 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:f17b:b355:b0a4:2592])
        by serve.minyard.net (Postfix) with ESMTPA id E13F0180561;
        Sat, 20 Jun 2020 17:34:00 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 6/6] watchdog:softdog: Convert to a millisecond watchdog
Date:   Sat, 20 Jun 2020 12:33:51 -0500
Message-Id: <20200620173351.18752-7-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620173351.18752-1-minyard@acm.org>
References: <20200620173351.18752-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Use milliseconds for the softdog timer to support a higher resolution
timeout.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/softdog.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 3e4885c1545e..794f552db53b 100644
--- a/drivers/watchdog/softdog.c
+++ b/drivers/watchdog/softdog.c
@@ -82,13 +82,13 @@ static int softdog_ping(struct watchdog_device *w)
 {
 	if (!hrtimer_active(&softdog_ticktock))
 		__module_get(THIS_MODULE);
-	hrtimer_start(&softdog_ticktock, ktime_set(w->timeout, 0),
+	hrtimer_start(&softdog_ticktock, ms_to_ktime(w->timeout),
 		      HRTIMER_MODE_REL);
 
 	if (IS_ENABLED(CONFIG_SOFT_WATCHDOG_PRETIMEOUT)) {
 		if (w->pretimeout)
 			hrtimer_start(&softdog_preticktock,
-				      ktime_set(w->timeout - w->pretimeout, 0),
+				      ms_to_ktime(w->timeout - w->pretimeout),
 				      HRTIMER_MODE_REL);
 		else
 			hrtimer_cancel(&softdog_preticktock);
@@ -110,7 +110,8 @@ static int softdog_stop(struct watchdog_device *w)
 
 static struct watchdog_info softdog_info = {
 	.identity = "Software Watchdog",
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = (WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
+		    WDIOF_MSECTIMER),
 };
 
 static const struct watchdog_ops softdog_ops = {
@@ -123,15 +124,15 @@ static struct watchdog_device softdog_dev = {
 	.info = &softdog_info,
 	.ops = &softdog_ops,
 	.min_timeout = 1,
-	.max_timeout = 65535,
-	.timeout = TIMER_MARGIN,
+	.max_timeout = 65535000,
+	.timeout = TIMER_MARGIN * 1000,
 };
 
 static int __init softdog_init(void)
 {
 	int ret;
 
-	watchdog_init_timeout(&softdog_dev, soft_margin, NULL);
+	watchdog_init_timeout(&softdog_dev, soft_margin * 1000, NULL);
 	watchdog_set_nowayout(&softdog_dev, nowayout);
 	watchdog_stop_on_reboot(&softdog_dev);
 
-- 
2.17.1

