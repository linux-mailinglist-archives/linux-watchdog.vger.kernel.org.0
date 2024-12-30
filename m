Return-Path: <linux-watchdog+bounces-2644-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EC79FE96C
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Dec 2024 18:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54450188107A
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Dec 2024 17:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEBE1ACED5;
	Mon, 30 Dec 2024 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J1lqBNPC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A45185920;
	Mon, 30 Dec 2024 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735580199; cv=none; b=o7qYaIGOMrSsXM5rioczdez0wsMWs+7PZqKKY/l7Z6N11ROZUjqqhmGROUjRTkMsT9aR6x5KKKfsh9hDxwDwbbBq8nRv6MZnhBHckpBYU/dzRxoR+75tWpcOw8c9UwUFIqhk/9SvSfsYvQ0prjV1RAX81YidXLQzZtjf52aX7A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735580199; c=relaxed/simple;
	bh=RCFDpSIiPM+fgvDEVLMWb/PAwBv5GDH6BDYtTBeQd0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ny4iCnqvFIeHG2kGzl1vF6/EQdis68QkPuAIVmzyWulz4mhGWxAiE2vX39WCn5yl8PxiOZqiJWRLsw1dKCH3r4rrnpCcc3NFNrwlMj1RaUuUN6cjU9ZHTQYXzqIrlCP6ICIuD4LAXHrsUUru0fvnVLTCBlotq8oRbq1vhhimB8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J1lqBNPC; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8534320002;
	Mon, 30 Dec 2024 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735580189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VTjyXowLtD8jETjdFmOuLNQ6/oxD8kvkCk4UOI4K1yY=;
	b=J1lqBNPCVDjKTO9jr58E9HODPem18uFgdoNf8GTjAmk+0+C6Xlj1fpdjMp3EnNc8GwOpMW
	uiFv9uL308o8WlN6aYgBlMuwKS1dPxsJcSlUCfuKNrLf2q3dvRAiXnhNQ3NYVYdFZpL306
	O5aKQZIpuaWBhiVFmltkglhYDIK9E4YsHU8hlk4hYtlb6PyhAXH1dvF/eT/hWMICxfb8Sg
	HNkMsY8K49ghHvz+KCjsvqZSY/O/vwMYZKaWHe5vuIjITn8OGnEtcDcjbP2aqtYhsg95SW
	DfB+c5klUmSOuZW6TQaPP3qlM+J760Qb037BHY+TEsmGPCMFV+hV+OHLgZm62Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 30 Dec 2024 18:35:58 +0100
Subject: [PATCH] watchdog: max77620: fix excess field in kerneldoc
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-max77620_wdt-kerneldoc-fix-v1-1-8a3211818993@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAP3ZcmcC/x3MQQqDMBBA0avIrB1IptJQryIiMRnbQY2SSA2Id
 2/o8v3FvyBxFE7QVhdE/kqSLRTougL3seHNKL4YSFGj6aFwtdmYJ6nh9AfOHAMvfnM4SUbnNL1
 Gy2oaDZTBHrnk/7zr7/sHuElcuGwAAAA=
X-Change-ID: 20241230-max77620_wdt-kerneldoc-fix-cc129bae0fb7
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com

The wdt_info does not exist in the struct being documented.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412281555.YMBF9azh-lkp@intel.com/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/watchdog/max77620_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/max77620_wdt.c b/drivers/watchdog/max77620_wdt.c
index 33835c0b06de573c93737309bd69c7aaab43127e..d3ced783a5f4d554db787a47185c8b7eb7ac85e4 100644
--- a/drivers/watchdog/max77620_wdt.c
+++ b/drivers/watchdog/max77620_wdt.c
@@ -25,7 +25,6 @@ static bool nowayout = WATCHDOG_NOWAYOUT;
 
 /**
  * struct max77620_variant - Data specific to a chip variant
- * @wdt_info:            watchdog descriptor
  * @reg_onoff_cnfg2:     ONOFF_CNFG2 register offset
  * @reg_cnfg_glbl2:      CNFG_GLBL2 register offset
  * @reg_cnfg_glbl3:      CNFG_GLBL3 register offset

---
base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
change-id: 20241230-max77620_wdt-kerneldoc-fix-cc129bae0fb7

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


