Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F4D1D77C5
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 May 2020 13:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgERLuQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 May 2020 07:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbgERLuP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 May 2020 07:50:15 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92292C061A0C;
        Mon, 18 May 2020 04:50:15 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f6so4696722pgm.1;
        Mon, 18 May 2020 04:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=X9lxL53iNCPyN2ZJcc89KlTBlpJfTdzY+QocElqkDm8=;
        b=vOW5E9hOzDafN252KJEens8aK+rEN7j0K5Qqc5FRQbtY2ZftrIEr+zbOY5SauSHg3T
         mjWbdfKErANDwBoqZeK0ydjoT4EItktS9awZiBW1Z6vPouYXP0WqAKrU+ae0p7zG3Bqd
         Yt+s4lGFW7q534tU8wEjc6OkeS4p3x9RJrHKPpaV9jZqW0SVJQaYZNB/NFUNcwoQXJpR
         1Z7ihz0VeB/x8Njyt6TW5H9+NBvWg81vqm39ZG1Fe/NIZOwTLRWLzTZkk/3/9BEdXzX6
         TYRqPHopdaKGFTCHNI3kAVkYi7e1V5LBdwfSzr2E9+4uqut9rH/bLkEKr756oyfxSdWB
         7MMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X9lxL53iNCPyN2ZJcc89KlTBlpJfTdzY+QocElqkDm8=;
        b=Ydvg7rY77bBlR4nqbf33G4WXCyCBsjrfETPM8cV6W8U6j52yZey5o+KNEr3PMqfhOh
         Cxc6u5GglNkoxq22AU9NcwoHD1qhHKBFVJo+mMiJh1ymlDqlkP4x0E1RndN+rVoz3YHW
         pQuJ3fgYc1wNc/hhdHgAyC7pnS3fwuv+Bwi1+G0Byx7XROZQZ6IRPWiDgRYgNfzS8f5T
         J612KIUx6jX3efQ561zdTRQLEsN4pRKlG+9KkcocqHQWpQdfbRr4210GJfyf158gwZXC
         oBzecCixBSyXoPFVQcA8Q1rEwUDMVcPqvbgQXpnCxGiuI5aDs0nHXrDjr0Z7soCi/pVp
         V7OA==
X-Gm-Message-State: AOAM532uXWFxvXmAUMRNlMQWV0KG5nqKgM135Jb6IekShqp5tkmtGl8h
        5GvaOf5cLOocdIPQ5+6/9L4WyehnHLNO7g==
X-Google-Smtp-Source: ABdhPJw/Es3Ip9d4nChplTcYkSM7jkwCZIXCoahQSaa/x+jIWG+nKjmoiHMLJTriH8P8bpIcVPCFcg==
X-Received: by 2002:a63:4f5c:: with SMTP id p28mr14724042pgl.412.1589802614975;
        Mon, 18 May 2020 04:50:14 -0700 (PDT)
Received: from localhost.localdomain ([103.227.71.184])
        by smtp.googlemail.com with ESMTPSA id l1sm7432933pgj.48.2020.05.18.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 04:50:14 -0700 (PDT)
From:   Harshal Chaudhari <harshalchau04@gmail.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: gef_wdt.c: convert to module_platform_driver()
Date:   Mon, 18 May 2020 17:19:54 +0530
Message-Id: <20200518114954.7417-1-harshalchau04@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The driver init and exit function don't do anything besides registering
and unregistering the platform driver, so the module_platform_driver()
macro could just be used instead of having separate functions.

Signed-off-by: Harshal Chaudhari <harshalchau04@gmail.com>
---
 drivers/watchdog/gef_wdt.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
index f6541d1b65e3..4421a452d0f5 100644
--- a/drivers/watchdog/gef_wdt.c
+++ b/drivers/watchdog/gef_wdt.c
@@ -311,19 +311,7 @@ static struct platform_driver gef_wdt_driver = {
 	.remove		= gef_wdt_remove,
 };
 
-static int __init gef_wdt_init(void)
-{
-	pr_info("GE watchdog driver\n");
-	return platform_driver_register(&gef_wdt_driver);
-}
-
-static void __exit gef_wdt_exit(void)
-{
-	platform_driver_unregister(&gef_wdt_driver);
-}
-
-module_init(gef_wdt_init);
-module_exit(gef_wdt_exit);
+module_platform_driver(gef_wdt_driver);
 
 MODULE_AUTHOR("Martyn Welch <martyn.welch@ge.com>");
 MODULE_DESCRIPTION("GE watchdog driver");
-- 
2.17.1

