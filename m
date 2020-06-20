Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490E72025BE
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgFTRuU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:20 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45905 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728381AbgFTRuT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:19 -0400
Received: by mail-ot1-f68.google.com with SMTP id m2so9801625otr.12
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nK+mVF9ZQV0dr81AyPeFSL6mPMdD5C2OQ3fEkI0R0m0=;
        b=dPlK26Ms53JnKa5FcI5IFSPZ9eyYhE36FQjOY+UzsUKdBpykpaqF/EhvQLoq3i2qX5
         VVyCpRmNZhPoWr5xGGMufLF33KiT9tqtNwzIH9yWML5Hey0XeRgN6qgpVcOEDrUnovUR
         H/nI4smtT7E2fi+iM2n9iD9Pqv/6xI5NQEQ3Fzas8ZdBWJGiEjcTGpJ4GDmg7sVzmJwD
         D+svfjm+di5yrm58Ei5Fbi6cXj7BjYH55HWs3j2cnOhlpk/o29WJAsAuFXesb3Utw/qG
         SmibIKvzq7FUi9cJSgJ0T45k7EyL93cLKZ0X8T3nsX11rJiBUU9lkWLK5RTn3/vVzY4l
         7t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nK+mVF9ZQV0dr81AyPeFSL6mPMdD5C2OQ3fEkI0R0m0=;
        b=Jtg6EpO1H0NX1BvykTXzO6toVd16Du+Cvxun1LuaAXwOhUj5T6zokZTIdELjvTdsxg
         5iARByybXAMybUzwTxzvq7xQmSTe9TkP+t203iFjmlXgvkaFfPnk6GfqpWJ5DVPsdvrp
         f4q+n7RSTLC9XyTJFb3spZI9X01Oagka/y6E9KCAt+VifGzYpyywJMCesmex02ehZRGe
         t6OLBdF8VTsMhUm1+2FUt1m6kfpyy4XACIjjRCp5LUJL/bggrQijZaz7/Vkutks41RWa
         LoUmO0/hWQyD4TkBBmISHAviNvgtEhW4CgtS3ZRPzjTZELmaDuSFMKmRrs9a+iflrPDg
         7sVg==
X-Gm-Message-State: AOAM530Ku60F1UB4+Od2NqOR7ehclM+ZQJheBYXdM1UtUrxy1v93pdRy
        hLzam+h1wEI4YZPX/ytD7w==
X-Google-Smtp-Source: ABdhPJyjegTKtwpTOY4XHo/rhDg0aIxxQBW2s0yA69ynK8Yu0w/cy3uEiK/r9liQVirElBqnJaSdHg==
X-Received: by 2002:a9d:6c03:: with SMTP id f3mr7697909otq.291.1592675357150;
        Sat, 20 Jun 2020 10:49:17 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
        by smtp.gmail.com with ESMTPSA id o2sm2057599ota.14.2020.06.20.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:14 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id CA4B7180561;
        Sat, 20 Jun 2020 17:49:11 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 06/10] ipmi:watchdog: Convert over to the watchdog framework
Date:   Sat, 20 Jun 2020 12:49:03 -0500
Message-Id: <20200620174907.20229-7-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Use the standard watchdog framework for the IPMI watchdog.  This reduces
complexity and should avoid issues with interactions between the IPMI
watchdog and other watchdogs.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_watchdog.c | 381 ++++++++++++------------------
 1 file changed, 153 insertions(+), 228 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/char/ipmi/ipmi_watchdog.c
index 55986e10a124..9265a5145691 100644
--- a/drivers/char/ipmi/ipmi_watchdog.c
+++ b/drivers/char/ipmi/ipmi_watchdog.c
@@ -19,7 +19,6 @@
 #include <linux/ipmi_smi.h>
 #include <linux/mutex.h>
 #include <linux/watchdog.h>
-#include <linux/miscdevice.h>
 #include <linux/init.h>
 #include <linux/completion.h>
 #include <linux/kdebug.h>
@@ -122,7 +121,11 @@
 
 #define IPMI_WDOG_TIMER_NOT_INIT_RESP	0x80
 
