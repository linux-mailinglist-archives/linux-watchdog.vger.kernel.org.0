Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895D12AAC30
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Nov 2020 17:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbgKHQZ4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Nov 2020 11:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgKHQZz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Nov 2020 11:25:55 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63093C0613CF;
        Sun,  8 Nov 2020 08:25:55 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id g19so6251151otp.13;
        Sun, 08 Nov 2020 08:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JwSH2aVoTO9OLiW27hN/IDvEgg/U4tZOFYArTi8XkLg=;
        b=GOe94XS3oWbAYmrseJkNCISMhHNI7+KTRl33h5D+p/wTFJlVDspXHDlHSIBxj2E2Vs
         ciy6j1iYFq56FoedCiq9XOo5XrtAjXMV/9dblprFgYgX9rPi8r7xigVdTefTiYANqIGa
         n21eEzyBaIcsjFyeV89SVNEpwWnmHW1VHPPlGLDdKm4IyXmS9F+M80JGAYZ4HU88U3rF
         k3Cr4Zw15Qxf//troD/4mneo5gEWtXeZ/oyVfDfftcuIeyV3fDAW3G2Vxxzio/lugMVB
         bsA+NPgb2ouNeYoK1rWv45tdWKFQShMxFR155l92UezGBUdu4YyrU6+54pZW/YG1P28T
         o5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=JwSH2aVoTO9OLiW27hN/IDvEgg/U4tZOFYArTi8XkLg=;
        b=OlfY3kZ9j+oBVNTswPSrgxquz1i3PMe6hCODFoYP3Wz8ncLKIYoxnr0V67Rtp3Pf3r
         2wDAze9ZB38cSLeecYOmBgZnpqyV7NBsbUQGrrK6nIb7ytWfws7z9b2h85DMzGiCZLKQ
         dflpmZ7bqsO8KhC/PqQJEoRhlc5El/QoDXs6ZTlS8BUwobkd2EzMa2JXJR19DaEfBW7p
         OsqbqZNFjg2voAp3/4SJiP+ysxZLa0PU23SwYZMSQJRRLEaetjS9cIxfCqrVSIeMvaof
         b60xU2YxdNEEoFRPg8DxecgV2lWyAT5L2RU7iM9DLeNCcWaWSWEvekzoK6zQBzGdj3H+
         ojEg==
X-Gm-Message-State: AOAM533xAFj0JOSqibj61OvHeq2FZz7ETViEzbXGqJYQXJCwMTPPhVnc
        aRJlMndYkkslmzMQCcCNehA5l09zePI=
X-Google-Smtp-Source: ABdhPJwr9uptoZNFCxRRTMGXGBP/uxWgWh7mBsx0t5xc3FrNG5IZQLYZLE3mhAX7oFAivQ1pILp4Aw==
X-Received: by 2002:a9d:5543:: with SMTP id h3mr7515017oti.241.1604852754733;
        Sun, 08 Nov 2020 08:25:54 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y35sm1878191otb.5.2020.11.08.08.25.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 08:25:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] watchdog: sirfsoc: Add missing dependency on HAS_IOMEM
Date:   Sun,  8 Nov 2020 08:25:50 -0800
Message-Id: <20201108162550.27660-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201108162550.27660-1-linux@roeck-us.net>
References: <20201108162550.27660-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If HAS_IOMEM is not defined and SIRFSOC_WATCHDOG is enabled,
the build fails with the following error.

drivers/watchdog/sirfsoc_wdt.o: in function `sirfsoc_wdt_probe':
sirfsoc_wdt.c:(.text+0x112):
	undefined reference to `devm_platform_ioremap_resource'

Reported-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b3e8bdaa2a11..f8e9be65036a 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -790,6 +790,7 @@ config MOXART_WDT
 
 config SIRFSOC_WATCHDOG
 	tristate "SiRFSOC watchdog"
+	depends on HAS_IOMEM
 	depends on ARCH_SIRF || COMPILE_TEST
 	select WATCHDOG_CORE
 	default y
-- 
2.17.1

