Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1112A2025A5
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgFTRfH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:35:07 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46804 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgFTRfG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:35:06 -0400
Received: by mail-oi1-f194.google.com with SMTP id 25so11545623oiy.13
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hz8GqE3JxF+NFjEiQfFD110wPSsNpDnROS/GHJzNG6w=;
        b=gEb7CAlAMt8j5b2PDqsBqbi4s2llZ0Cjca7ToGkekUhyLRRNIPwiTKTRLTVB7RZgaQ
         YRaAIJhiYqe8uJyxBD+qeP2vjW+vzvo/AHv8mNVvF6ImYxx3pQTyvOA9iPeTU/MPZB4W
         bLesGENar78NZLmleSheB/atz/d5nfS+cGzTV8C3TOtrwq7GNOHRJc4yF6o0Uxkw333f
         3u6Mxk2B9G50FTRqa2dNTR3sa41QU3Tvhml65MAHggQeAWzcBtrafVzJ9GYXsF6b1Uho
         uwUGJWH+Y49QPF995bYwQsIWRZOO+nQIS3I9b6Er25cZeWsmw7lOzsh77Vyyn4SURTEr
         WFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=hz8GqE3JxF+NFjEiQfFD110wPSsNpDnROS/GHJzNG6w=;
        b=NtMUaROleW7c9CuVZqBVi3sW3Liz9ryrelHhJo3S7hzTQc6f5WSYnTxidSRq5mN+jN
         d52Whb2/f2Dm37t7k536ySD4zK9xWl9+lQk4vvxkWKrwQZ4V2aLJxzGRBZhBGgdffcua
         ybRvHecuTcevJxAMtsk2fNYH8u3iiXTKlYHyXtQBDxioQDyV2/IfDcZrOflCCuX/GtR9
         qDo0lASZ5hioBZZTA8LWjimk+RFjiGp2qunj2mSb0vSFv1Su4ql6j6JCfHn5Ywu1e+tF
         vuiyxO39X1myxP5Y9Tvd7i6cpx2L3zUw0sbREOnDbedNLeRkK/ikPGTfP9tLTTZU9xzE
         nOHA==
X-Gm-Message-State: AOAM532LPoAqOmCAK4yEVv3t5zBiYuLBXPcZOdcHL+07Kd5qIAL4BvWs
        0tetZ4MnbjRUQxOkAJxQSw==
X-Google-Smtp-Source: ABdhPJxGwM0r7OnhgY1rekJ7pKdQbFs5eU4T5HFVMVsaLm9lm0Xi1i2vtT8F47XPUnplqISCIzuE6w==
X-Received: by 2002:aca:603:: with SMTP id 3mr6845193oig.89.1592674443946;
        Sat, 20 Jun 2020 10:34:03 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id q85sm1994205oic.23.2020.06.20.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:34:02 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:f17b:b355:b0a4:2592])
        by serve.minyard.net (Postfix) with ESMTPA id A04A618054F;
        Sat, 20 Jun 2020 17:34:00 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 4/6] watchdog: Add documentation for millisecond interfaces
Date:   Sat, 20 Jun 2020 12:33:49 -0500
Message-Id: <20200620173351.18752-5-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620173351.18752-1-minyard@acm.org>
References: <20200620173351.18752-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Document the new interfaces and semantics of how this works.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 Documentation/watchdog/watchdog-api.rst       | 59 +++++++++++++++++++
 .../watchdog/watchdog-kernel-api.rst          | 30 ++++++----
 2 files changed, 78 insertions(+), 11 deletions(-)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index c6c1e9fa9f73..9f9aa1cd7310 100644
--- a/Documentation/watchdog/watchdog-api.rst
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -112,6 +112,39 @@ current timeout using the GETTIMEOUT ioctl::
     ioctl(fd, WDIOC_GETTIMEOUT, &timeout);
     printf("The timeout was is %d seconds\n", timeout);
 
+There is also millisecond-level ioctls for setting timeouts in
+millisecond values.  These will work against a watchdog driver that
+only supports seconds, but values will be truncated up on setting and
+truncated on fetching.  So, for instance:
+
+    int timeout = 44001;
+    ioctl(fd, WDIOC_SETTIMEOUT_MS, &timeout);
+    printf("The timeout was set to %d milliseconds\n", timeout);
+
+If the driver only supports seconds, the timeout will be set to 45
+seconds because it's truncated up.
+
+Fetching does similar conversions.  On a driver that supports
+milliseconds, if the current value is 39603 milliseconds:
+
+    ioctl(fd, WDIOC_GETTIMEOUT, &timeout);
+    printf("The timeout was is %d seconds\n", timeout);
+    ioctl(fd, WDIOC_GETTIMEOUT_MS, &timeout);
+    printf("The timeout was is %d milliseconds\n", timeout);
+
+will print 39 seconds and 39603 milliseconds.
+
+If a driver supports millisecond level precision, it will have the
+WDIOF_MSECTIMER flag set in its option field.  Note that does not mean
+that the driver has millisecond level accuracy.  For instance, a
+device might have a 10Hz clock, giving 100ms accuracy.  The driver
+should set the return timeout for WDIOC_SETTIMEOUT_MS to the actual
+setting of the timeout, so you can verify the value.
+
+It would be nice to have a granularity field, but some devices may not
+be linear.  So a granularity is not a general thing that could be
+done.
+
 Pretimeouts
 ===========
 
@@ -137,6 +170,16 @@ There is also a get function for getting the pretimeout::
 
 Not all watchdog drivers will support a pretimeout.
 
