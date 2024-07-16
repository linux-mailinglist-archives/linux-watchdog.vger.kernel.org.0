Return-Path: <linux-watchdog+bounces-1396-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ACD931F2D
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 05:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E999282442
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 03:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFA5D53B;
	Tue, 16 Jul 2024 03:12:22 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54EDDBD;
	Tue, 16 Jul 2024 03:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721099542; cv=none; b=b8CPzDHgw74bHcqJLTJD1kOPDgYgwfis5ks05E6XENb/YY/TaztrQ9lJFBkoD+4bStHEuYn/WKLkaXdKIhKrc4RmsHim7qQxsLwXkZO2xS7TFLBxkl2J7PxkbPeSV3HHaTfOWQfsE0EUhXakI9Ne7Qd/pDJr8ZX8DhB0pynbV6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721099542; c=relaxed/simple;
	bh=WmrMRFgwGRcWUtDYC6XQmVVV7bWAVa6NiRmqhT6/kOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ThEmUvFErRa9TxQcI3NZ+rd01ayW2JlmIIi1YzLBcKNX2Y+2AHDX1rsXdqztYZWAvkqOCYxeRIZd0chmu81KGWs8xThIMIOw0AHrnz0boFGnTW+pf3Y2LxkslXVFjPBYvmASK/ZlQfQfUHgADH+oIdNL3iHaE2mcxelbjGzYy8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACHjeUL5ZVmM3eNAw--.48372S2;
	Tue, 16 Jul 2024 11:12:11 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	jjhiblot@traphandler.com,
	tzungbi@kernel.org,
	phil.edworthy@renesas.com
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] watchdog: rzn1: Convert comma to semicolon
Date: Tue, 16 Jul 2024 11:11:37 +0800
Message-Id: <20240716031137.400502-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACHjeUL5ZVmM3eNAw--.48372S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF18CFyrKrykAr1xAFb_yoWDJFg_C3
	yIyr1fWr1UGF10kF48ta13CrW09ayYqF18AF1vgrWay393JrWxXrWUXryxG3yUXa4UGrnx
	ArsFq34Y9Fn3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
	Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUenmRUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Fixes: d65112f58464 ("watchdog: Add Renesas RZ/N1 Watchdog driver")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/watchdog/rzn1_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
index 980c1717adb5..7d3192d34afd 100644
--- a/drivers/watchdog/rzn1_wdt.c
+++ b/drivers/watchdog/rzn1_wdt.c
@@ -140,9 +140,9 @@ static int rzn1_wdt_probe(struct platform_device *pdev)
 	}
 
 	wdt->clk_rate_khz = clk_rate / 1000;
-	wdt->wdtdev.info = &rzn1_wdt_info,
-	wdt->wdtdev.ops = &rzn1_wdt_ops,
-	wdt->wdtdev.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
+	wdt->wdtdev.info = &rzn1_wdt_info;
+	wdt->wdtdev.ops = &rzn1_wdt_ops;
+	wdt->wdtdev.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
 	wdt->wdtdev.parent = dev;
 	/*
 	 * The period of the watchdog cannot be changed once set
-- 
2.25.1


