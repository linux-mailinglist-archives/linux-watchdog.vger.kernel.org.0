Return-Path: <linux-watchdog+bounces-2490-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D049D928D
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Nov 2024 08:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79A7AB24B9A
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Nov 2024 07:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059951885B8;
	Tue, 26 Nov 2024 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="B6Xv0/jo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75810194AE8
	for <linux-watchdog@vger.kernel.org>; Tue, 26 Nov 2024 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732606617; cv=none; b=OkryAT3Ejg46+/INjz4aXja5kZ8bW4rJxPOQNma+9XnYWBqNOkf7119USPETPJD91dzX7QNqdKYsxYaQh9s7VP0spDNiFYbsuQjis/+oMktCkeiyoZ8iErw5nv1/Mb27VzXcCWN/fmL0NbUodVUd9JUl+cJVaFuCKi4JDDGud2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732606617; c=relaxed/simple;
	bh=KNVO8J3gsl2DA/9ocoZ52F61ETHEzcquUh12mEvk7Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RPK1ngzvKBKnDXToU5WCdaxT75FaWYYIBHpamV7oQAHdYmVktciceOk5Z7dxIJJSzwpIuE0fRM0akvpAI36P/h9DR3DbVnOClsrCdF01idwEurqauOJl4edYNrSP8ZwyXAjkCx18/jlOrU6IdEvlyLAd59BGA8pKEaZUR0hUb4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=B6Xv0/jo; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241126073649d9947aa62048498ce0
        for <linux-watchdog@vger.kernel.org>;
        Tue, 26 Nov 2024 08:36:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EtDCUfr3LrwAsgpNBtOhELyiQg8r8ri1jLgAFEDt+8Q=;
 b=B6Xv0/joc4vKaDj3qjfUWawbR/grdTOp/swwVAkSlaffweDNQoNsCIVm1l/p6jQhiC5ndq
 qeqjJlXvQeosa3rXuFl1a3Myz0Ws+2rpJExvHojX3ys5aPCHDypb4TDDfg1DZBN+Jpv2BZQp
 uD3XXot5FnZ431Un5MJMglrpcQSJUaWRYmexBO0rj3OBmhjQZCPAP922ws8qiWyOfJII62QO
 D1kSRXpqP1bCdOG26oAhX5QH+bVryR5W/VoMM6SyT+jwmoYj5VOGs4175vkRrBxAIWcxIPYS
 bELVuMf9/f8Ql0agSbGXSN4JWTsB4ZpN2fOzAaV3Z0AC3h/0lkm0Vkzw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-watchdog@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Judith Mendez <jm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH] watchdog: rti: Fix off-by-one in heartbeat recovery
Date: Tue, 26 Nov 2024 08:36:43 +0100
Message-ID: <20241126073646.126752-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

According to AM62x TRM WDT period is (RTIDWDPRLD + 1) * (2^13) / RTICLK1,
Fix the heartbeat recovery. In practice this doesn't affect rounded
heatbeat in seconds, but it does correct 4% of error in milliseconds,
for, say, default 60s heartbeat. This affects last_ping calculation.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/watchdog/rti_wdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 563d842014dfb..0416e54b17edb 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -273,7 +273,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
 		time_left_ms = rti_wdt_get_timeleft_ms(wdd);
-		heartbeat_ms = readl(wdt->base + RTIDWDPRLD);
+		/* AM62x TRM: texp = (RTIDWDPRLD + 1) * (2^13) / RTICLK1 */
+		heartbeat_ms = readl(wdt->base + RTIDWDPRLD) + 1;
 		heartbeat_ms <<= WDT_PRELOAD_SHIFT;
 		heartbeat_ms *= 1000;
 		do_div(heartbeat_ms, wdt->freq);
-- 
2.47.0


