Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496282025AA
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgFTRfG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:35:06 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44684 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbgFTRfF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:35:05 -0400
Received: by mail-ot1-f67.google.com with SMTP id e5so9780531ote.11
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=f4PL0T6GCERZ/YEDo14hZLuC450xWsmw+SQUtlVusaM=;
        b=DTmFYFHf2N8OTI5tCrUf5rn2dn4VZ1Y3PK6m11rb3lNXWDWU9Ike6gABkBFEuT4/xl
         NocJI/qCR9HYx1rUjX9yLpocA8UmMRM7zEyoVviOte0I5SMQY71vpNdcgA9rG4pNNU2V
         DnxkYCNzfR1ksSUjIztkXT3ooXwIupGfNDMBZvJtJgA+Cxl+10e0vXV/iMhkHPKToOMN
         X+CrnJF3sNUFTYtVS0F3owIqk67u/lBX65aZcVNuJZVL4nBuE7Rx5OnSdBDqUA4OuIDd
         b3+inw+nrYbsEJU/BGkR7wAYQalZTDzb7EtJhBKS3yxbH+Wk4KxebHRkaPkW3eJCXTs5
         3FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=f4PL0T6GCERZ/YEDo14hZLuC450xWsmw+SQUtlVusaM=;
        b=V//qciAGV8UEKN8xzK6lK+m40iPMDikMdDKhX5bt17Nkc+jtl1ncM8aUIS+y7MM0JT
         StF6RBe3z4zvS9WMCWcCDi4zZr0BgtZBINlIvTjQeHhVxXA8nitPKeKeXfWCy2qluxNK
         PQCfjzWEtt6O9dK+11R/RE9mml8OQaAWBa1u3+OEfG2ovT08KFsKir0lmgloYLvLw/uR
         7XcnwwZmagFTGqoDB1ckVpOo1ayisWwfXEm6Og6+579gcurZBBeSybsxBE2zzqN9ieSb
         xhhUoThiqoS/xba3isg410M40DxbM3bBlrTdXZVDbHnttAKEOJukCwomTQBmViJ30rYz
         OCIg==
X-Gm-Message-State: AOAM53070PjLEbRda16n6BcFIsqMiqyAhoAp5ITB48l1z3+qLq/+RFsi
        NGlrd8kWpCY1rnSQfbx+pUsnDJo=
X-Google-Smtp-Source: ABdhPJzaqfVKX6ZRV8gBsTlcbwKJXnTzYBdGNtAEhZDTPBi5QD7morWMsndmGyEbK36ECY7sg641Rg==
X-Received: by 2002:a9d:6e0a:: with SMTP id e10mr7997634otr.171.1592674443480;
        Sat, 20 Jun 2020 10:34:03 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id u125sm1982816oif.57.2020.06.20.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:34:01 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:f17b:b355:b0a4:2592])
        by serve.minyard.net (Postfix) with ESMTPA id 87777180545;
        Sat, 20 Jun 2020 17:34:00 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 2/6] watchdog: Add ioctls for millisecond timeout handling
