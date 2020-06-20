Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76722025B9
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgFTRuR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:17 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33775 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgFTRuQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:16 -0400
Received: by mail-ot1-f65.google.com with SMTP id n6so9854247otl.0
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SWYmfUtHykqWtLMjWsep9JBV05ID8OlIgVmIpTjPzI0=;
        b=qSACYR+CCd4djpUUzbXBt5BvEXJ7nYsrxsyHvC3qBos6Hu5RI4hOV0sKmuHZbkZLrH
         emMEfConKXNdYYJaYPjwzCHXNYvOf5v19lIlX5rMfsn65fIyTWjykX5jtyiKz4IZpVE6
         6pPC3DDqzkN2EKFeSKrApUYL396LnhgZFfiT8U5q25TWG3Ku3nd0VpLKsEQarpbwBkVZ
         ctTxsy8UTBARr/E/h4GutM5Re6VeHmZTdBDkFOdXv7sq1KnCoo8cFiIV5kP/HoqA7mJT
         jBvahanfBhpTsijEBi0tfucPvyTW0lqd2Pupz74ACffhTY7w004IouMcP0ABs2v4Pese
         gDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=SWYmfUtHykqWtLMjWsep9JBV05ID8OlIgVmIpTjPzI0=;
        b=fe6OR+mkqle88erRDNDRTRt6H2NDk0FU46k1OELxhzF61Jg8gnDDRbkaLKnrT2LAy2
         API8o9v4MPwXVtpaotl243H5hI2f0jIyFT6cZJOHFvIkMGN4e/gh9+R8OH9sXOUHCwv9
         C2Sc15dXeMTu07iklRWOHOzBpDnLjO6MhDDv14OWLoBK0/JY9AuwdMAm/JjmByQycCpi
         j7sKeQ9xpfx/wqtlfy4fTrplAfybk8429Asfd6p4XsosgrybwaioGaTD7HBhqKg+29M+
         uNBbuW/HIxeOiZ//oohUt8pHf8EyghZc0w2jvsfzPGHHcuxxKiUqQCXrChV4imXAFRN3
         mrlg==
X-Gm-Message-State: AOAM532cbfmTXkqDvKzollhbfBn1Q6FWoIaT2qnIN5l/KXwOWthzNCdb
        ITdBLTYLyjMHyb7RWX0Qsg==
X-Google-Smtp-Source: ABdhPJwy//OZpAhAynJvnNSeHpa7pc9E2jSnN9nE30InvUJWsMKodWorrnm4UNYgNyLjsKTIvbUXRQ==
X-Received: by 2002:a9d:12f7:: with SMTP id g110mr8028643otg.79.1592675355520;
        Sat, 20 Jun 2020 10:49:15 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id f187sm1994651oig.12.2020.06.20.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:14 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id A802D18055F;
        Sat, 20 Jun 2020 17:49:11 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 05/10] watchdog: Export an interface to start the watchdog
Date:   Sat, 20 Jun 2020 12:49:02 -0500
Message-Id: <20200620174907.20229-6-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

This way a watchdog driver can start itself.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_dev.c | 30 ++++++++++++++++++++++++++----
 include/linux/watchdog.h        |  3 +++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 6c423aed3f3c..752358df1606 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -253,7 +253,7 @@ static enum hrtimer_restart watchdog_timer_expired(struct hrtimer *timer)
 }
 
 /*
- *	watchdog_start: wrapper to start the watchdog.
+ *	_watchdog_start: wrapper to start the watchdog.
  *	@wdd: the watchdog device to start
  *
  *	The caller must hold wd_data->lock.
@@ -263,7 +263,7 @@ static enum hrtimer_restart watchdog_timer_expired(struct hrtimer *timer)
  *	failure.
  */
 
-static int watchdog_start(struct watchdog_device *wdd)
+static int _watchdog_start(struct watchdog_device *wdd)
 {
 	struct watchdog_core_data *wd_data = wdd->wd_data;
 	ktime_t started_at;
@@ -289,6 +289,28 @@ static int watchdog_start(struct watchdog_device *wdd)
 	return err;
 }
 
+/*
+ *	watchdog_start: External interface to start the watchdog.
+ *	@wdd: the watchdog device to start
+ *
+ *	Start the watchdog if it is not active and mark it active.
+ *	This function returns zero on success or a negative errno code for
+ *	failure.
+ */
+
+int watchdog_start(struct watchdog_device *wdd)
+{
+	struct watchdog_core_data *wd_data = wdd->wd_data;
+	int err;
+
+	mutex_lock(&wd_data->lock);
+	err = _watchdog_start(wdd);
+	mutex_unlock(&wd_data->lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(watchdog_start);
+
 /*
  *	watchdog_stop: wrapper to stop the watchdog.
  *	@wdd: the watchdog device to stop
@@ -837,7 +859,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 				break;
 		}
 		if (val & WDIOS_ENABLECARD)
-			err = watchdog_start(wdd);
+			err = _watchdog_start(wdd);
 		break;
 	case WDIOC_KEEPALIVE:
 		if (!(wdd->info->options & WDIOF_KEEPALIVEPING)) {
@@ -935,7 +957,7 @@ static int watchdog_open(struct inode *inode, struct file *file)
 		goto out_clear;
 	}
 
-	err = watchdog_start(wdd);
+	err = _watchdog_start(wdd);
 	if (err < 0)
 		goto out_mod;
 
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 95396b644a9b..1eefae61215d 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -205,6 +205,9 @@ static inline void *watchdog_get_drvdata(struct watchdog_device *wdd)
 int watchdog_set_timeout(struct watchdog_device *wdd, unsigned int timeout);
 int watchdog_set_pretimeout(struct watchdog_device *wdd, unsigned int timeout);
 
+/* Allow the driver to start the watchdog. */
+int watchdog_start(struct watchdog_device *wdd);
+
 /* Use the following functions to report watchdog pretimeout event */
 #if IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)
 void watchdog_notify_pretimeout(struct watchdog_device *wdd);
-- 
2.17.1

