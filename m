Return-Path: <linux-watchdog+bounces-3094-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD6A5EE45
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 09:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C1E317CC9B
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 08:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D4326157F;
	Thu, 13 Mar 2025 08:44:39 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B9261565;
	Thu, 13 Mar 2025 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855479; cv=none; b=Ny4lnGPAxz1CdFKNpmP0epvl+DkgSeYxRnHthM52yxf0U5TaeU3h89N7/84peutMA3+6jnTE5IAK45lyYkbcBrIrKWGE11pllEFFZ3yynp/gjvUjVA4qj+XR2A9f0fjarA4qKR4pLhqLKcHeOK0tz8fFLGLYOVhWxLq9xhMvpDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855479; c=relaxed/simple;
	bh=LPTBbVCgJ3gNYRoorgbuJ2GD+DCqzyI7DNJWUsahgSY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jQ3TnEf4thFjSVUwCW0SGnRxs6UcNuL6A7wapLcnVnP2BIaNIJi1CtSN2nNjOo+Q7qsHEsul19IeTWHh8q+3oF2aFYk+S+KtrRNNNRjlEqpu7QZpvYkowRCdYBw6BvM2bfgNLIomeW7fZY0quGadXPlXe3/quPjgB1HjkptFnhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADX32_smtJn3qfUFA--.13198S2;
	Thu, 13 Mar 2025 16:44:28 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] watchdog: npcm: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
Date: Thu, 13 Mar 2025 16:44:19 +0800
Message-Id: <20250313084420.2481763-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADX32_smtJn3qfUFA--.13198S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15tFWDXr1rCr48Ary7Jrb_yoW8JFWxpF
	WIyrWSvFW7tFWYqw43Jw4DAr1FkF42yFyfZryUCa4rWwn0yryFvFyFy34j9Fs8ArWfC3WY
	va1jyrWDC3WjyFJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67
	AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sR_JKItUU
	UUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

clk_prepare_enable() and clk_disable_unprepare() already checked
NULL clock parameter.Remove unneeded NULL check for clk here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/watchdog/npcm_wdt.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index a5dd1c230137..e62ea054bc61 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -68,8 +68,7 @@ static int npcm_wdt_start(struct watchdog_device *wdd)
 	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
 	u32 val;
 
-	if (wdt->clk)
-		clk_prepare_enable(wdt->clk);
+	clk_prepare_enable(wdt->clk);
 
 	if (wdd->timeout < 2)
 		val = 0x800;
@@ -105,8 +104,7 @@ static int npcm_wdt_stop(struct watchdog_device *wdd)
 
 	writel(0, wdt->reg);
 
-	if (wdt->clk)
-		clk_disable_unprepare(wdt->clk);
+	clk_disable_unprepare(wdt->clk);
 
 	return 0;
 }
@@ -156,8 +154,7 @@ static int npcm_wdt_restart(struct watchdog_device *wdd,
 	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
 
 	/* For reset, we start the WDT clock and leave it running. */
-	if (wdt->clk)
-		clk_prepare_enable(wdt->clk);
+	clk_prepare_enable(wdt->clk);
 
 	writel(NPCM_WTR | NPCM_WTRE | NPCM_WTE, wdt->reg);
 	udelay(1000);
-- 
2.25.1


