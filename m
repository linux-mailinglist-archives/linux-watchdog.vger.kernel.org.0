Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104902025A4
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgFTRfH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:35:07 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36342 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgFTRfF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:35:05 -0400
Received: by mail-oi1-f194.google.com with SMTP id a137so11587118oii.3
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HOVBYX09s4vb3dCiShBG4NSsb19cgNGL44yivBt9AqQ=;
        b=ioJCILskKb7oD4HN+oRp0Xb7bCKYZgLEUbxjkk+m9AMKBg7srdQhlvulVDHO8I0ATQ
         VAolcNgU5Zj9svSjp6saOjl+sn0XNXkNk9ObjJCUP+II3W6pLEatemkwcwyU9eNLCcut
         ZhLyStdZtq4/ESsc/K/xd1m0xwVgB5Os9sPTYSYHrxwUNSrfjKsqsOb/ikUZ50J8vj3c
         09XOuTlbV9KJ84Uf+WB91Pewqjf5iVWnQQe49VjTzVeLDDEbEQfnNmlDO2h4Mc36HS2L
         mc6XwSDtA/ljrBb6flI+O7SLzBsHnSoo+GD97UPqhIPvbAs4M1U4Bxtd6bLH1UiOcOmI
         25bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=HOVBYX09s4vb3dCiShBG4NSsb19cgNGL44yivBt9AqQ=;
        b=pZqi8bXQ4YfTYV1C/nuzOSo1qP8C6a/8/A06wgNm/llqZfm3Pxy6kXo0snbdM3mlx8
         M0Iv7c2xNVE6Euf+7kXpWaGY4nThnc1NTbX3+D21WrP5obIxynUz8/MQl85mFJYU09Fw
         1bZturHKvAmeiBRBgMOO6hH8SpZn+vPdw/koU9FP7evGEgKwS9vNzUcTLwEm5l2aJLki
         F5S2c3Ff6tt7JzsVTjCq4lGOVQ4sR7+Y4Jk86M7OI5v4qssgdESnq5yjefvVEh+mTMSs
         XicEnsu6jwvIMw3gUAWvVCgWjH0Jrs+QH3ISeg/BOOQypdLBRS2KWizF1raZpyD0I0Zc
         1sQw==
X-Gm-Message-State: AOAM530dSAdjW3Iy2ij4ZOysqIJxJkad8RTBrw0tFnyU7ZuVWm/jSosZ
        KadYOLKOMmtzIsY5YEyEJ+goxR4=
X-Google-Smtp-Source: ABdhPJzJ/aOvpOMypiS7YmUOUcr7cGrxm74otNl6GSmSwuphL4reMsApF68JVR3YLlZVALQSCF8KdA==
X-Received: by 2002:a05:6808:c2:: with SMTP id t2mr7599544oic.44.1592674442594;
        Sat, 20 Jun 2020 10:34:02 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
        by smtp.gmail.com with ESMTPSA id y206sm2128230ooa.32.2020.06.20.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:34:01 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:f17b:b355:b0a4:2592])
        by serve.minyard.net (Postfix) with ESMTPA id 68241180171;
        Sat, 20 Jun 2020 17:34:00 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 1/6] watchdog: Allow a driver to use milliseconds instead of seconds
Date:   Sat, 20 Jun 2020 12:33:46 -0500
Message-Id: <20200620173351.18752-2-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620173351.18752-1-minyard@acm.org>
References: <20200620173351.18752-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

