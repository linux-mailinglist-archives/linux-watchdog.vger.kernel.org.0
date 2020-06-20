Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171E92025A7
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgFTRfI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:35:08 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35686 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbgFTRfH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:35:07 -0400
Received: by mail-ot1-f68.google.com with SMTP id d4so9818367otk.2
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c9eyYnIbSCchZ+Qys6jP+lWq+0wox/nJrkZtPtmSbFE=;
        b=PEYLqeDbgaF55kY3PIcittV51Y0QoTmaLq7XZdCfTx2NCcJ1u4gOZqM+DKBf/0Zpmu
         Se+RrqYE03k+1bMsD1JzY4jv05Rj+hEAV27W7hbi/UNT4wcr3LuMWF1k6R0+N1U2qLeL
         PH+qWgd//mOAnxgS0GtQjtv+OigmUeqS8EkUkMFM11mHGp5lO+l8s0Sv8ROhfaybh2k6
         iSg9aPoir5xVKeIZRAxhB2/Vv+uptrqdmdqTAG3srrlYAGzg/LiX5lXU1WoDpxobCn9+
         KlvkKeMmmuyQAOQAVabk6Q/8F69mygucCW6NAgrEZIPYzSbrxTYOJuX0uhdxRgm+X6JJ
         uliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=c9eyYnIbSCchZ+Qys6jP+lWq+0wox/nJrkZtPtmSbFE=;
        b=T7GCYuV0nnWJ75LkGELr/sjtDVUo2koubtNKR6+bgznaMQQINZ5qSMsfZdCdfCEt94
         vSgfM5AVtUMGpHmkJo0MDluqX6x6s+qfPCLRw19gsuW7ioo8vqaOr915v0ozaZ6zZ6F/
         gTONJy8FBYwVu0jiir7km2mzaMZ2DfVK5WS/BCG6dgNCByh0fB7Qm2ve2AFzaApTHpvi
         U2/CKeB4B6ub0p9FGULXcHTFYFYwtpvf0tw7USqN2uqqFzrUQTrhoBemYsBNXhRTKu+R
         /b0TfxwyXCjLAK6hwRKInhsvwmmDoV68qEJY6n+dTwca7xlOwbkVRJm4leUjKgx0Ce+z
         ocAA==
X-Gm-Message-State: AOAM531nZ+Oj67IIzaFmhchv4Q7kaWlOmy9kX7TfD/7Ai451v80SaJcY
        8OsFIN/eGgAsZKDp8Fxf+w==
X-Google-Smtp-Source: ABdhPJwQtNAySJVinmJtwXxWchQmPBLW074FRNyCe6odSbGF6uZHx6I3OQ2coJ/fgmeFSubI9Ste5A==
X-Received: by 2002:a9d:7301:: with SMTP id e1mr7723707otk.289.1592674445302;
        Sat, 20 Jun 2020 10:34:05 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
        by smtp.gmail.com with ESMTPSA id l20sm2074368otp.35.2020.06.20.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:34:03 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:f17b:b355:b0a4:2592])
        by serve.minyard.net (Postfix) with ESMTPA id B95E518055F;
        Sat, 20 Jun 2020 17:34:00 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 5/6] watchdog:i6300: Convert to a millisecond watchdog device
Date:   Sat, 20 Jun 2020 12:33:50 -0500
Message-Id: <20200620173351.18752-6-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620173351.18752-1-minyard@acm.org>
References: <20200620173351.18752-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

The i6300 clock runs at 1Khz, so it's an easy conversion to make it a
millisecond timer.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/i6300esb.c | 66 +++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/i6300esb.c b/drivers/watchdog/i6300esb.c
index a30835f547b3..9f5afe6ee622 100644
--- a/drivers/watchdog/i6300esb.c
+++ b/drivers/watchdog/i6300esb.c
@@ -69,12 +69,40 @@
 #define ESB_UNLOCK1     0x80            /* Step 1 to unlock reset registers  */
 #define ESB_UNLOCK2     0x86            /* Step 2 to unlock reset registers  */
 