Date:   Sat, 20 Jun 2020 12:33:47 -0500
Message-Id: <20200620173351.18752-3-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620173351.18752-1-minyard@acm.org>
References: <20200620173351.18752-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Add millisecond ioctls for the five timeout ioctls in the watchdog.  If
the driver being used doesn't support milliseconds, the appropriate
conversions are done.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_core.c |   5 +-
 drivers/watchdog/watchdog_core.h |   2 +
 drivers/watchdog/watchdog_dev.c  | 123 ++++++++++++++++++++++---------
 include/uapi/linux/watchdog.h    |   5 ++
 4 files changed, 98 insertions(+), 37 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index b54451a9a336..9c531ae05c46 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -138,9 +138,8 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
 				 &timeout_parm) == 0) {
 		if (timeout_parm &&
 		    !watchdog_timeout_invalid(wdd, timeout_parm)) {
-			if (!(wdd->info->options & WDIOF_MSECTIMER))
-				/* Convert to msecs if not already so. */
-				timeout_parm *= 1000;
+			timeout_parm = watchdog_timeout_tointernal(wdd, false,
+							timeout_parm);
 			goto set_timeout;
 		}
 
diff --git a/drivers/watchdog/watchdog_core.h b/drivers/watchdog/watchdog_core.h
index a5062e8e0d13..151806073d58 100644
--- a/drivers/watchdog/watchdog_core.h
+++ b/drivers/watchdog/watchdog_core.h
@@ -31,3 +31,5 @@ extern int watchdog_dev_register(struct watchdog_device *);
 extern void watchdog_dev_unregister(struct watchdog_device *);
 extern int __init watchdog_dev_init(void);
 extern void __exit watchdog_dev_exit(void);
+extern unsigned int watchdog_timeout_tointernal(struct watchdog_device *,
+						bool, unsigned int);
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 480460b89c16..eca13ce1dc91 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -371,6 +371,56 @@ static unsigned int watchdog_get_status(struct watchdog_device *wdd)
 	return status;
 }
 
+/*
+ *	watchdog_timeout_tointernal: Convert to internal time representation
+ *	@wdd: the watchdog device
+ *	@in_msecs: false - timeout in seconds, true - timeout in milliseconds
+ *	@timeout: timeout to convert
+ *
+ *	Convert from an external representation of the timeout in
+ *	seconds (or milliseconds if in_msecs is true) to the internal
+ *	timeout in seconds or milliseconds, depending on
+ *	WDIOF_MSECTIMER.
+ */
+unsigned int watchdog_timeout_tointernal(struct watchdog_device *wdd,
+					 bool in_msecs,
+					 unsigned int timeout)
+{
+	if (wdd->info->options & WDIOF_MSECTIMER) {
+		if (!in_msecs)
+			timeout *= 1000;
+	} else if (in_msecs) {
+		/* Truncate up. */
+		timeout = (timeout + 999) / 1000;
+	}
+	return timeout;
+}
+
+/*
+ *	watchdog_timeout_toexternal: Convert to external time representation
+ *	@wdd: the watchdog device
+ *	@in_msecs: false - returns seconds, true - returns milliseconds
+ *	@timeout: timeout in seconds (or milliseconds if WDIOF_MSECTIMER is set)
+ *
+ *	Convert from an internal representation of the timeout in
+ *	seconds (or milliseconds if WDIOF_MSECTIMER is set) to the
+ *	external timeout in seconds or milliseconds, depending on
+ *	in_msecs.
+ */
+static unsigned int watchdog_timeout_toexternal(struct watchdog_device *wdd,
+						bool in_msecs,
+						unsigned int timeout)
+{
+	if (wdd->info->options & WDIOF_MSECTIMER) {
+		if (!in_msecs)
+			timeout /= 1000;
+	} else if (in_msecs) {
+		timeout *= 1000;
+	}
+
+	return timeout;
+}
+
 /*
  *	watchdog_set_timeout: set the watchdog timer timeout
  *	@wdd: the watchdog device to set the timeout for
@@ -379,7 +429,7 @@ static unsigned int watchdog_get_status(struct watchdog_device *wdd)
  *	The caller must hold wd_data->lock.
  */
 