+/* Forward declaration. */
+static struct watchdog_device ipmi_wdd;
+
 static DEFINE_MUTEX(ipmi_watchdog_mutex);
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
 static struct ipmi_user *watchdog_user;
@@ -154,7 +157,6 @@ static char data_to_read;
 static DECLARE_WAIT_QUEUE_HEAD(read_q);
 static struct fasync_struct *fasync_q;
 static atomic_t pretimeout_since_last_heartbeat;
-static char expect_close;
 
 static int ifnum_to_use = -1;
 
@@ -163,7 +165,6 @@ static int ifnum_to_use = -1;
 #define IPMI_SET_TIMEOUT_HB_IF_NECESSARY	1
 #define IPMI_SET_TIMEOUT_FORCE_HB		2
 
-static int ipmi_set_timeout(int do_heartbeat);
 static void ipmi_register_watchdog(int ipmi_intf);
 static void ipmi_unregister_watchdog(int ipmi_intf);
 
@@ -175,19 +176,24 @@ static int start_now;
 
 static int set_param_timeout(const char *val, const struct kernel_param *kp)
 {
-	char *endp;
-	int  l;
+	unsigned long l;
 	int  rv = 0;
+	int *ptr;
 
 	if (!val)
 		return -EINVAL;
-	l = simple_strtoul(val, &endp, 0);
-	if (endp == val)
-		return -EINVAL;
+	rv = kstrtoul(val, 0, &l);
+	if (rv)
+		return rv;
 
-	*((int *)kp->arg) = l;
-	if (watchdog_user)
-		rv = ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+	ptr = (int *) kp->arg;
+	*ptr = l;
+	if (watchdog_user) {
+		if (ptr == &pretimeout)
+			rv = watchdog_set_pretimeout(&ipmi_wdd, l);
+		else if (ptr == &timeout)
+			rv = watchdog_set_timeout(&ipmi_wdd, l);
+	}
 
 	return rv;
 }
@@ -223,7 +229,7 @@ static int set_param_str(const char *val, const struct kernel_param *kp)
 
 	check_parms();
 	if (watchdog_user)
-		rv = ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+		rv = watchdog_set_timeout(&ipmi_wdd, ipmi_wdd.timeout);
 
  out:
 	return rv;
@@ -266,6 +272,38 @@ static const struct kernel_param_ops param_ops_str = {
 	.get = get_param_str,
 };
 
+static int set_param_nowayout(const char *val, const struct kernel_param *kp)
+{
+	unsigned long l;
+	int rv;
+
+	if (!val)
+		return -EINVAL;
+	if (val[0] == 'Y' || val[0] == 'y')
+		l = true;
+	else if (val[0] == 'N' || val[0] == 'n')
+		l = false;
+	else {
+		rv = kstrtoul(val, 0, &l);
+		if (rv)
+			return rv;
+	}
+
+	nowayout = l;
+	if (nowayout)
+		set_bit(WDOG_NO_WAY_OUT, &ipmi_wdd.status);
+	else
+		clear_bit(WDOG_NO_WAY_OUT, &ipmi_wdd.status);
+
+	return 0;
+}
+
+static const struct kernel_param_ops param_ops_nowayout = {
+	.set = set_param_nowayout,
+	.get = param_get_bool,
+};
+#define param_check_nowayout param_check_bool
+
 module_param(ifnum_to_use, wdog_ifnum, 0644);
 MODULE_PARM_DESC(ifnum_to_use, "The interface number to use for the watchdog "
 		 "timer.  Setting to -1 defaults to the first registered "
@@ -296,24 +334,13 @@ module_param(start_now, int, 0444);
 MODULE_PARM_DESC(start_now, "Set to 1 to start the watchdog as"
 		 "soon as the driver is loaded.");
 
-module_param(nowayout, bool, 0644);
+module_param(nowayout, nowayout, 0644);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
 		 "(default=CONFIG_WATCHDOG_NOWAYOUT)");
 
 /* Default state of the timer. */
 static unsigned char ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
 