+Like timeouts, pretimeouts also have millisecond-level ioctls:
+
+    pretimeout = 10000;
+    ioctl(fd, WDIOC_SETPRETIMEOUT_MS, &pretimeout);
+    ioctl(fd, WDIOC_GETPRETIMEOUT_NS, &pretimeout);
+    printf("The pretimeout was is %d milliseconds\n", pretimeout);
+
+These work just like the timeouts, see that discussion for how
+conversions are done.
+
 Get the number of seconds before reboot
 =======================================
 
@@ -147,6 +190,14 @@ that returns the number of seconds before reboot::
     ioctl(fd, WDIOC_GETTIMELEFT, &timeleft);
     printf("The timeout was is %d seconds\n", timeleft);
 
+There is also a millisecond-level version:
+
+    ioctl(fd, WDIOC_GETTIMELEFT_MS, &timeleft);
+    printf("The timeout was is %d milliseconds\n", timeleft);
+
+If the driver only supports seconds, then the value returns is just
+1000 times the seconds value.
+
 Environmental monitoring
 ========================
 
@@ -223,6 +274,14 @@ sense.
 
 The watchdog saw a keepalive ping since it was last queried.
 
+	===============		========================================
+	WDIOF_MSECTIMER		Driver can use milliseconds for timeouts
+	===============		========================================
+
+The driver can do millisecond-level timeouts.  The seconds-level
+interfaces still work, but setting values in milliseconds can result
+in finer granularity.
+
 	================	=======================
 	WDIOF_SETTIMEOUT	Can set/get the timeout
 	================	=======================
diff --git a/Documentation/watchdog/watchdog-kernel-api.rst b/Documentation/watchdog/watchdog-kernel-api.rst
index 068a55ee0d4a..bee60e6ae274 100644
--- a/Documentation/watchdog/watchdog-kernel-api.rst
+++ b/Documentation/watchdog/watchdog-kernel-api.rst
@@ -80,13 +80,13 @@ It contains following fields:
   additional information about the watchdog timer itself. (Like it's unique name)
 * ops: a pointer to the list of watchdog operations that the watchdog supports.
 * gov: a pointer to the assigned watchdog device pretimeout governor or NULL.
-* timeout: the watchdog timer's timeout value (in seconds).
+* timeout: the watchdog timer's timeout value.
   This is the time after which the system will reboot if user space does
   not send a heartbeat request if WDOG_ACTIVE is set.
-* pretimeout: the watchdog timer's pretimeout value (in seconds).
-* min_timeout: the watchdog timer's minimum timeout value (in seconds).
+* pretimeout: the watchdog timer's pretimeout value.
+* min_timeout: the watchdog timer's minimum timeout value.
   If set, the minimum configurable value for 'timeout'.
-* max_timeout: the watchdog timer's maximum timeout value (in seconds),
+* max_timeout: the watchdog timer's maximum timeout value,
   as seen from userspace. If set, the maximum configurable value for
   'timeout'. Not used if max_hw_heartbeat_ms is non-zero.
 * min_hw_heartbeat_ms: Hardware limit for minimum time between heartbeats,
@@ -96,7 +96,7 @@ It contains following fields:
   If set, the infrastructure will send heartbeats to the watchdog driver
   if 'timeout' is larger than max_hw_heartbeat_ms, unless WDOG_ACTIVE
   is set and userspace failed to send a heartbeat for at least 'timeout'
-  seconds. max_hw_heartbeat_ms must be set if a driver does not implement
+  time. max_hw_heartbeat_ms must be set if a driver does not implement
   the stop function.
 * reboot_nb: notifier block that is registered for reboot notifications, for
   internal use only. If the driver calls watchdog_stop_on_reboot, watchdog core
@@ -117,6 +117,13 @@ It contains following fields:
 * deferred: entry in wtd_deferred_reg_list which is used to
   register early initialized watchdogs.
 
+The time value used to interact with the device can either be in
+seconds or milli-seconds except for min_hw_heartbeat_ms and
+max_hw_heartbeat_ms, which are always in milli-seconds. If the driver
+sets WDIOF_MSECTIMER in the driver info flags, then the time values
+will be in milli-seconds. If it is not set, then the time values will
+be in seconds.
+
 The list of watchdog operations is defined as::
 
   struct watchdog_ops {
@@ -212,12 +219,13 @@ they are supported. These optional routines/operations are:
   also take care of checking if pretimeout is still valid and set up the timer
   accordingly. This can't be done in the core without races, so it is the
   duty of the driver.
-* set_pretimeout: this routine checks and changes the pretimeout value of
-  the watchdog. It is optional because not all watchdogs support pretimeout
-  notification. The timeout value is not an absolute time, but the number of
-  seconds before the actual timeout would happen. It returns 0 on success,
-  -EINVAL for "parameter out of range" and -EIO for "could not write value to
-  the watchdog". A value of 0 disables pretimeout notification.
+* set_pretimeout: this routine checks and changes the pretimeout value
+  of the watchdog. It is optional because not all watchdogs support
+  pretimeout notification. The timeout value is not an absolute time,
+  but the time before the actual timeout would happen. It returns 0 on
+  success, -EINVAL for "parameter out of range" and -EIO for "could
+  not write value to the watchdog". A value of 0 disables pretimeout
+  notification.
 
   (Note: the WDIOF_PRETIMEOUT needs to be set in the options field of the
   watchdog's info structure).
-- 
2.17.1

