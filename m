Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E07A42615A
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Oct 2021 02:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbhJHAfJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Oct 2021 20:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhJHAfH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Oct 2021 20:35:07 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0FFC061570;
        Thu,  7 Oct 2021 17:33:06 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id u20-20020a9d7214000000b0054e170300adso9604968otj.13;
        Thu, 07 Oct 2021 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NOEsMMjkc88ksVTOJu1U07OSu7E9jl7WMzqKGgvDspQ=;
        b=eizuH8f3mtCELwbR5rLmnhWBv/1tx98wTYrlH5+rYUjaKbF8ghZZI982DqmPkT1k4A
         ppCxpB0jV40AO0xQcXQZePLaou08QaE++s0dHF/Jn2ilFdnMmXJBMoXEx/6OBlGkNFT1
         u8WmKAnuqAttur+HdA3ijJa0bzO4inLxMwIm2seHtjD3cwZpETQJKRze+0Obe40bZ4sM
         8HDw665krQqn1T5OZ8iHZMrQVqVTNAIXFcTasXdnqsXjDBbenHXwWlhnQ0bfUlt1sex2
         yCu1aa1xMS58JzQrG8Dmy0JBsAPB/YkCXAEWZHbN6rf1JXK4eIG5D/rDik2CDRh2lyie
         +mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=NOEsMMjkc88ksVTOJu1U07OSu7E9jl7WMzqKGgvDspQ=;
        b=YF1gBM4ROpL4u+mtThDJyIZe+xSMpQeK+7IBFP78cW1J3RI8sjPIGDfmcfpqfap4/w
         /1QP1a0AWrrQHXUQc9/86xX7daaBP0Dlwa1+yPW4rowIJeu7dtq1lEGpkCDmlFtAxLA8
         mny5RYJGe/poRXMTCdzmFqlb1Vy0Hb6YsAROvrJ4FhszOhoJAJ9OfoI/gmA0JCBmnHtt
         idJn8webAK0Oait6NTMAWwv6RTKQK78FpJjZSQg81ADA2qHVEFhwQ2EYsT93GvAlHd36
         Jd83uL3tLsiYeulwlZB8xcqYqZ00OgOrFblRpvStqOjiPY6oFliNqTAoXWGgKuTAqPSr
         0xQA==
X-Gm-Message-State: AOAM532tuXV2u22HPCovMqkhChK5LrwkYdhhWvVQpqOcCR8bCJ3GovQn
        fzLHJz8HEnarcWxqZvfoGYs=
X-Google-Smtp-Source: ABdhPJxnjKw/0iaNkZ6oODFUTmWJW6w5TFT6POVoBBCTTboAYEDV7iPUI1lU/l6rFRVXjXr/k/MXiA==
X-Received: by 2002:a05:6830:1448:: with SMTP id w8mr6337049otp.50.1633653186258;
        Thu, 07 Oct 2021 17:33:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w7sm228801oic.12.2021.10.07.17.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 17:33:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>,
        "Javier S . Pedro" <debbugs@javispedro.com>
Subject: [PATCH] Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
Date:   Thu,  7 Oct 2021 17:33:02 -0700
Message-Id: <20211008003302.1461733-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This reverts commit cb011044e34c ("watchdog: iTCO_wdt: Account for
rebooting on second timeout") and commit aec42642d91f ("watchdog: iTCO_wdt:
Fix detection of SMI-off case") since those patches cause a regression
on certain boards (https://bugzilla.kernel.org/show_bug.cgi?id=213809).

While this revert may result in some boards to only reset after twice
the configured timeout value, that is still better than a watchdog reset
after half the configured value.

Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
Fixes: aec42642d91f ("watchdog: iTCO_wdt: Fix detection of SMI-off case")
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Mantas Mikulėnas <grawity@gmail.com>
Reported-by: Javier S. Pedro <debbugs@javispedro.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/iTCO_wdt.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 643c6c2d0b72..ced2fc0deb8c 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -71,8 +71,6 @@
 #define TCOBASE(p)	((p)->tco_res->start)
 /* SMI Control and Enable Register */
 #define SMI_EN(p)	((p)->smi_res->start)
-#define TCO_EN		(1 << 13)
-#define GBL_SMI_EN	(1 << 0)
 
 #define TCO_RLD(p)	(TCOBASE(p) + 0x00) /* TCO Timer Reload/Curr. Value */
 #define TCOv1_TMR(p)	(TCOBASE(p) + 0x01) /* TCOv1 Timer Initial Value*/
@@ -357,12 +355,8 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
 
 	tmrval = seconds_to_ticks(p, t);
 
-	/*
-	 * If TCO SMIs are off, the timer counts down twice before rebooting.
-	 * Otherwise, the BIOS generally reboots when the SMI triggers.
-	 */
-	if (p->smi_res &&
-	    (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
+	/* For TCO v1 the timer counts down twice before rebooting */
+	if (p->iTCO_version == 1)
 		tmrval /= 2;
 
 	/* from the specs: */
@@ -527,7 +521,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 		 * Disables TCO logic generating an SMI#
 		 */
 		val32 = inl(SMI_EN(p));
-		val32 &= ~TCO_EN;	/* Turn off SMI clearing watchdog */
+		val32 &= 0xffffdfff;	/* Turn off SMI clearing watchdog */
 		outl(val32, SMI_EN(p));
 	}
 
-- 
2.33.0