If the WDIOF_MSECTIMER is set, then all the timeouts in the watchdog
structure are expected to be in milliseconds.  Add the flag and the
various conversions.  This should have no effect on existing drivers.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_core.c | 30 +++++++++++++-------
 drivers/watchdog/watchdog_dev.c  | 47 ++++++++++++++++++++++++++------
 include/linux/watchdog.h         | 29 +++++++++++++++-----
 include/uapi/linux/watchdog.h    |  1 +
 4 files changed, 82 insertions(+), 25 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 423844757812..b54451a9a336 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -116,17 +116,17 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
 {
 	const char *dev_str = wdd->parent ? dev_name(wdd->parent) :
 			      (const char *)wdd->info->identity;
-	unsigned int t = 0;
 	int ret = 0;
 
 	watchdog_check_min_max_timeout(wdd);
 
 	/* check the driver supplied value (likely a module parameter) first */
 	if (timeout_parm) {
-		if (!watchdog_timeout_invalid(wdd, timeout_parm)) {
-			wdd->timeout = timeout_parm;
-			return 0;
-		}
+		if (wdd->info->options & WDIOF_MSECTIMER) {
+			if (!_watchdog_timeout_invalid(wdd, timeout_parm))
+				goto set_timeout;
+		} else if (!watchdog_timeout_invalid(wdd, timeout_parm))
+			goto set_timeout;
 		pr_err("%s: driver supplied timeout (%u) out of range\n",
 			dev_str, timeout_parm);
 		ret = -EINVAL;
@@ -134,12 +134,18 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
 
 	/* try to get the timeout_sec property */
 	if (dev && dev->of_node &&
-	    of_property_read_u32(dev->of_node, "timeout-sec", &t) == 0) {
-		if (t && !watchdog_timeout_invalid(wdd, t)) {
-			wdd->timeout = t;
-			return 0;
+	    of_property_read_u32(dev->of_node, "timeout-sec",
+				 &timeout_parm) == 0) {
+		if (timeout_parm &&
+		    !watchdog_timeout_invalid(wdd, timeout_parm)) {
+			if (!(wdd->info->options & WDIOF_MSECTIMER))
+				/* Convert to msecs if not already so. */
+				timeout_parm *= 1000;
+			goto set_timeout;
 		}
-		pr_err("%s: DT supplied timeout (%u) out of range\n", dev_str, t);
+
+		pr_err("%s: DT supplied timeout (%u) out of range\n", dev_str,
+		       timeout_parm);
 		ret = -EINVAL;
 	}
 
@@ -148,6 +154,10 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
 			wdd->timeout);
 
 	return ret;
+
+set_timeout:
+	wdd->timeout = timeout_parm;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(watchdog_init_timeout);
 
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 7e4cd34a8c20..480460b89c16 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -99,7 +99,11 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
 {
 	/* All variables in milli-seconds */
 	unsigned int hm = wdd->max_hw_heartbeat_ms;
-	unsigned int t = wdd->timeout * 1000;
+	unsigned int t = wdd->timeout;
+
+	if (!(wdd->info->options & WDIOF_MSECTIMER))
+		/* Convert to msecs if not already so. */
+		t *= 1000;
 
 	/*
 	 * A worker to generate heartbeat requests is needed if all of the
@@ -121,12 +125,16 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
 static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
 {
 	struct watchdog_core_data *wd_data = wdd->wd_data;
-	unsigned int timeout_ms = wdd->timeout * 1000;
+	unsigned int timeout_ms = wdd->timeout;
 	ktime_t keepalive_interval;
 	ktime_t last_heartbeat, latest_heartbeat;
 	ktime_t virt_timeout;
 	unsigned int hw_heartbeat_ms;
 
+	if (!(wdd->info->options & WDIOF_MSECTIMER))
+		/* Convert to msecs if not already so. */
+		timeout_ms *= 1000;
+
 	if (watchdog_active(wdd))
 		virt_timeout = ktime_add(wd_data->last_keepalive,
 					 ms_to_ktime(timeout_ms));
@@ -137,7 +145,7 @@ static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
 	keepalive_interval = ms_to_ktime(hw_heartbeat_ms / 2);
 
 	/*
-	 * To ensure that the watchdog times out wdd->timeout seconds
+	 * To ensure that the watchdog times out wdd->timeout seconds/msecs
 	 * after the most recent ping from userspace, the last
 	 * worker ping has to come in hw_heartbeat_ms before this timeout.
 	 */
@@ -382,6 +390,8 @@ static int watchdog_set_timeout(struct watchdog_device *wdd,
 	if (watchdog_timeout_invalid(wdd, timeout))
 		return -EINVAL;
 
+	if (wdd->info->options & WDIOF_MSECTIMER)
+		timeout *= 1000;
 	if (wdd->ops->set_timeout) {
 		err = wdd->ops->set_timeout(wdd, timeout);
 	} else {
@@ -413,6 +423,8 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
 	if (watchdog_pretimeout_invalid(wdd, timeout))
 		return -EINVAL;
 
+	if (wdd->info->options & WDIOF_MSECTIMER)
+		timeout *= 1000;
 	if (wdd->ops->set_pretimeout)
 		err = wdd->ops->set_pretimeout(wdd, timeout);
 	else
@@ -440,6 +452,8 @@ static int watchdog_get_timeleft(struct watchdog_device *wdd,
 		return -EOPNOTSUPP;
 
 	*timeleft = wdd->ops->get_timeleft(wdd);
+	if (wdd->info->options & WDIOF_MSECTIMER)
+		*timeleft /= 1000;
 
 	return 0;
 }
@@ -508,8 +522,11 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
 	mutex_lock(&wd_data->lock);
 	status = watchdog_get_timeleft(wdd, &val);
 	mutex_unlock(&wd_data->lock);
-	if (!status)
+	if (!status) {
+		if (wdd->info->options & WDIOF_MSECTIMER)
+			val /= 1000;
 		status = sprintf(buf, "%u\n", val);
+	}
 
 	return status;
 }
@@ -519,8 +536,12 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	unsigned int t = wdd->timeout;
+
+	if (wdd->info->options & WDIOF_MSECTIMER)
+		t /= 1000;
 
-	return sprintf(buf, "%u\n", wdd->timeout);
+	return sprintf(buf, "%u\n", t);
 }
 static DEVICE_ATTR_RO(timeout);
 
@@ -528,8 +549,12 @@ static ssize_t pretimeout_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	unsigned int t = wdd->pretimeout;
 
-	return sprintf(buf, "%u\n", wdd->pretimeout);
+	if (wdd->info->options & WDIOF_MSECTIMER)
+		t /= 1000;
+
+	return sprintf(buf, "%u\n", t);
 }
 static DEVICE_ATTR_RO(pretimeout);
 
@@ -783,7 +808,10 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 			err = -EOPNOTSUPP;
 			break;
 		}
-		err = put_user(wdd->timeout, p);
+		val = wdd->timeout;
+		if (wdd->info->options & WDIOF_MSECTIMER)
+			val /= 1000;
+		err = put_user(val, p);
 		break;
 	case WDIOC_GETTIMELEFT:
 		err = watchdog_get_timeleft(wdd, &val);
@@ -799,7 +827,10 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 		err = watchdog_set_pretimeout(wdd, val);
 		break;
 	case WDIOC_GETPRETIMEOUT:
-		err = put_user(wdd->pretimeout, p);
+		val = wdd->pretimeout;
+		if (wdd->info->options & WDIOF_MSECTIMER)
+			val /= 1000;
+		err = put_user(val, p);
 		break;
 	default:
 		err = -ENOTTY;
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 1464ce6ffa31..49bfaf986b37 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -55,7 +55,9 @@ struct watchdog_ops {
 	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
 };
 
-/** struct watchdog_device - The structure that defines a watchdog device
+/** struct watchdog_device - The structure that defines a watchdog device.
+ * Unless otherwise specified, all timeouts are in seconds unless
+ * WDIOF_MSECTIMER is set, then they are in milliseconds.
  *
  * @id:		The watchdog's ID. (Allocated by watchdog_register_device)
  * @parent:	The parent bus device
@@ -65,10 +67,10 @@ struct watchdog_ops {
  * @ops:	Pointer to the list of watchdog operations.
  * @gov:	Pointer to watchdog pretimeout governor.
  * @bootstatus:	Status of the watchdog device at boot.
- * @timeout:	The watchdog devices timeout value (in seconds).
+ * @timeout:	The watchdog devices timeout value.
  * @pretimeout: The watchdog devices pre_timeout value.
- * @min_timeout:The watchdog devices minimum timeout value (in seconds).
- * @max_timeout:The watchdog devices maximum timeout value (in seconds)
+ * @min_timeout:The watchdog devices minimum timeout value.
+ * @max_timeout:The watchdog devices maximum timeout value
  *		as configurable from user space. Only relevant if
  *		max_hw_heartbeat_ms is not provided.
  * @min_hw_heartbeat_ms:
@@ -156,6 +158,17 @@ static inline void watchdog_stop_on_unregister(struct watchdog_device *wdd)
 	set_bit(WDOG_STOP_ON_UNREGISTER, &wdd->status);
 }
 
+/*
+ * Use the following function to check if a timeout value is
+ * internally consistent with the range parameters.  t is in milliseconds.
+ */
+static inline bool _watchdog_timeout_invalid(struct watchdog_device *wdd, unsigned int t)
+{
+	return  t < wdd->min_timeout ||
+		(!wdd->max_hw_heartbeat_ms && wdd->max_timeout &&
+		 t > wdd->max_timeout);
+}
+
 /* Use the following function to check if a timeout value is invalid */
 static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigned int t)
 {
@@ -170,9 +183,11 @@ static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigne
 	 *   is configured, and the requested value is larger than the
 	 *   configured maximum timeout.
 	 */
-	return t > UINT_MAX / 1000 || t < wdd->min_timeout ||
-		(!wdd->max_hw_heartbeat_ms && wdd->max_timeout &&
-		 t > wdd->max_timeout);
+	if (t > UINT_MAX / 1000)
+		return true;
+	if (wdd->info->options & WDIOF_MSECTIMER)
+		t *= 1000;
+	return _watchdog_timeout_invalid(wdd, t);
 }
 
 /* Use the following function to check if a pretimeout value is invalid */
diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
index b15cde5c9054..feb3bcc46993 100644
--- a/include/uapi/linux/watchdog.h
+++ b/include/uapi/linux/watchdog.h
@@ -48,6 +48,7 @@ struct watchdog_info {
 #define	WDIOF_PRETIMEOUT	0x0200  /* Pretimeout (in seconds), get/set */
 #define	WDIOF_ALARMONLY		0x0400	/* Watchdog triggers a management or
 					   other external alarm not a reboot */
+#define	WDIOF_MSECTIMER		0x0800	/* Driver can use milliseconds for timeouts */
 #define	WDIOF_KEEPALIVEPING	0x8000	/* Keep alive ping reply */
 
 #define	WDIOS_DISABLECARD	0x0001	/* Turn off the watchdog timer */
-- 
2.17.1

