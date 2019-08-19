Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5553894F2A
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbfHSUhY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:24 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35280 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbfHSUhX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:23 -0400
Received: by mail-oi1-f196.google.com with SMTP id a127so2365498oii.2
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=afVVkhiAhS/5yGhJkERMRjqcLkxcohiQZxgssbm+lkc=;
        b=qOwP9/dVMhrbAK57DvdjbLmPmMOfxk90Yd9HnqnEUi9lMHww64XCagUk3s+4Qtf5EY
         9dDFLzQV1CTOy3Hs9iDj3JcPtycWcw5EUVCwNjepZrDQ+MPRz10EMt6PmPCUZkJKDjVy
         ABgRIpJrRQOKu8g37w/G/2r/2T9fiEtNQsbNUsMZ//lZvNDynxEKSnpIRVWTlmvihOwT
         DHiO3/ixQEcONgwHjH1+DrpJtxUg21/gEmQApzAQ9eq1dbDoha8d77FSzud/Lw5vqm72
         MExkkc/HwY0qwaV07YNtU/aIDjNPIAXIQDOrVIGgcYr0oB7fWLxojT+n3iGHUhgwPoO2
         ka3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=afVVkhiAhS/5yGhJkERMRjqcLkxcohiQZxgssbm+lkc=;
        b=bE7HGGQ+mJ0cXbK+GI/790qbVBhlLhhoS+qmtY6R2oq0csc9WA6QxX86vGdSCXZJ1M
         6GRn70R5bjSa0TUqUGsvpRv/GhSj70QVWG/HpUlCOkQ8sIWb8sTycYPWllqxbMY4XDNb
         Y+5GBCjgpDUoKEFbI53BENgN7OTnM3XFj5PgiAWBdRuY0f8k7/lIazubPZCE5n+8KslX
         KsaPp3ZdAjiC69GPTlv+Yg2hS7prqgGNNWkmrtDltqMe7f41bw5dP/orL4/6Xarfah0X
         I85TnXmXMrJCzu0nip2vOoT9yz0yt2KoczklE4NeuJgn5IK+B/IIeFDPxyo/63Q3DUPq
         MCpw==
X-Gm-Message-State: APjAAAV/IG5VDQp9rvyNue+n0GsSzRScQnNeTkmyj/Us8Wt6+xTMQil0
        OpliLC/KVDEjKWAjGXzShg==
X-Google-Smtp-Source: APXvYqx2uPT+agNuzKCLmzekWXw8Edov8fOqTBPfRaZOfU2D3jUFCCaouEHW8q68mF1Fq5AMU65Sog==
X-Received: by 2002:aca:1803:: with SMTP id h3mr13949775oih.24.1566247039392;
        Mon, 19 Aug 2019 13:37:19 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id j189sm759040oih.30.2019.08.19.13.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id 534591805AB;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id 3CECE30232A; Mon, 19 Aug 2019 15:37:14 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 06/12] watchdog:ipmi: Convert over to the standard watchdog infrastructure
Date:   Mon, 19 Aug 2019 15:37:05 -0500
Message-Id: <20190819203711.32599-7-minyard@acm.org>
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

The IPMI watchdog was using its own ioctl and misc registration.
Switch over to using the standard watchdog code.  This required
almost a complete rewrite, but this allowed a lot of improvements.
No functional changes.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/ipmi_watchdog.c | 1350 ++++++++++++++----------------
 1 file changed, 621 insertions(+), 729 deletions(-)

diff --git a/drivers/watchdog/ipmi_watchdog.c b/drivers/watchdog/ipmi_watchdog.c
index 74c6d1f34132..c8c11a61ebb9 100644
--- a/drivers/watchdog/ipmi_watchdog.c
+++ b/drivers/watchdog/ipmi_watchdog.c
@@ -36,6 +36,9 @@
 #include <linux/delay.h>
 #include <linux/atomic.h>
 #include <linux/sched/signal.h>
+#include <linux/rcupdate.h>
+
+#include "watchdog_pretimeout.h"
 
 #ifdef CONFIG_X86
 /*
@@ -122,20 +125,69 @@
 
 #define IPMI_WDOG_TIMER_NOT_INIT_RESP	0x80
 
-static DEFINE_MUTEX(ipmi_watchdog_mutex);
-static bool nowayout = WATCHDOG_NOWAYOUT;
+#define IPMI_MAX_TIMEOUT	6553	/* 16 bit value in 1/10 of a second */
+#define IPMI_MIN_TIMEOUT	0
+
+struct ipmi_wdt {
+	struct watchdog_device wdd;
+	struct watchdog_info info;
+	struct ipmi_user *user;
+	int ifnum;		/* IPMI interface number. */
+	u8 ipmi_version_major;
+	u8 ipmi_version_minor;
+
+	struct mutex lock;
+
+	struct completion msg_wait;
+	atomic_t msg_tofree;
+	struct ipmi_smi_msg smi_msg;
+	struct ipmi_recv_msg recv_msg;
+
+	int state; /* One of WDOG_TIMEOUT_xxx, NONE if disabled. */
+
+	bool nmi_works;
+
+	atomic_t pretimeout_since_last_heartbeat;
+	bool panic_event_handled;
+};
+
+#define wdd_to_ipmi_wdt(wdd) container_of(wdd, struct ipmi_wdt, wdd)
+
+/* Parameters to ipmi_set_timeout(), _ipmi_update_timeout() */
+#define IPMI_SET_TIMEOUT_NO_HB			0
+#define IPMI_SET_TIMEOUT_HB_IF_NECESSARY	1
+#define IPMI_SET_TIMEOUT_FORCE_HB		2
+
+static int _ipmi_update_timeout(struct ipmi_wdt *iwd, int do_heartbeat,
+				bool do_poll);
+static int ipmi_set_timeout(struct ipmi_wdt *iwd, int timeout,
+			    int do_heartbeat);
+static int ipmi_set_pretimeout(struct ipmi_wdt *iwd, int timeout,
+			       int do_heartbeat);
+static void ipmi_register_watchdog(int ipmi_intf, struct device *dev);
+static void _ipmi_unregister_watchdog(struct ipmi_wdt *iwd);
+static void ipmi_unregister_watchdog(int ipmi_intf);
+
+/*
+ * Only used if HAVE_DIE_NMI is set, but pretimeout will not be delivered
+ * if this is set.
+ * 0 = not testing
+ * 1 = test running, no NMI
+ * 2 = test running, got an NMI
+ */
+static int testing_nmi;
 
-static struct ipmi_user *watchdog_user;
-static int watchdog_ifnum;
 
-/* Default the timeout to 10 seconds. */
-static int timeout = 10;
+/* Protects the following values. */
+static DEFINE_MUTEX(ipmi_wdt_data_mutex);
+static int ifnum_to_use = -1;
+static struct ipmi_wdt *ipmi_wdt;
 
-/* The pre-timeout is disabled by default. */
-static int pretimeout;
+static bool nowayout = WATCHDOG_NOWAYOUT;
 
-/* Default timeout to set on panic */
-static int panic_wdt_timeout = 255;
+static int timeout = 10; /* Default timeout. */
+static int pretimeout; /* Default pretimeout. */
+static int panic_wdt_timeout = 255; /* Default timeout to set on panic */
 
 /* Default action is to reset the board on a timeout. */
 static unsigned char action_val = WDOG_TIMEOUT_RESET;
@@ -149,23 +201,6 @@ static char preaction[16] = "pre_none";
 static unsigned char preop_val = WDOG_PREOP_NONE;
 
 static char preop[16] = "preop_none";
-static DEFINE_SPINLOCK(ipmi_read_lock);
-static char data_to_read;
-static DECLARE_WAIT_QUEUE_HEAD(read_q);
-static struct fasync_struct *fasync_q;
-static atomic_t pretimeout_since_last_heartbeat;
-static char expect_close;
-
-static int ifnum_to_use = -1;
-
-/* Parameters to ipmi_set_timeout */
-#define IPMI_SET_TIMEOUT_NO_HB			0
-#define IPMI_SET_TIMEOUT_HB_IF_NECESSARY	1
-#define IPMI_SET_TIMEOUT_FORCE_HB		2
-
-static int ipmi_set_timeout(int do_heartbeat);
-static void ipmi_register_watchdog(int ipmi_intf);
-static void ipmi_unregister_watchdog(int ipmi_intf);
 
 /*
  * If true, the driver will start running as soon as it is configured
@@ -173,21 +208,162 @@ static void ipmi_unregister_watchdog(int ipmi_intf);
  */
 static int start_now;
 
