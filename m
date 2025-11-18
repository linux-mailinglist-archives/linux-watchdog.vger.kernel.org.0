Return-Path: <linux-watchdog+bounces-4617-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D44C6BADF
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 22:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DEC0B35F53A
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 21:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD072EB860;
	Tue, 18 Nov 2025 21:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+1OWYYU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DF6370305
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Nov 2025 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763499854; cv=none; b=sMaG0M23EwqnDK8YSgGMIjD0OiesxQ4NSF/xClQgK7++4BnTNAD4O1ubKpCjQ/uvTpkJG+pkfk9MAaNidulFbeiIxPT79olsDUdmKUiYyIGKnZS3BpNi7xQyO/6yX1/9ZWWhcbKAluDE/neqYbILu+0ftdzC/ErLEKqyD7ajXLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763499854; c=relaxed/simple;
	bh=kaU4u/N0sHazEu09348nTCLOb8s7SuVJa1eS7d2gqY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dBkDaVzYTHIfoUT4toAPFba+Uc/3wWzD/xctf+NpeTE6/mUox2GBhPJHR+eoFqhB5GNovDPmFLRdpW2eVgyWnX6JTEVyMPQ9OGm6zhzFkCKJFzsuBl5oyD53GayV/fh/OgDsMF1wGVOQsL2DwBsRQyP2TayjY+V0u33cWERsqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+1OWYYU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so5211149b3a.0
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Nov 2025 13:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763499851; x=1764104651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+lX/6VZLWAmCs/H5Fb6sN9IbLniBA5Itl7fv+H0AR74=;
        b=V+1OWYYUZ76Pnew1DqbdAkqtzLZXLKs01qGHkmf5393yYTpe9V9wv6JVvz24xLz9So
         6R6bIPFnaE54mMi5zi7If8rmoBmCCjjFXl6BkUSnW4I0/NC5VCqHZpwHtf11ZT44drgA
         k4+/Yipe5idZ4fcFL2l7LcP7rJqjkhynM27Xu0VirNpcAlGRiC846yHHk2ceEG263yaF
         0EkDMrME87znxHRnEI8ol5gAbodvDMGjYZLtAHxTcEp1BjaTx3ZPKBNDnEAyQO9l2V8U
         ZCnIfkqxRoYkuhH3a1lcPeGNSQsBFGYsfmSOwB/fZ+5qVL/EWSfg+vjIXPtyeXKN/HwW
         tGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763499851; x=1764104651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lX/6VZLWAmCs/H5Fb6sN9IbLniBA5Itl7fv+H0AR74=;
        b=UYpMfrWoMyw4Q2MM5jQGDR47mH2xGaO8g9piSgu4Fbc0cbWoWvMSZ7YxkQ1uKW8Qno
         Tpsc+KuIsp5jzihezPwgDfyWZkbqnkO8PAIQffaTYBa8QrqGyjAAk0Npp+uRytElvZYx
         T78prlSpORgD4HoQW+6KZwR8269tvhaQcUTl8Wdx/BgLD9AQ4eUrbA2HJ5wQ0SLMUADN
         ZJqNb0eUv7DrdjeRZ+VVrXVR4BAtJ0uoiatczI6fQ/1zwFRue7jx/ojl+WyddFcgGZnJ
         HhDJcy4/CTgzF7wkEpHUL9p7Jez4a65ic/3XiZUt8yYMU7VksLqvKg9U10lnlzYlovW2
         dFGg==
X-Gm-Message-State: AOJu0YxBuyiajE44XmMdZUvZCYPwpeVD4A6SD64sFxrRJOfl7EVabrf+
	FsIhx+m4EN3nk72UgmYSReVEGZdKCVZSXKHBGF2f8VThPH4oUez5CAUY
X-Gm-Gg: ASbGncs1WkdI2xruHHin73tckRfN6134+qg5Rl44iiMZbXG89XnWaR3KMPApTwOL/Dj
	wwn9XRVnbJjypF9cu01M5+meXBNet5+TlF14qI/4BAatoImPc6SO4Oel0BRfHtkbqiysra74r0Z
	xTUElAGmON1Y9mzGBgzkaIR/CoMPQN57hb/drluS8ZOKrnMiAQir/1xmI4tx9pRKn4hziTw8pC8
	steh/LUdlkmUK/JAKSILsUnrHJSYDn+MOLsMAtAM7Aa85TjpbbGZgKQMLvCzMFM/VZrae8+Udv/
	rb439EuXYmxyjgfE0sG3Rpv7hTFlg7dy35dtAThQee5roRKmbWEjWRvU7Vm+U191LFKQOVIjZvU
	Fn2ckHQaiw81kwFQLKcFKuohThSCjuGfUtQ1aI+nZsude6tiechAgMFasufHRCwppg5FqcCvrpI
	3qQ+ffQK+BydrALsiutr5gOMniydhP1g8a9bDLovef9bGAIvofJ6kRAwI=
