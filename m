Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB0D408565
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Sep 2021 09:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237608AbhIMHdp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Sep 2021 03:33:45 -0400
Received: from out0.migadu.com ([94.23.1.103]:48705 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235185AbhIMHdp (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Sep 2021 03:33:45 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1631518347;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=0hl2fxYxZhj/9wgVrbYbabF0Wtj8Cu9hAVh3a0d62dY=;
        b=Z/qsmfEyvW5QyKB/43N2CxBwNyyY3C+IBk7oduhArnOTCEIdpxGCaBrDrDlipgZJdjMmi4
        2ObCbCFT1VNykFXsQy6yhzgNm3FCDryLY9MRbS+iCVgQgK8Q7AJKXtAEhW1wW+1WT8zYVf
        d5hYyReRUMzO/M8m4IBorl+aQCjUkVU=
From:   Jackie Liu <liu.yun@linux.dev>
To:     linux@roeck-us.net, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, liu.yun@linux.dev
Subject: [PATCH] watchdog/sb_watchdog: fix compilation problem due to COMPILE_TEST
Date:   Mon, 13 Sep 2021 15:32:20 +0800
Message-Id: <20210913073220.1159520-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

Compiling sb_watchdog needs to clearly define SIBYTE_HDR_FEATURES.
In arch/mips/sibyte/Platform like:

  cflags-$(CONFIG_SIBYTE_BCM112X) +=                                      \
                -I$(srctree)/arch/mips/include/asm/mach-sibyte          \
                -DSIBYTE_HDR_FEATURES=SIBYTE_HDR_FMASK_1250_112x_ALL

Otherwise, SIBYTE_HDR_FEATURES is SIBYTE_HDR_FMASK_ALL.
SIBYTE_HDR_FMASK_ALL is mean:

 #define SIBYTE_HDR_FMASK_ALL  SIBYTE_HDR_FMASK_1250_ALL | SIBYTE_HDR_FMASK_112x_ALL \
				     | SIBYTE_HDR_FMASK_1480_ALL)

So, If not limited to CPU_SB1, we will get such an error:

  arch/mips/include/asm/sibyte/bcm1480_scd.h:261: error: "M_SPC_CFG_CLEAR" redefined [-Werror]
  arch/mips/include/asm/sibyte/bcm1480_scd.h:262: error: "M_SPC_CFG_ENABLE" redefined [-Werror]

Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b81fe4f7d434..bf59faeb3de1 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1666,7 +1666,7 @@ config WDT_MTX1
 
 config SIBYTE_WDOG
 	tristate "Sibyte SoC hardware watchdog"
-	depends on CPU_SB1 || (MIPS && COMPILE_TEST)
+	depends on CPU_SB1
 	help
 	  Watchdog driver for the built in watchdog hardware in Sibyte
 	  SoC processors.  There are apparently two watchdog timers
-- 
2.25.1

