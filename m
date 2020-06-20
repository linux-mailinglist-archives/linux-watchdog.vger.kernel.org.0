Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D173E2025BB
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgFTRuS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42965 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgFTRuR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id t6so9804988otk.9
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=461CLOKGmiU5CofZzL7eUc/s5fevWfSccRK543s1Eo0=;
        b=Lz1G/TGOcix74igMNs2i3BCOsB6VwLSOHtuyEaCgWPqM3rbCVeXjvrXh30IcHjZX/b
         SvANV4xrNaamC+J37mxaqtoo+Iq9tBAgnVW0iGZ6tfwdjgEVDpjXjcPSa8Paaat2/JLw
         0WFeYAJ8t8+XIWv1J597hcGF7RCX7faLYgzejHLxuxGK3bmqo4i8un656kXFs+7v0NgZ
         N2acGEkah0KSwOvLGDfLLfH204b5EGZsL4AdfC8Ojbf8hAUOMQb4sfOA4nllGDTG7lx9
         z6C3cMqF4BShG2GSXfEpxyDSb2WJ1+HuWhcWDpmHa369VfVyMLuhIsGopaeY2fO0luS9
         GWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=461CLOKGmiU5CofZzL7eUc/s5fevWfSccRK543s1Eo0=;
        b=ZNyG/FU6YrF3NMr89+8TSS/NuWUB0rcVot+cZyCqqsV6OZuln49AxKD+aWJ13cOSeC
         qRZAZ8pwkCMfC6qWX9TPuGtfp+/xSzVURd7hfItCKtF/ssfnWOtBONAfZFISBe84Q0I6
         /bZAe3gDyqdqJlviNqbQOvlAPs0bf2jxGSjBTCgh9UCsQ1dxG2wbWQ6hy+yK4Myy3DjT
         sc1CuUk2yvB7Ug9bJbQOdCiWF8YIJW+VHDR/qIaxMw/TTRFScNwJy7avh6iArqKWAtl6
         LfWiVOnhwysDtlYOMsq1TWmMCYgQ5LSHXi1uvxyIX5x4XVXKyuojjl0AS/DSgq7g/1WM
         IK5g==
X-Gm-Message-State: AOAM530y3z19KSiQyg+wkIw9sDICUxVoMkeScMf8XqBbUFg/9mEgRpoD
        /E1eDxhOOKJ9DxS7DTqoFg==
X-Google-Smtp-Source: ABdhPJyjCBUY145ExsorOuUiTMW4lgD2SALtS8QiuaOGerzcHQQ91jos9UTs1x02WVH+UlOiYXYfzg==
X-Received: by 2002:a9d:629a:: with SMTP id x26mr8090339otk.116.1592675354828;
        Sat, 20 Jun 2020 10:49:14 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id m8sm2083210otc.1.2020.06.20.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:13 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id 9CFBE18054F;
        Sat, 20 Jun 2020 17:49:11 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 04/10] watchdog: Add functions to set the timeout and pretimeout
Date:   Sat, 20 Jun 2020 12:49:01 -0500
Message-Id: <20200620174907.20229-5-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

If the watchdog device wants to set it's pretimeout (say from module
parameters), this lets them do that.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_dev.c | 54 +++++++++++++++++++++++++++++----
 include/linux/watchdog.h        |  4 +++
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 45a0a4fe731d..6c423aed3f3c 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -364,14 +364,14 @@ static unsigned int watchdog_get_status(struct watchdog_device *wdd)
 }
 
 /*
- *	watchdog_set_timeout: set the watchdog timer timeout
+ *	_watchdog_set_timeout: set the watchdog timer timeout
  *	@wdd: the watchdog device to set the timeout for
  *	@timeout: timeout to set in seconds
  *
  *	The caller must hold wd_data->lock.
  */
 
-static int watchdog_set_timeout(struct watchdog_device *wdd,
+static int _watchdog_set_timeout(struct watchdog_device *wdd,
 							unsigned int timeout)
 {
 	int err = 0;
@@ -396,14 +396,35 @@ static int watchdog_set_timeout(struct watchdog_device *wdd,
 	return err;
 }
 
+/*
+ *	watchdog_set_timeout: set the watchdog timer timeout
+ *	@wdd: the watchdog device to set the timeout for
+ *	@timeout: timeout to set in seconds
+ */
+
+int watchdog_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	int err = 0;
+
+	if (!wdd->wd_data)
+		return -ENODEV;
+
+	mutex_lock(&wdd->wd_data->lock);
+	err = _watchdog_set_timeout(wdd, timeout);
+	mutex_unlock(&wdd->wd_data->lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(watchdog_set_timeout);
+
 /*
  *	watchdog_set_pretimeout: set the watchdog timer pretimeout
  *	@wdd: the watchdog device to set the timeout for
  *	@timeout: pretimeout to set in seconds
  */
 
-static int watchdog_set_pretimeout(struct watchdog_device *wdd,
-				   unsigned int timeout)
+static int _watchdog_set_pretimeout(struct watchdog_device *wdd,
+				    unsigned int timeout)
 {
 	int err = 0;
 
@@ -421,6 +442,27 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
 	return err;
 }
 
+/*
+ *	watchdog_set_pretimeout: set the watchdog timer pretimeout
+ *	@wdd: the watchdog device to set the timeout for
+ *	@timeout: pretimeout to set in seconds
+ */
+
+int watchdog_set_pretimeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	int err = 0;
+
+	if (!wdd->wd_data)
+		return -ENODEV;
+
+	mutex_lock(&wdd->wd_data->lock);
+	err = _watchdog_set_pretimeout(wdd, timeout);
+	mutex_unlock(&wdd->wd_data->lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(watchdog_set_pretimeout);
+
 /*
  *	watchdog_get_timeleft: wrapper to get the time left before a reboot
  *	@wdd: the watchdog device to get the remaining time from
@@ -809,7 +851,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 			err = -EFAULT;
 			break;
 		}
-		err = watchdog_set_timeout(wdd, val);
+		err = _watchdog_set_timeout(wdd, val);
 		if (err < 0)
 			break;
 		/* If the watchdog is active then we send a keepalive ping
@@ -838,7 +880,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 			err = -EFAULT;
 			break;
 		}
-		err = watchdog_set_pretimeout(wdd, val);
+		err = _watchdog_set_pretimeout(wdd, val);
 		break;
 	case WDIOC_GETPRETIMEOUT:
 		err = put_user(wdd->pretimeout, p);
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 36f99c8c973e..95396b644a9b 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -201,6 +201,10 @@ static inline void *watchdog_get_drvdata(struct watchdog_device *wdd)
 	return wdd->driver_data;
 }
 
+/* Allow the driver to set the timeout and pretimeout. */
+int watchdog_set_timeout(struct watchdog_device *wdd, unsigned int timeout);
+int watchdog_set_pretimeout(struct watchdog_device *wdd, unsigned int timeout);
+
 /* Use the following functions to report watchdog pretimeout event */
 #if IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)
 void watchdog_notify_pretimeout(struct watchdog_device *wdd);
-- 
2.17.1

