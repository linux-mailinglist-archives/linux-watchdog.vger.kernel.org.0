Return-Path: <linux-watchdog+bounces-2497-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2969E189D
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Dec 2024 10:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E84D16665E
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Dec 2024 09:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2548A190068;
	Tue,  3 Dec 2024 09:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mcrowe.com header.i=@mcrowe.com header.b="k/u/D7b1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smarthost01b.sbp.mail.zen.net.uk (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9989185B48
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Dec 2024 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.23.1.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219904; cv=none; b=PMGtE1umMMkkaIhUjSg6UcjBIVjw0kV7Air7mVYHNNcUDyHQQ3aPVSWQ0TfOZW00qRkKtfrFeSb7095df5IVv/ep263Qoxb7Pr6zHB8dAG+IKORHEQguNleW4MVlzKLytsEaKFInhA9Z4lEC/hzQ/mLDAY/zE+2us2iDrkuNrrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219904; c=relaxed/simple;
	bh=dYQYJ0HQcV8mZWDgGPoIhwK/tPS1FNDfqYK6l3wbVEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TwIvjJUw/CHUtdOgsq/6D7B5c4MB+W+/fRa31EorAy2tauY0RhrLA7aFe7eas4Ke5aAm3/8HNuA1GoRoUCKsI8znkiCHGevF0nVYEIIzBmfTsGt1TvcT4sgInHUcfFLWfAgjYL9313rzMfJs3w2+aHY7HbVlNWzHwYLi7ZHgs1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mcrowe.com; spf=pass smtp.mailfrom=mcrowe.com; dkim=pass (2048-bit key) header.d=mcrowe.com header.i=@mcrowe.com header.b=k/u/D7b1; arc=none smtp.client-ip=212.23.1.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mcrowe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcrowe.com
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01b.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1tIPfQ-007ZSa-B8;
	Tue, 03 Dec 2024 09:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description; bh=tabRML47ADo8k2LCejYOp7BvKRTeWBTUsmGddHb/Qts=; b=k/u/D
	7b1OwjJ3q+T72iXOa05KTdI/xZl+F7Xv0ksNPliL3sgQjGOnYX47GbznhCnzo3sZTdkD0wapM4N/k
	kl47sMqFhUGMTRPGb91hcqsrjEQZtG9nxEjy382+gVEcoL2LOidMwayM3ogXG4ZB+ABRkwFefnYxI
	+9qlBfmFPxysaHQN/txfoELopVLoUD1fVnDbnMiH8xr9rRKYPtgdtseC3gQb04hpyDCcT+l+Bfq9a
	1lBCgDROg60FIob1UrM5Ew6rPpWV7isGuT7bp3sdGLrI7RzK3NuomYNXeOy2ixxXSpUiej9IuKOWg
	qMbEgqPT5tMkOT5C7YcVfs97fERhA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1tIPfY-004x9N-2z;
	Tue, 03 Dec 2024 09:58:12 +0000
From: Mike Crowe <mac@mcrowe.com>
To: linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Mike Crowe <mac@mcrowe.com>
Subject: [PATCH v2] watchdog: sp805: Report correct timeleft at maximum
Date: Tue,  3 Dec 2024 09:57:44 +0000
Message-Id: <20241203095744.3001795-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202214343.2425341-1-mac@mcrowe.com>
References: <20241202214343.2425341-1-mac@mcrowe.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01b-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36

sp805_wdt::load_val is of type unsigned int. When the interrupt is
inactive wdt_timeleft adds one to the value, and then adds that to the
value used to calculate the time remaining. Unfortunately it's not
unlikely that load_val contains LOAD_MAX, which is 0xFFFFFFFF and wraps
to zero when one is added to it, resulting in the time left being
understated by about 21.7s. Fix this by ensuring the addition happens as
64-bit.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 drivers/watchdog/sp805_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index 109e2e37e8f0..4400c439c718 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -128,7 +128,7 @@ static unsigned int wdt_timeleft(struct watchdog_device *wdd)
 
 	/*If the interrupt is inactive then time left is WDTValue + WDTLoad. */
 	if (!(readl_relaxed(wdt->base + WDTRIS) & INT_MASK))
-		load += wdt->load_val + 1;
+		load += (u64)wdt->load_val + 1;
 	spin_unlock(&wdt->lock);
 
 	return div_u64(load, wdt->rate);
-- 
2.39.5


