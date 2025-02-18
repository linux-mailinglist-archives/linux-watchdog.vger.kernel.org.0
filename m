Return-Path: <linux-watchdog+bounces-2954-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F27C8A3913D
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 04:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E68151894B04
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 03:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53BB17A5BE;
	Tue, 18 Feb 2025 03:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="YdKWLbyu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F3718E1F;
	Tue, 18 Feb 2025 03:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739848661; cv=none; b=Mb9UJIUtFxNzhj0Hue3FDYKvmuG+M55wU2dSQ/FuCJPTTts15KetBpv9/00nE8X5k55+pMIKX/VNgIRpxouE/ebYOsBECfqDeZGOFSSssic6VWxOhmhD3k+exaURX/iac+/70tv6jHe8mVvnXTpkNb9NGlOdl9gR6xBJ5goxW3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739848661; c=relaxed/simple;
	bh=hwMyPVaKVUhw8vJpzPoyTFJEveI+dSwGCqu8FTtJ6dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFlQTXTXdnu5ygESgEtVLvmVDMAMK5DF1ViuFd5lBLPIy/Kyc+sJXElC1RKGQ1Lq8tOAloEWdjaoC4UbCjHOIheCmXfc84bYQ8zzzMwG8wC5cMM7Jp2PFA2JMpG7UlLlB3DOZ8USP5uUhdT0507nr1A7YzXlljHuy3IvwDwOHoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=YdKWLbyu; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739848649; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=f3CbPlmh3sHKCr4h2q4NBJY7IFm6y5tBiOCFjrBwvTs=;
	b=YdKWLbyuUwjOpMaZwsJ1QD4uC/ZUalVdV5xj/aAju4EZ3dfAR5iE1gPsj9NaUBJ1bqUN6gEw5zLRzr0awhmeE+FQZ4bpAKlrlUBmDwb+HnWWM6E37wbWFDsO5jrqnwHhxkqBp3mQs7k0cGnaOnCmnrqETpOK/xWW21hKyXcmS8Q=
Received: from 03382176d5c3.tbsite.net(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPk8NtB_1739848638 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Feb 2025 11:17:28 +0800
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Heyi Guo <guoheyi@linux.alibaba.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down logic
Date: Tue, 18 Feb 2025 11:16:58 +0800
Message-ID: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aspeed watchdog uses counting down logic, so the value set to register
should be the value of subtracting pretimeout from total timeout.

Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")

Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Eddie James <eajames@linux.ibm.com>
---
 drivers/watchdog/aspeed_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..520d8aba12a5 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
 	u32 actual = pretimeout * WDT_RATE_1MHZ;
 	u32 s = wdt->cfg->irq_shift;
 	u32 m = wdt->cfg->irq_mask;
+	u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
+
+	if (actual >= reload)
+		return -EINVAL;
+
+	/* watchdog timer is counting down */
+	actual = reload - actual;
 
 	wdd->pretimeout = pretimeout;
 	wdt->ctrl &= ~m;
-- 
2.43.0


