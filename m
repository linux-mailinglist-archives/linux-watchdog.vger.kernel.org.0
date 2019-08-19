Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED0094F25
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbfHSUhS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:18 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44852 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbfHSUhS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:18 -0400
Received: by mail-ot1-f66.google.com with SMTP id w4so2928670ote.11
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=u29FeR1SKyP0iadm6DJ9FKc4kWwIxuJkgydwi575YWQ=;
        b=DBWh8YkvU59NDatDgFlNzC7Q+uf8pXXzLtImsY3akNmv/5e71OS+zq8UNgzo2o1fV0
         S/WAwIzjwzjoZFzPK7Z2JB8dlYqxOJ9iHaQx+pf3KhlTszCHUAc6IBbOVHR2qSnp1qfW
         HWCxusHvQadoeGx6tfRi8HOrQQW420t4O+tYh7uIc1rpfNaWeyjdh8aL/WAPXc1AUl1g
         gcZZrfqCjVYD106NBYl0kUL3Hjb+M675qOlxufcvOkx2QJCV7SCV9qlQwjcxBvAbCZOR
         jY08Lsb4fxXyvD3DWKSbqJK/jPLhP5JDRA5iOOz3RFR0e/nk5RFpp4F2dZTJftDaMCRl
         bopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=u29FeR1SKyP0iadm6DJ9FKc4kWwIxuJkgydwi575YWQ=;
        b=FdDFAbHPtYbOGE7nBzNvg2aUqB8LaUy8Hz18HPv04VCCdwAUvt0GrWlLHwm6rBQeaL
         olNpk0XTrEJQc6Mav4jJwGY2N7LyWyPmHN3DWzWG766sygAq5MR++JV1kxl1vd838zJh
         cRQfTBAb6XXjeA3VvCwV9XeQDmBuy2pMFr3L1LwALMMomE4vhd8gSRXN7HsxRL4pPXrE
         lsgMwriPe/K0JJFTzGQ6cPXXVc5G76IG5JJ80WH3DTySLwjcdeg2uPrYzO8x/ofqKxJi
         Ieji7bcIoxtJLdcOy5mO6r7RHTZbXcIA4+AzMHG4ZNN+sPsgW6PaMjQQ693FZErW7Qqg
         Nuhw==
X-Gm-Message-State: APjAAAXu+RlOFFaTL5sqkorOpFuCFmofslao81KMl0uZH8FqkSDOciTk
        A8EpEsER7pdk+mMXVohxYrk8KbM=
X-Google-Smtp-Source: APXvYqyjoloZgKs0ZUk9UYyL861P+5YUAadCySkZ30FyELdfU66dyVTMmrLikHN3HvrtheY0PUzE1g==
X-Received: by 2002:a9d:a87:: with SMTP id 7mr19336659otq.256.1566247037099;
        Mon, 19 Aug 2019 13:37:17 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id v24sm5746993otj.78.2019.08.19.13.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id 7105F1805AD;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id 5C2A4301176; Mon, 19 Aug 2019 15:37:14 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 08/12] watchdog: Add the ability to set the action of a timeout
Date:   Mon, 19 Aug 2019 15:37:07 -0500
Message-Id: <20190819203711.32599-9-minyard@acm.org>
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

Add a way to tell the watchdog what to do on a timeout and on
a pretimeout.  This is to support the IPMI watchdog's ability
to do this.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 Documentation/watchdog/watchdog-api.rst | 40 ++++++++++++
 drivers/watchdog/watchdog_dev.c         | 82 +++++++++++++++++++++++++
 include/linux/watchdog.h                |  4 ++
 include/uapi/linux/watchdog.h           | 14 +++++
 4 files changed, 140 insertions(+)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index c6c1e9fa9f73..927be9e56b5d 100644