X-Google-Smtp-Source: AGHT+IHGhNnaSvhLfGq+rNRqh3m+YrApbmwb2Xs2MwPQnM1c120aDA43yUGlFuzBdZB6RyBz2iRXbg==
X-Received: by 2002:a05:7022:388e:b0:119:e55a:9be6 with SMTP id a92af1059eb24-11b40e853a8mr8063117c88.2.1763499850680;
        Tue, 18 Nov 2025 13:04:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608861asm43447369c88.9.2025.11.18.13.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 13:04:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] watchdog: Always return time left until watchdog times out
Date: Tue, 18 Nov 2025 13:04:07 -0800
Message-ID: <20251118210407.2362338-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The watchdog core knows when the most recent keepalive was sent. It also
knows the configured timeout. With that, it can always calculate and
return the time left until a watchdog times out, even if its driver does
not support it.

Convert watchdog_get_timeleft() into a void function. It never returns an
error after this patch is applied, so the error checks in the calling code
are now pointless and can be removed.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Tested on system which supports reading the remaining time from the
hardware. Confirmed that the calculated remaining time is never more
than 1 second different than the time reported by the hardware.

 drivers/watchdog/watchdog_dev.c | 35 ++++++++++++++-------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 8369fd94fc1a..9a5e544b886b 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -424,20 +424,22 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
  *
  * Get the time before a watchdog will reboot (if not pinged).
  * The caller must hold wd_data->lock.
- *
- * Return: 0 if successful, error otherwise.
  */
-static int watchdog_get_timeleft(struct watchdog_device *wdd,
-							unsigned int *timeleft)
+static void watchdog_get_timeleft(struct watchdog_device *wdd,
+				  unsigned int *timeleft)
 {
 	*timeleft = 0;
 
-	if (!wdd->ops->get_timeleft)
-		return -EOPNOTSUPP;
+	if (wdd->ops->get_timeleft) {
+		*timeleft = wdd->ops->get_timeleft(wdd);
+	} else {
+		struct watchdog_core_data *wd_data = wdd->wd_data;
+		s64 last_keepalive_ms = ktime_ms_delta(ktime_get(), wd_data->last_keepalive);
+		s64 last_keepalive = DIV_ROUND_UP_ULL(last_keepalive_ms, 1000);
 
-	*timeleft = wdd->ops->get_timeleft(wdd);
-
-	return 0;
+		if (wdd->timeout > last_keepalive)
+			*timeleft = wdd->timeout - last_keepalive;
+	}
 }
 
 #ifdef CONFIG_WATCHDOG_SYSFS
@@ -499,16 +501,13 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 	struct watchdog_core_data *wd_data = wdd->wd_data;
-	ssize_t status;
 	unsigned int val;
 
 	mutex_lock(&wd_data->lock);
-	status = watchdog_get_timeleft(wdd, &val);
+	watchdog_get_timeleft(wdd, &val);
 	mutex_unlock(&wd_data->lock);
-	if (!status)
-		status = sysfs_emit(buf, "%u\n", val);
 
-	return status;
+	return sysfs_emit(buf, "%u\n", val);
 }
 static DEVICE_ATTR_RO(timeleft);
 
@@ -624,9 +623,7 @@ static umode_t wdt_is_visible(struct kobject *kobj, struct attribute *attr,
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 	umode_t mode = attr->mode;
 
-	if (attr == &dev_attr_timeleft.attr && !wdd->ops->get_timeleft)
-		mode = 0;
-	else if (attr == &dev_attr_pretimeout.attr && !watchdog_have_pretimeout(wdd))
+	if (attr == &dev_attr_pretimeout.attr && !watchdog_have_pretimeout(wdd))
 		mode = 0;
 	else if ((attr == &dev_attr_pretimeout_governor.attr ||
 		  attr == &dev_attr_pretimeout_available_governors.attr) &&
@@ -825,9 +822,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 		err = put_user(wdd->timeout, p);
 		break;
 	case WDIOC_GETTIMELEFT:
-		err = watchdog_get_timeleft(wdd, &val);
-		if (err < 0)
-			break;
+		watchdog_get_timeleft(wdd, &val);
 		err = put_user(val, p);
 		break;
 	case WDIOC_SETPRETIMEOUT:
-- 
2.45.2


