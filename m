Return-Path: <linux-watchdog+bounces-4524-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1148C3E931
	for <lists+linux-watchdog@lfdr.de>; Fri, 07 Nov 2025 07:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C81A7188A250
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Nov 2025 06:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7046625FA2D;
	Fri,  7 Nov 2025 06:01:51 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23E7D27E;
	Fri,  7 Nov 2025 06:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762495311; cv=none; b=uMPraIhGnbbu56IsmoOUkkVgbaD2V6ADvAIxBex5sa6bZ1e4pwefoXaBfFgUdJ//Cdi0ZX8/dD30LAlv9VuRi1LhwWohdR2DUt0R3X+ONBe8/k6QUPmV/04OPnd0hvH8hSsxuljT/4AtfMngKyFR4yQVN0X/nIjRU0TjHPHX3gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762495311; c=relaxed/simple;
	bh=jNK/MYzHi7n/urMQGiuIB/7a1B4zVrZcU5Hj0QPwwJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXS1jJ18xGnMMosWQXCPcUNgxn269umUnH91Ut73rGmlxdKEjHDxpjDPcj2TzOvzwKZ3L3h6he4n3N6suip3vMWYprGXxal622FXCOqyKjvlr+r+X+KT3ytKSIeO5dTVIE9BhkDpzQnrR5ZCIyTyCMroaXyBKDIx/zMBp4txx/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8Dxb_BJiw1ppCYgAA--.5143S3;
	Fri, 07 Nov 2025 14:01:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJBxzsFCiw1pSJIqAQ--.32958S4;
	Fri, 07 Nov 2025 14:01:44 +0800 (CST)
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
Subject: [PATCH v2 2/5] watchdog: loongson1: Simplify ls1x_wdt_probe code
Date: Fri,  7 Nov 2025 14:01:28 +0800
Message-ID: <7d792b573160cbeb0f797f6b8e2f5dcb54f8b490.1762482089.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762482089.git.zhoubinbin@loongson.cn>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxzsFCiw1pSJIqAQ--.32958S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQETCGkNii4ACAAAsT
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww18Kw1UJry3GrWxGw47ZFc_yoW8GF1rpF
	Z5ua4FkrWUKr429w17t34DAF1fGFWIq3y7Xr4xKw1kuas8Kr15ZFWrJFySya98AFZ7Jr17
	tF9rtrWfua98tFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxhiSDUUUU

Remove meaningless output to simplify ls1x_wdt_probe().

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/loongson1_wdt.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
index 8502263b0d6f..781f01f1f888 100644
--- a/drivers/watchdog/loongson1_wdt.c
+++ b/drivers/watchdog/loongson1_wdt.c
@@ -108,11 +108,11 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 	struct ls1x_wdt_drvdata *drvdata;
 	struct watchdog_device *ls1x_wdt;
 	unsigned long clk_rate;
-	int err;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
+	platform_set_drvdata(pdev, drvdata);
 
 	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drvdata->base))
@@ -139,15 +139,7 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(ls1x_wdt, nowayout);
 	watchdog_set_drvdata(ls1x_wdt, drvdata);
 
-	err = devm_watchdog_register_device(dev, &drvdata->wdt);
-	if (err)
-		return err;
-
-	platform_set_drvdata(pdev, drvdata);
-
-	dev_info(dev, "Loongson1 Watchdog driver registered\n");
-
-	return 0;
+	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
 #ifdef CONFIG_OF
-- 
2.47.3


