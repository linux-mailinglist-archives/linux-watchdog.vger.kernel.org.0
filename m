Return-Path: <linux-watchdog+bounces-4599-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24FC61C25
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 21:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3D604E0F09
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 20:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF2A23ABBD;
	Sun, 16 Nov 2025 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="FL+HQAh1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3F93B7A8
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763323755; cv=none; b=IT655+7osbNfKTKAILw1+ARSZZIY4fxjoUwKjtiIsaTzyOtjY2ykoMCqixcHYHFTj7Hk1bQiQEsjv+R2umA8CKZT8ZoxscXGc/p0WHR2mo41mz8JVHFTL8bDyItKPLmdWRJ/HdKQ8nMjnKkWEzJd5wLgUJi+sNh4Z8QGdJ32oLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763323755; c=relaxed/simple;
	bh=3CBz2/Ro9JoFLPNLzeqmh9fWNXv9kAjWxMRCZHUpyAI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oJMe5hKeYL1XVa3yoGSJNXiZqkLo8mvTJrSNYj9Eb+c3aFsALgqixfQKAsulK7fGNhcuo5Ki/IL/vbeyqtP+B7UXENwVj6P1RPz/8du/lQx7iVSJ+xouGpy0wShPv/Y0CSjjVWG0r2C2/E+fUeuV9sVfNB4WzVdmwZvVDBYHfD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=FL+HQAh1; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=v+KeuEYt13h6GFELBl3xeI7diDMAbOX/hg/pbcyLB68=; b=FL+HQAh1nmQNXCZfGZwpk3VnDv
	8wo6N31yioskqHe0XwV4ykAYyv3qoDpj6jHIeXdhTFTvrmqbXC9Uz9lN3IGmsAIJS/YaEmKDXoHKH
	8Wb18R7yageZrX0GqieHJe2QSHf8FTCjeEFw7OWl4ZFmnUpPKWa9dZNlIdX1epLUQAiaEonEPFTgT
	poIG5HyGaBDbfs5uSqaDFq4FM1EcygifG0o+RpY55q98YXVvAiuvB9bHvF0fC7OwJlyP8SKjXaOtw
	liJUgNjKvrBtvOTnRxPl3oSe8ANC95KzVMryYNAAgUuGmGKLYYWsvyVCkmROxQVsrv4sZQCIz/G/7
	3lY+L33w==;
Date: Sun, 16 Nov 2025 21:09:20 +0100 (CET)
Message-Id: <20251116.210920.587481738814327702.rene@exactco.de>
To: linux@roeck-us.net
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3] fix it87_wdt early reboot w/ FW started timer
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
References: <20251116.145908.308086523429052446.rene@exactcode.com>
	<72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Some products, such as the Ugreen DXP4800 Plus NAS, ship with the it87
wdt enabled by the firmware and a broken BIOS option that does not
allow to change the default time or turn it off. This makes installing
Linux difficult and annoyingly rebooting early in an installer; unless
one loads and starts a watchdogd in the installer environment.

Change it87_wdt to report a running timer to the watchdog core using
the user supplied or module's default time so it is reset before
triggering.

Signed-off-by: René Rebe <rene@exactco.de>

v1:
- just clear hw timer register

v2:
- detect running hw timer and report to watchdog core

v3:
- multiply TOV1 in _wdt_get_timeout
- don't wrongly and superfluously set .max_hw_heartbeat_ms
- don't call set_timeout manually

--- linux-6.17/drivers/watchdog/it87_wdt.c.orig	2025-09-28 23:39:22.000000000 +0200
+++ linux-6.17/drivers/watchdog/it87_wdt.c	2025-11-16 20:05:01.650672740 +0100
@@ -188,6 +190,21 @@
 		superio_outb(t >> 8, WDTVALMSB);
 }
 
+/* Internal function, should be called after superio_select(GPIO) */
+static unsigned int _wdt_get_timeout(void)
+{
+	unsigned int t;
+	u8 cfg;
+
+	cfg = superio_inb(WDTCFG);
+	t = superio_inb(WDTVALLSB);
+	if (max_units > 255)
+		t |= superio_inb(WDTVALMSB) << 8;
+	if (cfg & WDT_TOV1)
+		t *= 60;
+	return t;
+}
+
 static int wdt_update_timeout(unsigned int t)
 {
 	int ret;
@@ -292,6 +309,7 @@
 	u8 ctrl;
 	int quirks = 0;
 	int rc;
+	unsigned int _timeout;
 
 	rc = superio_enter();
 	if (rc)
@@ -374,8 +392,6 @@
 		}
 	}
 
-	superio_exit();
-
 	if (timeout < 1 || timeout > max_units * 60) {
 		timeout = DEFAULT_TIMEOUT;
 		pr_warn("Timeout value out of range, use default %d sec\n",
@@ -388,6 +404,15 @@
 	wdt_dev.timeout = timeout;
 	wdt_dev.max_timeout = max_units * 60;
 
+	/* wdt already left running by fw bios? */
+	_timeout = _wdt_get_timeout();
+	if (_timeout) {
+		pr_info("Left running by firmware.\n");
+		set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
+	}
+
+	superio_exit();
+
 	watchdog_stop_on_reboot(&wdt_dev);
 	rc = watchdog_register_device(&wdt_dev);
 	if (rc)

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactco.de | https://t2linux.com | https://rene.rebe.de

