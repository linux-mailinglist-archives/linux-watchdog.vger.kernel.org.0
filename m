Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213D3453E84
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 03:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhKQCny (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Nov 2021 21:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhKQCny (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Nov 2021 21:43:54 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBA6C061570;
        Tue, 16 Nov 2021 18:40:56 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so3946445pja.1;
        Tue, 16 Nov 2021 18:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f343OJ6pfdz3dDo4eVAerEx0dQYlehCylZAHl53zawM=;
        b=M9cCoIqSluVZTlTUPfAo0F2nLn6ZjpSRHbwY1krT0UZxmJ78EXGjtR4IgUyPyQNE80
         x7tYwzX7srvOAub+iQBVimw5niOXiXqiBEZ+opcUOl6CdUyUrHZi7s3tnpw+8XNDMSVX
         GLgbxvEG9x9n0+TuzBc0X533GnDM3dTdOQHYR0OKFpaA8hzk7rhvdnrPYda0DYyqnRC4
         2HltOiR+fIKoZCnUO9T3nXz9Lo3lVOiQWkuUoeZvOVefP/tKYKQA1bED9La2Yq4Xkhwi
         mqJYvCeiiS2eQowbKrcQlTCqJTG9wtGucuaFK2+mEaheDQ6jVmNmuHxSiJWkFA5RouGr
         8gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=f343OJ6pfdz3dDo4eVAerEx0dQYlehCylZAHl53zawM=;
        b=5LthtySH0XivSJObgp+ZD21qYJbHJJvU0nHa601GKLkRNMQ79Ve2Rhj8xSsSYhW6Og
         C94jFadcO+gE81S5rMZapSfhVHZmLIRgvwx3TqiIHX/5aEcd+E+FCmWce3d/0hVSmTwU
         whnBrWluTBhMpZx+XHTsyJYrbuFwxgzFQGkH49vkCDrknEMcdPCUHngnaOcWwWrav8zG
         ZYE0Edkx3fLOiOaPqP4R/YT2URDJtFGOmRmnnTRhKgS3GHidyuYwtBo/+3UIz73aBj3N
         HCEEl0Z1FTHqKY/mADp7i8x1AV8WUNopQxX3lOIC2PuI933+tSyDrZ87Rsk9Yvkf2sdb
         Juzg==
X-Gm-Message-State: AOAM533HvC6KiJY6QR4iRr73bAo0mgFiIwCD9HQ0mynr7PDblrVK0ke+
        THtWezUKpVvhb76Y789lyKQ=
X-Google-Smtp-Source: ABdhPJxPPx9RO4qBzU1PKCScKfVrtwHza6JAQQGsL0c7j6BgKGD7KV6XzAXhQJIhAc9s1SpA1b4oOA==
X-Received: by 2002:a17:902:ec04:b0:143:b9b8:827e with SMTP id l4-20020a170902ec0400b00143b9b8827emr35045471pld.54.1637116855932;
        Tue, 16 Nov 2021 18:40:55 -0800 (PST)
Received: from localhost (220-135-95-34.hinet-ip.hinet.net. [220.135.95.34])
        by smtp.gmail.com with ESMTPSA id hg4sm3459598pjb.1.2021.11.16.18.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 18:40:55 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From:   AceLan Kao <acelan.kao@canonical.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        SophieHu <sophiehu@aaeon.com.tw>
Subject: [PATCH] watchdog: f71808e_wdt: Add F81966 support
Date:   Wed, 17 Nov 2021 10:40:52 +0800
Message-Id: <20211117024052.2427539-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: AaeonIot <sophiehu@aaeon.com.tw>

This adds watchdog support the Fintek F81966 Super I/O chip.
Testing was done on the Aaeon SSE-OPTI

Signed-off-by: AaeonIot <sophiehu@aaeon.com.tw>
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/watchdog/f71808e_wdt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index ee90c5f943f9..7f59c680de25 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -49,6 +49,7 @@
 #define SIO_F81803_ID		0x1210	/* Chipset ID */
 #define SIO_F81865_ID		0x0704	/* Chipset ID */
 #define SIO_F81866_ID		0x1010	/* Chipset ID */
+#define SIO_F81966_ID		0x1502  /* F81804 chipset ID, same for f81966 */
 
 #define F71808FG_REG_WDO_CONF		0xf0
 #define F71808FG_REG_WDT_CONF		0xf5
@@ -105,7 +106,7 @@ MODULE_PARM_DESC(start_withtimeout, "Start watchdog timer on module load with"
 	" given initial timeout. Zero (default) disables this feature.");
 
 enum chips { f71808fg, f71858fg, f71862fg, f71868, f71869, f71882fg, f71889fg,
-	     f81803, f81865, f81866};
+	     f81803, f81865, f81866, f81966};
 
 static const char * const fintek_wdt_names[] = {
 	"f71808fg",
@@ -118,6 +119,7 @@ static const char * const fintek_wdt_names[] = {
 	"f81803",
 	"f81865",
 	"f81866",
+	"f81966"
 };
 
 /* Super-I/O Function prototypes */
@@ -347,6 +349,7 @@ static int fintek_wdt_start(struct watchdog_device *wdd)
 		break;
 
 	case f81866:
+	case f81966:
 		/*
 		 * GPIO1 Control Register when 27h BIT3:2 = 01 & BIT0 = 0.
 		 * The PIN 70(GPIO15/WDTRST) is controlled by 2Ch:
@@ -373,7 +376,7 @@ static int fintek_wdt_start(struct watchdog_device *wdd)
 	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
 	superio_set_bit(wd->sioaddr, SIO_REG_ENABLE, 0);
 
-	if (wd->type == f81865 || wd->type == f81866)
+	if (wd->type == f81865 || wd->type == f81866 || wd->type == f81966)
 		superio_set_bit(wd->sioaddr, F81865_REG_WDO_CONF,
 				F81865_FLAG_WDOUT_EN);
 	else
@@ -580,6 +583,9 @@ static int __init fintek_wdt_find(int sioaddr)
 	case SIO_F81866_ID:
 		type = f81866;
 		break;
+	case SIO_F81966_ID:
+		type = f81966;
+		break;
 	default:
 		pr_info("Unrecognized Fintek device: %04x\n",
 			(unsigned int)devid);
-- 
2.25.1

