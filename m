Return-Path: <linux-watchdog+bounces-2559-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 570F29EE537
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 12:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615F9166D2D
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 11:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD261F37CB;
	Thu, 12 Dec 2024 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=zankapfel.net header.i=phil@zankapfel.net header.b="vBBy0Mlw";
	dkim=pass (2048-bit key) header.d=zankapfel.net header.i=phil@zankapfel.net header.b="myhTvdnV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from zankapfel.net (zankapfel.net [5.45.106.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A931F0E57;
	Thu, 12 Dec 2024 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.45.106.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734003494; cv=none; b=HDkEoA4hOfW9Bocdc1+C53XH/jzFBcODhETPtOH/uBKwPWOR7Uxp7lXc401jIP1Ln5+vbyQXgHMBkFJXENm6BbRCj3q6e38s7BtpPR/2MtBvLwN2ZVi1VQSLs0pSW/B+MAAiOi0vnb5GazGOvnGaVKdi+Fq8bH6z4v1ZazlCZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734003494; c=relaxed/simple;
	bh=4u5q3iNWiKTEWb5hmFX2ihyKWr/q1tuP/iJ7YDhn8ds=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mIu36pxLQiie88Ytxhz/HEnRDRR9wmMQQEQSXptmc5awxKCDVlSu72cJFnsIV9bg5LHDlPyfGY1UCv8vuHnpyFtSe7Qd5mpZKFQjPFr52eCMRLoe3fDzBxBNglq2tnFOvndK5e5fJal9WuG6W6IUZ02PWF3pEfpeSy2BjJ5p3ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zankapfel.net; spf=pass smtp.mailfrom=zankapfel.net; dkim=permerror (0-bit key) header.d=zankapfel.net header.i=phil@zankapfel.net header.b=vBBy0Mlw; dkim=pass (2048-bit key) header.d=zankapfel.net header.i=phil@zankapfel.net header.b=myhTvdnV; arc=none smtp.client-ip=5.45.106.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zankapfel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zankapfel.net
Received: from zankapfel.net by zankapfel.net ([5.45.106.173]) via tcp with
	ESMTPSA id 6rlJ0Kh87LDhBzgHayDNZQ (TLS1.3 TLS_AES_128_GCM_SHA256)
	12 Dec 2024 12:30:35 +0100
DKIM-Signature: v=1; d=zankapfel.net; s=2024a; i=phil@zankapfel.net;
	a=ed25519-sha256; t=1734003035; x=1734262235; h=From:To:Cc:Bcc:Reply-To:
	References:In-Reply-To:Subject:Date:Message-Id:Content-Type:From:To:Cc:
	Subject:Date:Message-Id; bh=4u5q3iNWiKTEWb5hmFX2ihyKWr/q1tuP/iJ7YDhn8ds=; b=v
	BBy0MlwkxEer7jbyODcWDO37TYsb95V6uDlHbG39t/MFcyDxX4cSJOmlKItQtguqi5tbW3AY7fXiO
	ciNvpQBQ==
DKIM-Signature: v=1; d=zankapfel.net; s=2024b; i=phil@zankapfel.net;
	a=rsa-sha256; t=1734003035; x=1734262235; h=From:To:Cc:Bcc:Reply-To:
	References:In-Reply-To:Subject:Date:Message-Id:Content-Type:From:To:Cc:
	Subject:Date:Message-Id; bh=4u5q3iNWiKTEWb5hmFX2ihyKWr/q1tuP/iJ7YDhn8ds=; b=m
	yhTvdnVd3Nzn9vAxlGnAfYZy8CHNi0b8OPSKjYNDqZim/p2alcP0QuMuxIMpDUX8Sm0wolDYrh0Gh
	/pvT4LU/9SQKqJMCnK7E1JO2CkCF99Qhm/nd985FOec3zMPHcmaiXZS99GKYn7BebLrYlUpPrlw/i
	arfSPUDplXMGUYfJ/v6/n4rOPHEgE0gb0OkEaMJR33spu8XbMP3HRt9FTelbf6X/QXux04pf0Pw+D
	fH9GUHGMyHuTXekYBZqhhsfVO90u2PfAruqi6R2afumO7eIiBUm/8C9yEHN1UjYN89DUHCUcAOsV5
	hECNuxe+c5E1G03s6iwpg4e+aQ1rMPkuw==
Authentication-Results: zankapfel.net;
	auth=pass smtp.mailfrom=phil@zankapfel.net
From: Phil Eichinger <phil@zankapfel.net>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Phil Eichinger <phil@zankapfel.net>
Subject: [PATCH] watchdog: aspeed: replace mdelay with msleep
Date: Thu, 12 Dec 2024 12:30:14 +0100
Message-Id: <20241212113014.1075414-1-phil@zankapfel.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Since it is not called in an atomic context the mdelay function
can be replaced with msleep to avoid busy wait.

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 drivers/watchdog/aspeed_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..98ef341408f7 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -208,7 +208,7 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
 	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
 
-	mdelay(1000);
+	msleep(1000);
 
 	return 0;
 }
-- 
2.39.5


