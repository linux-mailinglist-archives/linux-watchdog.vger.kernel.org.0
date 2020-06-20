Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1523C2025B5
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgFTRuO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:14 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:45114 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgFTRuN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:13 -0400
Received: by mail-oo1-f66.google.com with SMTP id k7so2536859ooo.12
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9UxhjSoE82TmEXppeCDn14Vvto0FXpWKoJEeMHzGlYo=;
        b=UekCF6s7D3qzXwRvg84H2d03EQWIOEb6dc3Lu1zHaxHJeqxWiExJrBIVtSoDmf5QQl
         GDwscbKXnH8Wcoqjx1RT11BsIk643BJTD4vsxgKV47iMh+yw4k0bzNrhJnals2gUE5vZ
         6Bgh6iS9o7viXmuSaEhZykiDtNUs/LHKZCjH1WaR7U7AWALq/rmSv2pXW3QvcwYojt+B
         Cb8VnFZcsUAglzAXXBMkCj/87ZbyTRLw7wgi60ZZlmiaI+Dquqw9J1A0FllwF5OeIcVR
         ddyC5NrDSFLRVL79vpdYdL9UTKklPaIkCXTnKpWk4r9yFs+UOvJLoU2/bPZX7iEkOyGE
         vJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=9UxhjSoE82TmEXppeCDn14Vvto0FXpWKoJEeMHzGlYo=;
        b=JsnOfHaeRTC6iYqOeAHH68S05Wrx2gRrAzCRwAYYazBRAU6BN3gcKPwiwqN/8c0yPT
         VwldKyjC7WdFY3P3rbxXgbF7Hf6HToagnl9V0Zwbyy5PwFuIFs0Gz4DdjbMHdIsP1agY
         k4exCuA5KbrmFfbuOQmtWDAxGJ8rTuRw0tzUGDZjN2D70SPEcvN4fSZsir9XX+lfno/S
         bgin5DREEjoso0fmTal9absa2zvbP3wiKmYrwQ9JMoHfaOqFYoOebN0McnNSHenCBJEd
         1mCi3DSKxS1j8LbnpvHWTnVP1UgTVPqSdnANx4xWscgSRwvZkgZis+a4oVaWvmi+1M4V
         ksBw==
X-Gm-Message-State: AOAM532fZMK/hNTfHt5z+Tinx3xb3cNOyLuQW8OOoJ+LXqvZaNOen4Go
        1AQzotdkCdtJ+BDE+vH6VJblE8M=
X-Google-Smtp-Source: ABdhPJzhyC/dF1sfvjhicBX2eMfArY8Ag0C+jhIh52nMNtfIUPR0JkPhRKWCAD87Z269iK+sY7m+4w==
X-Received: by 2002:a4a:e496:: with SMTP id s22mr8167459oov.67.1592675352862;
        Sat, 20 Jun 2020 10:49:12 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
        by smtp.gmail.com with ESMTPSA id w19sm298243otj.10.2020.06.20.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:12 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id 89471180545;
        Sat, 20 Jun 2020 17:49:11 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 02/10] watchdog: Add read capability
Date:   Sat, 20 Jun 2020 12:48:59 -0500
Message-Id: <20200620174907.20229-3-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Allow read, poll, and fasync calls on the watchdog device to be passed
to the driver.  This is so the IPMI driver can be moved over to the
watchdog framework, as it has the ability to have a read return when
data comes in on the watchdog.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_dev.c | 45 +++++++++++++++++++++++++++++++++
 include/linux/watchdog.h        |  8 ++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 7e4cd34a8c20..45a0a4fe731d 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -698,6 +698,48 @@ static ssize_t watchdog_write(struct file *file, const char __user *data,
 	return len;
 }
 
+/*
+ *	watchdog_read: Pass a read on to the device if it accepts it
+ *	@file: file handle to the device
+ *	@buf: the buffer to read into
+ *	@count: the size of buf in bytes
+ *      @ppos: pointer to the file offset
+ *
+ *	The watchdog API defines a common set of functions for all watchdogs
+ *	according to their available features.
+ */
+
+static ssize_t watchdog_read(struct file *file, char __user *buf,
+			     size_t count, loff_t *ppos)
+{
+	struct watchdog_core_data *wd_data = file->private_data;
+	struct watchdog_device *wdd = wd_data->wdd;
+
+	if (!wdd->ops->read)
+		return -EINVAL;
+	return wdd->ops->read(wdd, file, buf, count, ppos);
+}
+
+static __poll_t watchdog_poll(struct file *file, poll_table *wait)
+{
+	struct watchdog_core_data *wd_data = file->private_data;
+	struct watchdog_device *wdd = wd_data->wdd;
+
+	if (!wdd->ops->poll)
+		return DEFAULT_POLLMASK;
+	return wdd->ops->poll(wdd, file, wait);
+}
+
+static int watchdog_fasync(int fd, struct file *file, int on)
+{
+	struct watchdog_core_data *wd_data = file->private_data;
+	struct watchdog_device *wdd = wd_data->wdd;
+
+	if (!wdd->ops->fasync)
+		return 0;
+	return wdd->ops->fasync(wdd, fd, file, on);
+}
+
 /*
  *	watchdog_ioctl: handle the different ioctl's for the watchdog device.
  *	@file: file handle to the device
@@ -951,6 +993,9 @@ static int watchdog_release(struct inode *inode, struct file *file)
 static const struct file_operations watchdog_fops = {
 	.owner		= THIS_MODULE,
 	.write		= watchdog_write,
+	.read		= watchdog_read,
+	.poll		= watchdog_poll,
+	.fasync		= watchdog_fasync,
 	.unlocked_ioctl	= watchdog_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 	.open		= watchdog_open,
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 1464ce6ffa31..36f99c8c973e 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/notifier.h>
+#include <linux/poll.h>
 #include <uapi/linux/watchdog.h>
 
 struct watchdog_ops;
@@ -34,6 +35,9 @@ struct watchdog_governor;
  * @get_timeleft:The routine that gets the time left before a reset (in seconds).
  * @restart:	The routine for restarting the machine.
  * @ioctl:	The routines that handles extra ioctl calls.
+ * @read:	Call this is not NULL and a read comes in on the watchdog dev.
+ * @poll:	Call this is not NULL and a poll comes in on the watchdog dev.
+ * @fasync:	Call this is not NULL and a fasync comes in on the watchdog dev.
  *
  * The watchdog_ops structure contains a list of low-level operations
  * that control a watchdog device. It also contains the module that owns
@@ -53,6 +57,10 @@ struct watchdog_ops {
 	unsigned int (*get_timeleft)(struct watchdog_device *);
 	int (*restart)(struct watchdog_device *, unsigned long, void *);
 	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
+	ssize_t (*read)(struct watchdog_device *, struct file *, char __user *,
+			size_t, loff_t *);
+	__poll_t (*poll)(struct watchdog_device *, struct file *, poll_table *);
+	int (*fasync)(struct watchdog_device *, int, struct file *, int);
 };
 
 /** struct watchdog_device - The structure that defines a watchdog device
-- 
2.17.1

