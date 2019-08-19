Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9612194F27
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbfHSUhU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:20 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44171 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbfHSUhU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:20 -0400
Received: by mail-oi1-f195.google.com with SMTP id k22so2362005oiw.11
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=fsycyhYdZgkF4YS9wk2+CF1iHIRRiA9YfeRdUgHPIlg=;
        b=DOLEreBAIJWUMp6dMGgetaCZnKLvOhLhBoHTakt5yn3TFJtfi5xyUnH5q+mkX37Wcb
         PRNBhG/ysGI+6LMIwj0AABl11CqS1+s/3TkSCJNlcgdPELueWZm1L9zywQBVWwfGjWRM
         Vnx9FKnWOT4eQ4+4Su+uQ6WuUMa3TahiFWq9To7UuC7gW5dOcl2PbmuHH5ildEb1oRKu
         rvw/JarzLbuOZEWrtW7zyYVBrJUS1fsj5usCyFbRPy1JyVg0MvkeYY7epWAmigKhzQNx
         DK16BQbX2V+eWUIRvIZ74I8X4M2xHr6ArP56ErminEYnE/qZj9xDKEAttngdzw7mKI3d
         Q+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=fsycyhYdZgkF4YS9wk2+CF1iHIRRiA9YfeRdUgHPIlg=;
        b=nRlObLXCyqnLttyde/nJcURKUQEWK5tcRHFwt6PWCjMY0J2AjRFwtUnQ2HMIfOhJDf
         XlptiGwwNfZOmXzza6U0vOXz7pXQDZ5MK1TUQNGPgBvapcklkWbMkbosyn9SV/8KsTA3
         p/7f3JWtpknmSZ4FUBaJf5uWG8IhL2Lvv/n/M+DrAgE5wzu8hRmzSYkfpJunN1xUe2JF
         raoBX+Ds3IDb549yHkPETSqzVYmlfJt2P8mlw/SrzhzK30jMdH7Q1e0JcVm23O++8Xxl
         MjhkOK+ho5UGPeBpq72cboaKdlMCJxM0Zgfx3wo1Pu5d3x7CmbXUACuK9JdiowGJ7pKW
         iSSA==
X-Gm-Message-State: APjAAAWe/cWe3zUWvydHy/2P62Cfn3qynvu7DY90HOiLblM/uexmKd3J
        QWL3T7NnKpdi5evCFxVHdw==
X-Google-Smtp-Source: APXvYqxIaPM1ZctBVkE7Ro+TREsdfryfxj/i6ycz7pQXyKH4dMgOCuTtzqB60i7vAR6HLJ+lPzJGMg==
X-Received: by 2002:aca:5246:: with SMTP id g67mr9201133oib.116.1566247038221;
        Mon, 19 Aug 2019 13:37:18 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id n109sm5986812ota.36.2019.08.19.13.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id 8877B1805AE;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id 70C8B30232A; Mon, 19 Aug 2019 15:37:14 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 09/12] watchdog:ipmi: Implement action and preaction functions
Date:   Mon, 19 Aug 2019 15:37:08 -0500
Message-Id: <20190819203711.32599-10-minyard@acm.org>
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

This required cleanup of how actions and preactions were done.  Setting
the values through the sysfs interface still works, though the sysfs
parameters it will not display changes that come in through the
standard watchdog interface.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/ipmi_watchdog.c | 365 +++++++++++++++++++++----------
 1 file changed, 246 insertions(+), 119 deletions(-)

diff --git a/drivers/watchdog/ipmi_watchdog.c b/drivers/watchdog/ipmi_watchdog.c
index 218c01707c0b..77dbd3851fdc 100644
--- a/drivers/watchdog/ipmi_watchdog.c
+++ b/drivers/watchdog/ipmi_watchdog.c
@@ -80,12 +80,6 @@
 #define WDOG_PRETIMEOUT_NMI		2
 #define WDOG_PRETIMEOUT_MSG_INT		3
 
-/* Operations that can be performed on a pretimout. */
-#define WDOG_PREOP_NONE		0
-#define WDOG_PREOP_PANIC	1
-/* Cause data to be available to read.  Doesn't work in NMI mode. */
-#define WDOG_PREOP_GIVE_DATA	2
-
 /* Actions to perform on a full timeout. */
 #define WDOG_SET_TIMEOUT_ACT(byte, use) \
 	byte = ((byte) & 0xf8) | ((use) & 0x7)
