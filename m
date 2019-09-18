Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F010B67B1
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Sep 2019 18:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfIRQFd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Sep 2019 12:05:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36280 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfIRQFd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Sep 2019 12:05:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id y19so35864wrd.3
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Sep 2019 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2x6v+F5GWK7Qkzp3BfJ/Q7vobP5WbouDHIFboXOXisk=;
        b=CWKmvTDi/pb2q3VVM9eWIyNneZp79S0lkD0LMHmwrrYrsZfRE547SAyEf2/BX3Ftq6
         PFPuyxbQZ1gYyMtPUv5vVqktq0ai3dQvWq2HHs9OFNgk8CiAFfottLHUSQzAmWQhDFUv
         x6SE4YTr/6KOK3RnKZVgMS79NrjA0F/Esj3VMbIFHSGLEoKoVBbmaFXLb4roWybxNsXr
         pkibYwWZW4+D6CZ/S6C+DMOg/mqRS/Z5E17efXdvn8ayP2Gv1R83RkQWJhcRJnVU1Qo+
         hA21f1XhJDAxti0DiU7EBv/9kB07JtGVXOLBk5DAXn/gKGoTDSA+IL784CjlFPgbqO1L
         vJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2x6v+F5GWK7Qkzp3BfJ/Q7vobP5WbouDHIFboXOXisk=;
        b=fwaxc2YhdE1we+iS6/8CtQNa1TBI9GBlpBbLeujmoa9zuvuzaAhzlrLcvO7tFyejAC
         9isuS5HqbFRnL/nUFEy1Mv5sW1TrnQcWpG5dU0O8/ez35hkMg7YH4fUdOIQ9OQVrutUa
         kS6qlNiWGyll3e8fRwuwieMWULX8qzVlhKnoPkO769qmY7k7SCj6jCJvIuTuzLVRKWVl
         n2zTpoqLHVvMDY3dVVQMXUgq/ndokO8BHJmE2dkC98dxeF0azBJn4yRVZw4J4t9G8Y9M
         txwcVl+//+yq07tbULpB4ipPos2x7bwHzrmlunPLfWoIQ50hLXuX4vIUeyx9Ey6YZ19t
         iJ+A==
X-Gm-Message-State: APjAAAUQKhZ+GrQKHVRV0KaSf6/thwmm0PCfTp9gKk2OUl5Ns6l1sFhm
        PhyIqXOmeLQWu/YtvWmfthBtTYRMwMc=
X-Google-Smtp-Source: APXvYqxZFC/tNVuCRCoZOoHAtvjwDb0KQBF60YOxCkNiLi7KlUN7moogLennaElePyRhJCmEgFJN8A==
X-Received: by 2002:a5d:6a09:: with SMTP id m9mr3640568wru.12.1568822730544;
        Wed, 18 Sep 2019 09:05:30 -0700 (PDT)
Received: from linux-code.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id s13sm3396377wmc.28.2019.09.18.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 09:05:29 -0700 (PDT)
From:   Srikanth Krishnakar <skrishnakar@gmail.com>
X-Google-Original-From: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
To:     linux-watchdog@vger.kernel.org, linux@roeck-us.net
Cc:     Cedric_Hombourger@mentor.com, Srikanth_Krishnakar@mentor.com
Subject: [PATCH v2] watchdog: w83627hf_wdt: Support NCT6116D
Date:   Wed, 18 Sep 2019 21:34:58 +0530
Message-Id: <20190918160458.10108-1-Srikanth_Krishnakar@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918145729.GA15471@roeck-us.net>
References: <20190918145729.GA15471@roeck-us.net>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog controller on NCT6116D is compatible with NCT6102D.
Extend the support to enable SuperIO based NCT6116D watchdog device.

Tested on Siemens SIMATIC IPC-527G.

Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
---

Thanks for the catch Guenter!

That was not intentional. Fixed the typo of return ID. I could have 
merged return ID of 6116 into 6102D but that would display 6102D as
SuperIO Initialized in bootlog.

 drivers/watchdog/Kconfig        |  1 +
 drivers/watchdog/w83627hf_wdt.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index a45f9e3e442b..4affadda5185 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1488,6 +1488,7 @@ config W83627HF_WDT
 		NCT6791
 		NCT6792
 		NCT6102D/04D/06D
+		NCT6116D
 
 	  This watchdog simply watches your kernel to make sure it doesn't
 	  freeze, and if it does, it reboots your computer after a certain
diff --git a/drivers/watchdog/w83627hf_wdt.c b/drivers/watchdog/w83627hf_wdt.c
index 38b31e9947aa..56a4a4030ca9 100644
--- a/drivers/watchdog/w83627hf_wdt.c
+++ b/drivers/watchdog/w83627hf_wdt.c
@@ -49,7 +49,7 @@ static int wdt_cfg_leave = 0xAA;/* key to lock configuration space */
 enum chips { w83627hf, w83627s, w83697hf, w83697ug, w83637hf, w83627thf,
 	     w83687thf, w83627ehf, w83627dhg, w83627uhg, w83667hg, w83627dhg_p,
 	     w83667hg_b, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
-	     nct6795, nct6796, nct6102 };
+	     nct6795, nct6796, nct6102, nct6116 };
 
 static int timeout;			/* in seconds */
 module_param(timeout, int, 0);
@@ -94,6 +94,7 @@ MODULE_PARM_DESC(early_disable, "Disable watchdog at boot time (default=0)");
 #define NCT6775_ID		0xb4
 #define NCT6776_ID		0xc3
 #define NCT6102_ID		0xc4
+#define NCT6116_ID		0xd2
 #define NCT6779_ID		0xc5
 #define NCT6791_ID		0xc8
 #define NCT6792_ID		0xc9
@@ -211,6 +212,7 @@ static int w83627hf_init(struct watchdog_device *wdog, enum chips chip)
 	case nct6795:
 	case nct6796:
 	case nct6102:
+	case nct6116:
 		/*
 		 * These chips have a fixed WDTO# output pin (W83627UHG),
 		 * or support more than one WDTO# output pin.
@@ -417,6 +419,12 @@ static int wdt_find(int addr)
 		cr_wdt_control = NCT6102D_WDT_CONTROL;
 		cr_wdt_csr = NCT6102D_WDT_CSR;
 		break;
+	case NCT6116_ID:
+		ret = nct6116;
+		cr_wdt_timeout = NCT6102D_WDT_TIMEOUT;
+		cr_wdt_control = NCT6102D_WDT_CONTROL;
+		cr_wdt_csr = NCT6102D_WDT_CSR;
+		break;
 	case 0xff:
 		ret = -ENODEV;
 		break;
@@ -482,6 +490,7 @@ static int __init wdt_init(void)
 		"NCT6795",
 		"NCT6796",
 		"NCT6102",
+		"NCT6116",
 	};
 
 	/* Apply system-specific quirks */
-- 
2.17.1

