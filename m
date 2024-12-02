Return-Path: <linux-watchdog+bounces-2494-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0229E0EA8
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2024 23:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CFC7165739
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2024 22:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B84E1DF258;
	Mon,  2 Dec 2024 22:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mcrowe.com header.i=@mcrowe.com header.b="l/EcvVXG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from queue02b.mail.zen.net.uk (queue02b.mail.zen.net.uk [212.23.3.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C58F1DFE07
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Dec 2024 22:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.23.3.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177242; cv=none; b=R24uzIpjCnvDkC3QGwGpETwO1rHSUUzrUXUX1ln3w4aMWLEjc6/DK/QWIjYSMoy+T5KSybCVaGI+v8iX8q5pAwgYC31q79CFEZgFUApq5C5jIRzKWavMX7seSyFOZNVJBxtD5GDbAb/JTKa74H84x8hd52Eb5JzOUp9hZ6TpNyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177242; c=relaxed/simple;
	bh=ANgOaaB5evWcyStH20IzajaBMr7eASk7lW8oHAKxIu4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kE4fL2JCtor07ehfoianub1R7gi3+SU/L8WDJjB7MhZINkrEtva/pgRQe3RILWr6bCkoU/9hnZQA+Q7/4Cjsr5P3Mjuq6C3CVOQEHylyWpapA/8Zb81RvMxpmX57eHTsanVaRyCJcYZbEFRRgT5QeLrASKgFcxUhgiT3gLu9Af0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mcrowe.com; spf=pass smtp.mailfrom=mcrowe.com; dkim=pass (2048-bit key) header.d=mcrowe.com header.i=@mcrowe.com header.b=l/EcvVXG; arc=none smtp.client-ip=212.23.3.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mcrowe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcrowe.com
Received: from [212.23.1.3] (helo=smarthost01b.sbp.mail.zen.net.uk)
	by queue02b.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1tIEJR-00BWR2-4t
	for linux-watchdog@vger.kernel.org;
	Mon, 02 Dec 2024 21:50:37 +0000
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01b.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1tIEJ0-006FeA-PS;
	Mon, 02 Dec 2024 21:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=ZI96kc5+o0P4e1+f8budvLpcjsxYFm6/Qrl7PwW8uZs=; b=l/
	EcvVXGu/FBUh4XK1QbpD0M0kfKQazpOcVd6dTc8GAs9pJ1I+sH9o0C6sXKmT1Xx6z1tG6wvwl1acu
	9zFIHVN6BhP/Ykk+dNsxXOhPE4UyQHvwoxdZx5Y2rhTCtAOAEtCf52yPqktLRxQxqTfhZT9xokFhF
	Bm0v3cywW+HFd3ljWgIc3R7NdIKxSXaP8Job2TWbGO+8dZ/srBINTjU0WyyJSiSr4ln/kE7qchllE
	wllpJVKCTkl8GRrFGY8QiEIMFx+XL8IW4yn20IutPGPne4m6ZKIUvnU9uakpNApkgSF8FuUtl+8XN
	nhCOr5cIpztPIeDM18zmyhdUaIoEhRgw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1tIEJ9-002x7f-0g;
	Mon, 02 Dec 2024 21:50:19 +0000
From: Mike Crowe <mac@mcrowe.com>
To: linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] watchdog: sp805: Report correct timeleft at maximum
Date: Mon,  2 Dec 2024 21:43:43 +0000
Message-Id: <20241202214343.2425341-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.5
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
understated by about 21.7s.

It would be possible to widen load_val to 64-bit, or cast the value
before adding it, but it's easy to just cap the value one tick lower at
0xFFFFFFFE so that the addition is guaranteed to succeed. Add a
static_assert to ensure this remains true.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 drivers/watchdog/sp805_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Of course a simple cast to u64 would work just as well. Please let me
know if you'd like me to fix this in a different way.

diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index 109e2e37e8f0..1f9a7001d0d6 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -39,7 +39,7 @@
 /* watchdog register offsets and masks */
 #define WDTLOAD			0x000
 	#define LOAD_MIN	0x00000001
-	#define LOAD_MAX	0xFFFFFFFF
+	#define LOAD_MAX	0xFFFFFFFE
 #define WDTVALUE		0x004
 #define WDTCONTROL		0x008
 	/* control register masks */
@@ -127,8 +127,10 @@ static unsigned int wdt_timeleft(struct watchdog_device *wdd)
 	load = readl_relaxed(wdt->base + WDTVALUE);
 
 	/*If the interrupt is inactive then time left is WDTValue + WDTLoad. */
-	if (!(readl_relaxed(wdt->base + WDTRIS) & INT_MASK))
+	if (!(readl_relaxed(wdt->base + WDTRIS) & INT_MASK)) {
+		static_assert((__typeof__(wdt->load_val))LOAD_MAX + 1 != 0);
 		load += wdt->load_val + 1;
+	}
 	spin_unlock(&wdt->lock);
 
 	return div_u64(load, wdt->rate);
-- 
2.39.5


