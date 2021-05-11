Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3AD379F9F
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 08:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhEKGT3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 02:19:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41660 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbhEKGT3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 02:19:29 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <juerg.haefliger@canonical.com>)
        id 1lgLio-0001yJ-6c
        for linux-watchdog@vger.kernel.org; Tue, 11 May 2021 06:18:22 +0000
Received: by mail-ej1-f69.google.com with SMTP id gy20-20020a170906f254b02903cc7a4500bfso333754ejb.4
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 23:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bbXPgmZrL4Pxh0/t8XE8baUOCONdkg5IyBFSdmqHWjM=;
        b=eKGEs763ycFEeuyYlUgMlMUzIv3484YU0qZD4P2AR/0ywpXrhif4hiFhqbnhxfaCsG
         khwRteOHichRPGJY4MYgIcN7xNrD6CZ3s6viYM6lsQHisD6tjP+va0q5sqkxeCSfNBEE
         r7IKpZn/yoFoV0+m5pe6gDiv/eemTd4aUq4/mZpB2uLe9UefR3BFuJz6ePJIEXVBoBcL
         p0MVgN9PEqptbLJMq01Nc48xnJx9zm79FSaUlW4nzGW2KuNPLHNBDSViFoKZ8LVqgFN6
         exuUZB9cd0D6hdJoC6lljT8Ldq0dK/ZcARy2SIaltDhCQl0rrE/H4LwPGg1dKCqshNBl
         WN5w==
X-Gm-Message-State: AOAM530iVj3bV1whW1F6cFNtnQ8lZ0IrfABmrnknONi1YEwsV3FltudK
        vWFp2LlG/rqtkoHOO1BLj0zyqBB7N8OnOoAFiS7LN2hPgwvexjLhwxSgq3SL+KnRLpgzRuu0JQk
        RWhoBl3tmc8Ux+fD5gOdkzqfg43VuRPC1vFwnwMN5meIu
X-Received: by 2002:a17:906:9246:: with SMTP id c6mr30337747ejx.10.1620713901801;
        Mon, 10 May 2021 23:18:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuFUKxnlEC58W09fcC4t8RpefrIfBsHhh1rU2Dzq5wghcRbv5j9OslBqjPeLytqr3YNEzFFg==
X-Received: by 2002:a17:906:9246:: with SMTP id c6mr30337730ejx.10.1620713901627;
        Mon, 10 May 2021 23:18:21 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id gn36sm10616136ejc.23.2021.05.10.23.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 23:18:21 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, joel@jms.id.au,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc:     andrew@aj.id.au, linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH] watchdog: Use sysfs_emit() and sysfs_emit_at() in "show" functions
Date:   Tue, 11 May 2021 08:18:12 +0200
Message-Id: <20210511061812.480172-1-juergh@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert sprintf() in sysfs "show" functions to sysfs_emit() and
sysfs_emit_at() in order to check for buffer overruns in sysfs outputs.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 drivers/watchdog/aspeed_wdt.c          |  4 ++--
 drivers/watchdog/watchdog_dev.c        | 19 ++++++++++---------
 drivers/watchdog/watchdog_pretimeout.c |  4 ++--
 drivers/watchdog/ziirave_wdt.c         | 12 +++++++-----
 4 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 7e00960651fa..933998e5a9de 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -175,8 +175,8 @@ static ssize_t access_cs0_show(struct device *dev,
 	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
 	u32 status = readl(wdt->base + WDT_TIMEOUT_STATUS);
 
-	return sprintf(buf, "%u\n",
-		      !(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
+	return sysfs_emit(buf, "%u\n",
+			  !(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
 }
 
 static ssize_t access_cs0_store(struct device *dev,
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 2946f3a63110..fe68a97973a5 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -451,7 +451,8 @@ static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
+	return sysfs_emit(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT,
+						  &wdd->status));
 }
 
 static ssize_t nowayout_store(struct device *dev, struct device_attribute *attr,
@@ -485,7 +486,7 @@ static ssize_t status_show(struct device *dev, struct device_attribute *attr,
 	status = watchdog_get_status(wdd);
 	mutex_unlock(&wd_data->lock);
 
-	return sprintf(buf, "0x%x\n", status);
+	return sysfs_emit(buf, "0x%x\n", status);
 }
 static DEVICE_ATTR_RO(status);
 
@@ -494,7 +495,7 @@ static ssize_t bootstatus_show(struct device *dev,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", wdd->bootstatus);
+	return sysfs_emit(buf, "%u\n", wdd->bootstatus);
 }
 static DEVICE_ATTR_RO(bootstatus);
 
@@ -510,7 +511,7 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
 	status = watchdog_get_timeleft(wdd, &val);
 	mutex_unlock(&wd_data->lock);
 	if (!status)
-		status = sprintf(buf, "%u\n", val);
+		status = sysfs_emit(buf, "%u\n", val);
 
 	return status;
 }
@@ -521,7 +522,7 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", wdd->timeout);
+	return sysfs_emit(buf, "%u\n", wdd->timeout);
 }
 static DEVICE_ATTR_RO(timeout);
 
@@ -530,7 +531,7 @@ static ssize_t pretimeout_show(struct device *dev,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", wdd->pretimeout);
+	return sysfs_emit(buf, "%u\n", wdd->pretimeout);
 }
 static DEVICE_ATTR_RO(pretimeout);
 
@@ -539,7 +540,7 @@ static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%s\n", wdd->info->identity);
+	return sysfs_emit(buf, "%s\n", wdd->info->identity);
 }
 static DEVICE_ATTR_RO(identity);
 
@@ -549,9 +550,9 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
 	if (watchdog_active(wdd))
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 
-	return sprintf(buf, "inactive\n");
+	return sysfs_emit(buf, "inactive\n");
 }
 static DEVICE_ATTR_RO(state);
 
diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index 01ca84be240f..7f257c3485cd 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -55,7 +55,7 @@ int watchdog_pretimeout_available_governors_get(char *buf)
 	mutex_lock(&governor_lock);
 
 	list_for_each_entry(priv, &governor_list, entry)
-		count += sprintf(buf + count, "%s\n", priv->gov->name);
+		count += sysfs_emit_at(buf, count, "%s\n", priv->gov->name);
 
 	mutex_unlock(&governor_lock);
 
@@ -68,7 +68,7 @@ int watchdog_pretimeout_governor_get(struct watchdog_device *wdd, char *buf)
 
 	spin_lock_irq(&pretimeout_lock);
 	if (wdd->gov)
-		count = sprintf(buf, "%s\n", wdd->gov->name);
+		count = sysfs_emit(buf, "%s\n", wdd->gov->name);
 	spin_unlock_irq(&pretimeout_lock);
 
 	return count;
diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 4297280807ca..6c9414d09684 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -445,8 +445,9 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.major,
-		      w_priv->firmware_rev.minor);
+	ret = sysfs_emit(buf, ZIIRAVE_FW_VERSION_FMT,
+			 w_priv->firmware_rev.major,
+			 w_priv->firmware_rev.minor);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
 
@@ -468,8 +469,9 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.major,
-		      w_priv->bootloader_rev.minor);
+	ret = sysfs_emit(buf, ZIIRAVE_BL_VERSION_FMT,
+			 w_priv->bootloader_rev.major,
+			 w_priv->bootloader_rev.minor);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
 
@@ -491,7 +493,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
+	ret = sysfs_emit(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
 
-- 
2.27.0

