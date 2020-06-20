Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478842025A9
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgFTRfE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:35:04 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36340 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgFTRfD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:35:03 -0400
Received: by mail-oi1-f193.google.com with SMTP id a137so11587106oii.3
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jIos/cHbqrurStkzPZEPZkdct3JfDCiT1Al2g34v7+M=;
        b=sIXqVXclo+4Ck3UmWBwJpEjM7CkUr955y0iqifo5W1GC5s72/oIvM5vc2HLkkTI6xK
         mBgv8FPt6kP79GSevYV+5BLsIKgX185uFW7S1rRckhLqfuqjA8aXSBtS5QIByCirrdIt
         bDIH29yncc4MfCglZPBmLmEzi4dBLN1eYLI+yFeO78/d21bu8oK5aZuYP7EIL/ldJV+z
         J5FLX6V2NAKPUEtKiFPYzvt+IaNgdMOqNpkGEhL2d/Qnocy/LEibPZ2cZejTu1m1sc3Y
         BPCtTRNlXuT9pBT91sQz3ag7vT9VtYjxtK3k3mFrwSBV65t0ps6wiyad54WMA2TARidp
         zp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=jIos/cHbqrurStkzPZEPZkdct3JfDCiT1Al2g34v7+M=;
        b=Hd5K9tRm0NYAp9YtQgTWt38RDY/nFI0ib60SDiHsPHxOAtYzR9uUd3Mn/PNkr5ZFhl
         bGbU1gRcH4KqWHZbIP5wa20B3Q0xxzA0hX+tbiRnILM2h1p1To81f9sFqfWUbtD8j5mg
         Vy5xhSLqcDgyiKRVdo/n1iewx+nXNPoqL7yEt6P9GyAw1MOyYzttdSh1BhMfgCkTpa5U
         bv/aapfJRfMqM2/X8hmhOr2oA/rdCJoFzbLsanQfcBbzZJYIYuTdddTz4sZa9dzRcjhi
         PbhGfTmf/D3lO1/dnrujST4pvDb9MZgCrMF0U9wPYO1r5xHr/ukOoyXct1QmXbFqcM5c
         27XA==
X-Gm-Message-State: AOAM531/mBDaivvh6/pBz5CTAuQguPGv7i+fE2s4Fi4di98jNwjxmFr6
        3YrSxO2cX5Ne+rvZ1qhHAFaQL4w=
X-Google-Smtp-Source: ABdhPJyMI9Agja2ULN/bm4Egbo2YH898dHbUAjVl/L/cn90eadqH8UlZmHFsy5vR/qOhQi/NwX5q/Q==
X-Received: by 2002:aca:d956:: with SMTP id q83mr7020231oig.78.1592674442133;
        Sat, 20 Jun 2020 10:34:02 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
        by smtp.gmail.com with ESMTPSA id w10sm2167357oon.40.2020.06.20.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:34:01 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:f17b:b355:b0a4:2592])
        by serve.minyard.net (Postfix) with ESMTPA id 9377818054B;
        Sat, 20 Jun 2020 17:34:00 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 3/6] watchdog: Add millisecond precision device attributes
Date:   Sat, 20 Jun 2020 12:33:48 -0500
Message-Id: <20200620173351.18752-4-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620173351.18752-1-minyard@acm.org>
References: <20200620173351.18752-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Add timeleft_ms, timeout_ms, and pretimeout_ms that print microsecond
values.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_dev.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index eca13ce1dc91..b82049896204 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -562,6 +562,21 @@ static ssize_t bootstatus_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(bootstatus);
 
+/*
+ * If _ms is in the attribute name, return milliseconds, otherwise
+ * return seconds.
+ */
+static unsigned int conv_time_to_attr_display(struct watchdog_device *wdd,
+					      struct device_attribute *attr,
+					      unsigned int val)
+{
+	bool in_msec = false;
+
+	if (strstr(attr->attr.name, "_ms"))
+		in_msec = true;
+	return watchdog_timeout_toexternal(wdd, in_msec, val);
+}
+
 static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
 {
@@ -575,11 +590,12 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&wd_data->lock);
 	if (!status)
 		status = sprintf(buf, "%u\n",
-				 watchdog_timeout_toexternal(wdd, false, val));
+				 conv_time_to_attr_display(wdd, attr, val));
 
 	return status;
 }
 static DEVICE_ATTR_RO(timeleft);
+static DEVICE_ATTR(timeleft_ms, 0444, timeleft_show, NULL);
 
 static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
@@ -587,9 +603,10 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%u\n",
-		       watchdog_timeout_toexternal(wdd, false, wdd->timeout));
+		       conv_time_to_attr_display(wdd, attr, wdd->timeout));
 }
 static DEVICE_ATTR_RO(timeout);
+static DEVICE_ATTR(timeout_ms, 0444, timeout_show, NULL);
 
 static ssize_t pretimeout_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
@@ -597,10 +614,10 @@ static ssize_t pretimeout_show(struct device *dev,
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%u\n",
-		       watchdog_timeout_toexternal(wdd, false,
-						   wdd->pretimeout));
+		       conv_time_to_attr_display(wdd, attr, wdd->pretimeout));
 }
 static DEVICE_ATTR_RO(pretimeout);
+static DEVICE_ATTR(pretimeout_ms, 0444, pretimeout_show, NULL);
 
 static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
@@ -677,8 +694,11 @@ static struct attribute *wdt_attrs[] = {
 	&dev_attr_state.attr,
 	&dev_attr_identity.attr,
 	&dev_attr_timeout.attr,
+	&dev_attr_timeout_ms.attr,
 	&dev_attr_pretimeout.attr,
+	&dev_attr_pretimeout_ms.attr,
 	&dev_attr_timeleft.attr,
+	&dev_attr_timeleft_ms.attr,
 	&dev_attr_bootstatus.attr,
 	&dev_attr_status.attr,
 	&dev_attr_nowayout.attr,
-- 
2.17.1

