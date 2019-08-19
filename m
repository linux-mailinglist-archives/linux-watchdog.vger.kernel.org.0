Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA1594F21
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbfHSUhR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:17 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45965 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfHSUhQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:16 -0400
Received: by mail-oi1-f193.google.com with SMTP id v12so2355506oic.12
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=QhoBQQ6l9oUi8mNhEv5RMMIQeW5JDhE0xlxpkZyDFS4=;
        b=L8JavJtTgse9YOJRhbFCvvX6TxHvPuJRzUBPp3OPVUeEgXvgcntj7jl7PaFeRhzZ6/
         6QnWk3W/yjzVutHi0HSyL7huQhitbO96Cyve2nIA+t0IOu8fS1nXE4d93zJFQnLZAipY
         /iT6fvl5w4PwRI5Ok7A8VKbUbes3QSx1brlpn0+EGJ3U38+FY3ilNxx2JrIn1q3t5YCS
         ym9M0/J9Ay+osWIbzlX7RpJJxWMgzkYhcD/t7fqKbPzpzj2OiNjCCfnmRrdtvYiBUpAj
         ohIxo1+jCIWKsLwzywQtua6WwW34jpQaYZhJvlbEPMidmq+ODZa2/U76E0SCV81VQ8Oh
         q5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=QhoBQQ6l9oUi8mNhEv5RMMIQeW5JDhE0xlxpkZyDFS4=;
        b=ERabBBZyQ6GLgQff193E9npr9bGAbGOx6oYIcaz9GRpFGvIVUiGhLjetyw825PSS6t
         Hy8lIoNI8ybM+Uq6eAuvlpwht0Qx17wxCEuMr0tdgl5697iBLp77opv7Ki6xlU2Yq1+B
         zCFHNgFrC7NnWqjuno+LBNvK0v3MDSpVhifRcRT8e5yT7NLahE8autnfV+BQ8972PMl3
         sHNVu0qOTDVy33y4dIF7Tcyziq9mIIj7YA5/RYf0Qdjk07H8CqhJNdhGMn3lXBV1Ella
         GJMHtCMQumU3a50G5smmT38pNGMJLAS9LpjjygBWwmh0BTLbHHxX0n2+y7UfUxw5ZfzV
         eQbw==
X-Gm-Message-State: APjAAAUwHQZW3+jEOatLDZbmtkF6VVXRopNohhL8yk+rTRx48W1iKlLP
        FciF40LKIfp1KZMn9x7bhA==
X-Google-Smtp-Source: APXvYqySq8xAc/CbPL0q1q/EHBG+E0EwI1s2eJFmWnC6zwwo+Zujiqiq+h2pm/62uFVowCQRx89AjQ==
X-Received: by 2002:aca:5e06:: with SMTP id s6mr15037232oib.171.1566247034896;
        Mon, 19 Aug 2019 13:37:14 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id 13sm5886029otv.14.2019.08.19.13.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:14 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id 145B41800D5;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id E4F5D30232A; Mon, 19 Aug 2019 15:37:13 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 02/12] watchdog: Add the ability to provide data to read
Date:   Mon, 19 Aug 2019 15:37:01 -0500
Message-Id: <20190819203711.32599-3-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819203711.32599-1-minyard@acm.org>
References: <20190819203711.32599-1-minyard@acm.org>
Reply-To: "[PATCH 00/12]"@minyard.net, Convert@minyard.net,
          the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
          to@minyard.net, the@minyard.net, standard@minyard.net,
          interface@minyard.net
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

This is for the read data pretimeout governor.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_core.c |   3 +
 drivers/watchdog/watchdog_dev.c  | 113 +++++++++++++++++++++++++++++++
 include/linux/watchdog.h         |   5 ++
 3 files changed, 121 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 21e8085b848b..80149ac229fc 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -216,6 +216,9 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 		return id;
 	wdd->id = id;
 