+static int action_op(const char *inval, char *outval)
+{
+	int rv = 0;
+
+	mutex_lock(&ipmi_wdt_data_mutex);
+	if (outval)
+		strcpy(outval, action);
+
+	if (!inval)
+		goto out_unlock;
+
+	if (strcmp(inval, "reset") == 0)
+		action_val = WDOG_TIMEOUT_RESET;
+	else if (strcmp(inval, "none") == 0)
+		action_val = WDOG_TIMEOUT_NONE;
+	else if (strcmp(inval, "power_cycle") == 0)
+		action_val = WDOG_TIMEOUT_POWER_CYCLE;
+	else if (strcmp(inval, "power_off") == 0)
+		action_val = WDOG_TIMEOUT_POWER_DOWN;
+	else
+		rv = -EINVAL;
+	if (!rv) {
+		strcpy(action, inval);
+		if (ipmi_wdt && ipmi_wdt->state != WDOG_TIMEOUT_NONE) {
+			ipmi_wdt->state = action_val;
+			rv = _ipmi_update_timeout(ipmi_wdt,
+					IPMI_SET_TIMEOUT_HB_IF_NECESSARY,
+					false);
+		}
+	}
+out_unlock:
+	mutex_unlock(&ipmi_wdt_data_mutex);
+
+	return rv;
+}
+
+static int preaction_op(const char *inval, char *outval)
+{
+	int rv = 0;
+
+	mutex_lock(&ipmi_wdt_data_mutex);
+	if (outval)
+		strcpy(outval, preaction);
+
+	if (!inval)
+		goto out_unlock;
+
+	if (strcmp(inval, "pre_none") == 0)
+		preaction_val = WDOG_PRETIMEOUT_NONE;
+	else if (strcmp(inval, "pre_smi") == 0)
+		preaction_val = WDOG_PRETIMEOUT_SMI;
+#ifdef HAVE_DIE_NMI
+	else if (strcmp(inval, "pre_nmi") == 0) {
+		if (preop_val == WDOG_PREOP_GIVE_DATA)
+			rv = -EINVAL;
+		else if (ipmi_wdt && !ipmi_wdt->nmi_works)
+			rv = -EINVAL;
+		else
+			preaction_val = WDOG_PRETIMEOUT_NMI;
+	}
+#endif
+	else if (strcmp(inval, "pre_int") == 0)
+		preaction_val = WDOG_PRETIMEOUT_MSG_INT;
+	else
+		rv = -EINVAL;
+	if (!rv) {
+		strcpy(preaction, inval);
+		if (ipmi_wdt && ipmi_wdt->state != WDOG_TIMEOUT_NONE &&
+		    ipmi_wdt->wdd.pretimeout) {
+			rv = _ipmi_update_timeout(ipmi_wdt,
+					IPMI_SET_TIMEOUT_HB_IF_NECESSARY,
+					false);
+		}
+	}
+out_unlock:
+	mutex_unlock(&ipmi_wdt_data_mutex);
+
+	return rv;
+}
+
+static int preop_op(const char *inval, char *outval)
+{
+	int rv = 0;
+	const char *gov = NULL;
+	unsigned int orig_val;
+
+	mutex_lock(&ipmi_wdt_data_mutex);
+	if (outval)
+		strcpy(outval, preop);
+
+	if (!inval)
+		goto out_unlock;
+
+	orig_val = preop_val;
+	if (strcmp(inval, "preop_none") == 0) {
+		preop_val = WDOG_PREOP_NONE;
+		gov = "noop";
+	} else if (strcmp(inval, "preop_panic") == 0) {
+		preop_val = WDOG_PREOP_PANIC;
+		gov = "panic";
+	} else if (strcmp(inval, "preop_give_data") == 0) {
+		if (preaction_val == WDOG_PRETIMEOUT_NMI)
+			rv = -EINVAL;
+		else {
+			preop_val = WDOG_PREOP_GIVE_DATA;
+			gov = "read_data";
+		}
+	} else {
+		rv = -EINVAL;
+	}
+	if (!rv) {
+		rv = watchdog_pretimeout_governor_set(&ipmi_wdt->wdd, gov);
+		if (rv)
+			preaction_val = orig_val;
+		else
+			strcpy(preop, inval);
+	}
+out_unlock:
+	mutex_unlock(&ipmi_wdt_data_mutex);
+
+	return rv;
+}
+
+static struct ipmi_smi_watcher smi_watcher = {
+	.owner    = THIS_MODULE,
+	.new_smi  = ipmi_register_watchdog,
+	.smi_gone = ipmi_unregister_watchdog
+};
+
 static int set_param_timeout(const char *val, const struct kernel_param *kp)
 {
-	char *endp;
-	int  l;
+	unsigned long l;
 	int  rv = 0;
 
 	if (!val)
 		return -EINVAL;
-	l = simple_strtoul(val, &endp, 0);
-	if (endp == val)
+	rv = kstrtoul(val, 0, &l);
+	if (rv)
+		return rv;
+
+	if (l < IPMI_MIN_TIMEOUT || l > IPMI_MAX_TIMEOUT)
 		return -EINVAL;
 
+	mutex_lock(&ipmi_wdt_data_mutex);
 	*((int *)kp->arg) = l;
-	if (watchdog_user)
-		rv = ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+	if (!ipmi_wdt)
+		goto out_unlock;
+	if (kp->arg == &timeout)
+		rv = ipmi_set_timeout(ipmi_wdt, l,
+				      IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+	else if (kp->arg == &pretimeout)
+		rv = ipmi_set_pretimeout(ipmi_wdt, l,
+					 IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+
+out_unlock:
+	mutex_unlock(&ipmi_wdt_data_mutex);
 
 	return rv;
 }
@@ -200,15 +376,9 @@ static const struct kernel_param_ops param_ops_timeout = {
 
 typedef int (*action_fn)(const char *intval, char *outval);
 
-static int action_op(const char *inval, char *outval);
-static int preaction_op(const char *inval, char *outval);
-static int preop_op(const char *inval, char *outval);
-static void check_parms(void);
-
 static int set_param_str(const char *val, const struct kernel_param *kp)
 {
 	action_fn  fn = (action_fn) kp->arg;
-	int        rv = 0;
 	char       valcp[16];
 	char       *s;
 
@@ -217,16 +387,7 @@ static int set_param_str(const char *val, const struct kernel_param *kp)
 
 	s = strstrip(valcp);
 
-	rv = fn(s, NULL);
-	if (rv)
-		goto out;
-
-	check_parms();
-	if (watchdog_user)
-		rv = ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
-
- out:
-	return rv;
+	return fn(s, NULL);
 }
 
 static int get_param_str(char *buffer, const struct kernel_param *kp)
@@ -240,17 +401,45 @@ static int get_param_str(char *buffer, const struct kernel_param *kp)
 	return strlen(buffer);
 }
 
-
 static int set_param_wdog_ifnum(const char *val, const struct kernel_param *kp)
 {
-	int rv = param_set_int(val, kp);
+	int rv;
+	unsigned long l;
+	struct ipmi_wdt *old_iwd = NULL;
+
+	if (!val)
+		return 0;
+
+	rv = kstrtoul(val, 0, &l);
 	if (rv)
 		return rv;
-	if ((ifnum_to_use < 0) || (ifnum_to_use == watchdog_ifnum))
+
+	mutex_lock(&ipmi_wdt_data_mutex);
+	if (l == ifnum_to_use) {
+		mutex_unlock(&ipmi_wdt_data_mutex);
 		return 0;
+	}
+
+	if (ipmi_wdt) {
+		old_iwd = ipmi_wdt;
+		ipmi_wdt = NULL;
+	}
+	mutex_unlock(&ipmi_wdt_data_mutex);
+
+	if (old_iwd)
+		_ipmi_unregister_watchdog(old_iwd);
+
+	/*
+	 * Re-register the smi watcher to run through all the IPMI
+	 * interfaces again.
+	 */
+	ipmi_smi_watcher_unregister(&smi_watcher);
+	rv = ipmi_smi_watcher_register(&smi_watcher);
+	if (rv) {
+		pr_warn("can't register smi watcher\n");
+		return rv;
+	}
 
-	ipmi_unregister_watchdog(watchdog_ifnum);
-	ipmi_register_watchdog(ifnum_to_use);
 	return 0;
 }
 
@@ -300,61 +489,39 @@ module_param(nowayout, bool, 0644);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
 		 "(default=CONFIG_WATCHDOG_NOWAYOUT)");
 
-/* Default state of the timer. */
-static unsigned char ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
-
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
-/* IPMI version of the BMC. */
-static unsigned char ipmi_version_major;
-static unsigned char ipmi_version_minor;
-
-/* If a pretimeout occurs, this is used to allow only one panic to happen. */
-static atomic_t preop_panic_excl = ATOMIC_INIT(-1);
-
-#ifdef HAVE_DIE_NMI
-static int testing_nmi;
-static int nmi_handler_registered;
-#endif
-
-static int __ipmi_heartbeat(void);
+static int __ipmi_heartbeat(struct ipmi_wdt *iwd, bool do_poll);
 
 /*
  * We use a mutex to make sure that only one thing can send a set a
  * message at one time.  The mutex is claimed when a message is sent
  * and freed when both the send and receive messages are free.
  */
-static atomic_t msg_tofree = ATOMIC_INIT(0);
-static DECLARE_COMPLETION(msg_wait);
 static void msg_free_smi(struct ipmi_smi_msg *msg)
 {
-	if (atomic_dec_and_test(&msg_tofree))
-		complete(&msg_wait);
+	struct ipmi_wdt *iwd = container_of(msg, struct ipmi_wdt, smi_msg);
+
+	if (atomic_dec_and_test(&iwd->msg_tofree))
+		complete(&iwd->msg_wait);
 }
 static void msg_free_recv(struct ipmi_recv_msg *msg)
 {
-	if (atomic_dec_and_test(&msg_tofree))
-		complete(&msg_wait);
+	struct ipmi_wdt *iwd = container_of(msg, struct ipmi_wdt, recv_msg);
+
+	if (atomic_dec_and_test(&iwd->msg_tofree))
+		complete(&iwd->msg_wait);
 }
-static struct ipmi_smi_msg smi_msg = {
-	.done = msg_free_smi
-};
-static struct ipmi_recv_msg recv_msg = {
-	.done = msg_free_recv
-};
 
-static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
-			      struct ipmi_recv_msg *recv_msg,
-			      int                  *send_heartbeat_now)
+static void wait_msg_done(struct ipmi_wdt *iwd, bool do_poll)
+{
+	if (do_poll) {
+		while (atomic_read(&iwd->msg_tofree) != 0)
+			ipmi_poll_interface(iwd->user);
+	} else {
+		wait_for_completion(&iwd->msg_wait);
+	}
+}
+
+static int __ipmi_update_timeout(struct ipmi_wdt *iwd, int *send_heartbeat_now)
 {
 	struct kernel_ipmi_msg            msg;
 	unsigned char                     data[6];
@@ -362,15 +529,17 @@ static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
 	struct ipmi_system_interface_addr addr;
 	int                               hbnow = 0;
 
-
 	data[0] = 0;
 	WDOG_SET_TIMER_USE(data[0], WDOG_TIMER_USE_SMS_OS);
 
-	if ((ipmi_version_major > 1)
-	    || ((ipmi_version_major == 1) && (ipmi_version_minor >= 5))) {
-		/* This is an IPMI 1.5-only feature. */
-		data[0] |= WDOG_DONT_STOP_ON_SET;
-	} else if (ipmi_watchdog_state != WDOG_TIMEOUT_NONE) {
+	/* If timer is running, keep it running. */
+	if (iwd->state != WDOG_TIMEOUT_NONE) {
+		if ((iwd->ipmi_version_major > 1)
+		    || ((iwd->ipmi_version_major == 1) &&
+			(iwd->ipmi_version_minor >= 5)))
+			/* This is an IPMI 1.5-only feature. */
+			data[0] |= WDOG_DONT_STOP_ON_SET;
+		else
 		/*
 		 * In ipmi 1.0, setting the timer stops the watchdog, we
 		 * need to start it back up again.
@@ -379,16 +548,17 @@ static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
 	}
 
 	data[1] = 0;
-	WDOG_SET_TIMEOUT_ACT(data[1], ipmi_watchdog_state);
-	if ((pretimeout > 0) && (ipmi_watchdog_state != WDOG_TIMEOUT_NONE)) {
-	    WDOG_SET_PRETIMEOUT_ACT(data[1], preaction_val);
-	    data[2] = pretimeout;
+	WDOG_SET_TIMEOUT_ACT(data[1], iwd->state);
+	if ((iwd->wdd.pretimeout > 0) &&
+	    (iwd->state != WDOG_TIMEOUT_NONE)) {
+		WDOG_SET_PRETIMEOUT_ACT(data[1], preaction_val);
+		data[2] = iwd->wdd.pretimeout;
 	} else {
-	    WDOG_SET_PRETIMEOUT_ACT(data[1], WDOG_PRETIMEOUT_NONE);
-	    data[2] = 0; /* No pretimeout. */
+		WDOG_SET_PRETIMEOUT_ACT(data[1], WDOG_PRETIMEOUT_NONE);
+		data[2] = 0; /* No pretimeout. */
 	}
 	data[3] = 0;
-	WDOG_SET_TIMEOUT(data[4], data[5], timeout);
+	WDOG_SET_TIMEOUT(data[4], data[5], iwd->wdd.timeout);
 
 	addr.addr_type = IPMI_SYSTEM_INTERFACE_ADDR_TYPE;
 	addr.channel = IPMI_BMC_CHANNEL;
@@ -398,13 +568,13 @@ static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
 	msg.cmd = IPMI_WDOG_SET_TIMER;
 	msg.data = data;
 	msg.data_len = sizeof(data);
-	rv = ipmi_request_supply_msgs(watchdog_user,
+	rv = ipmi_request_supply_msgs(iwd->user,
 				      (struct ipmi_addr *) &addr,
 				      0,
 				      &msg,
 				      NULL,
-				      smi_msg,
-				      recv_msg,
+				      &iwd->smi_msg,
+				      &iwd->recv_msg,
 				      1);
 	if (rv)
 		pr_warn("set timeout error: %d\n", rv);
@@ -414,132 +584,79 @@ static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
 	return rv;
 }
 
-static int _ipmi_set_timeout(int do_heartbeat)
+static int _ipmi_update_timeout(struct ipmi_wdt *iwd, int do_heartbeat,
+				bool do_poll)
 {
 	int send_heartbeat_now;
 	int rv;
 
-	if (!watchdog_user)
-		return -ENODEV;
-
-	atomic_set(&msg_tofree, 2);
+	atomic_set(&iwd->msg_tofree, 2);
 
-	rv = __ipmi_set_timeout(&smi_msg,
-				&recv_msg,
-				&send_heartbeat_now);
-	if (rv)
+	rv = __ipmi_update_timeout(iwd, &send_heartbeat_now);
+	if (rv) {
+		atomic_set(&iwd->msg_tofree, 0);
 		return rv;
+	}
 
-	wait_for_completion(&msg_wait);
+	wait_msg_done(iwd, do_poll);
 
 	if ((do_heartbeat == IPMI_SET_TIMEOUT_FORCE_HB)
 		|| ((send_heartbeat_now)
 		    && (do_heartbeat == IPMI_SET_TIMEOUT_HB_IF_NECESSARY)))
-		rv = __ipmi_heartbeat();
+		rv = __ipmi_heartbeat(iwd, do_poll);
 
 	return rv;
 }
 
-static int ipmi_set_timeout(int do_heartbeat)
+static int ipmi_set_timeout(struct ipmi_wdt *iwd, int val, int do_heartbeat)
 {
 	int rv;
 
-	mutex_lock(&ipmi_watchdog_mutex);
-	rv = _ipmi_set_timeout(do_heartbeat);
-	mutex_unlock(&ipmi_watchdog_mutex);
+	mutex_lock(&iwd->lock);
+	if (val <= iwd->wdd.pretimeout) {
+		pr_warn("pretimeout set >= timeout, pretimeout disabled\n");
+		iwd->wdd.pretimeout = 0;
+	}
+	iwd->wdd.timeout = val;
+	rv = _ipmi_update_timeout(iwd, do_heartbeat, false);
+	mutex_unlock(&iwd->lock);
 
 	return rv;
 }
 
-static atomic_t panic_done_count = ATOMIC_INIT(0);
-
-static void panic_smi_free(struct ipmi_smi_msg *msg)
-{
-	atomic_dec(&panic_done_count);
-}
-static void panic_recv_free(struct ipmi_recv_msg *msg)
-{
-	atomic_dec(&panic_done_count);
-}
-
-static struct ipmi_smi_msg panic_halt_heartbeat_smi_msg = {
-	.done = panic_smi_free
-};
-static struct ipmi_recv_msg panic_halt_heartbeat_recv_msg = {
-	.done = panic_recv_free
-};
-
-static void panic_halt_ipmi_heartbeat(void)
+static int ipmi_set_pretimeout(struct ipmi_wdt *iwd, int val, int do_heartbeat)
 {
-	struct kernel_ipmi_msg             msg;
-	struct ipmi_system_interface_addr addr;
 	int rv;
 
-	/*
-	 * Don't reset the timer if we have the timer turned off, that
-	 * re-enables the watchdog.
-	 */
-	if (ipmi_watchdog_state == WDOG_TIMEOUT_NONE)
-		return;
-
-	addr.addr_type = IPMI_SYSTEM_INTERFACE_ADDR_TYPE;
-	addr.channel = IPMI_BMC_CHANNEL;
-	addr.lun = 0;
+	mutex_lock(&iwd->lock);
+	if (val >= iwd->wdd.timeout) {
+		pr_warn("pretimeout set >= timeout, pretimeout disabled\n");
+		val = 0;
+	}
+	iwd->wdd.pretimeout = val;
+	rv = _ipmi_update_timeout(iwd, do_heartbeat, false);
+	mutex_unlock(&iwd->lock);
 
-	msg.netfn = 0x06;
-	msg.cmd = IPMI_WDOG_RESET_TIMER;
-	msg.data = NULL;
-	msg.data_len = 0;
-	atomic_add(1, &panic_done_count);
-	rv = ipmi_request_supply_msgs(watchdog_user,
-				      (struct ipmi_addr *) &addr,
-				      0,
-				      &msg,
-				      NULL,
-				      &panic_halt_heartbeat_smi_msg,
-				      &panic_halt_heartbeat_recv_msg,
-				      1);
-	if (rv)
-		atomic_sub(1, &panic_done_count);
+	return rv;
 }
 
-static struct ipmi_smi_msg panic_halt_smi_msg = {
-	.done = panic_smi_free
-};
-static struct ipmi_recv_msg panic_halt_recv_msg = {
-	.done = panic_recv_free
-};
-
 /*
  * Special call, doesn't claim any locks.  This is only to be called
  * at panic or halt time, in run-to-completion mode, when the caller
  * is the only CPU and the only thing that will be going is these IPMI
  * calls.
  */
-static void panic_halt_ipmi_set_timeout(void)
+static void panic_halt_ipmi_update_timeout(struct ipmi_wdt *iwd)
 {
-	int send_heartbeat_now;
 	int rv;
 
-	/* Wait for the messages to be free. */
-	while (atomic_read(&panic_done_count) != 0)
-		ipmi_poll_interface(watchdog_user);
-	atomic_add(1, &panic_done_count);
-	rv = __ipmi_set_timeout(&panic_halt_smi_msg,
-				&panic_halt_recv_msg,
-				&send_heartbeat_now);
-	if (rv) {
-		atomic_sub(1, &panic_done_count);
+	wait_msg_done(iwd, true);
+	rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_HB_IF_NECESSARY, true);
+	if (rv)
 		pr_warn("Unable to extend the watchdog timeout\n");
-	} else {
-		if (send_heartbeat_now)
-			panic_halt_ipmi_heartbeat();
-	}
-	while (atomic_read(&panic_done_count) != 0)
-		ipmi_poll_interface(watchdog_user);
 }
 
-static int __ipmi_heartbeat(void)
+static int __ipmi_heartbeat(struct ipmi_wdt *iwd, bool do_poll)
 {
 	struct kernel_ipmi_msg msg;
 	int rv;
@@ -551,10 +668,10 @@ static int __ipmi_heartbeat(void)
 	 * Don't reset the timer if we have the timer turned off, that
 	 * re-enables the watchdog.
 	 */
-	if (ipmi_watchdog_state == WDOG_TIMEOUT_NONE)
+	if (iwd->state == WDOG_TIMEOUT_NONE)
 		return 0;
 
-	atomic_set(&msg_tofree, 2);
+	atomic_set(&iwd->msg_tofree, 2);
 
 	addr.addr_type = IPMI_SYSTEM_INTERFACE_ADDR_TYPE;
 	addr.channel = IPMI_BMC_CHANNEL;
@@ -564,23 +681,24 @@ static int __ipmi_heartbeat(void)
 	msg.cmd = IPMI_WDOG_RESET_TIMER;
 	msg.data = NULL;
 	msg.data_len = 0;
-	rv = ipmi_request_supply_msgs(watchdog_user,
+	rv = ipmi_request_supply_msgs(iwd->user,
 				      (struct ipmi_addr *) &addr,
 				      0,
 				      &msg,
 				      NULL,
-				      &smi_msg,
-				      &recv_msg,
+				      &iwd->smi_msg,
+				      &iwd->recv_msg,
 				      1);
 	if (rv) {
+		atomic_set(&iwd->msg_tofree, 0);
 		pr_warn("heartbeat send failure: %d\n", rv);
 		return rv;
 	}
 
 	/* Wait for the heartbeat to be sent. */
-	wait_for_completion(&msg_wait);
+	wait_msg_done(iwd, do_poll);
 
-	if (recv_msg.msg.data[0] == IPMI_WDOG_TIMER_NOT_INIT_RESP)  {
+	if (iwd->recv_msg.msg.data[0] == IPMI_WDOG_TIMER_NOT_INIT_RESP)  {
 		timeout_retries++;
 		if (timeout_retries > 3) {
 			pr_err("Unable to restore the IPMI watchdog's settings, giving up\n");
@@ -596,7 +714,8 @@ static int __ipmi_heartbeat(void)
 		 * in this process, so must say no heartbeat to avoid a
 		 * deadlock on this mutex
 		 */
-		rv = _ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
+		rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_NO_HB,
+					  do_poll);
 		if (rv) {
 			pr_err("Unable to send the command to set the watchdog's settings, giving up\n");
 			goto out;
@@ -604,7 +723,7 @@ static int __ipmi_heartbeat(void)
 
 		/* Might need a heartbeat send, go ahead and do it. */
 		goto restart;
-	} else if (recv_msg.msg.data[0] != 0) {
+	} else if (iwd->recv_msg.msg.data[0] != 0) {
 		/*
 		 * Got an error in the heartbeat response.  It was already
 		 * reported in ipmi_wdog_msg_handler, but we should return
@@ -617,545 +736,434 @@ static int __ipmi_heartbeat(void)
 	return rv;
 }
 
-static int _ipmi_heartbeat(void)
+static int _ipmi_heartbeat(struct ipmi_wdt *iwd)
 {
 	int rv;
 
-	if (!watchdog_user)
-		return -ENODEV;
-
-	if (ipmi_start_timer_on_heartbeat) {
-		ipmi_start_timer_on_heartbeat = 0;
-		ipmi_watchdog_state = action_val;
-		rv = _ipmi_set_timeout(IPMI_SET_TIMEOUT_FORCE_HB);
-	} else if (atomic_cmpxchg(&pretimeout_since_last_heartbeat, 1, 0)) {
+	if (atomic_cmpxchg(&iwd->pretimeout_since_last_heartbeat, 1, 0)) {
 		/*
 		 * A pretimeout occurred, make sure we set the timeout.
 		 * We don't want to set the action, though, we want to
 		 * leave that alone (thus it can't be combined with the
 		 * above operation.
 		 */
-		rv = _ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+		rv = _ipmi_update_timeout(iwd,
+					  IPMI_SET_TIMEOUT_HB_IF_NECESSARY,
+			false);
 	} else {
-		rv = __ipmi_heartbeat();
+		rv = __ipmi_heartbeat(iwd, false);
 	}
 
 	return rv;
 }
 
-static int ipmi_heartbeat(void)
+static void ipmi_wdog_msg_handler(struct ipmi_recv_msg *msg,
+				  void                 *handler_data)
 {
-	int rv;
-
-	mutex_lock(&ipmi_watchdog_mutex);
-	rv = _ipmi_heartbeat();
-	mutex_unlock(&ipmi_watchdog_mutex);
+	if (msg->msg.cmd == IPMI_WDOG_RESET_TIMER &&
+			msg->msg.data[0] == IPMI_WDOG_TIMER_NOT_INIT_RESP)
+		pr_info("response: The IPMI controller appears to have been reset, will attempt to reinitialize the watchdog timer\n");
+	else if (msg->msg.data[0] != 0)
+		pr_err("response: Error %x on cmd %x\n",
+		       msg->msg.data[0],
+		       msg->msg.cmd);
 
-	return rv;
+	ipmi_free_recv_msg(msg);
 }
 
-static struct watchdog_info ident = {
-	.options	= 0,	/* WDIOF_SETTIMEOUT, */
-	.firmware_version = 1,
-	.identity	= "IPMI"
-};
-
-static int ipmi_ioctl(struct file *file,
-		      unsigned int cmd, unsigned long arg)
+static void ipmi_wdog_pretimeout_handler(void *handler_data)
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
+	struct ipmi_wdt *iwd = handler_data;
 
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
+	/*
+	 * On some machines, the heartbeat will give an error and not
+	 * work unless we re-enable the timer.  So do so.  Do this
+	 * before the notify because it may panic.
+	 */
+	atomic_set(&iwd->pretimeout_since_last_heartbeat, 1);
 
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
+	if (!testing_nmi)
+		watchdog_notify_pretimeout(&iwd->wdd);
+}
 
-		if (val & WDIOS_ENABLECARD) {
-			ipmi_watchdog_state = action_val;
-			_ipmi_set_timeout(IPMI_SET_TIMEOUT_FORCE_HB);
-		}
-		return 0;
+static void ipmi_wdog_panic_handler(void *user_data)
+{
+	struct ipmi_wdt *iwd = user_data;
 
-	case WDIOC_GETSTATUS:
-		val = 0;
-		i = copy_to_user(argp, &val, sizeof(val));
-		if (i)
-			return -EFAULT;
-		return 0;
+	/*
+	 * On a panic, if we have a panic timeout, make sure to extend
+	 * the watchdog timer to a reasonable value to complete the
+	 * panic, if the watchdog timer is running.  Plus the
+	 * pretimeout is meaningless at panic time.
+	 */
+	if (!iwd->panic_event_handled &&
+	    iwd->state != WDOG_TIMEOUT_NONE) {
+		/* Make sure we do this only once. */
+		iwd->panic_event_handled = true;
 
-	default:
-		return -ENOIOCTLCMD;
+		iwd->wdd.timeout = panic_wdt_timeout;
+		iwd->wdd.pretimeout = 0;
+		panic_halt_ipmi_update_timeout(iwd);
 	}
 }
 
-static long ipmi_unlocked_ioctl(struct file *file,
-				unsigned int cmd,
-				unsigned long arg)
+static int ipmi_wdt_start(struct watchdog_device *wdd)
 {
-	int ret;
+	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
+	int rv;
 
-	mutex_lock(&ipmi_watchdog_mutex);
-	ret = ipmi_ioctl(file, cmd, arg);
-	mutex_unlock(&ipmi_watchdog_mutex);
+	mutex_lock(&iwd->lock);
+	iwd->state = action_val;
+	rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_FORCE_HB, false);
+	mutex_unlock(&iwd->lock);
 
-	return ret;
+	return rv;
 }
 
-static ssize_t ipmi_write(struct file *file,
-			  const char  __user *buf,
-			  size_t      len,
-			  loff_t      *ppos)
+static int ipmi_wdt_stop(struct watchdog_device *wdd)
 {
+	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
 	int rv;
 
-	if (len) {
-		if (!nowayout) {
-			size_t i;
+	mutex_lock(&iwd->lock);
+	iwd->state = WDOG_TIMEOUT_NONE;
+	rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_NO_HB, false);
+	mutex_unlock(&iwd->lock);
+
+	return rv;
+}
 
-			/* In case it was set long ago */
-			expect_close = 0;
+static int ipmi_wdt_ping(struct watchdog_device *wdd)
+{
+	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
+	int rv;
 
-			for (i = 0; i != len; i++) {
-				char c;
+	mutex_lock(&iwd->lock);
+	rv = _ipmi_heartbeat(iwd);
+	mutex_unlock(&iwd->lock);
 
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
+	return rv;
 }
 
-static ssize_t ipmi_read(struct file *file,
-			 char        __user *buf,
-			 size_t      count,
-			 loff_t      *ppos)
+static int ipmi_wdt_set_timeout(struct watchdog_device *wdd, unsigned int val)
 {
-	int          rv = 0;
-	wait_queue_entry_t wait;
+	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
 
-	if (count <= 0)
-		return 0;
+	return ipmi_set_timeout(iwd, val, IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+}
 
-	/*
-	 * Reading returns if the pretimeout has gone off, and it only does
-	 * it once per pretimeout.
-	 */
-	spin_lock_irq(&ipmi_read_lock);
-	if (!data_to_read) {
-		if (file->f_flags & O_NONBLOCK) {
-			rv = -EAGAIN;
-			goto out;
-		}
-
-		init_waitqueue_entry(&wait, current);
-		add_wait_queue(&read_q, &wait);
-		while (!data_to_read) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			spin_unlock_irq(&ipmi_read_lock);
-			schedule();
-			spin_lock_irq(&ipmi_read_lock);
-		}
-		remove_wait_queue(&read_q, &wait);
-
-		if (signal_pending(current)) {
-			rv = -ERESTARTSYS;
-			goto out;
-		}
-	}
-	data_to_read = 0;
+static int ipmi_wdt_set_pretimeout(struct watchdog_device *wdd,
+				   unsigned int val)
+{
+	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
+	int rv;
 
- out:
-	spin_unlock_irq(&ipmi_read_lock);
-
-	if (rv == 0) {
-		if (copy_to_user(buf, &data_to_read, 1))
-			rv = -EFAULT;
-		else
-			rv = 1;
-	}
+	mutex_lock(&iwd->lock);
+	iwd->wdd.pretimeout = val;
+	rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_NO_HB, false);
+	mutex_unlock(&iwd->lock);
 
 	return rv;
 }
 
-static int ipmi_open(struct inode *ino, struct file *filep)
-{
-	switch (iminor(ino)) {
-	case WATCHDOG_MINOR:
-		if (test_and_set_bit(0, &ipmi_wdog_open))
-			return -EBUSY;
+static const struct watchdog_info ipmi_wdt_ident = {
+	.options	= WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
+			  WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE,
+	.firmware_version = 1,
+	.identity	= "IPMI"
+};
 
+static const struct watchdog_ops ipmi_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= ipmi_wdt_start,
+	.stop		= ipmi_wdt_stop,
+	.ping		= ipmi_wdt_ping,
+	.set_timeout	= ipmi_wdt_set_timeout,
+	.set_pretimeout = ipmi_wdt_set_pretimeout,
+};
 
-		/*
-		 * Don't start the timer now, let it start on the
-		 * first heartbeat.
-		 */
-		ipmi_start_timer_on_heartbeat = 1;
-		return stream_open(ino, filep);
+static const struct ipmi_user_hndl ipmi_hndlrs = {
+	.ipmi_recv_hndl           = ipmi_wdog_msg_handler,
+	.ipmi_watchdog_pretimeout = ipmi_wdog_pretimeout_handler,
+	.ipmi_panic_handler       = ipmi_wdog_panic_handler
+};
 
-	default:
-		return (-ENODEV);
-	}
-}
+#ifdef HAVE_DIE_NMI
+static DEFINE_MUTEX(ipmi_nmi_test_mutex);
+static bool nmi_handler_registered;
 
-static __poll_t ipmi_poll(struct file *file, poll_table *wait)
-{
-	__poll_t mask = 0;
+/* If a pretimeout occurs, this is used to allow only one panic to happen. */
+static atomic_t preop_panic_excl = ATOMIC_INIT(-1);
 
-	poll_wait(file, &read_q, wait);
+static int
+ipmi_nmi(unsigned int val, struct pt_regs *regs)
+{
+	struct ipmi_wdt *iwd = READ_ONCE(ipmi_wdt);
 
-	spin_lock_irq(&ipmi_read_lock);
-	if (data_to_read)
-		mask |= (EPOLLIN | EPOLLRDNORM);
-	spin_unlock_irq(&ipmi_read_lock);
+	/*
+	 * If we get here, it's an NMI that's not a memory or I/O
+	 * error.  We can't truly tell if it's from IPMI or not
+	 * without sending a message, and sending a message is almost
+	 * impossible because of locking.
+	 */
 
-	return mask;
-}
+	if (testing_nmi) {
+		testing_nmi = 2;
+		return NMI_HANDLED;
+	}
 
-static int ipmi_fasync(int fd, struct file *file, int on)
-{
-	int result;
+	if (!iwd)
+		return NMI_DONE;
 
-	result = fasync_helper(fd, file, on, &fasync_q);
+	/* If we are not expecting a timeout, ignore it. */
+	if (iwd->state == WDOG_TIMEOUT_NONE)
+		return NMI_DONE;
 
-	return (result);
-}
+	if (preaction_val != WDOG_PRETIMEOUT_NMI)
+		return NMI_DONE;
 
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
+	/*
+	 * If no one else handled the NMI, we assume it was the IPMI
+	 * watchdog.
+	 */
+	if (preop_val == WDOG_PREOP_PANIC) {
+		/*
+		 * On some machines, the heartbeat will give an error
+		 * and not work unless we re-enable the timer.  So
+		 * make it do so on the next heartbeat.
+		 */
+		atomic_set(&iwd->pretimeout_since_last_heartbeat, 1);
+		if (atomic_inc_and_test(&preop_panic_excl))
+			nmi_panic(regs, "pre-timeout");
 	}
 
-	expect_close = 0;
-
-	return 0;
+	return NMI_HANDLED;
 }
 
-static const struct file_operations ipmi_wdog_fops = {
-	.owner   = THIS_MODULE,
-	.read    = ipmi_read,
-	.poll    = ipmi_poll,
-	.write   = ipmi_write,
-	.unlocked_ioctl = ipmi_unlocked_ioctl,
-	.open    = ipmi_open,
-	.release = ipmi_close,
-	.fasync  = ipmi_fasync,
-	.llseek  = no_llseek,
-};
-
-static struct miscdevice ipmi_wdog_miscdev = {
-	.minor		= WATCHDOG_MINOR,
-	.name		= "watchdog",
-	.fops		= &ipmi_wdog_fops
-};
-
-static void ipmi_wdog_msg_handler(struct ipmi_recv_msg *msg,
-				  void                 *handler_data)
+static void nmi_check(struct ipmi_wdt *iwd)
 {
-	if (msg->msg.cmd == IPMI_WDOG_RESET_TIMER &&
-			msg->msg.data[0] == IPMI_WDOG_TIMER_NOT_INIT_RESP)
-		pr_info("response: The IPMI controller appears to have been reset, will attempt to reinitialize the watchdog timer\n");
-	else if (msg->msg.data[0] != 0)
-		pr_err("response: Error %x on cmd %x\n",
-		       msg->msg.data[0],
-		       msg->msg.cmd);
+	int old_state = iwd->state;
+	int old_pretimeout = iwd->wdd.pretimeout;
+	int old_timeout = iwd->wdd.timeout;
+	int rv;
+	unsigned int count;
 
-	ipmi_free_recv_msg(msg);
-}
+	if (iwd->nmi_works)
+		return;
 
-static void ipmi_wdog_pretimeout_handler(void *handler_data)
-{
-	if (preaction_val != WDOG_PRETIMEOUT_NONE) {
-		if (preop_val == WDOG_PREOP_PANIC) {
-			if (atomic_inc_and_test(&preop_panic_excl))
-				panic("Watchdog pre-timeout");
-		} else if (preop_val == WDOG_PREOP_GIVE_DATA) {
-			unsigned long flags;
-
-			spin_lock_irqsave(&ipmi_read_lock, flags);
-			data_to_read = 1;
-			wake_up_interruptible(&read_q);
-			kill_fasync(&fasync_q, SIGIO, POLL_IN);
-			spin_unlock_irqrestore(&ipmi_read_lock, flags);
+	mutex_lock(&ipmi_nmi_test_mutex);
+	if (!nmi_handler_registered) {
+		rv = register_nmi_handler(NMI_UNKNOWN, ipmi_nmi, 0,
+					  "ipmi");
+		if (rv) {
+			iwd->nmi_works = false;
+			pr_warn("Can't register nmi handler\n");
+			goto out_restore;
+		} else {
+			nmi_handler_registered = true;
 		}
 	}
 
 	/*
-	 * On some machines, the heartbeat will give an error and not
-	 * work unless we re-enable the timer.  So do so.
+	 * Set the pretimeout to go off in a second and give
+	 * ourselves 99 seconds to stop the timer.
 	 */
-	atomic_set(&pretimeout_since_last_heartbeat, 1);
-}
+	iwd->state = WDOG_TIMEOUT_RESET;
+	iwd->wdd.pretimeout = 99;
+	iwd->wdd.timeout = 100;
 
-static void ipmi_wdog_panic_handler(void *user_data)
-{
-	static int panic_event_handled;
+	testing_nmi = 1;
 
-	/*
-	 * On a panic, if we have a panic timeout, make sure to extend
-	 * the watchdog timer to a reasonable value to complete the
-	 * panic, if the watchdog timer is running.  Plus the
-	 * pretimeout is meaningless at panic time.
-	 */
-	if (watchdog_user && !panic_event_handled &&
-	    ipmi_watchdog_state != WDOG_TIMEOUT_NONE) {
-		/* Make sure we do this only once. */
-		panic_event_handled = 1;
+	rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_FORCE_HB, false);
+	if (rv) {
+		pr_warn("Error starting timer to test NMI: 0x%x.  The NMI pretimeout will likely not work\n",
+			rv);
+		iwd->nmi_works = false;
+		goto out_restore;
+	}
 
-		timeout = panic_wdt_timeout;
-		pretimeout = 0;
-		panic_halt_ipmi_set_timeout();
+	if (iwd->recv_msg.msg.data[0] != 0)  {
+		pr_warn("Error in IPMI NMI pretimeout set: 0x%x.  The NMI pretimeout will likely not work\n",
+			iwd->recv_msg.msg.data[0]);
+		iwd->nmi_works = false;
+		goto out_restore;
 	}
-}
 
-static const struct ipmi_user_hndl ipmi_hndlrs = {
-	.ipmi_recv_hndl           = ipmi_wdog_msg_handler,
-	.ipmi_watchdog_pretimeout = ipmi_wdog_pretimeout_handler,
-	.ipmi_panic_handler       = ipmi_wdog_panic_handler
-};
+	for (count = 0; count < 50; count++) {
+		if (testing_nmi == 2)
+			break;
+		msleep(20);
+	}
+
+	if (testing_nmi == 2) {
+		iwd->nmi_works = true;
+	} else {
+		iwd->nmi_works = false;
+		pr_warn("IPMI NMI didn't seem to occur.  The NMI pretimeout will likely not work\n");
+	}
+ out_restore:
+	testing_nmi = 0;
+	mutex_unlock(&ipmi_nmi_test_mutex);
+	iwd->wdd.pretimeout = old_pretimeout;
+	iwd->wdd.timeout = old_timeout;
+	iwd->state = old_state;
+	rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_FORCE_HB, false);
+	if (rv)
+		pr_warn("Unable to stop timer after NMI test: 0x%x.\n", rv);
+}
+#else
+static void nmi_check(struct ipmi_wdt *iwd)
+{
+	iwd->nmi_works = false;
+}
+#endif
 
-static void ipmi_register_watchdog(int ipmi_intf)
+static void ipmi_register_watchdog(int ipmi_intf, struct device *dev)
 {
+	struct ipmi_wdt *iwd = NULL;
 	int rv = -EBUSY;
 
-	if (watchdog_user)
+	mutex_lock(&ipmi_wdt_data_mutex);
+	if ((ifnum_to_use != -1) && (ifnum_to_use != ipmi_intf))
 		goto out;
-
-	if ((ifnum_to_use >= 0) && (ifnum_to_use != ipmi_intf))
+	/* -1 means allow the first interface. */
+	if (ifnum_to_use == -1 && ipmi_wdt)
 		goto out;
 
-	watchdog_ifnum = ipmi_intf;
-
-	rv = ipmi_create_user(ipmi_intf, &ipmi_hndlrs, NULL, &watchdog_user);
+	iwd = kzalloc(sizeof(*iwd), GFP_KERNEL);
+	if (!iwd) {
+		rv = -ENOMEM;
+		goto out;
+	}
+	iwd->ifnum = ipmi_intf;
+	init_completion(&iwd->msg_wait);
+	iwd->smi_msg.done = msg_free_smi;
+	iwd->recv_msg.done = msg_free_recv;
+	iwd->state = WDOG_TIMEOUT_NONE;
+	mutex_init(&iwd->lock);
+
+	rv = ipmi_create_user(ipmi_intf, &ipmi_hndlrs, iwd, &iwd->user);
 	if (rv < 0) {
 		pr_crit("Unable to register with ipmi\n");
 		goto out;
 	}
 
-	rv = ipmi_get_version(watchdog_user,
-			      &ipmi_version_major,
-			      &ipmi_version_minor);
+	rv = ipmi_get_version(iwd->user,
+			      &iwd->ipmi_version_major,
+			      &iwd->ipmi_version_minor);
 	if (rv) {
 		pr_warn("Unable to get IPMI version, assuming 1.0\n");
-		ipmi_version_major = 1;
-		ipmi_version_minor = 0;
+		iwd->ipmi_version_major = 1;
+		iwd->ipmi_version_minor = 0;
 	}
 
-	rv = misc_register(&ipmi_wdog_miscdev);
-	if (rv < 0) {
-		ipmi_destroy_user(watchdog_user);
-		watchdog_user = NULL;
-		pr_crit("Unable to register misc device\n");
+	iwd->wdd.ops = &ipmi_wdt_ops;
+	iwd->info = ipmi_wdt_ident;
+	iwd->info.firmware_version = (iwd->ipmi_version_major << 8 |
+				      iwd->ipmi_version_minor);
+	iwd->wdd.info = &iwd->info;
+	iwd->wdd.max_timeout = IPMI_MAX_TIMEOUT;
+	iwd->wdd.min_timeout = IPMI_MIN_TIMEOUT;
+	watchdog_stop_on_unregister(&iwd->wdd);
+	watchdog_set_nowayout(&iwd->wdd, nowayout);
+	watchdog_init_timeout(&iwd->wdd, timeout, NULL);
+	iwd->wdd.pretimeout = pretimeout;
+	iwd->wdd.parent = dev;
+
+	rv = watchdog_register_device(&iwd->wdd);
+	if (rv) {
+		ipmi_destroy_user(iwd->user);
+		pr_crit("Unable to register IPMI watchdog device\n");
+		goto out;
 	}
 
-#ifdef HAVE_DIE_NMI
-	if (nmi_handler_registered) {
-		int old_pretimeout = pretimeout;
-		int old_timeout = timeout;
-		int old_preop_val = preop_val;
-
-		/*
-		 * Set the pretimeout to go off in a second and give
-		 * ourselves plenty of time to stop the timer.
-		 */
-		ipmi_watchdog_state = WDOG_TIMEOUT_RESET;
-		preop_val = WDOG_PREOP_NONE; /* Make sure nothing happens */
-		pretimeout = 99;
-		timeout = 100;
+	nmi_check(iwd);
 
-		testing_nmi = 1;
-
-		rv = ipmi_set_timeout(IPMI_SET_TIMEOUT_FORCE_HB);
-		if (rv) {
-			pr_warn("Error starting timer to test NMI: 0x%x.  The NMI pretimeout will likely not work\n",
-				rv);
-			rv = 0;
-			goto out_restore;
-		}
-
-		msleep(1500);
-
-		if (testing_nmi != 2) {
-			pr_warn("IPMI NMI didn't seem to occur.  The NMI pretimeout will likely not work\n");
-		}
- out_restore:
-		testing_nmi = 0;
-		preop_val = old_preop_val;
-		pretimeout = old_pretimeout;
-		timeout = old_timeout;
+	if (preaction_val == WDOG_PRETIMEOUT_NMI && !iwd->nmi_works) {
+		pr_warn("NMI pretimeout test failed, disabling pretimeout.\n");
+		preaction_val = WDOG_PRETIMEOUT_NONE;
 	}
-#endif
+
+	ipmi_wdt = iwd;
 
  out:
-	if ((start_now) && (rv == 0)) {
+	mutex_unlock(&ipmi_wdt_data_mutex);
+	if (start_now && rv == 0) {
 		/* Run from startup, so start the timer now. */
 		start_now = 0; /* Disable this function after first startup. */
-		ipmi_watchdog_state = action_val;
-		ipmi_set_timeout(IPMI_SET_TIMEOUT_FORCE_HB);
+		iwd->state = action_val;
+		mutex_lock(&iwd->lock);
+		_ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_FORCE_HB, false);
+		mutex_unlock(&iwd->lock);
 		pr_info("Starting now!\n");
-	} else {
-		/* Stop the timer now. */
-		ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
-		ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
+	} else if (iwd && rv != 0) {
+		kfree(iwd);
 	}
 }
 
-static void ipmi_unregister_watchdog(int ipmi_intf)
+static void _ipmi_unregister_watchdog(struct ipmi_wdt *iwd)
 {
 	int rv;
-	struct ipmi_user *loc_user = watchdog_user;
-
-	if (!loc_user)
-		return;
-
-	if (watchdog_ifnum != ipmi_intf)
-		return;
-
-	/* Make sure no one can call us any more. */
-	misc_deregister(&ipmi_wdog_miscdev);
-
-	watchdog_user = NULL;
 
 	/*
-	 * Wait to make sure the message makes it out.  The lower layer has
-	 * pointers to our buffers, we want to make sure they are done before
-	 * we release our memory.
+	 * This function should make sure that the misc device has no
+	 * outstanding calls, thus we should have no messages being
+	 * used after this.
 	 */
-	while (atomic_read(&msg_tofree))
-		msg_free_smi(NULL);
+	watchdog_unregister_device(&iwd->wdd);
 
-	mutex_lock(&ipmi_watchdog_mutex);
+	/* Make sure no NMIs or interrupts are running. */
+	synchronize_rcu();
 
 	/* Disconnect from IPMI. */
-	rv = ipmi_destroy_user(loc_user);
+	rv = ipmi_destroy_user(iwd->user);
 	if (rv)
 		pr_warn("error unlinking from IPMI: %d\n",  rv);
 
-	/* If it comes back, restart it properly. */
-	ipmi_start_timer_on_heartbeat = 1;
-
-	mutex_unlock(&ipmi_watchdog_mutex);
+	kfree(iwd);
 }
 
-#ifdef HAVE_DIE_NMI
-static int
-ipmi_nmi(unsigned int val, struct pt_regs *regs)
+static void ipmi_unregister_watchdog(int ipmi_intf)
 {
-	/*
-	 * If we get here, it's an NMI that's not a memory or I/O
-	 * error.  We can't truly tell if it's from IPMI or not
-	 * without sending a message, and sending a message is almost
-	 * impossible because of locking.
-	 */
+	struct ipmi_wdt *iwd = NULL;
 
-	if (testing_nmi) {
-		testing_nmi = 2;
-		return NMI_HANDLED;
-	}
-
-	/* If we are not expecting a timeout, ignore it. */
-	if (ipmi_watchdog_state == WDOG_TIMEOUT_NONE)
-		return NMI_DONE;
-
-	if (preaction_val != WDOG_PRETIMEOUT_NMI)
-		return NMI_DONE;
-
-	/*
-	 * If no one else handled the NMI, we assume it was the IPMI
-	 * watchdog.
-	 */
-	if (preop_val == WDOG_PREOP_PANIC) {
-		/* On some machines, the heartbeat will give
-		   an error and not work unless we re-enable
-		   the timer.   So do so. */
-		atomic_set(&pretimeout_since_last_heartbeat, 1);
-		if (atomic_inc_and_test(&preop_panic_excl))
-			nmi_panic(regs, "pre-timeout");
+	mutex_lock(&ipmi_wdt_data_mutex);
+	if (ipmi_wdt->ifnum == ipmi_intf) {
+		iwd = ipmi_wdt;
+		ipmi_wdt = NULL;
 	}
+	mutex_unlock(&ipmi_wdt_data_mutex);
+	if (!iwd)
+		return;
 
-	return NMI_HANDLED;
+	_ipmi_unregister_watchdog(iwd);
 }
-#endif
 
 static int wdog_reboot_handler(struct notifier_block *this,
 			       unsigned long         code,
 			       void                  *unused)
 {
 	static int reboot_event_handled;
+	struct ipmi_wdt *iwd = READ_ONCE(ipmi_wdt);
 
-	if ((watchdog_user) && (!reboot_event_handled)) {
+	if (iwd && !reboot_event_handled) {
 		/* Make sure we only do this once. */
 		reboot_event_handled = 1;
 
 		if (code == SYS_POWER_OFF || code == SYS_HALT) {
 			/* Disable the WDT if we are shutting down. */
-			ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
-			ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
-		} else if (ipmi_watchdog_state != WDOG_TIMEOUT_NONE) {
+			iwd->state = WDOG_TIMEOUT_NONE;
+			_ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_NO_HB,
+					     false);
+		} else if (iwd->state != WDOG_TIMEOUT_NONE) {
 			/* Set a long timer to let the reboot happen or
 			   reset if it hangs, but only if the watchdog
 			   timer was already running. */
-			if (timeout < 120)
-				timeout = 120;
-			pretimeout = 0;
-			ipmi_watchdog_state = WDOG_TIMEOUT_RESET;
-			ipmi_set_timeout(IPMI_SET_TIMEOUT_NO_HB);
+			if (iwd->wdd.timeout < panic_wdt_timeout)
+				iwd->wdd.timeout = panic_wdt_timeout;
+			iwd->wdd.pretimeout = 0;
+			_ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_NO_HB,
+					     false);
 		}
 	}
 	return NOTIFY_OK;
@@ -1167,147 +1175,30 @@ static struct notifier_block wdog_reboot_notifier = {
 	.priority	= 0
 };
 
-static void ipmi_new_smi(int if_num, struct device *device)
-{
-	ipmi_register_watchdog(if_num);
-}
-
-static void ipmi_smi_gone(int if_num)
-{
-	ipmi_unregister_watchdog(if_num);
-}
-
-static struct ipmi_smi_watcher smi_watcher = {
-	.owner    = THIS_MODULE,
-	.new_smi  = ipmi_new_smi,
-	.smi_gone = ipmi_smi_gone
-};
-
-static int action_op(const char *inval, char *outval)
-{
-	if (outval)
-		strcpy(outval, action);
-
-	if (!inval)
-		return 0;
-
-	if (strcmp(inval, "reset") == 0)
-		action_val = WDOG_TIMEOUT_RESET;
-	else if (strcmp(inval, "none") == 0)
-		action_val = WDOG_TIMEOUT_NONE;
-	else if (strcmp(inval, "power_cycle") == 0)
-		action_val = WDOG_TIMEOUT_POWER_CYCLE;
-	else if (strcmp(inval, "power_off") == 0)
-		action_val = WDOG_TIMEOUT_POWER_DOWN;
-	else
-		return -EINVAL;
-	strcpy(action, inval);
-	return 0;
-}
-
-static int preaction_op(const char *inval, char *outval)
-{
-	if (outval)
-		strcpy(outval, preaction);
-
-	if (!inval)
-		return 0;
-
-	if (strcmp(inval, "pre_none") == 0)
-		preaction_val = WDOG_PRETIMEOUT_NONE;
-	else if (strcmp(inval, "pre_smi") == 0)
-		preaction_val = WDOG_PRETIMEOUT_SMI;
-#ifdef HAVE_DIE_NMI
-	else if (strcmp(inval, "pre_nmi") == 0)
-		preaction_val = WDOG_PRETIMEOUT_NMI;
-#endif
-	else if (strcmp(inval, "pre_int") == 0)
-		preaction_val = WDOG_PRETIMEOUT_MSG_INT;
-	else
-		return -EINVAL;
-	strcpy(preaction, inval);
-	return 0;
-}
-
-static int preop_op(const char *inval, char *outval)
-{
-	if (outval)
-		strcpy(outval, preop);
-
-	if (!inval)
-		return 0;
-
-	if (strcmp(inval, "preop_none") == 0)
-		preop_val = WDOG_PREOP_NONE;
-	else if (strcmp(inval, "preop_panic") == 0)
-		preop_val = WDOG_PREOP_PANIC;
-	else if (strcmp(inval, "preop_give_data") == 0)
-		preop_val = WDOG_PREOP_GIVE_DATA;
-	else
-		return -EINVAL;
-	strcpy(preop, inval);
-	return 0;
-}
-
-static void check_parms(void)
-{
-#ifdef HAVE_DIE_NMI
-	int do_nmi = 0;
-	int rv;
-
-	if (preaction_val == WDOG_PRETIMEOUT_NMI) {
-		do_nmi = 1;
-		if (preop_val == WDOG_PREOP_GIVE_DATA) {
-			pr_warn("Pretimeout op is to give data but NMI pretimeout is enabled, setting pretimeout op to none\n");
-			preop_op("preop_none", NULL);
-			do_nmi = 0;
-		}
-	}
-	if (do_nmi && !nmi_handler_registered) {
-		rv = register_nmi_handler(NMI_UNKNOWN, ipmi_nmi, 0,
-						"ipmi");
-		if (rv) {
-			pr_warn("Can't register nmi handler\n");
-			return;
-		} else
-			nmi_handler_registered = 1;
-	} else if (!do_nmi && nmi_handler_registered) {
-		unregister_nmi_handler(NMI_UNKNOWN, "ipmi");
-		nmi_handler_registered = 0;
-	}
-#endif
-}
-
 static int __init ipmi_wdog_init(void)
 {
 	int rv;
 
 	if (action_op(action, NULL)) {
-		action_op("reset", NULL);
 		pr_info("Unknown action '%s', defaulting to reset\n", action);
+		action_op("reset", NULL);
 	}
 
 	if (preaction_op(preaction, NULL)) {
-		preaction_op("pre_none", NULL);
 		pr_info("Unknown preaction '%s', defaulting to none\n",
 			preaction);
+		preaction_op("pre_none", NULL);
 	}
 
 	if (preop_op(preop, NULL)) {
-		preop_op("preop_none", NULL);
 		pr_info("Unknown preop '%s', defaulting to none\n", preop);
+		preop_op("preop_none", NULL);
 	}
 
-	check_parms();
-
 	register_reboot_notifier(&wdog_reboot_notifier);
 
 	rv = ipmi_smi_watcher_register(&smi_watcher);
 	if (rv) {
-#ifdef HAVE_DIE_NMI
-		if (nmi_handler_registered)
-			unregister_nmi_handler(NMI_UNKNOWN, "ipmi");
-#endif
 		unregister_reboot_notifier(&wdog_reboot_notifier);
 		pr_warn("can't register smi watcher\n");
 		return rv;
@@ -1321,7 +1212,8 @@ static int __init ipmi_wdog_init(void)
 static void __exit ipmi_wdog_exit(void)
 {
 	ipmi_smi_watcher_unregister(&smi_watcher);
-	ipmi_unregister_watchdog(watchdog_ifnum);
+	if (ipmi_wdt)
+		ipmi_unregister_watchdog(ipmi_wdt->ifnum);
 
 #ifdef HAVE_DIE_NMI
 	if (nmi_handler_registered)
-- 
2.17.1

