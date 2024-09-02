Return-Path: <linux-watchdog+bounces-1655-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6597968167
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 10:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDED11C21AE2
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 08:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081581552FC;
	Mon,  2 Sep 2024 08:11:18 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3EC17E017;
	Mon,  2 Sep 2024 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264677; cv=none; b=sd/ohPxoiRuLXV2rxc/48Y/7WytHJM4Br6f2AJdUf9dasoiRRcIf3olHEqRHzY539L0uZSly3oOe9SVTSIUuLHUxN64VpVYppF+h0EpvxlVFiM6pkpAZTvuyk2IxylJ4B7w6cYWySL1FvCp2aMm9sq8MbwvwQtCvxL9pR/8vp3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264677; c=relaxed/simple;
	bh=9FrYoSca2jduyAoMMhNei/jVGPU3lyRMm4uluMDLqBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S3CVsAFg+qIwYlU6NyMt0GCVwMvCvWJiE7zHwv230DoxLWwpKC3B5FKvohefQVFIz5fEQ1bFZBRWmqivS2o1pa77j9ekj4gDcpzTi9iyBrDYEx2kEwQDpSqNnnYsX9TGhwiTv5g0E4IZvKfoJLUzxV+38IYZLuprm+ril46itms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADX944bc9Vmz0eFAA--.32908S2;
	Mon, 02 Sep 2024 16:11:07 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	andy.shevchenko@gmail.com
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] watchdog: iTCO_wdt: Convert comma to semicolon
Date: Mon,  2 Sep 2024 16:10:51 +0800
Message-Id: <20240902081051.3824822-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADX944bc9Vmz0eFAA--.32908S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF15ZF1ftF4UtryrZwb_yoWfGFXEka
	47urs7Gr1UGF1jkF42ka4YkFWFvrZ8XF1xJFsYqrZaka9rJryUZ3yFqrykKw45Xa4UZr12
	yFs8XryY9F17AjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUjna93UUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Fixes: ce1b95ca23c1 ("watchdog: iTCO_wdt: Use allocated data structures")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/watchdog/iTCO_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 264857d314da..35b358bcf94c 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -563,8 +563,8 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	}
 
 	ident.firmware_version = p->iTCO_version;
-	p->wddev.info = &ident,
-	p->wddev.ops = &iTCO_wdt_ops,
+	p->wddev.info = &ident;
+	p->wddev.ops = &iTCO_wdt_ops;
 	p->wddev.bootstatus = 0;
 	p->wddev.timeout = WATCHDOG_TIMEOUT;
 	watchdog_set_nowayout(&p->wddev, nowayout);
-- 
2.25.1