--- a/Documentation/watchdog/watchdog-api.rst
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -112,6 +112,24 @@ current timeout using the GETTIMEOUT ioctl::
     ioctl(fd, WDIOC_GETTIMEOUT, &timeout);
     printf("The timeout was is %d seconds\n", timeout);
 
+Actions
+=======
+
+Some watchdog timers can perform different actions when they time out.
+Most will only reset.  The values are::
+
+    WDIOA_RESET - Reset the system
+    WDIOA_POWER_OFF - Power off the system
+    WDIOA_POWER_CYCLE - Power off the system then power it back on
+
+The value can be set::
+
+    ioctl(fd, WDIOC_SETACTION, &action);
+
+and queried::
+
+    ioctl(fd, WDIOC_GETACTION, &action);
+
 Pretimeouts
 ===========
 
@@ -137,6 +155,28 @@ There is also a get function for getting the pretimeout::
 
 Not all watchdog drivers will support a pretimeout.
 
+Preactions
+==========
+
+Like actions some watchdog timers can perform different actions when
+they pretimeout.  The values are::
+
+    WDIOP_NONE - Don't do anything on a pretimeout
+    WDIOP_NMI - Issue an NMI
+    WDIOP_SMI - Issue a system management interrupt
+    WDIOP_INTERRUPT - Issue a normal interrupt
+
+The value can be set::
+
+    ioctl(fd, WDIOC_SETPREACTION, &preaction);
+
+and queried::
+
+    ioctl(fd, WDIOC_GETPREACTION, &preaction);
+
+Note that the pretimeout governor that reads data is not compatible with
+the NMI preaction.  The NMI preaction can only do nothing or panic.
+
 Get the number of seconds before reboot
 =======================================
 
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 8e8304607a8c..0e70f510a491 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -423,6 +423,48 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
 	return err;
 }
 
