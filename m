Return-Path: <linux-watchdog+bounces-3093-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 504ADA5EE40
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 09:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 923893A8DA2
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 08:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E796B26158A;
	Thu, 13 Mar 2025 08:44:06 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED1A261566;
	Thu, 13 Mar 2025 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855446; cv=none; b=sRIElvRG5UOVyAG7slWV1vDkTK5YZHOgEVcTlOEENSClNvBIpsepJL/zaSbJ7td89RP7QiYzEAExcbConUN72Ne5t4xkVf4R356ke32/tOHVLbM81TBX9YM3mJQ7Jz5YdrevIfbxr9lwNvzhXaLfr67E72UvphB4Mhf+3+hcOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855446; c=relaxed/simple;
	bh=LPTBbVCgJ3gNYRoorgbuJ2GD+DCqzyI7DNJWUsahgSY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QONJblFTdu1UPSCD0MXDzxpoLfxFWoZgb9j/KN2oaXXd/DqkpMPA7OOShc6Xr8w14HzIX8o2miBbgRnmWYz4zBfGGpwSGL3204VcEfkzfrg4OL8IdMELkCneW9++FVBL/U317nxtySaI4iDRrESV/rJWQ1pdbAo4lvDwLGEfHoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAD3_dHMmtJn8KHUFA--.4201S2;
	Thu, 13 Mar 2025 16:43:56 +0800 (CST)
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
Date: Thu, 13 Mar 2025 16:43:32 +0800
Message-Id: <20250313084333.2481712-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD3_dHMmtJn8KHUFA--.4201S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15tFWDXr1rCr48Ary7Jrb_yoW8JFWxpF
	WIyrWSvFW7tFWYqw43Jw4DAr1FkF42yFyfZryUCa4rWwn0yryFvFyFy34j9Fs8ArWfC3WY
	va1jyrWDC3WjyFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY
	1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5l1vDUUUU
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