-/* Is someone using the watchdog?  Only one user is allowed. */
-static unsigned long ipmi_wdog_open;
-
-/*
- * If set to 1, the heartbeat command will set the state to reset and
- * start the timer.  The timer doesn't normally run when the driver is
- * first opened until the heartbeat is set the first time, this
- * variable is used to accomplish this.
- */
-static int ipmi_start_timer_on_heartbeat;
-
 /* IPMI version of the BMC. */
 static unsigned char ipmi_version_major;
 static unsigned char ipmi_version_minor;
@@ -326,7 +353,7 @@ static int testing_nmi;
 static int nmi_handler_registered;
 #endif
 
-static int __ipmi_heartbeat(void);
+static int __ipmi_heartbeat(struct watchdog_device *wdd);
 
 /*
  * We use a mutex to make sure that only one thing can send a set a
@@ -352,7 +379,8 @@ static struct ipmi_recv_msg recv_msg = {
 	.done = msg_free_recv
 };
 
-static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
+static int __ipmi_set_timeout(struct watchdog_device *wdd,
+			      struct ipmi_smi_msg  *smi_msg,
 			      struct ipmi_recv_msg *recv_msg,
 			      int                  *send_heartbeat_now)
 {
@@ -380,15 +408,16 @@ static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
 
 	data[1] = 0;
 	WDOG_SET_TIMEOUT_ACT(data[1], ipmi_watchdog_state);
-	if ((pretimeout > 0) && (ipmi_watchdog_state != WDOG_TIMEOUT_NONE)) {
-	    WDOG_SET_PRETIMEOUT_ACT(data[1], preaction_val);
-	    data[2] = pretimeout;
+	if ((wdd->pretimeout > 0) &&
+	    (ipmi_watchdog_state != WDOG_TIMEOUT_NONE)) {
+		WDOG_SET_PRETIMEOUT_ACT(data[1], preaction_val);
+		data[2] = wdd->pretimeout;
 	} else {
 	    WDOG_SET_PRETIMEOUT_ACT(data[1], WDOG_PRETIMEOUT_NONE);
 	    data[2] = 0; /* No pretimeout. */
 	}
 	data[3] = 0;
-	WDOG_SET_TIMEOUT(data[4], data[5], timeout);
+	WDOG_SET_TIMEOUT(data[4], data[5], wdd->timeout);
 
 	addr.addr_type = IPMI_SYSTEM_INTERFACE_ADDR_TYPE;
 	addr.channel = IPMI_BMC_CHANNEL;
@@ -414,7 +443,7 @@ static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
 	return rv;
 }
 