-static int watchdog_set_timeout(struct watchdog_device *wdd,
+static int watchdog_set_timeout(struct watchdog_device *wdd, bool in_msecs,
 							unsigned int timeout)
 {
 	int err = 0;
@@ -387,11 +437,13 @@ static int watchdog_set_timeout(struct watchdog_device *wdd,
 	if (!(wdd->info->options & WDIOF_SETTIMEOUT))
 		return -EOPNOTSUPP;
 
-	if (watchdog_timeout_invalid(wdd, timeout))
+	if (in_msecs) {
+		if (_watchdog_timeout_invalid(wdd, timeout))
+			return -EINVAL;
+	} else if (watchdog_timeout_invalid(wdd, timeout))
 		return -EINVAL;
 
-	if (wdd->info->options & WDIOF_MSECTIMER)
-		timeout *= 1000;
+	timeout = watchdog_timeout_tointernal(wdd, in_msecs, timeout);
 	if (wdd->ops->set_timeout) {
 		err = wdd->ops->set_timeout(wdd, timeout);
 	} else {
@@ -413,6 +465,7 @@ static int watchdog_set_timeout(struct watchdog_device *wdd,
  */
 
 static int watchdog_set_pretimeout(struct watchdog_device *wdd,
+				   bool in_msecs,
 				   unsigned int timeout)
 {
 	int err = 0;
@@ -423,8 +476,7 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
 	if (watchdog_pretimeout_invalid(wdd, timeout))
 		return -EINVAL;
 
-	if (wdd->info->options & WDIOF_MSECTIMER)
-		timeout *= 1000;
+	timeout = watchdog_timeout_tointernal(wdd, in_msecs, timeout);
 	if (wdd->ops->set_pretimeout)
 		err = wdd->ops->set_pretimeout(wdd, timeout);
 	else
@@ -443,7 +495,7 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
  *	Get the time before a watchdog will reboot (if not pinged).
  */
 
-static int watchdog_get_timeleft(struct watchdog_device *wdd,
+static int watchdog_get_timeleft(struct watchdog_device *wdd, bool in_msecs,
 							unsigned int *timeleft)
 {
 	*timeleft = 0;
@@ -452,8 +504,7 @@ static int watchdog_get_timeleft(struct watchdog_device *wdd,
 		return -EOPNOTSUPP;
 
 	*timeleft = wdd->ops->get_timeleft(wdd);
-	if (wdd->info->options & WDIOF_MSECTIMER)
-		*timeleft /= 1000;
+	*timeleft = watchdog_timeout_toexternal(wdd, in_msecs, *timeleft);
 
 	return 0;
 }
@@ -520,13 +571,11 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
 	unsigned int val;
 
 	mutex_lock(&wd_data->lock);
-	status = watchdog_get_timeleft(wdd, &val);
+	status = watchdog_get_timeleft(wdd, false, &val);
 	mutex_unlock(&wd_data->lock);
-	if (!status) {
-		if (wdd->info->options & WDIOF_MSECTIMER)
-			val /= 1000;
-		status = sprintf(buf, "%u\n", val);
-	}
+	if (!status)
+		status = sprintf(buf, "%u\n",
+				 watchdog_timeout_toexternal(wdd, false, val));
 
 	return status;
 }
@@ -536,12 +585,9 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
-	unsigned int t = wdd->timeout;
 
-	if (wdd->info->options & WDIOF_MSECTIMER)
-		t /= 1000;
-
-	return sprintf(buf, "%u\n", t);
+	return sprintf(buf, "%u\n",
+		       watchdog_timeout_toexternal(wdd, false, wdd->timeout));
 }
 static DEVICE_ATTR_RO(timeout);
 
@@ -549,12 +595,10 @@ static ssize_t pretimeout_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
-	unsigned int t = wdd->pretimeout;
-
-	if (wdd->info->options & WDIOF_MSECTIMER)
-		t /= 1000;
 
-	return sprintf(buf, "%u\n", t);
+	return sprintf(buf, "%u\n",
+		       watchdog_timeout_toexternal(wdd, false,
+						   wdd->pretimeout));
 }
 static DEVICE_ATTR_RO(pretimeout);
 
@@ -788,11 +832,13 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 		err = watchdog_ping(wdd);
 		break;
 	case WDIOC_SETTIMEOUT:
+	case WDIOC_SETTIMEOUT_MS:
 		if (get_user(val, p)) {
 			err = -EFAULT;
 			break;
 		}
-		err = watchdog_set_timeout(wdd, val);
+		err = watchdog_set_timeout(wdd, cmd == WDIOC_SETTIMEOUT_MS,
+					   val);
 		if (err < 0)
 			break;
 		/* If the watchdog is active then we send a keepalive ping
@@ -803,33 +849,42 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 			break;
 		/* fall through */
 	case WDIOC_GETTIMEOUT:
+	case WDIOC_GETTIMEOUT_MS:
 		/* timeout == 0 means that we don't know the timeout */
 		if (wdd->timeout == 0) {
 			err = -EOPNOTSUPP;
 			break;
 		}
-		val = wdd->timeout;
-		if (wdd->info->options & WDIOF_MSECTIMER)
-			val /= 1000;
+		val = watchdog_timeout_toexternal(wdd,
+					  (cmd == WDIOC_SETTIMEOUT_MS ||
+					   cmd == WDIOC_GETTIMEOUT_MS),
+					  wdd->timeout);
 		err = put_user(val, p);
 		break;
 	case WDIOC_GETTIMELEFT:
-		err = watchdog_get_timeleft(wdd, &val);
+	case WDIOC_GETTIMELEFT_MS:
+		err = watchdog_get_timeleft(wdd, cmd == WDIOC_GETTIMELEFT_MS,
+					    &val);
 		if (err < 0)
 			break;
 		err = put_user(val, p);
 		break;
 	case WDIOC_SETPRETIMEOUT:
+	case WDIOC_SETPRETIMEOUT_MS:
 		if (get_user(val, p)) {
 			err = -EFAULT;
 			break;
 		}
-		err = watchdog_set_pretimeout(wdd, val);
+		err = watchdog_set_pretimeout(wdd,
+					      cmd == WDIOC_SETPRETIMEOUT_MS,
+					      val);
 		break;
 	case WDIOC_GETPRETIMEOUT:
-		val = wdd->pretimeout;
-		if (wdd->info->options & WDIOF_MSECTIMER)
-			val /= 1000;
+	case WDIOC_GETPRETIMEOUT_MS:
+		val = watchdog_timeout_toexternal(wdd,
+					  (cmd == WDIOC_SETPRETIMEOUT_MS ||
+					   cmd == WDIOC_GETPRETIMEOUT_MS),
+					  wdd->pretimeout);
 		err = put_user(val, p);
 		break;
 	default:
diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
index feb3bcc46993..3df7880c6fca 100644
--- a/include/uapi/linux/watchdog.h
+++ b/include/uapi/linux/watchdog.h
@@ -32,6 +32,11 @@ struct watchdog_info {
 #define	WDIOC_SETPRETIMEOUT	_IOWR(WATCHDOG_IOCTL_BASE, 8, int)
 #define	WDIOC_GETPRETIMEOUT	_IOR(WATCHDOG_IOCTL_BASE, 9, int)
 #define	WDIOC_GETTIMELEFT	_IOR(WATCHDOG_IOCTL_BASE, 10, int)
+#define	WDIOC_SETTIMEOUT_MS	_IOWR(WATCHDOG_IOCTL_BASE, 11, int)
+#define	WDIOC_GETTIMEOUT_MS	_IOR(WATCHDOG_IOCTL_BASE, 12, int)
+#define	WDIOC_SETPRETIMEOUT_MS	_IOWR(WATCHDOG_IOCTL_BASE, 13, int)
+#define	WDIOC_GETPRETIMEOUT_MS	_IOR(WATCHDOG_IOCTL_BASE, 14, int)
+#define	WDIOC_GETTIMELEFT_MS	_IOR(WATCHDOG_IOCTL_BASE, 15, int)
 
 #define	WDIOF_UNKNOWN		-1	/* Unknown flag error */
 #define	WDIOS_UNKNOWN		-1	/* Unknown status error */
-- 
2.17.1

