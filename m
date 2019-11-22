Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C68A7106812
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 09:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfKVIZ1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Nov 2019 03:25:27 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:35050 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727422AbfKVIZX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Nov 2019 03:25:23 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAM8Ca4X024404;
        Fri, 22 Nov 2019 09:24:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=7YG8hMLBlcZH9okyAWH+GnK29WW6bCIlSdmP8Pj50xc=;
 b=uY2pBRUENT6U808IvNJJEG1i+oGTu0K6UkQAwayp/bbNLUqHRt9u83Jqvaf1v6+JQ1wX
 ZzasUcvdG1WuL2QXjKyxjm4ZHPunMVyUzigvdsys15VzAg1s+wEXi79EcXcey5j4w8kZ
 kRZlk3OFfdvyix+IwF9Q2LP1kuMrqpbkfeBH8vesx0GA4qf+apH7eBthFt/oEkb0Jepd
 S3uGBnUyRC1OBGWU1fXyLh84+FanVB/Fads5+NlEGbvQH+OqHO6LNcfI1zE+g3/qNqXE
 uTvLcGCdf1FyCHLE848tYP3K0BzCoMkFGw9DYq6zcyOtc9ZinZl1a09RUBSnEmVNuHqA tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2wa9ujfmpv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Nov 2019 09:24:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B356100034;
        Fri, 22 Nov 2019 09:24:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B3552AD9F3;
        Fri, 22 Nov 2019 09:24:47 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Nov 2019 09:24:46
 +0100
From:   Christophe Roullier <christophe.roullier@st.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
CC:     <linux-watchdog@vger.kernel.org>, <christophe.roullier@st.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/1] drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at probe
Date:   Fri, 22 Nov 2019 09:24:42 +0100
Message-ID: <20191122082442.21695-1-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_07:2019-11-21,2019-11-21 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the watchdog hardware is already enabled during the boot process,
when the Linux watchdog driver loads, it should start/reset the watchdog
and tell the watchdog framework. As a result, ping can be generated from
the watchdog framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set),
until the userspace watchdog daemon takes over control

Fixes:4332d113c66a ("watchdog: Add STM32 IWDG driver")

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
Changes since v1:
According to Guenter
I follow the guidance from intel-mid_wdt.c
and I added test to check if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
because we need to be flexible (depends on customer config, but watchdog
not always start by bootloader (Uboot, ..))
I've tested some config and it is working as expected:
Watchdog enable in Uboot + HANDLE_BOOT_ENABLE is not set + daemon watchdog in userland ON ==> No reset IWDG2
Watchdog enable in Uboot + HANDLE_BOOT_ENABLE is not set ==> Reset IWDG2
Watchdog enable in Uboot + HANDLE_BOOT_ENABLE=y ==> No reset IWDG2
Watchdog enable in Uboot + HANDLE_BOOT_ENABLE=y + daemon watchdog in userland ON puis OFF ==> Reset IWDG2
Watchdog disable in Uboot + HANDLE_BOOT_ENABLE is not set ==> No reset IWDG2
Watchdog disable in Uboot + HANDLE_BOOT_ENABLE=y ==> No reset IWDG2
Watchdog disable in Uboot + HANDLE_BOOT_ENABLE=y + daemon watchdog in userland ON ==> No reset IWDG2
Watchdog disable in Uboot + HANDLE_BOOT_ENABLE=y + daemon watchdog in userland ON puis OFF ==> Reset IWDG2

Thanks,
Christophe

 drivers/watchdog/stm32_iwdg.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index a3a329011a06..7f454a6e17ba 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -50,6 +50,9 @@
 #define TIMEOUT_US	100000
 #define SLEEP_US	1000
 
+static bool handle_boot_enabled =
+	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
+
 struct stm32_iwdg_data {
 	bool has_pclk;
 	u32 max_prescaler;
@@ -262,6 +265,24 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
 	watchdog_init_timeout(wdd, 0, dev);
 
+	/*
+	 * In case of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
+	 * (Means U-Boot/bootloaders leaves the watchdog running)
+	 * When we get here we should make a decision to prevent
+	 * any side effects before user space daemon will take care of it.
+	 * The best option, taking into consideration that there is no
+	 * way to read values back from hardware, is to enforce watchdog
+	 * being run with deterministic values.
+	 */
+	if (handle_boot_enabled) {
+		ret = stm32_iwdg_start(wdd);
+		if (ret)
+			return ret;
+
+		/* Make sure the watchdog is serviced */
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+	}
+
 	ret = devm_watchdog_register_device(dev, wdd);
 	if (ret)
 		return ret;
-- 
2.17.1

