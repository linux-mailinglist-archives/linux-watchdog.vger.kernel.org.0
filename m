Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC5211A0078
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Apr 2020 23:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgDFVvH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Apr 2020 17:51:07 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54677 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFVvG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Apr 2020 17:51:06 -0400
Received: by mail-pj1-f65.google.com with SMTP id np9so459661pjb.4
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Apr 2020 14:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d0GRC6tXE6kwzKrqZfJwv/i4t0Oj1bZlDHZZAPnKTyo=;
        b=CcD5R1YOQBeJ0eejVRu4PnbzOhjkKrKvuULASLm2ot/i4F5rUvEiqgXrz36mn3koLK
         h0AsUNyjcXs6M0/tyNvnidIaTUI5YsgGlleH+br5nfmDCjZRJaE/8VuatdV3/csHxsZd
         BJOMAXlJfYznBra9UiwrSpHJKdJe7+8UfKqUsAY6YzVPZV6ZEgCgFcaMNsAUNYdJB9yQ
         1il3EYrIMB7GjoqPPnRNrnn4xKf56coS3o/eBNqTiSnKynUrAOIh+tvBaYnSQ6x4EHNe
         d8vd7RSLtzmZM7CCn5TzXmgqz4Yv7x/wMxK+/Xr3c4GNXFNKZjAwsGt3xRs1DtEeW/SO
         yoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d0GRC6tXE6kwzKrqZfJwv/i4t0Oj1bZlDHZZAPnKTyo=;
        b=PyKTbJFQEzVhzfEdy9siGnXY28HlAsxwP19EH4vcq79jq1X/2E5XJNOlqeAUv1d+x+
         KR4Uff9K2vG1AxzBuYrxGXw8jtvtps+ysVHRFU80qlaAeha1qYkl2mkyGL5b8HYhJdv2
         y7He7w6YCjG/IrsgkgnPWx/U7rbThAkW9oeW+jLbSdL5X9eRHQY1Z6gJODfDak5tqouU
         SrZfQzEtr8ntAzyoSRl2zvzvCLGZM55MEo33v4KbVAGgiBOv28LcgJ9Zie4jt+LsuLm/
         Q0KD0y3YI4xNAtaUEaOx+oMedNCuSKmekiWNmMfK3aPa7FJRIiFOSSif3G/ZhVf1LKW5
         4RDA==
X-Gm-Message-State: AGi0PuZukIhB8Msqq++dpM3wZ62604PAJHdhn7Ds7QX2Mo2fDvRrxxpW
        1Kgr8AN4Adn6TgL9/O91GJTnw7KrDuc=
X-Google-Smtp-Source: APiQypJLwK7OWKlZEpQ32Kqb8h6sXTHRJOcjQydldtwpfHqqXXvHOQ9NwupCmh2scLHBhmLC2E/W4g==
X-Received: by 2002:a17:902:b591:: with SMTP id a17mr21824577pls.283.1586209863806;
        Mon, 06 Apr 2020 14:51:03 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:305c:ab5e:90cd:f9db:2a22:87c5])
        by smtp.gmail.com with ESMTPSA id h15sm12411781pfq.10.2020.04.06.14.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 14:51:03 -0700 (PDT)
From:   Shyam Saini <mayhs11saini@gmail.com>
X-Google-Original-From: Shyam Saini <shyam.saini@savoirfairelinux.com>
To:     wim@linux-watchdog.org
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        jerome.oufella@savoirfairelinux.com,
        Shyam Saini <shyam.saini@savoirfairelinux.com>
Subject: [PATCH] drivers: watchdog: ts72xx_wdt: fix build error
Date:   Tue,  7 Apr 2020 03:20:08 +0530
Message-Id: <20200406215008.30468-1-shyam.saini@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If TS72XX_WATCHDOG is y and WATCHDOG_CORE is not enabled or its m,
then building fails:

drivers/watchdog/ts72xx_wdt.o: in function `ts72xx_wdt_probe':
	ts72xx_wdt.c:(.text+0x14c): undefined reference to \
	`watchdog_init_timeout'
	ts72xx_wdt.c:(.text+0x15c): undefined reference to \
	`devm_watchdog_register_device'

Select WATCHDOG_CORE to fix this.

Signed-off-by: Shyam Saini <shyam.saini@savoirfairelinux.com>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index cec868f8db3f..62da6e903336 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -669,6 +669,7 @@ config TS4800_WATCHDOG
 config TS72XX_WATCHDOG
 	tristate "TS-72XX SBC Watchdog"
 	depends on MACH_TS72XX || COMPILE_TEST
+	select WATCHDOG_CORE
 	help
 	  Technologic Systems TS-7200, TS-7250 and TS-7260 boards have
 	  watchdog timer implemented in a external CPLD chip. Say Y here
-- 
2.20.1

