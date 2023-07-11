Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5D774EA44
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Jul 2023 11:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbjGKJYO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 Jul 2023 05:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbjGKJXo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 Jul 2023 05:23:44 -0400
X-Greylist: delayed 88 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 11 Jul 2023 02:19:22 PDT
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286C646A1
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Jul 2023 02:19:22 -0700 (PDT)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20230711091750bca5fc6664ee3254cd
        for <linux-watchdog@vger.kernel.org>;
        Tue, 11 Jul 2023 11:17:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cNKNC6oIcXI+MaGN9+y8x9Kvw+smz8uL9Y684QAwSc8=;
 b=V8ml7pwKF0A7d+MuOgmVtfrIc1O0Y+20hKNN4rl4H8w/aO8hILniyh75PI4TpKr1Tgevss
 ZYEKlBY4Dx3WMnyPnjIOzxhYT1EHxSUvYFV5BZ4s6BkuyXopa1z/BlfLsai6xRkCHvvDSL3G
 uUWrc/96uefC2BvXuX5NrAqX+GYEs=;
From:   huaqian.li@siemens.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     huaqianlee@gmail.com, nm@ti.com, vigneshr@ti.com,
        kristo@kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jan.kiszka@siemens.com,
        baocheng.su@siemens.com, Li Hua Qian <huaqian.li@siemens.com>
Subject: [PATCH v2 3/3] watchdog:rit_wdt: Add support for WDIOF_CARDRESET
Date:   Tue, 11 Jul 2023 17:17:13 +0800
Message-Id: <20230711091713.1113010-4-huaqian.li@siemens.com>
In-Reply-To: <20230711091713.1113010-1-huaqian.li@siemens.com>
References: <20230711091713.1113010-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Li Hua Qian <huaqian.li@siemens.com>

This patch adds the WDIOF_CARDRESET support for the platform watchdog
whose hardware does not support this feature, to know if the board
reboot is due to a watchdog reset.

This is done via reserved memory(RAM), which indicates if specific
info saved, triggering the watchdog reset in last boot.

Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 drivers/watchdog/rti_wdt.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index ce8f18e93aa9..77fd6b54137c 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -18,6 +18,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
+#include <linux/of.h>
 
 #define DEFAULT_HEARTBEAT 60
 
@@ -52,6 +53,11 @@
 
 #define DWDST			BIT(1)
 
+#define PON_REASON_SOF_NUM	0xBBBBCCCC
+#define PON_REASON_MAGIC_NUM	0xDDDDDDDD
+#define PON_REASON_EOF_NUM	0xCCCCBBBB
+#define PON_REASON_ITEM_BITS	0xFFFFFFFF
+
 static int heartbeat = DEFAULT_HEARTBEAT;
 
 /*
@@ -198,6 +204,11 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	struct rti_wdt_device *wdt;
 	struct clk *clk;
 	u32 last_ping = 0;
+	u32 reserved_mem_size;
+	unsigned long *vaddr;
+	unsigned long paddr;
+	u32 data[3];
+	u32 reg[8];
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
@@ -284,6 +295,43 @@ static int rti_wdt_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "reg", reg,
+					 0, ARRAY_SIZE(reg));
+	if (ret < 0) {
+		dev_err(dev, "cannot read the reg info.\n");
+		goto err_iomap;
+	}
+
+	/*
+	 * If reserved memory is defined for watchdog reset cause.
+	 * Readout the Power-on(PON) reason and pass to bootstatus.
+	 */
+	if (ret == 8) {
+		paddr = reg[5];
+		reserved_mem_size = reg[7];
+		vaddr = memremap(paddr, reserved_mem_size, MEMREMAP_WB);
+		if (vaddr == NULL) {
+			dev_err(dev, "Failed to map memory-region.\n");
+			goto err_iomap;
+		}
+
+		data[0] = *vaddr & PON_REASON_ITEM_BITS;
+		data[1] = *(vaddr + 1) & PON_REASON_ITEM_BITS;
+		data[2] = *(vaddr + 2) & PON_REASON_ITEM_BITS;
+
+		dev_dbg(dev, "Watchdog: sof = %lX, data = %lX, eof = %lX\n",
+			data[0], data[1], data[2]);
+
+		if ((data[0] == PON_REASON_SOF_NUM)
+		    && (data[1] == PON_REASON_MAGIC_NUM)
+		    && (data[1] == PON_REASON_MAGIC_NUM)) {
+			dev_info(dev, "Watchdog reset cause detected.\n");
+			wdd->bootstatus |= WDIOF_CARDRESET;
+		}
+		memset(vaddr, 0, reserved_mem_size);
+		memunmap(vaddr);
+	}
+
 	watchdog_init_timeout(wdd, heartbeat, dev);
 
 	ret = watchdog_register_device(wdd);
-- 
2.34.1

