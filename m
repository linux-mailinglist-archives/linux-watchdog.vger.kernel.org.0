Return-Path: <linux-watchdog+bounces-4447-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B78C1803F
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 03:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7E2E400D14
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 02:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624322E9EA4;
	Wed, 29 Oct 2025 02:09:26 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF622E8881;
	Wed, 29 Oct 2025 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703766; cv=none; b=uaMRVXxsHKsoxX5tdWzbBYqvMME7b7oLgVgTUaIdA/e6r7+1SPuB7ovEzqBfC0YtPojBmwOkUWxyUVPpdXJMeVCaZWnlBzyJM2++bCRvwf/URdogdwaVRvWGXkIullNaXgeFReDJz8NTc/HrK3jL9pek+1KLTZpGC3lbjMH9Muc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703766; c=relaxed/simple;
	bh=QL7Kpmsvg3N6pJriiqLI0HEO2QI3ovEP/gHHLRCzh4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lwadsmz5rPux7yVuYAdDdIY+vHhKxvFViO7lqq54Ap2+FatV9lNEdLkCfvYEzAYtvZhDdE3MMLZpTyaTYkPlTdgqcAyNJ+B/BS0tYYn+yHgrTHp8JPsPsxvzlsfPYnVBjthJBMg+4lOtUesS8JJajwI+SD+KW1PRJzbm+h4/x7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8BxXNJSdwFpfdobAA--.60333S3;
	Wed, 29 Oct 2025 10:09:22 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJAx+8BRdwFp1rAXAQ--.27054S2;
	Wed, 29 Oct 2025 10:09:22 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 4/6] watchdog: loongson: Drop CONFIG_OF
Date: Wed, 29 Oct 2025 10:09:11 +0800
Message-ID: <20251029020913.1946321-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx+8BRdwFp1rAXAQ--.27054S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGkAWxIUrQAAsY
X-Coremail-Antispam: 1Uk129KBj9xXoWrKrW8Jr4xCr1rKry8Jw1rKrX_yoWkWrX_ua
	42qrZ3WFyrJrW3Xa4Yg3y5Ar92qas0qa45uF48KFs3Xa47tryYqrWkZF1DG3W7ZrWUJry3
	ur4kWrWSkry7XosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUneRRtUUUUU==

The general recommendation is to not use of_match_ptr() or CONFIG_OF
ifdef.

Drop them.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/loongson_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/loongson_wdt.c b/drivers/watchdog/loongson_wdt.c
index 3e0c3cac14f9..703c65952c7c 100644
--- a/drivers/watchdog/loongson_wdt.c
+++ b/drivers/watchdog/loongson_wdt.c
@@ -140,20 +140,18 @@ static int loongson_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id loongson_wdt_dt_ids[] = {
 	{ .compatible = "loongson,ls1b-wdt", },
 	{ .compatible = "loongson,ls1c-wdt", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, loongson_wdt_dt_ids);
-#endif
 
 static struct platform_driver loongson_wdt_driver = {
 	.probe = loongson_wdt_probe,
 	.driver = {
 		.name = "loongson-wdt",
-		.of_match_table = of_match_ptr(loongson_wdt_dt_ids),
+		.of_match_table = loongson_wdt_dt_ids,
 	},
 };
 
-- 
2.47.3


