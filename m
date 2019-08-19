Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 187F094F24
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbfHSUhS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:18 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42272 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbfHSUhS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:18 -0400
Received: by mail-oi1-f194.google.com with SMTP id o6so2360004oic.9
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=bNjK9CgUTygymcC7/Qv0YzgosH+HuLFu57Lex5Wnf74=;
        b=dArIVsOLVIMeZMqhdqGD551axauQHnPd9UFAL4OtEaN3JKqxBUYCLkeNG6LG0M7X5v
         J7m2fzdZiFHlXzOLIZdWGrciXc4CI6VjPwXMXw684bYb5iv0pLqjObjPf8gRyDV4w6j2
         ZpuAwcq6dmV7mYIgD/AWyiHbjwSZpUZFJ/8aaR/866nfnajSpy6RYXAQttLVX2pq6kzN
         7EE/PnHV/4c17QNZLiSRKWJ5K4J3W6lidTLy9NlVfwEmLtvXxjIYEIGY/DDDC8opwiFK
         CRLgzKgJsF+346EVTvqxi/hlsGdWoe86VBSa4wGW2uAg3VxqjSgpPHZwB1Oi2pUazjSN
         POiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=bNjK9CgUTygymcC7/Qv0YzgosH+HuLFu57Lex5Wnf74=;
        b=A+lNanoZqGVYtZAasj43vYptWrKzgZwXUChTPJ6tNUkvAuIbkNUzIFMfX4BFMDjTfw
         UCJnSr8RmA3MdzyMne0iRxGIa1hsJKuArH96LPxDVPOwKkp3o07x5wHHessvU9waSH7l
         TsoM4RcVAYepahJLZx1VSjJ1YkuK3i62pJSrypk8q4Vnyrwmi66i47K3KgNcW7ZeHoDK
         bli0iYDfAO+2LLPUAd9JFLhpYJ9OeCetqZ8XscSRo5Rq67SxlAZ0uzZXpLrR947f+f93
         7wLt/Zzd+eRvr5006+Rv8CvtaWaI1AHKXX49nfsoEF/t3JDO6vToOjBaNz8m76Xy7kqY
         0ecw==
X-Gm-Message-State: APjAAAV7m1/U7kQejcm+bIrM3WKP4bgZtvWcBxLpxxPnri+gvXHvcgsy
        Vga0qmLbTzvoxmB+t3AAqQ==
X-Google-Smtp-Source: APXvYqztLxM+wsohom0p3+yd+4cTvcdvU0ypJ3sfqP9nle4DUGjBPIpY2QAoGVDsZh617xwfPbPocw==
X-Received: by 2002:aca:4846:: with SMTP id v67mr15087302oia.112.1566247037441;
        Mon, 19 Aug 2019 13:37:17 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id u5sm4437336oic.45.2019.08.19.13.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id A2FC21805B1;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id 814AA301220; Mon, 19 Aug 2019 15:37:14 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 10/12] watchdog: Add a way to set the governor through the ioctl
Date:   Mon, 19 Aug 2019 15:37:09 -0500
Message-Id: <20190819203711.32599-11-minyard@acm.org>
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

The watchdog governor could only be set through the systfs interface
before, make that function available through the ioctl, too.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 Documentation/watchdog/watchdog-api.rst | 31 +++++++++++++++++++++++++
 drivers/watchdog/watchdog_dev.c         | 14 +++++++++++
 drivers/watchdog/watchdog_pretimeout.h  |  2 +-
 include/uapi/linux/watchdog.h           |  8 +++++++
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index 927be9e56b5d..a2a3057e2b5d 100644
--- a/Documentation/watchdog/watchdog-api.rst
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -177,6 +177,37 @@ and queried::
 Note that the pretimeout governor that reads data is not compatible with
 the NMI preaction.  The NMI preaction can only do nothing or panic.
 
