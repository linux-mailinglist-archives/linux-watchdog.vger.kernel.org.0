Return-Path: <linux-watchdog+bounces-1202-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3991B585
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jun 2024 05:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A271C2154C
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jun 2024 03:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A7B1CD32;
	Fri, 28 Jun 2024 03:35:54 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AE829CED;
	Fri, 28 Jun 2024 03:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719545754; cv=none; b=WFDgT0R8xq4pH6GWRTYonkn2SONWAgf+6NacUCCdrShzzAYSFRiCrnXEywqNdJJOvp/bAeSw8MDIyI0HUAkULO+a2AVS0JKOQ9eOh8fsiOEqp1FrRMDcc5UokWy79PVVbU8ll0zdG3ydGl0faLNSVa5MqIsGmKHY30bnbaGkEc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719545754; c=relaxed/simple;
	bh=4PTMG8x5ll9DWcGJGqMJXhh7xGBPqEwcIHo2sypsPWs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VgHrPIODVjjMatBo/WGyJdNHFD4AGzUE8RQQqp+NjRfRPgZ4M//wqjvckkTTPWdaEw9Wb8f+dpbAA2wZKdE63+uOeSFAg4nvikhmcBErrJeaR7N2jp1hVf00gJ4egrjsYDMR/YegL89CjWtWIGaKQIccV1DKr0xmhzErUZ3TNFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAXHNSOL35mVovZEg--.9949S2;
	Fri, 28 Jun 2024 11:35:43 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: xingyu.wu@starfivetech.com,
	samin.guo@starfivetech.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] watchdog: starfive: Add missing clk_disable_unprepare()
Date: Fri, 28 Jun 2024 11:35:08 +0800
Message-Id: <20240628033508.281058-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAXHNSOL35mVovZEg--.9949S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF4fWw48try5WFy8Cw17ZFb_yoWfJFc_K3
	ZrGa9IgF1DZF4Ska4qkw1ayryI9r4UZF4Uur4rtrW3t347tr15Kr4UXF95Jw1kZ3Wqvr9x
	C3Zxur4Ikas7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
	Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeVyIUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add the missing clk_disable_unprepare() before return in
starfive_wdt_enable_clock().

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/watchdog/starfive-wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index b4b059883618..19a2620d3d38 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -152,8 +152,10 @@ static int starfive_wdt_enable_clock(struct starfive_wdt *wdt)
 		return dev_err_probe(wdt->wdd.parent, ret, "failed to enable apb clock\n");
 
 	ret = clk_prepare_enable(wdt->core_clk);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(wdt->apb_clk);
 		return dev_err_probe(wdt->wdd.parent, ret, "failed to enable core clock\n");
+	}
 
 	return 0;
 }
-- 
2.25.1


