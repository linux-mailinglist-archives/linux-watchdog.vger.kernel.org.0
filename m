Return-Path: <linux-watchdog+bounces-4604-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7BC64007
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 13:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9721E3475F1
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 12:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1611725785E;
	Mon, 17 Nov 2025 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="solTL/nO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6AE23BF9E
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Nov 2025 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763381481; cv=none; b=ayCd7ceLZDHatpdOioqsd9UXMBwBlBYC7xJqD6SrgcniZ5m+aN2Y0B5IRPG/kcnWK7GU3foUxspbgLBoLZa/+HAtnDeM7s+biyvSqD/0t4q8tz8b1wXlmrM+M8WtvarOZKK0FD3irPjbmQaoQJ+G4K35oALlusDI6WU0M94+SHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763381481; c=relaxed/simple;
	bh=3KKfzwPJZHVv3CS31W5BcfJkG6Sas7ghRb17V3FdaUI=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=LbXwvoUfUTsDKBsbWGALS4qqGLyocd4ikscoZRlXrHUEn2WLm871DrGz4gxCjTbWNa+fMwiCu+0gV3NMvGKjWHPrUsrVbM/YVd0EL8U0u1i8KtcstKAbEwCH5cT/C4hkG7u9QItDW+qFfgRwyzKR73yV54SeasWWD20FhVdr6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=solTL/nO; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=x10DM21PgDkJ0qJyW8UCz5IKZl3CN25FMn3GKY5qW9E=; b=s
	olTL/nOeY0BAEuMsqfFCTYS0IXzx1Xkny7Dhho1xHp+UM7ruWqKvdSxovd/k/3prWh0glZaCv95P0
	UgQt1HVc10NfFxNKlapF4ZZxTaiLM6pBOKZ5prtkCtTmQakvj9At5gM3L4ppa0I8jqISiZwEhQGn4
	LVuyeMkyhbChVUopL91cH+DrehaiKe30AcmEVw1qtKTS+UpXUXozhk/O88vCdeNDgIm04EeDrMbtc
	sy703srk/hWXuXHfbGzwy8B3vPbrbQ1dZjDqlib4ReYw7R8MsCIi5W4R7toBDQsWIa1s2h48h4QXc
	UDJGCzW/fRT2ajFKnkzgmvd11hisl2htg==;
Date: Mon, 17 Nov 2025 13:11:24 +0100 (CET)
Message-Id: <20251117.131124.1452225967649047223.rene@exactco.de>
To: linux@roeck-us.net
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v4] fix it87_wdt early reboot by reporting running timer
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

Some products, such as the Ugreen DXP4800 Plus NAS, ship with the it87
wdt enabled by the firmware and a broken BIOS option that does not
allow to change the time or turn it off. As this makes installing
Linux rather difficult, change the it87_wdt to report it running to
the watchdog core.

Signed-off-by: René Rebe <rene@exactco.de>
---
v1:
- just clear hw timer register
v2:
- detect running hw timer and report to watchdog core
v3:
- multiply TOV1 in _wdt_get_timeout
- don't wrongly and superfluously set .max_hw_heartbeat_ms
- don't call set_timeout manually
v4:
- simplify to wdt_running
- move code up to not move superio_exit

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 3b8488c86a2f..8ba7e03857ca 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -188,6 +188,12 @@ static void _wdt_update_timeout(unsigned int t)
 		superio_outb(t >> 8, WDTVALMSB);
 }
 
+/* Internal function, should be called after superio_select(GPIO) */
+static bool _wdt_running(void)
+{
+	return superio_inb(WDTVALLSB) || (max_units > 255 && superio_inb(WDTVALMSB));
+}
+
 static int wdt_update_timeout(unsigned int t)
 {
 	int ret;
@@ -374,6 +381,12 @@ static int __init it87_wdt_init(void)
 		}
 	}
 
+	/* wdt already left running by firmware? */
+	if (_wdt_running()) {
+		pr_info("Left running by firmware.\n");
+		set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
+	}
+
 	superio_exit();
 
 	if (timeout < 1 || timeout > max_units * 60) {

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactco.de | https://t2linux.com | https://rene.rebe.de

