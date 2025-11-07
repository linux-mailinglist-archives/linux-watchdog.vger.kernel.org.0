Return-Path: <linux-watchdog+bounces-4525-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 735CAC3E934
	for <lists+linux-watchdog@lfdr.de>; Fri, 07 Nov 2025 07:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D84F188B79F
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Nov 2025 06:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A3929DB6E;
	Fri,  7 Nov 2025 06:01:53 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A8229B799;
	Fri,  7 Nov 2025 06:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762495313; cv=none; b=ohyuw71DYEmmvt6nveorbQ2mWsarmM8hnfKBI1jkGC+NlDqo7kuxPr0qnve1cy9DZWhSKCU5ZyOH86exct6od+cs7EPz6/ap559hEHOJFmXwLG/MC6ibe94m0/ops1uK3OOqz+4A7Rf14I94UiMOmeFCHPd47asfcgffWirAJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762495313; c=relaxed/simple;
	bh=jO42I00j4PRb4LfFerTNgwqMiXIlw8lh9KY6iqS7+eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4ihdLolBaXeuJeChhdyS9xGjXkH3QB66kq+6i99nYk2idhhm1ZF5/EuNpghpIgnVMHRQTQtWe2OYW5JY2E3nJhj0T6FTgQxKpDoQK0dSAAyWGPU6Z76hJ+XPmG8tcdLQBPgZAG43GAcbDrI6dBaMphXJjP8I0sUyC4q2e/mAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8CxbNJKiw1pqyYgAA--.4717S3;
	Fri, 07 Nov 2025 14:01:46 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJBxzsFCiw1pSJIqAQ--.32958S5;
	Fri, 07 Nov 2025 14:01:45 +0800 (CST)
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
Subject: [PATCH v2 3/5] watchdog: loongson1: Drop CONFIG_OF
Date: Fri,  7 Nov 2025 14:01:29 +0800
Message-ID: <a374b938f2cc304b7e618bf22a5e8fa9f32e3efd.1762482089.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJBxzsFCiw1pSJIqAQ--.32958S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGkNihMACQAAss
X-Coremail-Antispam: 1Uk129KBj9xXoWrKrW8Jr1Dtr1rZw1DAry3Jrc_yoWkJFg_C3
	42qrnrWr95Jr93XFyYqw4xArZ2q3Z0qF1Uu3WkKFs3Za4xtry5ZrWDZr9rJ345ZFWUJFy5
	Aa1DXFWSkFnrXosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_Wryl
	Yx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j2MKZUUUUU=

The general recommendation is to not use of_match_ptr() or CONFIG_OF
ifdef.

Drop them.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/loongson1_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
index 781f01f1f888..255198cbf5bf 100644
--- a/drivers/watchdog/loongson1_wdt.c
+++ b/drivers/watchdog/loongson1_wdt.c
@@ -142,20 +142,18 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id ls1x_wdt_dt_ids[] = {
 	{ .compatible = "loongson,ls1b-wdt", },
 	{ .compatible = "loongson,ls1c-wdt", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);
-#endif
 
 static struct platform_driver ls1x_wdt_driver = {
 	.probe = ls1x_wdt_probe,
 	.driver = {
 		.name = "ls1x-wdt",
-		.of_match_table = of_match_ptr(ls1x_wdt_dt_ids),
+		.of_match_table = ls1x_wdt_dt_ids,
 	},
 };
 
-- 
2.47.3