+Pretimeout Governors
+====================
+
+When a pretimeout occurs and the pretimeout framework is compiled in
+to the kernel, the pretimeout framework will generally be called.
+(The exception is that NMI pretimeouts do not call the pretimeout
+framework because they need special handling.)  Several pretimeout
+governers can be registered::
+
+    noop - Don't do anything on a pretimeout
+    panic - Issue a panic when a pretimeout occurs.  This is generally the
+            default
+    read_data - Provide one byte of data on the read interface to the
+                watchdog timer.  This way a userland program can handle
+		the pretimeout.
+
+If the CONFING_WATCHDOG_SYSFS is enabled, the pretimeout governor can
+be set by writing the value to the
+/sys/class/watchdog/watchdog<n>/pretimeout_governor sysfs file.
+
+The pretimeout governor can also be set through the ioctl interface with::
+
+    char governor[WATCHDOG_GOV_NAME_MAXLEN] = "panic";
+    ioctl(fd, WDIOC_SETPREGOV, gov);
+
+and can be queried with::
+
+    char governor[WATCHDOG_GOV_NAME_MAXLEN];
+    ioctl(fd, WDIOC_GETPREGOV, gov);
+    printf("The governor is %s\n", gov);
+
 Get the number of seconds before reboot
 =======================================
 
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 0e70f510a491..7e1ad6e303d0 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -762,6 +762,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 	int __user *p = argp;
 	unsigned int val;
 	int err;
+	char gov[WATCHDOG_GOV_NAME_MAXLEN];
 
 	mutex_lock(&wd_data->lock);
 
@@ -866,6 +867,19 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 	case WDIOC_GETPREACTION:
 		err = put_user(wdd->preaction, p);
 		break;
+	case WDIOC_SETPREGOV:
+		err = strncpy_from_user(gov, argp, sizeof(gov));
+		if (err >= 0)
+			err = watchdog_pretimeout_governor_set(wdd, gov);
+		break;
+	case WDIOC_GETPREGOV:
+		err = 0;
+		val = watchdog_pretimeout_governor_get(wdd, gov);
+		if (val == 0)
+			err = -ENOENT;
+		if (copy_to_user(argp, gov, val + 1))
+			err = -EFAULT;
+		break;
 	default:
 		err = -ENOTTY;
 		break;
diff --git a/drivers/watchdog/watchdog_pretimeout.h b/drivers/watchdog/watchdog_pretimeout.h
index 819517ed0138..e6e191b787bb 100644
--- a/drivers/watchdog/watchdog_pretimeout.h
+++ b/drivers/watchdog/watchdog_pretimeout.h
@@ -2,7 +2,7 @@
 #ifndef __WATCHDOG_PRETIMEOUT_H
 #define __WATCHDOG_PRETIMEOUT_H
 
-#define WATCHDOG_GOV_NAME_MAXLEN	20
+#include <uapi/linux/watchdog.h>
 
 struct watchdog_device;
 
diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
index bf13cf25f9e0..2acbfff6db8c 100644
--- a/include/uapi/linux/watchdog.h
+++ b/include/uapi/linux/watchdog.h
@@ -36,10 +36,18 @@ struct watchdog_info {
 #define	WDIOC_GETACTION		_IOR(WATCHDOG_IOCTL_BASE, 12, int)
 #define	WDIOC_SETPREACTION	_IOWR(WATCHDOG_IOCTL_BASE, 13, int)
 #define	WDIOC_GETPREACTION	_IOR(WATCHDOG_IOCTL_BASE, 14, int)
+#define	WDIOC_SETPREGOV		_IOWR(WATCHDOG_IOCTL_BASE, 15, char)
+#define	WDIOC_GETPREGOV		_IOR(WATCHDOG_IOCTL_BASE, 16, char)
 
 #define	WDIOF_UNKNOWN		-1	/* Unknown flag error */
 #define	WDIOS_UNKNOWN		-1	/* Unknown status error */
 
+/*
+ * Buffer for WDIOC_GETPREGOV must be at least this big.  WDIOC_SETPRGOV
+ * will take at max this many bytes - 1, excess will be ignored.
+ */
+#define WATCHDOG_GOV_NAME_MAXLEN	20
+
 #define	WDIOF_OVERHEAT		0x0001	/* Reset due to CPU overheat */
 #define	WDIOF_FANFAULT		0x0002	/* Fan failed */
 #define	WDIOF_EXTERN1		0x0004	/* External relay 1 */
-- 
2.17.1