-/* module parameters */
-/* 30 sec default heartbeat (1 < heartbeat < 2*1023) */
+/*
+ * Timer clock is driven by a 30ns clock divided by 32768, giving a
+ * 983.04usec clock.  Not really close enough to say it's 1Khz.  But
+ * if we multiply by 101725261 / 100000000, that would give us a
+ * 1000.0000057 usec per increment of time, which is very close and
+ * slightly slow, which is preferred to slightly fast.  If there is a
+ * remainder from that calculation, then round up.  So if 1 comes in
+ * for the time, we will have (1 * 101725261) / 100000000 = 1, and
+ * (1 * 101725261) % 100000000 = 1725261, so we round up the 1 to a 2, which
+ * will result in 1.96608msecs.  Remember, better too long than too short.
+ * All the arithmetic has to be 64 bit to avoid overflow.
+ *
+ * The error gets better as the numbers increase to more reasonable
+ * values.  For 30 seconds, for instance, we get a count of 30518,
+ * which is 30.0004 seconds.  Close enough :).
+ *
+ * The 2061582 max time comes in because we have 2 20 bit registers
+ * that count down.  This means that the maximum timeout value we can
+ * put in the registers is 0x1ffffe.  Run that through the calculation
+ * backwards and we get 0x1ffffe * 100000000 / 101725261 = 2061582.  If we
+ * put that into our calculation, we get 2061582 * 101725261 / 100000000 =
+ * 0x1ffffd which will round up to 0x1ffffe.
+ *
+ * These numbers should never result in an error more than 1ms, so
+ * there is no need to be more accurate.  This is been tested
+ * exhaustively.
+ */
 #define ESB_HEARTBEAT_MIN	1
-#define ESB_HEARTBEAT_MAX	2046
-#define ESB_HEARTBEAT_DEFAULT	30
-#define ESB_HEARTBEAT_RANGE __MODULE_STRING(ESB_HEARTBEAT_MIN) \
+#define ESB_HEARTBEAT_MAX	2061582
+/* 30 sec default heartbeat */
+#define ESB_HEARTBEAT_DEFAULT	30000
+
+/* module parameters */
+#define ESB_HEARTBEAT_RANGE __MODULE_STRING(ESB_HEARTBEAT_MIN)	\
 	"<heartbeat<" __MODULE_STRING(ESB_HEARTBEAT_MAX)
 static int heartbeat; /* in seconds */
 module_param(heartbeat, int, 0);
@@ -158,17 +186,34 @@ static int esb_timer_set_heartbeat(struct watchdog_device *wdd,
 {
 	struct esb_dev *edev = to_esb_dev(wdd);
 	u32 val;
+	u64 ttime, ctime;
+
+	/* See comments above ESB_HEARTBEAT_xxx for details on this. */
+	ttime = (u64) time * 101725261ULL;
+	ctime = div_u64(ttime, 100000000);
+	/*
+	 * You might think that a "if (ttime % 100000000ULL)" would be
+	 * required here so we don't round up if the time is exact,
+	 * but with these numbers, there is never a time value that
+	 * will come in that will result in a zero remainder.  So no
+	 * need to check.  We round up, as it's better to be a little
+	 * long than a little short.
+	 */
+	ctime += 1;
 
-	/* We shift by 9, so if we are passed a value of 1 sec,
-	 * val will be 1 << 9 = 512, then write that to two
-	 * timers => 2 * 512 = 1024 (which is decremented at 1KHz)
+	/*
+	 * We have two registers that have to count down, so each gets
+	 * loaded with half the time.
 	 */
-	val = time << 9;
+	val = ctime / 2;
 
 	/* Write timer 1 */
 	esb_unlock_registers(edev);
 	writel(val, ESB_TIMER1_REG(edev));
 
+	/* If the time was odd, add the extra tick to the second register. */
+	val += ctime % 2;
+
 	/* Write timer 2 */
 	esb_unlock_registers(edev);
 	writel(val, ESB_TIMER2_REG(edev));
@@ -190,7 +235,8 @@ static int esb_timer_set_heartbeat(struct watchdog_device *wdd,
 
 static struct watchdog_info esb_info = {
 	.identity = ESB_MODULE_NAME,
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = (WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
+		    WDIOF_MSECTIMER),
 };
 
 static const struct watchdog_ops esb_ops = {
-- 
2.17.1