+	spin_lock_init(&wdd->readlock);
+	init_waitqueue_head(&wdd->read_q);
+
 	ret = watchdog_dev_register(wdd);
 	if (ret) {
 		ida_simple_remove(&watchdog_ida, id);
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index dbd2ad4c9294..8e8304607a8c 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -44,6 +44,8 @@
 #include <linux/types.h>	/* For standard types (like size_t) */
 #include <linux/watchdog.h>	/* For watchdog specific items */
 #include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
+#include <linux/poll.h>		/* For poll_table/... */
+#include <linux/sched/signal.h>	/* For signal_pending */
 
 #include <uapi/linux/sched/types.h>	/* For struct sched_param */
 
@@ -929,12 +931,120 @@ static int watchdog_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static ssize_t watchdog_read(struct file *file,
+			     char        __user *buf,
+			     size_t      count,
+			     loff_t      *ppos)
+{
+	struct watchdog_core_data *wd_data = file->private_data;
+	struct watchdog_device *wdd;
+	int err = 0;
+	wait_queue_entry_t wait;
+	char dummy = 1;
+
+	if (count <= 0)
+		return 0;
+
+	mutex_lock(&wd_data->lock);
+
+	wdd = wd_data->wdd;
+	if (!wdd)
+		goto done;
+
+	/*
+	 * Reading returns if the pretimeout has gone off, and it only does
+	 * it once per pretimeout.
+	 */
+	spin_lock_irq(&wdd->readlock);
+	while (!wdd->data_to_read) {
+		if (file->f_flags & O_NONBLOCK) {
+			err = -EAGAIN;
+			goto out;
+		}
+
+		init_waitqueue_entry(&wait, current);
+		add_wait_queue(&wdd->read_q, &wait);
+		set_current_state(TASK_INTERRUPTIBLE);
+		spin_unlock_irq(&wdd->readlock);
+		schedule();
+		spin_lock_irq(&wdd->readlock);
+		remove_wait_queue(&wdd->read_q, &wait);
+
+		if (signal_pending(current)) {
+			err = -ERESTARTSYS;
+			goto out;
+		}
+	}
+	dummy = wdd->data_to_read;
+	wdd->data_to_read = 0;
+
+ out:
+	spin_unlock_irq(&wdd->readlock);
+
+	if (err == 0) {
+		if (copy_to_user(buf, &dummy, 1))
+			err = -EFAULT;
+		else
+			err = 1;
+	}
+
+ done:
+	mutex_unlock(&wd_data->lock);
+
+	return err;
+}
+
+static __poll_t watchdog_poll(struct file *file, poll_table *wait)
+{
+	struct watchdog_core_data *wd_data = file->private_data;
+	struct watchdog_device *wdd;
+	__poll_t mask = 0;
+
+	mutex_lock(&wd_data->lock);
+
+	wdd = wd_data->wdd;
+	if (!wdd)
+		goto done;
+
+	poll_wait(file, &wdd->read_q, wait);
+
+	spin_lock_irq(&wdd->readlock);
+	if (wdd->data_to_read)
+		mask |= (EPOLLIN | EPOLLRDNORM);
+	spin_unlock_irq(&wdd->readlock);
+
+done:
+	mutex_unlock(&wd_data->lock);
+	return mask;
+}
+
+static int watchdog_fasync(int fd, struct file *file, int on)
+{
+	struct watchdog_core_data *wd_data = file->private_data;
+	struct watchdog_device *wdd;
+	int err = -ENODEV;
+
+	mutex_lock(&wd_data->lock);
+
+	wdd = wd_data->wdd;
+	if (!wdd)
+		goto done;
+
+	err = fasync_helper(fd, file, on, &wdd->fasync_q);
+done:
+	mutex_unlock(&wd_data->lock);
+	return err;
+}
+
 static const struct file_operations watchdog_fops = {
 	.owner		= THIS_MODULE,
 	.write		= watchdog_write,
 	.unlocked_ioctl	= watchdog_ioctl,
 	.open		= watchdog_open,
 	.release	= watchdog_release,
+	.read		= watchdog_read,
+	.poll		= watchdog_poll,
+	.fasync		= watchdog_fasync,
 };
 
 static struct miscdevice watchdog_miscdev = {
@@ -970,6 +1080,9 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
 	if (IS_ERR_OR_NULL(watchdog_kworker))
 		return -ENODEV;
 
+	spin_lock_init(&wdd->readlock);
+	init_waitqueue_head(&wdd->read_q);
+
 	kthread_init_work(&wd_data->work, watchdog_ping_work);
 	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	wd_data->timer.function = watchdog_timer_expired;
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 417d9f37077a..e34501a822f0 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -117,6 +117,11 @@ struct watchdog_device {
 #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
 #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
 	struct list_head deferred;
+
+	spinlock_t readlock;
+	bool data_to_read;
+	struct wait_queue_head read_q;
+	struct fasync_struct *fasync_q;
 };
 
 #define WATCHDOG_NOWAYOUT		IS_BUILTIN(CONFIG_WATCHDOG_NOWAYOUT)
-- 
2.17.1

