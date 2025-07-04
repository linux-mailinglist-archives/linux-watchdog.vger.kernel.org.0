Return-Path: <linux-watchdog+bounces-3816-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3775AF899B
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Jul 2025 09:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FA77582C3D
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Jul 2025 07:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC8E270575;
	Fri,  4 Jul 2025 07:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BaLnfg8/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7481FC0FC;
	Fri,  4 Jul 2025 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614552; cv=none; b=o5SjtpbhqGbRqX5jiKQfTg5ZNPdgDX8ZrbxGya/fZbVAyi4yvxSLkw4AeXfdXeS9V0rasiGGawDweZJ+erAjp8G7nEompN04REJFp6woSAhUy8LBH/OHHKJw5VzZl462+usrBet5evRmz1hUkZ3m4I3SErtcODANjsOKueItT8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614552; c=relaxed/simple;
	bh=XY83Hduz2IFtdympjVunRV8NwH0o03IOlu4UckdZpGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VV3i5VAj66cVQk1p/OxgtQs/VIW5UKRTVqg0c6zoNnZRROezZhC9m3NazcbkrLNXM0Ec82HqmzrEnEzhVxLSUJ58vQ401MenR0vaJXE6kIt0QEWJXEPb8+E/NkX9Z7djv+h2U4EV36AH3f4JyW0fLqRn3/kqNHXRF8hNlRyIp/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BaLnfg8/; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/r
	pQNnf/SXH5Yewblodb44FTxFUHDBPnbG5vsS5IwbI=; b=BaLnfg8/M8ba8Vt0Ry
	8LNN/l0GrZ4cSGz110ACOscpDQ3Xa5RZ8rmW5ZL3URhdOe9rv2nmhGuXJSXZRTK1
	tNAPjDvp/BFX5nUcfAiLBtw1+MiWtumftRQWKyrz7RdmHjbmW8GVtJpOcqp66XVh
	RFlBDwljXlfNVdTL1B5Vwr5/0=
Received: from fzy-XPS-15-9570.lenovo.com (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3H5k4hGdoT5cmAA--.5387S2;
	Fri, 04 Jul 2025 15:35:21 +0800 (CST)
From: Ziyan Fu <13281011316@163.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	fuzy5@lenovo.com
Subject: [PATCH] watchdog: iTCO_wdt: Report error if timeout configuration fails
Date: Fri,  4 Jul 2025 15:35:18 +0800
Message-ID: <20250704073518.7838-1-13281011316@163.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3H5k4hGdoT5cmAA--.5387S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWxGryrtr1UCrykuFW7Jwb_yoW8Wr1fpF
	sxKayDAry8WF4xWw4Iya93Za18ua40gFWUCFZ0g3409wn8JwsxGF4rta4Dta48AF9rJr1r
	Ja48XrW5W3y5ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnZ23UUUUU=
X-CM-SenderInfo: bprtjmyrqrijirw6il2tof0z/xtbBEgOA8WhnfUKqCQABsy

From: Ziyan Fu <fuzy5@lenovo.com>

The driver probes with the invalid timeout value when
'iTCO_wdt_set_timeout()' fails, as its return value is not checked. In
this case, when executing "wdctl", we may get:

Device:        /dev/watchdog0
Timeout:       30 seconds
Timeleft:      613 seconds

The timeout value is the value of "heartbeat" or "WATCHDOG_TIMEOUT", and
the timeleft value is calculated from the register value we actually read
(0xffff) by masking with 0x3ff and converting ticks to seconds (* 6 / 10).

Add error handling to return the failure code if 'iTCO_wdt_set_timeout()'
fails, ensuring the driver probe fails and prevents invalid operation.

Signed-off-by: Ziyan Fu <fuzy5@lenovo.com>
---
 drivers/watchdog/iTCO_wdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 9ab769aa0244..4ab3405ef8e6 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -577,7 +577,11 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	/* Check that the heartbeat value is within it's range;
 	   if not reset to the default */
 	if (iTCO_wdt_set_timeout(&p->wddev, heartbeat)) {
-		iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
+		ret = iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
+		if (ret != 0) {
+			dev_err(dev, "Failed to set watchdog timeout (%d)\n", WATCHDOG_TIMEOUT);
+			return ret;
+		}
 		dev_info(dev, "timeout value out of range, using %d\n",
 			WATCHDOG_TIMEOUT);
 		heartbeat = WATCHDOG_TIMEOUT;
-- 
2.27.0


