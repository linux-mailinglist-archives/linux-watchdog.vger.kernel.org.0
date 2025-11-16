Return-Path: <linux-watchdog+bounces-4594-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC9C6166D
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 14:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD30D345855
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 13:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220DA309DD2;
	Sun, 16 Nov 2025 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="GcMjOGZX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DB32E541F
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301553; cv=none; b=sqP9y2RnsIlJEpe6q9DsFqO5vyQkEGPKEOqJiNfnA3t2SvgnLvYysSVmgH3eeZFVphX0lDr5hhz6zKUaRFwjUmVdzzkKR4NTiDwLlWZrP2x4RNjN9HkQyCJdjN6sv5W5eTdgJvC8y7dcjHIsR4chaqDunlbbTn9YFCZP6KDQOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301553; c=relaxed/simple;
	bh=9zxGYXiw/jZgUkPY+tzDktmdh1ahR7Lj2+HOV3yftho=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=Dzm9StE1eddpOXLHDbPD1dMC63gd0vOT2+fTJj7DNOX0if8jsQQr87Oxs3rc9KefpQ9on2WIRyK/zzp9Appapn62Tbx+b6FLYXSi89RXd2YvJ0HwKAGfkd/4R7R6DYQlv6XV+b8VG8pkTWAsl1qqVaJtK0N8UC3pP6MoT1SKCAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=GcMjOGZX; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=CrzdwkzeAO5fRR0MyWLR080pUi7L2PA0eYD68BhANUc=; b=G
	cMjOGZX6EAkOHLKYEwjLp1/qL9tYVyS/XT8kNeAXTueCD1X4NnkMQ0/GX7sbc7B7VpdHmf/LQQzVG
	IYbxkRFxe3PsdT39KOgGZYR7hhFO6eu843ac/+g1ScLT8U8kedHs2mOcJy6YwLyHM+obefOZmf2Zl
	ABqq8GaXDoeaAK+a0Eldboo5dyFXacHRaknxrkGIY16TjdMEZLat49S+MCTAzU95tQg2HAbyOnnBu
	8YTYjaZsH23upuFkU+JIUocZ8A8RloAUAZvzWO7ygXeDwpop/Hmg+xmPJEdHtzkvZ4f7780KXkVvN
	nB8u53XsKndVK62LxXkZq9J1vVwMzX5Lw==;
Date: Sun, 16 Nov 2025 14:59:08 +0100 (CET)
Message-Id: <20251116.145908.308086523429052446.rene@exactcode.com>
To: linux@roeck-us.net
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2] fix it87_wdt early reboot w/ FW started timer
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Some products, such as the Ugreen dxp4800 plus NAS, ship with the it87
wdt enabled by the firmware and a broken BIOS option that does not
allow to change the defautl time or turn it off. This makes installing
Linux difficult and annoyingly rebooting early in an installer; unless
one loads and starts a watchdogd in the installer environment.

Change it87_wdt to report a running timer to the watchdog core using
the user supplied or module's default time and set it as the timer
might already be up and trigger soon.

Signed-off-by: René Rebe <rene@exactco.de>

--- a/drivers/watchdog/it87_wdt.c	2025-09-28 23:39:22.000000000 +0200
+++ b/drivers/watchdog/it87_wdt.c	2025-11-16 14:18:24.759115286 +0100
@@ -4,6 +4,7 @@
  *	   for ITE IT87xx Environment Control - Low Pin Count Input / Output
  *
  *	(c) Copyright 2007  Oliver Schuster <olivers137@aol.com>
+ *	(c) Copyright 2025  René Rebe <rene@exactco.de>
  *
  *	Based on softdog.c	by Alan Cox,
  *		 83977f_wdt.c	by Jose Goncalves,
@@ -188,6 +189,15 @@
 		superio_outb(t >> 8, WDTVALMSB);
 }
 
+/* Internal function, should be called after superio_select(GPIO) */
+static unsigned int _wdt_get_timeout(void)
+{
+	unsigned int ret = superio_inb(WDTVALLSB);
+	if (max_units > 255)
+		ret |= superio_inb(WDTVALMSB) << 8;
+	return ret;
+}
+
 static int wdt_update_timeout(unsigned int t)
 {
 	int ret;
@@ -292,6 +302,7 @@
 	u8 ctrl;
 	int quirks = 0;
 	int rc;
+	unsigned int _timeout;
 
 	rc = superio_enter();
 	if (rc)
@@ -374,8 +385,6 @@
 		}
 	}
 
-	superio_exit();
-
 	if (timeout < 1 || timeout > max_units * 60) {
 		timeout = DEFAULT_TIMEOUT;
 		pr_warn("Timeout value out of range, use default %d sec\n",
@@ -388,6 +397,17 @@
 	wdt_dev.timeout = timeout;
 	wdt_dev.max_timeout = max_units * 60;
 
+	/* wdt already left running by fw bios? */
+	_timeout = _wdt_get_timeout();
+	if (_timeout) {
+		pr_warn("Left running by firmware.\n");
+		wdt_dev.max_hw_heartbeat_ms = timeout * 1000;
+		set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
+		_wdt_update_timeout(timeout);
+	}
+
+	superio_exit();
+
 	watchdog_stop_on_reboot(&wdt_dev);
 	rc = watchdog_register_device(&wdt_dev);
 	if (rc)

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactcode.com | https://t2linux.com | https://rene.rebe.de

