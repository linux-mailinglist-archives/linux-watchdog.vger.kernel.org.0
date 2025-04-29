Return-Path: <linux-watchdog+bounces-3396-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2446AA0880
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Apr 2025 12:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60A1C169923
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Apr 2025 10:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DA3275101;
	Tue, 29 Apr 2025 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JDb3R9EU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33E72BE7B4;
	Tue, 29 Apr 2025 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922403; cv=none; b=CSjZO+kDNvHY6hLqjPWNvn0804xAI5bsjlKOIZC0XAbqsdpECcmJ0n0o9jELk3iWi7gHN9ag6dkBhznlZ8SiOmr0YTaXU9K7UhzjcJFBr+MphFkoHjNzzfoGVATj3Z1iLhw6M9KCr6IFTQsG9AgjKc4vcqoqVuFElTLH2ERvwdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922403; c=relaxed/simple;
	bh=dmg0TUHM8w36Iq6ZAgI2ielBvGHctCL1QDiPgfZ18z4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aro1LkC1GOz28s9KfnlMAWVid8nFKEiPmpUUiLVwM94c00OB5J7jXJudI8MY2DBgdLVAPehGImc+jUGRXRYpzUwT8xiq7aF8n4Wh74KjfcJROdB3nH6zlo3zgkIbHoIERxbfQ/uAz6o0vNlkGTSXaix4jBlK/V/kTjrWs86lS7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JDb3R9EU; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=8GP+n
	pVX+iv9UUdWPJRMpZv3Pc8wAEAmhISDscAl75Q=; b=JDb3R9EUxgjVHs5Wwcy3H
	uvHnrjjKMCLgpyCnRD9vjCenkkT7lR7P9wwmAbpTUQF6Jnqph1JKryQT/gx8yFKs
	S+8HuLJRlXkdyk0A4qvo3qLvWo+u0BM/2qxHCUzQPdVbLacCiGJEWOd7EGqONDGb
	u3bo9NjquAzt+myjmx7XWs=
Received: from fzy-XPS-15-9570.lenovo.com (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBHWWxDqRBoX4iyBQ--.41706S2;
	Tue, 29 Apr 2025 18:26:13 +0800 (CST)
From: Ziyan Fu <13281011316@163.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ahuang12@lenovo.com,
	Ziyan Fu <fuzy5@lenovo.com>
Subject: [PATCH] watchdog: iTCO_wdt: Update the heartbeat value after clamping timeout
Date: Tue, 29 Apr 2025 18:25:33 +0800
Message-ID: <20250429102533.11886-1-13281011316@163.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgBHWWxDqRBoX4iyBQ--.41706S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7XrW5GrWxCw1rAF48JFykAFb_yoW8Jr1kpF
	Z5AFy8Ary8XF4xWw1Iyan7ZF47Wa48WF47ArZYg3409398Jw1UGF4SkayDK3WkAF9xJw15
	A3W0q348Wa9xZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnfHUUUUUU=
X-CM-SenderInfo: bprtjmyrqrijirw6il2tof0z/xtbBkA4+8WgQYfT4nwABsa

From: Ziyan Fu <fuzy5@lenovo.com>

When executing "modprobe iTCO_wdt heartbeat=700", the user-specified
'heartbeat' parameter exceeds the valid range, the driver clamps the
timeout to default 30s but fails to update the logged 'heartbeat' value,
resulting in misleading log output:

iTCO_wdt iTCO_wdt: timeout value out of range, using 30
iTCO_wdt iTCO_wdt: initialized. heartbeat=700 sec (nowayout=0)

After validating the range, update the 'heartbeat' value with the clamped
timeout value to ensure that log messages accurately reflect the actual
runtime parameters.

Signed-off-by: Ziyan Fu <fuzy5@lenovo.com>
---
 drivers/watchdog/iTCO_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 7672582fa407..3391abacaae2 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -604,6 +604,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 		iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
 		dev_info(dev, "timeout value out of range, using %d\n",
 			WATCHDOG_TIMEOUT);
+		heartbeat = WATCHDOG_TIMEOUT;
 	}
 
 	watchdog_stop_on_reboot(&p->wddev);
-- 
2.34.1


