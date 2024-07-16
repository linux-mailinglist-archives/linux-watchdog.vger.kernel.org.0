Return-Path: <linux-watchdog+bounces-1395-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AB3931F19
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 05:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B5BAB218E6
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 03:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CBCBA2F;
	Tue, 16 Jul 2024 03:08:20 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AD2182B5;
	Tue, 16 Jul 2024 03:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721099300; cv=none; b=JADkfDNl2ArjJfoNSNXuWRxCyh07jzEWYXeJg8HIaeicMXtXEnczCQQJL3SEPUXii+kS2BKcPprmBeaXwz8gnNidxMA6PGa54okKt4XMvyVwT6OqE5oGdB9xkI3KaygPcXPqBu9+y8Hbr6/8rJrGsyZRoOBt2EvoqsnGJr1mHV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721099300; c=relaxed/simple;
	bh=NzFgXShPSbnJn2Za/YJQsATqis3YpfVDNrSS8xfDEDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OXI6n5wzbKslNIPfwgqiaVn/z0J8G8GQ9T/3jSxCd07fTlG3N6mP6Bw+DpWY9T4EWqQjcc/dQxmQMgTZsJ/2Lfah6ekDkFpzUrEV3wKVaSPoXKVqMUIcnuzi8osVfcBYy8QHqvt5vwkW5FHmPCVqI1XoTIcaqNyLEOzdY+1fLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADn7+cZ5JVmdVaNAw--.51321S2;
	Tue, 16 Jul 2024 11:08:09 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	mpearson-lenovo@squebb.ca,
	dober@lenovo.com
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] watchdog: lenovo_se10_wdt: Convert comma to semicolon
Date: Tue, 16 Jul 2024 11:07:25 +0800
Message-Id: <20240716030725.400400-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADn7+cZ5JVmdVaNAw--.51321S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZrWkuw1rur1DtFy7Jrb_yoWDXrXE9F
	Z7Wr4I9a1DG3ZFk3Wqkw15Cr40vrs8ZFy8u3WxK3y3Jas7t3yjqrWkZw1kta1DZFs5WryY
	yr4DXr9YkrW3JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK
	6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjGQ6JUUUU
	U==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Fixes: 1f6602c8ed1e ("watchdog: lenovo_se10_wdt: Watchdog driver for Lenovo SE10 platform")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/watchdog/lenovo_se10_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/lenovo_se10_wdt.c b/drivers/watchdog/lenovo_se10_wdt.c
index 139ff0e8220f..cd0500e5080b 100644
--- a/drivers/watchdog/lenovo_se10_wdt.c
+++ b/drivers/watchdog/lenovo_se10_wdt.c
@@ -196,8 +196,8 @@ static int se10_wdt_probe(struct platform_device *pdev)
 	watchdog_set_drvdata(&priv->wdd, priv);
 
 	priv->wdd.parent = dev;
-	priv->wdd.info = &wdt_info,
-	priv->wdd.ops = &se10_wdt_ops,
+	priv->wdd.info = &wdt_info;
+	priv->wdd.ops = &se10_wdt_ops;
 	priv->wdd.timeout = WATCHDOG_TIMEOUT; /* Set default timeout */
 	priv->wdd.min_timeout = MIN_TIMEOUT;
 	priv->wdd.max_timeout = MAX_TIMEOUT;
-- 
2.25.1


