Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 318BBB64EB
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Sep 2019 15:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfIRNnW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Sep 2019 09:43:22 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35352 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbfIRNnW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Sep 2019 09:43:22 -0400
Received: by mail-wr1-f68.google.com with SMTP id v8so7018534wrt.2
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Sep 2019 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=F79il8OJykD/T/5Dw7H2ORLmM/g8D3l6gapwGa7fuso=;
        b=jlepJpzG4Befo2hPBAb0DuXwpOR8ibqZEsaNGblPViCGmUVzEe8fAooSaNSs3cD+7s
         VScmiorThQTnQrMGqkJXmvRZubdeSY/FCzUqG2vv2mUJ3vcl6ZuuQ4q0Y9gCER69eMSY
         0DOtox4SFH2JJl9YMaUz86hLHh7AM73v2DTyG8v5PQfavZUodVctRktzu5Q6DmFqdXqG
         St0aLdDjOJmcTrmswb4Fb7BYnqmLMqpB2T/OLfHTJ2lamENNbhS/BFa5+jUO4pyk2dJL
         RYZ2mKGmAGlu9XDMctyrnHIFW/Q1NwfTa8I2yOVqY6Ca1iqoeBLI3AEz30aTMl+E7veZ
         1ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=F79il8OJykD/T/5Dw7H2ORLmM/g8D3l6gapwGa7fuso=;
        b=HRYRZljCYukIf0AmudyD1Drm/JPkpnu4EwPIGVxNSQS8Ow2V3WA2nqDrEowg6tEdTU
         1bjZLcsnJM0WEDQiRUJYCjEi7z4L84W7WWHE67q06W3Z6uadDkEwLTZUwSlrUu1rmSSp
         xjFJFcPSHp73qZ0cKV874cCmVpAukeusp3rjD7qowPz6QGw20HbMtjpXoGBNVilNR5Lr
         fkAZuYzRVldAZ2IdlOt1gc5oqP/+2a2VXe4VqIKMtMQlz2H4rl7Y7Q8YI5eYdO2Pb+Sz
         RvXtJJKfOz6zLrGkM7X2z61oJF20QrmFK15HvYmwIgCAuYDOk7+/Xlbj+T/tLYSylFFU
         /qjg==
X-Gm-Message-State: APjAAAUyCVpLy2i2QRr9tvYOThPzrWqusSBj5rVByirZxsx0UJFT734p
        X2ZQwKJWsfTmnblWi9v2wa0ZtvmIeeE=
X-Google-Smtp-Source: APXvYqzy+d/wwrdIIIbVWoP4/fSkQljv+xR5eQdzRoMdHWihqgM0RmODFqGFIrrrJuh1HmUtBrrAdA==
X-Received: by 2002:adf:e546:: with SMTP id z6mr3090133wrm.113.1568814199966;
        Wed, 18 Sep 2019 06:43:19 -0700 (PDT)
Received: from linux-code.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id y3sm4971076wrw.83.2019.09.18.06.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 06:43:19 -0700 (PDT)
From:   Srikanth_Krishnakar <skrishnakar@gmail.com>
X-Google-Original-From: Srikanth_Krishnakar <Srikanth_Krishnakar@mentor.com>
To:     linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        wim@linux-watchdog.org
Cc:     Cedric_Hombourger@mentor.com, Srikanth_Krishnakar@mentor.com
Subject: [PATCH] watchdog: w83627hf_wdt: Support NCT6116D
Date:   Wed, 18 Sep 2019 19:12:15 +0530
Message-Id: <20190918134215.3036-1-Srikanth_Krishnakar@mentor.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>

The watchdog controller on NCT6116D is compatible with NCT6102D.
Extend the support to enable SuperIO based NCT6116D watchdog device.

Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
---
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
index 38b31e9947aa..fdf533fe0bb2 100644
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
+		ret = nct6102;
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