+/*
+ *	watchdog_set_action: set the action the watchdog performs.
+ *	@wdd: the watchdog device to set the timeout for
+ *	@action: The action, one of WDIOA_xxx
+ *
+ *	The caller must hold wd_data->lock.
+ */
+
+static int watchdog_set_action(struct watchdog_device *wdd,
+			       unsigned int action)
+{
+	int err = 0;
+
+	if (wdd->ops->set_action)
+		err = wdd->ops->set_action(wdd, action);
+	else if (action != WDIOA_RESET)
+		err = -EINVAL;
+
+	return err;
+}
+
+/*
+ *	watchdog_set_preaction: set the action the watchdog pretimeout performs.
+ *	@wdd: the watchdog device to set the timeout for
+ *	@action: The action, one of WDIOP_xxx
+ *
+ *	The caller must hold wd_data->lock.
+ */
+
+static int watchdog_set_preaction(struct watchdog_device *wdd,
+				  unsigned int action)
+{
+	int err;
+
+	if (wdd->ops->set_preaction)
+		err = wdd->ops->set_preaction(wdd, action);
+	else
+		err = -EOPNOTSUPP;
+
+	return err;
+}
+
 /*
  *	watchdog_get_timeleft: wrapper to get the time left before a reboot
  *	@wdd: the watchdog device to get the remaining time from
@@ -516,6 +558,24 @@ static ssize_t pretimeout_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(pretimeout);
 
+static ssize_t action_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", wdd->action);
+}
+static DEVICE_ATTR_RO(action);
+
+static ssize_t preaction_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", wdd->preaction);
+}
+static DEVICE_ATTR_RO(preaction);
+
 static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
 {
@@ -592,6 +652,8 @@ static struct attribute *wdt_attrs[] = {
 	&dev_attr_identity.attr,
 	&dev_attr_timeout.attr,
 	&dev_attr_pretimeout.attr,
+	&dev_attr_action.attr,
+	&dev_attr_preaction.attr,
 	&dev_attr_timeleft.attr,
 	&dev_attr_bootstatus.attr,
 	&dev_attr_status.attr,
@@ -784,6 +846,26 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 	case WDIOC_GETPRETIMEOUT:
 		err = put_user(wdd->pretimeout, p);
 		break;
+	case WDIOC_SETACTION:
+		if (get_user(val, p)) {
+			err = -EFAULT;
+			break;
+		}
+		err = watchdog_set_action(wdd, val);
+		break;
+	case WDIOC_GETACTION:
+		err = put_user(wdd->action, p);
+		break;
+	case WDIOC_SETPREACTION:
+		if (get_user(val, p)) {
+			err = -EFAULT;
+			break;
+		}
+		err = watchdog_set_preaction(wdd, val);
+		break;
+	case WDIOC_GETPREACTION:
+		err = put_user(wdd->preaction, p);
+		break;
 	default:
 		err = -ENOTTY;
 		break;
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index e34501a822f0..d4644994106e 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -53,6 +53,8 @@ struct watchdog_ops {
 	unsigned int (*get_timeleft)(struct watchdog_device *);
 	int (*restart)(struct watchdog_device *, unsigned long, void *);
 	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
+	int (*set_action)(struct watchdog_device *wdd, unsigned int val);
+	int (*set_preaction)(struct watchdog_device *wdd, unsigned int val);
 };
 
 /** struct watchdog_device - The structure that defines a watchdog device
@@ -101,6 +103,8 @@ struct watchdog_device {
 	unsigned int bootstatus;
 	unsigned int timeout;
 	unsigned int pretimeout;
+	unsigned int action;
+	unsigned int preaction;
 	unsigned int min_timeout;
 	unsigned int max_timeout;
 	unsigned int min_hw_heartbeat_ms;
diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
index b15cde5c9054..bf13cf25f9e0 100644
--- a/include/uapi/linux/watchdog.h
+++ b/include/uapi/linux/watchdog.h
@@ -32,6 +32,10 @@ struct watchdog_info {
 #define	WDIOC_SETPRETIMEOUT	_IOWR(WATCHDOG_IOCTL_BASE, 8, int)
 #define	WDIOC_GETPRETIMEOUT	_IOR(WATCHDOG_IOCTL_BASE, 9, int)
 #define	WDIOC_GETTIMELEFT	_IOR(WATCHDOG_IOCTL_BASE, 10, int)
+#define	WDIOC_SETACTION		_IOWR(WATCHDOG_IOCTL_BASE, 11, int)
+#define	WDIOC_GETACTION		_IOR(WATCHDOG_IOCTL_BASE, 12, int)
+#define	WDIOC_SETPREACTION	_IOWR(WATCHDOG_IOCTL_BASE, 13, int)
+#define	WDIOC_GETPREACTION	_IOR(WATCHDOG_IOCTL_BASE, 14, int)
 
 #define	WDIOF_UNKNOWN		-1	/* Unknown flag error */
 #define	WDIOS_UNKNOWN		-1	/* Unknown status error */
@@ -54,5 +58,15 @@ struct watchdog_info {
 #define	WDIOS_ENABLECARD	0x0002	/* Turn on the watchdog timer */
 #define	WDIOS_TEMPPANIC		0x0004	/* Kernel panic on temperature trip */
 
+/* Actions for WDIOC_xxxACTION ioctls. */
+#define WDIOA_RESET		0	/* Reset the system. */
+#define WDIOA_POWER_OFF		1	/* Power off the system. */
+#define WDIOA_POWER_CYCLE	2	/* Power cycle the system. */
+
+/* Actions for WDIOC_xxxPREACTION ioctls. */
+#define WDIOP_NONE		0	/* Do nothing. */
+#define WDIOP_NMI		1	/* Issue an NMI. */
+#define WDIOP_SMI		2	/* Issue a system management irq. */
+#define WDIOP_INTERRUPT		3	/* Issue a normal irq. */
 
 #endif /* _UAPI_LINUX_WATCHDOG_H */
-- 
2.17.1

