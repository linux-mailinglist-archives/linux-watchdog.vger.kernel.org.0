Return-Path: <linux-watchdog+bounces-4513-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58518C3486E
	for <lists+linux-watchdog@lfdr.de>; Wed, 05 Nov 2025 09:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 326C446717F
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Nov 2025 08:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45382D8779;
	Wed,  5 Nov 2025 08:42:47 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B92D595D;
	Wed,  5 Nov 2025 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332167; cv=none; b=NyM0HHen6c2pPIqR2CiHwZ3pknZFYrnAajKRrJ6fxrJOKf25l5+0V4Af2zz1ck2SFzR2FCSr9xzEiKLXlek7hSHhB1UAF9mlvoiby/crhMSBsVIj+sUXuXqg197P51TSywuy3EeiHG1cDSa66AW7uq2xfwsfMYNLGb5gEK/cgnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332167; c=relaxed/simple;
	bh=MynJdN+q0tQCspRsA/Y2l/tUwetCPLe9L2/rq1X6uFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VaPKJnCn+U3RJhZrDWsEqd0g23+sYvurvAhwEmww/os1VP6LaQjD+iESAAz6riEtdvzzY6NL1yz7aZLqCI7Za460//q/49Rdh3RzjRmbuEHsmUotBcoEDEKDjZy/weNHikU73rlfFKo71vpehleI4g9oHrlxHgenhCb+ESV8xRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAA3sun6DQtp4wiWAQ--.25976S2;
	Wed, 05 Nov 2025 16:42:36 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: linux-watchdog@vger.kernel.org,
	xingyu.wu@starfivetech.com,
	ziv.xu@starfivetech.com,
	wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] watchdog: starfive: Fix resource leak in probe error path
Date: Wed,  5 Nov 2025 16:42:20 +0800
Message-ID: <20251105084220.1334-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAA3sun6DQtp4wiWAQ--.25976S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWrGF1rAF1DAr45tFy7Jrb_yoW8JF4Dpw
	4Skasakr10qr429r47Ja1DZa45Cayxt347ArW8Ga4F9rs8Cw4rtw4vyFyYga1DJr93Ga17
	ta1qq3y8uayakr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAURA2kK8b6plAAAsK

If pm_runtime_put_sync() fails after watchdog_register_device()
succeeds, the probe function jumps to err_exit without
unregistering the watchdog device. This leaves the watchdog
registered in the subsystem while the driver fails to load,
resulting in a resource leak.

Add a new error label err_unregister_wdt to properly unregister
the watchdog device.

Fixes: 8bc22a2f1bf0 ("watchdog: starfive: Check pm_runtime_enabled() before decrementing usage counter")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/watchdog/starfive-wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index 355918d62f63..ed71d3960a0f 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -500,12 +500,14 @@ static int starfive_wdt_probe(struct platform_device *pdev)
 		if (pm_runtime_enabled(&pdev->dev)) {
 			ret = pm_runtime_put_sync(&pdev->dev);
 			if (ret)
-				goto err_exit;
+				goto err_unregister_wdt;
 		}
 	}
 
 	return 0;
 
+err_unregister_wdt:
+	watchdog_unregister_device(&wdt->wdd);
 err_exit:
 	starfive_wdt_disable_clock(wdt);
 	pm_runtime_disable(&pdev->dev);
-- 
2.50.1.windows.1