@@ -144,6 +138,7 @@ struct ipmi_wdt {
 	struct ipmi_recv_msg recv_msg;
 
 	int state; /* One of WDOG_TIMEOUT_xxx, NONE if disabled. */
+	int prestate;  /* One of WDOG_PRETIMEOUT_xxx. */
 
 	bool nmi_works;
 
@@ -164,6 +159,8 @@ static int ipmi_set_timeout(struct ipmi_wdt *iwd, int timeout,
 			    int do_heartbeat);
 static int ipmi_set_pretimeout(struct ipmi_wdt *iwd, int timeout,
 			       int do_heartbeat);
+static int ipmi_set_action(struct ipmi_wdt *iwd, unsigned int action);
+static int ipmi_set_preaction(struct ipmi_wdt *iwd, unsigned int action);
 static void ipmi_register_watchdog(int ipmi_intf, struct device *dev);
 static void _ipmi_unregister_watchdog(struct ipmi_wdt *iwd);
 static void ipmi_unregister_watchdog(int ipmi_intf);
@@ -189,18 +186,14 @@ static int timeout = 10; /* Default timeout. */
 static int pretimeout; /* Default pretimeout. */
 static int panic_wdt_timeout = 255; /* Default timeout to set on panic */
 
-/* Default action is to reset the board on a timeout. */
-static unsigned char action_val = WDOG_TIMEOUT_RESET;
-
-static char action[16] = "reset";
-
-static unsigned char preaction_val = WDOG_PRETIMEOUT_NONE;
-
-static char preaction[16] = "pre_none";
-
-static unsigned char preop_val = WDOG_PREOP_NONE;
+#define WDOG_PREOP_NONE		0
+#define WDOG_PREOP_PANIC	1
+#define WDOG_PREOP_GIVE_DATA	2
 
-static char preop[16] = "preop_none";
+/* Default action is to reset the board on a timeout. */
+static unsigned char def_action_val = WDIOA_RESET;
+static unsigned char def_preaction_val = WDIOP_NONE;
+static unsigned char def_preop_val = WDOG_PREOP_NONE;
 
 /*
  * If true, the driver will start running as soon as it is configured
@@ -211,33 +204,41 @@ static int start_now;
 static int action_op(const char *inval, char *outval)
 {
 	int rv = 0;
+	unsigned int new_val;
 
 	mutex_lock(&ipmi_wdt_data_mutex);
-	if (outval)
-		strcpy(outval, action);
+	if (outval) {
+		switch (def_action_val) {
+		case WDIOA_RESET:
+			strcpy(outval, "reset");
+			break;
+		case WDIOA_POWER_OFF:
+			strcpy(outval, "power_off");
+			break;
+		case WDIOA_POWER_CYCLE:
+			strcpy(outval, "power_cycle");
+			break;
+		default:
+			strcpy(outval, "?");
+			break;
+		}
+	}
 
 	if (!inval)
 		goto out_unlock;
 
 	if (strcmp(inval, "reset") == 0)
-		action_val = WDOG_TIMEOUT_RESET;
-	else if (strcmp(inval, "none") == 0)
-		action_val = WDOG_TIMEOUT_NONE;
+		new_val = WDIOA_RESET;
 	else if (strcmp(inval, "power_cycle") == 0)
-		action_val = WDOG_TIMEOUT_POWER_CYCLE;
+		new_val = WDIOA_POWER_CYCLE;
 	else if (strcmp(inval, "power_off") == 0)
-		action_val = WDOG_TIMEOUT_POWER_DOWN;
+		new_val = WDIOA_POWER_OFF;
 	else
 		rv = -EINVAL;
-	if (!rv) {
-		strcpy(action, inval);
-		if (ipmi_wdt && ipmi_wdt->state != WDOG_TIMEOUT_NONE) {
-			ipmi_wdt->state = action_val;
-			rv = _ipmi_update_timeout(ipmi_wdt,
-					IPMI_SET_TIMEOUT_HB_IF_NECESSARY,
-					false);
-		}
-	}
+	if (!rv && ipmi_wdt)
+		rv = ipmi_set_action(ipmi_wdt, new_val);
+	if (!rv)
+		def_action_val = new_val;
 out_unlock:
 	mutex_unlock(&ipmi_wdt_data_mutex);
 
@@ -247,84 +248,115 @@ static int action_op(const char *inval, char *outval)
 static int preaction_op(const char *inval, char *outval)
 {
 	int rv = 0;
+	unsigned int new_val;
 
 	mutex_lock(&ipmi_wdt_data_mutex);
-	if (outval)
-		strcpy(outval, preaction);
+	if (outval) {
+		switch (def_preaction_val) {
+		case WDIOP_NONE:
+			strcpy(outval, "pre_none");
+			break;
+		case WDIOP_NMI:
+			strcpy(outval, "pre_nmi");
+			break;
+		case WDIOP_SMI:
+			strcpy(outval, "pre_smi");
+			break;
+		case WDIOP_INTERRUPT:
+			strcpy(outval, "pre_int");
+			break;
+		default:
+			strcpy(outval, "?");
+			break;
+		}
+	}
 
 	if (!inval)
 		goto out_unlock;
 
-	if (strcmp(inval, "pre_none") == 0)
-		preaction_val = WDOG_PRETIMEOUT_NONE;
-	else if (strcmp(inval, "pre_smi") == 0)
-		preaction_val = WDOG_PRETIMEOUT_SMI;
+	if (strcmp(inval, "pre_none") == 0) {
+		new_val = WDIOP_NONE;
+	} else if (strcmp(inval, "pre_smi") == 0) {
+		new_val = WDIOP_SMI;
 #ifdef HAVE_DIE_NMI
-	else if (strcmp(inval, "pre_nmi") == 0) {
-		if (preop_val == WDOG_PREOP_GIVE_DATA)
-			rv = -EINVAL;
-		else if (ipmi_wdt && !ipmi_wdt->nmi_works)
-			rv = -EINVAL;
-		else
-			preaction_val = WDOG_PRETIMEOUT_NMI;
-	}
+	} else if (strcmp(inval, "pre_nmi") == 0) {
+		new_val = WDIOP_NMI;
 #endif
-	else if (strcmp(inval, "pre_int") == 0)
-		preaction_val = WDOG_PRETIMEOUT_MSG_INT;
-	else
+	} else if (strcmp(inval, "pre_int") == 0) {
+		new_val = WDIOP_INTERRUPT;
+	} else {
 		rv = -EINVAL;
-	if (!rv) {
-		strcpy(preaction, inval);
-		if (ipmi_wdt && ipmi_wdt->state != WDOG_TIMEOUT_NONE &&
-		    ipmi_wdt->wdd.pretimeout) {
-			rv = _ipmi_update_timeout(ipmi_wdt,
-					IPMI_SET_TIMEOUT_HB_IF_NECESSARY,
-					false);
-		}
 	}
+	if (!rv && ipmi_wdt)
+		rv = ipmi_set_preaction(ipmi_wdt, new_val);
+	if (!rv)
+		def_preaction_val = new_val;
 out_unlock:
 	mutex_unlock(&ipmi_wdt_data_mutex);
 
 	return rv;
 }
 
+static const char *preop_to_governor(unsigned int preop)
+{
+	switch (preop) {
+	case WDOG_PREOP_NONE:
+		return "noop";
+	case WDOG_PREOP_PANIC:
+		return "panic";
+	case WDOG_PREOP_GIVE_DATA:
+		return "read_data";
+	default:
+		return NULL;
+	}
+}
 static int preop_op(const char *inval, char *outval)
 {
 	int rv = 0;
 	const char *gov = NULL;
-	unsigned int orig_val;
+	unsigned int new_val;
 
 	mutex_lock(&ipmi_wdt_data_mutex);
-	if (outval)
-		strcpy(outval, preop);
+	if (outval) {
+		switch (def_preop_val) {
+		case WDOG_PREOP_NONE:
+			strcpy(outval, "preop_none");
+			break;
+		case WDOG_PREOP_PANIC:
+			strcpy(outval, "preop_panic");
+			break;
+		case WDOG_PREOP_GIVE_DATA:
+			strcpy(outval, "preop_give_data");
+			break;
+		default:
+			strcpy(outval, "?");
+			break;
+		}
+	}
 
 	if (!inval)
 		goto out_unlock;
 
-	orig_val = preop_val;
 	if (strcmp(inval, "preop_none") == 0) {
-		preop_val = WDOG_PREOP_NONE;
-		gov = "noop";
+		new_val = WDOG_PREOP_NONE;
 	} else if (strcmp(inval, "preop_panic") == 0) {
-		preop_val = WDOG_PREOP_PANIC;
-		gov = "panic";
+		new_val = WDOG_PREOP_PANIC;
 	} else if (strcmp(inval, "preop_give_data") == 0) {
-		if (preaction_val == WDOG_PRETIMEOUT_NMI)
-			rv = -EINVAL;
-		else {
-			preop_val = WDOG_PREOP_GIVE_DATA;
-			gov = "read_data";
-		}
+		new_val = WDOG_PREOP_GIVE_DATA;
 	} else {
 		rv = -EINVAL;
 	}
-	if (!rv) {
-		rv = watchdog_pretimeout_governor_set(&ipmi_wdt->wdd, gov);
-		if (rv)
-			preaction_val = orig_val;
-		else
-			strcpy(preop, inval);
+	if (!rv && ipmi_wdt) {
+		gov = preop_to_governor(new_val);
+		if (!gov)
+			rv = -EINVAL;
+		if (!rv) {
+			rv = watchdog_pretimeout_governor_set(&ipmi_wdt->wdd,
+							      gov);
+		}
 	}
+	if (!rv)
+		def_preop_val = new_val;
 out_unlock:
 	mutex_unlock(&ipmi_wdt_data_mutex);
 
@@ -551,7 +583,7 @@ static int __ipmi_update_timeout(struct ipmi_wdt *iwd, int *send_heartbeat_now)
 	WDOG_SET_TIMEOUT_ACT(data[1], iwd->state);
 	if ((iwd->wdd.pretimeout > 0) &&
 	    (iwd->state != WDOG_TIMEOUT_NONE)) {
-		WDOG_SET_PRETIMEOUT_ACT(data[1], preaction_val);
+		WDOG_SET_PRETIMEOUT_ACT(data[1], iwd->prestate);
 		data[2] = iwd->wdd.pretimeout;
 	} else {
 		WDOG_SET_PRETIMEOUT_ACT(data[1], WDOG_PRETIMEOUT_NONE);
@@ -863,19 +895,36 @@ static void ipmi_wdog_panic_handler(void *user_data)
 	}
 }
 
-static int ipmi_wdt_start(struct watchdog_device *wdd)
+static int _ipmi_wdt_start(struct ipmi_wdt *iwd)
 {
-	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
-	int rv;
+	int rv = 0;
 
-	mutex_lock(&iwd->lock);
-	iwd->state = action_val;
-	rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_FORCE_HB, false);
-	mutex_unlock(&iwd->lock);
+	switch (iwd->wdd.action) {
+	case WDIOA_RESET:
+		iwd->state = WDOG_TIMEOUT_RESET;
+		break;
+	case WDIOA_POWER_OFF:
+		iwd->state = WDOG_TIMEOUT_RESET;
+		break;
+	case WDIOA_POWER_CYCLE:
+		iwd->state = WDOG_TIMEOUT_RESET;
+		break;
+	default:
+		rv = -EINVAL;
+		break;
+	}
+	if (!rv)
+		rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_FORCE_HB,
+					  false);
 
 	return rv;
 }
 
+static int ipmi_wdt_start(struct watchdog_device *wdd)
+{
+	return _ipmi_wdt_start(wdd_to_ipmi_wdt(wdd));
+}
+
 static int ipmi_wdt_stop(struct watchdog_device *wdd)
 {
 	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
@@ -903,25 +952,101 @@ static int ipmi_wdt_ping(struct watchdog_device *wdd)
 
 static int ipmi_wdt_set_timeout(struct watchdog_device *wdd, unsigned int val)
 {
-	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
-
-	return ipmi_set_timeout(iwd, val, IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+	return ipmi_set_timeout(wdd_to_ipmi_wdt(wdd), val,
+				IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
 }
 
 static int ipmi_wdt_set_pretimeout(struct watchdog_device *wdd,
 				   unsigned int val)
 {
 	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
-	int rv;
+
+	return ipmi_set_pretimeout(iwd, val, IPMI_SET_TIMEOUT_HB_IF_NECESSARY);
+}
+
+static int ipmi_set_action(struct ipmi_wdt *iwd, unsigned int val)
+{
+	int rv = 0;
 
 	mutex_lock(&iwd->lock);
-	iwd->wdd.pretimeout = val;
-	rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_NO_HB, false);
+	if (val == iwd->wdd.action)
+		goto out_unlock;
+	switch (val) {
+	case WDIOA_RESET:
+	case WDIOA_POWER_OFF:
+	case WDIOA_POWER_CYCLE:
+		iwd->wdd.action = val;
+		break;
+	default:
+		rv = -EINVAL;
+	}
+	if (!rv)
+		rv = _ipmi_wdt_start(iwd);
+out_unlock:
 	mutex_unlock(&iwd->lock);
 
 	return rv;
 }
 
+static int ipmi_wdt_set_action(struct watchdog_device *wdd,
+			       unsigned int val)
+{
+	return ipmi_set_action(wdd_to_ipmi_wdt(wdd), val);
+}
+
+static int ipmi_set_preaction(struct ipmi_wdt *iwd, unsigned int val)
+{
+	int rv = 0;
+	int new_state = 0;
+
+	mutex_lock(&iwd->lock);
+	if (val == iwd->wdd.preaction)
+		goto out_unlock;
+	switch (val) {
+	case WDIOP_NONE:
+		new_state = WDOG_PRETIMEOUT_NONE;
+		break;
+	case WDIOP_SMI:
+		new_state = WDOG_PRETIMEOUT_SMI;
+		break;
+	case WDIOP_INTERRUPT:
+		new_state = WDOG_PRETIMEOUT_MSG_INT;
+		break;
+#ifdef HAVE_DIE_NMI
+	case WDIOP_NMI:
+		if (!iwd->nmi_works)
+			rv = -EINVAL;
+		else
+			new_state = WDOG_PRETIMEOUT_NMI;
+		break;
+#endif
+	default:
+		rv = -EINVAL;
+	}
+	if (!rv) {
+		int old_preaction = iwd->wdd.preaction;
+		int old_prestate = iwd->prestate;
+
+		iwd->wdd.preaction = val;
+		iwd->prestate = new_state;
+		rv = _ipmi_wdt_start(iwd);
+		if (rv) {
+			iwd->wdd.preaction = old_preaction;
+			iwd->prestate = old_prestate;
+		}
+	}
+out_unlock:
+	mutex_unlock(&iwd->lock);
+
+	return rv;
+}
+
+static int ipmi_wdt_set_preaction(struct watchdog_device *wdd,
+				  unsigned int val)
+{
+	return ipmi_set_preaction(wdd_to_ipmi_wdt(wdd), val);
+}
+
 static const struct watchdog_info ipmi_wdt_ident = {
 	.options	= WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
 			  WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE,
@@ -936,7 +1061,9 @@ static const struct watchdog_ops ipmi_wdt_ops = {
 	.ping		= ipmi_wdt_ping,
 	.set_timeout	= ipmi_wdt_set_timeout,
 	.set_pretimeout = ipmi_wdt_set_pretimeout,
-	.get_timeleft   = ipmi_wdt_get_timeleft,
+	.get_timeleft	= ipmi_wdt_get_timeleft,
+	.set_action	= ipmi_wdt_set_action,
+	.set_preaction	= ipmi_wdt_set_preaction,
 };
 
 static const struct ipmi_user_hndl ipmi_hndlrs = {
@@ -976,14 +1103,14 @@ ipmi_nmi(unsigned int val, struct pt_regs *regs)
 	if (iwd->state == WDOG_TIMEOUT_NONE)
 		return NMI_DONE;
 
-	if (preaction_val != WDOG_PRETIMEOUT_NMI)
+	if (iwd->wdd.preaction != WDIOP_NMI)
 		return NMI_DONE;
 
 	/*
 	 * If no one else handled the NMI, we assume it was the IPMI
 	 * watchdog.
 	 */
-	if (preop_val == WDOG_PREOP_PANIC) {
+	if (iwd->wdd.gov && strcmp(iwd->wdd.gov->name, "panic") == 0) {
 		/*
 		 * On some machines, the heartbeat will give an error
 		 * and not work unless we re-enable the timer.  So
@@ -1000,6 +1127,7 @@ ipmi_nmi(unsigned int val, struct pt_regs *regs)
 static void nmi_check(struct ipmi_wdt *iwd)
 {
 	int old_state = iwd->state;
+	int old_prestate = iwd->prestate;
 	int old_pretimeout = iwd->wdd.pretimeout;
 	int old_timeout = iwd->wdd.timeout;
 	int rv;
@@ -1026,6 +1154,7 @@ static void nmi_check(struct ipmi_wdt *iwd)
 	 * ourselves 99 seconds to stop the timer.
 	 */
 	iwd->state = WDOG_TIMEOUT_RESET;
+	iwd->prestate = WDOG_PRETIMEOUT_NMI;
 	iwd->wdd.pretimeout = 99;
 	iwd->wdd.timeout = 100;
 
@@ -1063,6 +1192,7 @@ static void nmi_check(struct ipmi_wdt *iwd)
 	mutex_unlock(&ipmi_nmi_test_mutex);
 	iwd->wdd.pretimeout = old_pretimeout;
 	iwd->wdd.timeout = old_timeout;
+	iwd->prestate = old_prestate;
 	iwd->state = old_state;
 	rv = _ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_FORCE_HB, false);
 	if (rv)
@@ -1079,6 +1209,7 @@ static void ipmi_register_watchdog(int ipmi_intf, struct device *dev)
 {
 	struct ipmi_wdt *iwd = NULL;
 	int rv = -EBUSY;
+	const char *gov;
 
 	mutex_lock(&ipmi_wdt_data_mutex);
 	if ((ifnum_to_use != -1) && (ifnum_to_use != ipmi_intf))
@@ -1126,6 +1257,8 @@ static void ipmi_register_watchdog(int ipmi_intf, struct device *dev)
 	watchdog_init_timeout(&iwd->wdd, timeout, NULL);
 	iwd->wdd.pretimeout = pretimeout;
 	iwd->wdd.parent = dev;
+	iwd->wdd.action = def_action_val;
+	iwd->wdd.preaction = def_preaction_val;
 
 	rv = watchdog_register_device(&iwd->wdd);
 	if (rv) {
@@ -1136,24 +1269,34 @@ static void ipmi_register_watchdog(int ipmi_intf, struct device *dev)
 
 	nmi_check(iwd);
 
-	if (preaction_val == WDOG_PRETIMEOUT_NMI && !iwd->nmi_works) {
+	if (iwd->wdd.preaction == WDIOP_NMI && !iwd->nmi_works) {
 		pr_warn("NMI pretimeout test failed, disabling pretimeout.\n");
-		preaction_val = WDOG_PRETIMEOUT_NONE;
+		iwd->wdd.preaction = WDIOP_NONE;
+	}
+
+	gov = preop_to_governor(def_preop_val);
+	if (!gov) {
+		pr_warn("Invalid preop value: %d\n", def_preop_val);
+	} else {
+		rv = watchdog_pretimeout_governor_set(&iwd->wdd, gov);
+		if (rv)
+			pr_warn("Setting governor to %s failed: %d\n",
+				gov, rv);
 	}
 
 	ipmi_wdt = iwd;
+	rv = 0;
 
  out:
 	mutex_unlock(&ipmi_wdt_data_mutex);
 	if (start_now && rv == 0) {
 		/* Run from startup, so start the timer now. */
 		start_now = 0; /* Disable this function after first startup. */
-		iwd->state = action_val;
-		mutex_lock(&iwd->lock);
-		_ipmi_update_timeout(iwd, IPMI_SET_TIMEOUT_FORCE_HB, false);
-		mutex_unlock(&iwd->lock);
-		pr_info("Starting now!\n");
-	} else if (iwd && rv != 0) {
+		if (_ipmi_wdt_start(iwd))
+			pr_warn("Starting now failed!\n");
+		else
+			pr_info("Starting now!\n");
+	} else if (iwd && rv) {
 		kfree(iwd);
 	}
 }
@@ -1236,22 +1379,6 @@ static int __init ipmi_wdog_init(void)
 {
 	int rv;
 
-	if (action_op(action, NULL)) {
-		pr_info("Unknown action '%s', defaulting to reset\n", action);
-		action_op("reset", NULL);
-	}
-
-	if (preaction_op(preaction, NULL)) {
-		pr_info("Unknown preaction '%s', defaulting to none\n",
-			preaction);
-		preaction_op("pre_none", NULL);
-	}
-
-	if (preop_op(preop, NULL)) {
-		pr_info("Unknown preop '%s', defaulting to none\n", preop);
-		preop_op("preop_none", NULL);
-	}
-
 	register_reboot_notifier(&wdog_reboot_notifier);
 
 	rv = ipmi_smi_watcher_register(&smi_watcher);
-- 
2.17.1

