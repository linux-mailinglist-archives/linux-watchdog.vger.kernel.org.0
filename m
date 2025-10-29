Return-Path: <linux-watchdog+bounces-4444-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B920C1802D
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 03:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5B2F3BF601
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 02:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8562E975E;
	Wed, 29 Oct 2025 02:09:11 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2330623D7CF;
	Wed, 29 Oct 2025 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703751; cv=none; b=AKk7cvm4auuyG+DZwtw3jA3xgAQDMmqNGCkI2SnIhb4gAec3rROVzQ3kz5JEP3DAkjpp5Qa+ZsNDyffmjnuYOjQ5QGY6PYyt3mJh3LadamsGMfORAxgxd1us3xZE9pasKCUtL9Uc6L14G61+VSNyHao0lcQCDJxzrd6RL0ksFNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703751; c=relaxed/simple;
	bh=pWLIeOrIPvij3ly95Tw1VY7CEj4IzIlnm2x9qNT8xmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksWkNihXkbwBo54KBJu4wo12gnwIm9jHd+CmmNi2MjW1KeEr+QS/JsRDSllT8+tZZhdEpMfuoMlk0/6GB9aJIMoKiMkefFJJJcDhELSYOC2zqNjLBWCmnWhC8ifcVb+xDqWvf3MPjFgnsUbU4FSzrdSBEfJsGBBa431fL/52yHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8DxN9FDdwFpX9obAA--.60693S3;
	Wed, 29 Oct 2025 10:09:07 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJDxqcA5dwFpbrAXAQ--.64967S5;
	Wed, 29 Oct 2025 10:09:06 +0800 (CST)
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
Subject: [PATCH 3/6] watchdog: loongson: Simplify loongson_wdt_probe code
Date: Wed, 29 Oct 2025 10:08:47 +0800
Message-ID: <20251029020847.1946295-4-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
References: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxqcA5dwFpbrAXAQ--.64967S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGkAWxIUqAAAsd
X-Coremail-Antispam: 1Uk129KBj93XoW7Zw13XrWkKrWrXrWkJF4DKFX_yoW8GFyxpF
	ZxZa4FkrW7trsFvrnrJ3yDZF13C34Iq3sxXF4xKw18u3s8Jw15X34rJFyxKa98AFZ8JFy2
	qFyxtrW8ua98tFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1mii3UUUUU==

Remove meaningless output to simplify loongson_wdt_probe().

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/loongson_wdt.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/loongson_wdt.c b/drivers/watchdog/loongson_wdt.c
index 2e7803ce7d42..3e0c3cac14f9 100644
--- a/drivers/watchdog/loongson_wdt.c
+++ b/drivers/watchdog/loongson_wdt.c
@@ -106,11 +106,11 @@ static int loongson_wdt_probe(struct platform_device *pdev)
 	struct loongson_wdt_drvdata *drvdata;
 	struct watchdog_device *loongson_wdt;
 	unsigned long clk_rate;
-	int err;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
+	platform_set_drvdata(pdev, drvdata);
 
 	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drvdata->base))
@@ -137,15 +137,7 @@ static int loongson_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(loongson_wdt, nowayout);
 	watchdog_set_drvdata(loongson_wdt, drvdata);
 
-	err = devm_watchdog_register_device(dev, &drvdata->wdt);
-	if (err)
-		return err;
-
-	platform_set_drvdata(pdev, drvdata);
-
-	dev_info(dev, "Loongson Watchdog driver registered\n");
-
-	return 0;
+	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
 #ifdef CONFIG_OF
-- 
2.47.3