-static int _ipmi_set_timeout(int do_heartbeat)
+static int _ipmi_set_timeout(struct watchdog_device *wdd, int do_heartbeat)
 {
 	int send_heartbeat_now;
 	int rv;
@@ -424,8 +453,7 @@ static int _ipmi_set_timeout(int do_heartbeat)
 
 	atomic_set(&msg_tofree, 2);
 
-	rv = __ipmi_set_timeout(&smi_msg,
-				&recv_msg,
+	rv = __ipmi_set_timeout(wdd, &smi_msg, &recv_msg,
 				&send_heartbeat_now);
 	if (rv)
 		return rv;
@@ -435,17 +463,17 @@ static int _ipmi_set_timeout(int do_heartbeat)
 	if ((do_heartbeat == IPMI_SET_TIMEOUT_FORCE_HB)
 		|| ((send_heartbeat_now)
 		    && (do_heartbeat == IPMI_SET_TIMEOUT_HB_IF_NECESSARY)))
-		rv = __ipmi_heartbeat();
+		rv = __ipmi_heartbeat(wdd);
 
 	return rv;
 }
 
-static int ipmi_set_timeout(int do_heartbeat)
+static int ipmi_set_timeout(struct watchdog_device *wdd, int do_heartbeat)
 {
 	int rv;
 
 	mutex_lock(&ipmi_watchdog_mutex);
-	rv = _ipmi_set_timeout(do_heartbeat);
+	rv = _ipmi_set_timeout(wdd, do_heartbeat);
 	mutex_unlock(&ipmi_watchdog_mutex);
 
 	return rv;
@@ -525,9 +553,8 @@ static void panic_halt_ipmi_set_timeout(void)
 	while (atomic_read(&panic_done_count) != 0)
 		ipmi_poll_interface(watchdog_user);
 	atomic_add(1, &panic_done_count);
-	rv = __ipmi_set_timeout(&panic_halt_smi_msg,
-				&panic_halt_recv_msg,
-				&send_heartbeat_now);
+	rv = __ipmi_set_timeout(&ipmi_wdd, &panic_halt_smi_msg,
+				&panic_halt_recv_msg, &send_heartbeat_now);
 	if (rv) {
 		atomic_sub(1, &panic_done_count);
 		pr_warn("Unable to extend the watchdog timeout\n");
@@ -539,7 +566,7 @@ static void panic_halt_ipmi_set_timeout(void)
 		ipmi_poll_interface(watchdog_user);
 }
 
-static int __ipmi_heartbeat(void)
+static int __ipmi_heartbeat(struct watchdog_device *wdd)
 {
 	struct kernel_ipmi_msg msg;
 	int rv;
@@ -596,7 +623,7 @@ static int __ipmi_heartbeat(void)
 		 * in this process, so must say no heartbeat to avoid a
 		 * deadlock on this mutex
 		 */
-		rv = _ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
+		rv = _ipmi_set_timeout(wdd, IPMI_SET_TIMEOUT_NO_HB);
 		if (rv) {
 			pr_err("Unable to send the command to set the watchdog's settings, giving up\n");
 			goto out;
@@ -617,165 +644,87 @@ static int __ipmi_heartbeat(void)
 	return rv;
 }
 
-static int _ipmi_heartbeat(void)
+static int _ipmi_heartbeat(struct watchdog_device *wdd)
 {
 	int rv;
 
 	if (!watchdog_user)
 		return -ENODEV;
 
-	if (ipmi_start_timer_on_heartbeat) {
-		ipmi_start_timer_on_heartbeat = 0;
-		ipmi_watchdog_state = action_val;
-		rv = _ipmi_set_timeout(IPMI_SET_TIMEOUT_FORCE_HB);
-	} else if (atomic_cmpxchg(&pretimeout_since_last_heartbeat, 1, 0)) {
-		/*
-		 * A pretimeout occurred, make sure we set the timeout.
-		 * We don't want to set the action, though, we want to
-		 * leave that alone (thus it can't be combined with the
-		 * above operation.
-		 */
-		rv = _ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+	if (atomic_cmpxchg(&pretimeout_since_last_heartbeat, 1, 0)) {
+		/* A pretimeout occurred, make sure we set the timeout. */
+		rv = _ipmi_set_timeout(wdd, IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
 	} else {
-		rv = __ipmi_heartbeat();
+		rv = __ipmi_heartbeat(wdd);
 	}
 
 	return rv;
 }
 
-static int ipmi_heartbeat(void)
+static int ipmi_wdog_set_timeout(struct watchdog_device *wdd,
+				 unsigned int timeout)
 {
 	int rv;
 
 	mutex_lock(&ipmi_watchdog_mutex);
-	rv = _ipmi_heartbeat();
+	wdd->timeout = timeout;
+	rv = _ipmi_set_timeout(wdd, IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
 	mutex_unlock(&ipmi_watchdog_mutex);
 
 	return rv;
 }
 
-static struct watchdog_info ident = {
-	.options	= 0,	/* WDIOF_SETTIMEOUT, */
-	.firmware_version = 1,
-	.identity	= "IPMI"
-};
-
-static int ipmi_ioctl(struct file *file,
-		      unsigned int cmd, unsigned long arg)
+static int ipmi_wdog_set_pretimeout(struct watchdog_device *wdd,
+				    unsigned int pretimeout)
 {
-	void __user *argp = (void __user *)arg;
-	int i;
-	int val;
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		i = copy_to_user(argp, &ident, sizeof(ident));
-		return i ? -EFAULT : 0;
-
-	case WDIOC_SETTIMEOUT:
-		i = copy_from_user(&val, argp, sizeof(int));
-		if (i)
-			return -EFAULT;
-		timeout = val;
-		return _ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
-
-	case WDIOC_GETTIMEOUT:
-		i = copy_to_user(argp, &timeout, sizeof(timeout));
-		if (i)
-			return -EFAULT;
-		return 0;
-
-	case WDIOC_SETPRETIMEOUT:
-		i = copy_from_user(&val, argp, sizeof(int));
-		if (i)
-			return -EFAULT;
-		pretimeout = val;
-		return _ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
-
-	case WDIOC_GETPRETIMEOUT:
-		i = copy_to_user(argp, &pretimeout, sizeof(pretimeout));
-		if (i)
-			return -EFAULT;
-		return 0;
-
-	case WDIOC_KEEPALIVE:
-		return _ipmi_heartbeat();
-
-	case WDIOC_SETOPTIONS:
-		i = copy_from_user(&val, argp, sizeof(int));
-		if (i)
-			return -EFAULT;
-		if (val & WDIOS_DISABLECARD) {
-			ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
-			_ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
-			ipmi_start_timer_on_heartbeat = 0;
-		}
-
-		if (val & WDIOS_ENABLECARD) {
-			ipmi_watchdog_state = action_val;
-			_ipmi_set_timeout(IPMI_SET_TIMEOUT_FORCE_HB);
-		}
-		return 0;
+	int rv;
 
-	case WDIOC_GETSTATUS:
-		val = 0;
-		i = copy_to_user(argp, &val, sizeof(val));
-		if (i)
-			return -EFAULT;
-		return 0;
+	mutex_lock(&ipmi_watchdog_mutex);
+	wdd->pretimeout = pretimeout;
+	rv = _ipmi_set_timeout(wdd, IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+	mutex_unlock(&ipmi_watchdog_mutex);
 
-	default:
-		return -ENOIOCTLCMD;
-	}
+	return rv;
 }
 
-static long ipmi_unlocked_ioctl(struct file *file,
-				unsigned int cmd,
-				unsigned long arg)
+static int ipmi_wdog_start(struct watchdog_device *wdd)
 {
-	int ret;
+	int rv;
 
 	mutex_lock(&ipmi_watchdog_mutex);
-	ret = ipmi_ioctl(file, cmd, arg);
+	ipmi_watchdog_state = action_val;
+	rv = _ipmi_set_timeout(wdd, IPMI_SET_TIMEOUT_FORCE_HB);
 	mutex_unlock(&ipmi_watchdog_mutex);
 
-	return ret;
+	return rv;
 }
 
-static ssize_t ipmi_write(struct file *file,
-			  const char  __user *buf,
-			  size_t      len,
-			  loff_t      *ppos)
+static int ipmi_wdog_ping(struct watchdog_device *wdd)
 {
 	int rv;
 
-	if (len) {
-		if (!nowayout) {
-			size_t i;
+	mutex_lock(&ipmi_watchdog_mutex);
+	rv = _ipmi_heartbeat(wdd);
+	mutex_unlock(&ipmi_watchdog_mutex);
 
-			/* In case it was set long ago */
-			expect_close = 0;
+	return rv;
+}
 
-			for (i = 0; i != len; i++) {
-				char c;
+static int ipmi_wdog_stop(struct watchdog_device *wdd)
+{
+	mutex_lock(&ipmi_watchdog_mutex);
+	ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
+	_ipmi_set_timeout(wdd, IPMI_SET_TIMEOUT_NO_HB);
+	mutex_unlock(&ipmi_watchdog_mutex);
 
-				if (get_user(c, buf + i))
-					return -EFAULT;
-				if (c == 'V')
-					expect_close = 42;
-			}
-		}
-		rv = ipmi_heartbeat();
-		if (rv)
-			return rv;
-	}
-	return len;
+	return 0;
 }
 
-static ssize_t ipmi_read(struct file *file,
-			 char        __user *buf,
-			 size_t      count,
-			 loff_t      *ppos)
+static ssize_t ipmi_wdog_read(struct watchdog_device *wdd,
+			      struct file *file,
+			      char        __user *buf,
+			      size_t      count,
+			      loff_t      *ppos)
 {
 	int          rv = 0;
 	wait_queue_entry_t wait;
@@ -824,27 +773,8 @@ static ssize_t ipmi_read(struct file *file,
 	return rv;
 }
 
-static int ipmi_open(struct inode *ino, struct file *filep)
-{
-	switch (iminor(ino)) {
-	case WATCHDOG_MINOR:
-		if (test_and_set_bit(0, &ipmi_wdog_open))
-			return -EBUSY;
-
-
-		/*
-		 * Don't start the timer now, let it start on the
-		 * first heartbeat.
-		 */
-		ipmi_start_timer_on_heartbeat = 1;
-		return stream_open(ino, filep);
-
-	default:
-		return (-ENODEV);
-	}
-}
-
-static __poll_t ipmi_poll(struct file *file, poll_table *wait)
+static __poll_t ipmi_wdog_poll(struct watchdog_device *wdd,
+			       struct file *file, poll_table *wait)
 {
 	__poll_t mask = 0;
 
@@ -858,7 +788,8 @@ static __poll_t ipmi_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
-static int ipmi_fasync(int fd, struct file *file, int on)
+static int ipmi_wdog_fasync(struct watchdog_device *wdd,
+			    int fd, struct file *file, int on)
 {
 	int result;
 
@@ -867,43 +798,31 @@ static int ipmi_fasync(int fd, struct file *file, int on)
 	return (result);
 }
 
-static int ipmi_close(struct inode *ino, struct file *filep)
-{
-	if (iminor(ino) == WATCHDOG_MINOR) {
-		if (expect_close == 42) {
-			mutex_lock(&ipmi_watchdog_mutex);
-			ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
-			_ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
-			mutex_unlock(&ipmi_watchdog_mutex);
-		} else {
-			pr_crit("Unexpected close, not stopping watchdog!\n");
-			ipmi_heartbeat();
-		}
-		clear_bit(0, &ipmi_wdog_open);
-	}
-
-	expect_close = 0;
-
-	return 0;
-}
+static const struct watchdog_ops ipmi_wdog_ops = {
+	.start		= ipmi_wdog_start,
+	.stop		= ipmi_wdog_stop,
+	.set_timeout	= ipmi_wdog_set_timeout,
+	.set_pretimeout	= ipmi_wdog_set_pretimeout,
+	.ping		= ipmi_wdog_ping,
+	.read		= ipmi_wdog_read,
+	.poll		= ipmi_wdog_poll,
+	.fasync		= ipmi_wdog_fasync,
+};
 
-static const struct file_operations ipmi_wdog_fops = {
-	.owner   = THIS_MODULE,
-	.read    = ipmi_read,
-	.poll    = ipmi_poll,
-	.write   = ipmi_write,
-	.unlocked_ioctl = ipmi_unlocked_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
-	.open    = ipmi_open,
-	.release = ipmi_close,
-	.fasync  = ipmi_fasync,
-	.llseek  = no_llseek,
+static struct watchdog_info ipmi_wdog_info = {
+	.options	= (WDIOF_SETTIMEOUT | WDIOF_PRETIMEOUT |
+			   WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE),
+	.firmware_version = 1,
+	.identity	= "IPMI"
 };
 
-static struct miscdevice ipmi_wdog_miscdev = {
-	.minor		= WATCHDOG_MINOR,
-	.name		= "watchdog",
-	.fops		= &ipmi_wdog_fops
+static struct watchdog_device ipmi_wdd = {
+	.ops = &ipmi_wdog_ops,
+	.info = &ipmi_wdog_info,
+	.min_timeout = 1,
+	.max_timeout = 6553,
+	.min_hw_heartbeat_ms = 1,
+	.max_hw_heartbeat_ms = 65535,
 };
 
 static void ipmi_wdog_msg_handler(struct ipmi_recv_msg *msg,
@@ -944,7 +863,7 @@ static void ipmi_wdog_pretimeout_handler(void *handler_data)
 	atomic_set(&pretimeout_since_last_heartbeat, 1);
 }
 
-static void ipmi_wdog_panic_handler(void *user_data)
+static void ipmi_wdog_panic_handler(void *handler_data)
 {
 	static int panic_event_handled;
 
@@ -998,11 +917,21 @@ static void ipmi_register_watchdog(int ipmi_intf)
 		ipmi_version_minor = 0;
 	}
 
-	rv = misc_register(&ipmi_wdog_miscdev);
+	ipmi_wdd.pretimeout = pretimeout;
+
+	rv = watchdog_init_timeout(&ipmi_wdd, timeout, NULL);
 	if (rv < 0) {
 		ipmi_destroy_user(watchdog_user);
 		watchdog_user = NULL;
-		pr_crit("Unable to register misc device\n");
+		pr_crit("Unable to initialize the IPMI watchdog device\n");
+	}
+	watchdog_set_nowayout(&ipmi_wdd, nowayout);
+
+	rv = watchdog_register_device(&ipmi_wdd);
+	if (rv) {
+		ipmi_destroy_user(watchdog_user);
+		watchdog_user = NULL;
+		pr_crit("Unable to register the IPMI watchdog device\n");
 	}
 
 #ifdef HAVE_DIE_NMI
@@ -1022,7 +951,7 @@ static void ipmi_register_watchdog(int ipmi_intf)
 
 		testing_nmi = 1;
 
-		rv = ipmi_set_timeout(IPMI_SET_TIMEOUT_FORCE_HB);
+		rv = ipmi_set_timeout(&ipmi_wdd, IPMI_SET_TIMEOUT_FORCE_HB);
 		if (rv) {
 			pr_warn("Error starting timer to test NMI: 0x%x.  The NMI pretimeout will likely not work\n",
 				rv);
@@ -1047,13 +976,12 @@ static void ipmi_register_watchdog(int ipmi_intf)
 	if ((start_now) && (rv == 0)) {
 		/* Run from startup, so start the timer now. */
 		start_now = 0; /* Disable this function after first startup. */
-		ipmi_watchdog_state = action_val;
-		ipmi_set_timeout(IPMI_SET_TIMEOUT_FORCE_HB);
+		watchdog_start(&ipmi_wdd);
 		pr_info("Starting now!\n");
 	} else {
 		/* Stop the timer now. */
 		ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
-		ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
+		_ipmi_set_timeout(&ipmi_wdd, IPMI_SET_TIMEOUT_NO_HB);
 	}
 }
 
@@ -1069,7 +997,7 @@ static void ipmi_unregister_watchdog(int ipmi_intf)
 		return;
 
 	/* Make sure no one can call us any more. */
-	misc_deregister(&ipmi_wdog_miscdev);
+	watchdog_unregister_device(&ipmi_wdd);
 
 	watchdog_user = NULL;
 
@@ -1088,9 +1016,6 @@ static void ipmi_unregister_watchdog(int ipmi_intf)
 	if (rv)
 		pr_warn("error unlinking from IPMI: %d\n",  rv);
 
-	/* If it comes back, restart it properly. */
-	ipmi_start_timer_on_heartbeat = 1;
-
 	mutex_unlock(&ipmi_watchdog_mutex);
 }
 
@@ -1147,7 +1072,7 @@ static int wdog_reboot_handler(struct notifier_block *this,
 		if (code == SYS_POWER_OFF || code == SYS_HALT) {
 			/* Disable the WDT if we are shutting down. */
 			ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
-			ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
+			ipmi_set_timeout(&ipmi_wdd, IPMI_SET_TIMEOUT_NO_HB);
 		} else if (ipmi_watchdog_state != WDOG_TIMEOUT_NONE) {
 			/* Set a long timer to let the reboot happen or
 			   reset if it hangs, but only if the watchdog
@@ -1156,7 +1081,7 @@ static int wdog_reboot_handler(struct notifier_block *this,
 				timeout = 120;
 			pretimeout = 0;
 			ipmi_watchdog_state = WDOG_TIMEOUT_RESET;
-			ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
+			ipmi_set_timeout(&ipmi_wdd, IPMI_SET_TIMEOUT_NO_HB);
 		}
 	}
 	return NOTIFY_OK;
-- 
2.17.1

