Return-Path: <linux-watchdog+bounces-4573-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B856BC55717
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 03:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521BD3A2B19
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 02:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DB72FD1BF;
	Thu, 13 Nov 2025 02:32:57 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C541FBEA6;
	Thu, 13 Nov 2025 02:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763001177; cv=none; b=ruWbzuOYQyMSBEk0oksaMrXxfjqTmplwNiJ+pYlm+W9HH3dAg1Vl233J4cpNysOqq2yUeqiLPTn58DnlgiL3OSAp0EuI5umGC8D2c0WFY8C4MTmehu5i00IIslwRPt5ka6JA552uRHSymUghROC0Gn0atEB/MW9RM74inGIMYTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763001177; c=relaxed/simple;
	bh=oSo1/m0pMpEL9gEgpPifGxmk/w0eiHhecFJPLP5qnbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DXooXbB1Z+AthsNIOM9VEgJTufW+lbxZlp2T1/SYniCOuX3kzv2MiIqEEWS5TYTtQl4TWY898ZiHwP/h1f0Se32ESRaqP0Kql9HGcGKKmIFq6h7DOlwSy1rwdm7G8bcHI5uWf74dg6RLsAr78V/5pJyyxamGGvd1X9ukH4slkhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAAnK2xPQxVpF5iOAA--.5385S2;
	Thu, 13 Nov 2025 10:32:49 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] watchdog: wdat_wdt: Fix ACPI table leak in probe function
Date: Thu, 13 Nov 2025 10:30:32 +0800
Message-ID: <20251113023032.547-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnK2xPQxVpF5iOAA--.5385S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur1xCryUZw4fury3GF47XFb_yoWrArW8pF
	WfCayYqrWjqr1Uur1xtw4DZFW3Ka1Sqayjqry8Cw1Sva45KryYqasYyryUtFs5GrWkGFW5
	XF1UtF4UuFWjvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAFA2kVJ+6EBAAAsq

wdat_wdt_probe() calls acpi_get_table() to obtain the WDAT ACPI table but
never calls acpi_put_table() on any paths. This causes a permanent ACPI
table memory leak.

Add a single cleanup path which calls acpi_put_table() to ensure
the ACPI table is always released.

Fixes: 058dfc767008 ("ACPI / watchdog: Add support for WDAT hardware watchdog")
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
  -Remove unnecessary initialization.
  -Correct the patch description, since the v1 patch already
   free table on both error and success paths.
---
 drivers/watchdog/wdat_wdt.c | 64 +++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index 650fdc7996e1..dd3c2d69c9df 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -326,19 +326,27 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	wdat = devm_kzalloc(dev, sizeof(*wdat), GFP_KERNEL);
-	if (!wdat)
-		return -ENOMEM;
+	if (!wdat) {
+		ret = -ENOMEM;
+		goto out_put_table;
+	}
 
 	regs = devm_kcalloc(dev, pdev->num_resources, sizeof(*regs),
 			    GFP_KERNEL);
-	if (!regs)
-		return -ENOMEM;
+	if (!regs) {
+		ret = -ENOMEM;
+		goto out_put_table;
+	}
 
 	/* WDAT specification wants to have >= 1ms period */
-	if (tbl->timer_period < 1)
-		return -EINVAL;
-	if (tbl->min_count > tbl->max_count)
-		return -EINVAL;
+	if (tbl->timer_period < 1) {
+		ret = -EINVAL;
+		goto out_put_table;
+	}
+	if (tbl->min_count > tbl->max_count) {
+		ret = -EINVAL;
+		goto out_put_table;
+	}
 
 	wdat->period = tbl->timer_period;
 	wdat->wdd.min_timeout = DIV_ROUND_UP(wdat->period * tbl->min_count, 1000);
@@ -355,15 +363,20 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 		res = &pdev->resource[i];
 		if (resource_type(res) == IORESOURCE_MEM) {
 			reg = devm_ioremap_resource(dev, res);
-			if (IS_ERR(reg))
-				return PTR_ERR(reg);
+			if (IS_ERR(reg)) {
+				ret = PTR_ERR(reg);
+				goto out_put_table;
+			}
 		} else if (resource_type(res) == IORESOURCE_IO) {
 			reg = devm_ioport_map(dev, res->start, 1);
-			if (!reg)
-				return -ENOMEM;
+			if (!reg) {
+				ret = -ENOMEM;
+				goto out_put_table;
+			}
 		} else {
 			dev_err(dev, "Unsupported resource\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out_put_table;
 		}
 
 		regs[i] = reg;
@@ -385,8 +398,10 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 		}
 
 		instr = devm_kzalloc(dev, sizeof(*instr), GFP_KERNEL);
-		if (!instr)
-			return -ENOMEM;
+		if (!instr) {
+			ret = -ENOMEM;
+			goto out_put_table;
+		}
 
 		INIT_LIST_HEAD(&instr->node);
 		instr->entry = entries[i];
@@ -417,7 +432,8 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 
 		if (!instr->reg) {
 			dev_err(dev, "I/O resource not found\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out_put_table;
 		}
 
 		instructions = wdat->instructions[action];
@@ -425,8 +441,10 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 			instructions = devm_kzalloc(dev,
 						    sizeof(*instructions),
 						    GFP_KERNEL);
-			if (!instructions)
-				return -ENOMEM;
+			if (!instructions) {
+				ret = -ENOMEM;
+				goto out_put_table;
+			}
 
 			INIT_LIST_HEAD(instructions);
 			wdat->instructions[action] = instructions;
@@ -443,7 +461,7 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 
 	ret = wdat_wdt_enable_reboot(wdat);
 	if (ret)
-		return ret;
+		goto out_put_table;
 
 	platform_set_drvdata(pdev, wdat);
 
@@ -460,12 +478,16 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 
 	ret = wdat_wdt_set_timeout(&wdat->wdd, timeout);
 	if (ret)
-		return ret;
+		goto out_put_table;
 
 	watchdog_set_nowayout(&wdat->wdd, nowayout);
 	watchdog_stop_on_reboot(&wdat->wdd);
 	watchdog_stop_on_unregister(&wdat->wdd);
-	return devm_watchdog_register_device(dev, &wdat->wdd);
+	ret = devm_watchdog_register_device(dev, &wdat->wdd);
+
+out_put_table:
+	acpi_put_table((struct acpi_table_header *)tbl);
+	return ret;
 }
 
 static int wdat_wdt_suspend_noirq(struct device *dev)
-- 
2.50.1.windows.1


