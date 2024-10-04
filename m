Return-Path: <linux-watchdog+bounces-2081-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF207991033
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1272A1C239B7
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613141DDC05;
	Fri,  4 Oct 2024 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QGpIqVNr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8146D1ADFEA
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Oct 2024 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072228; cv=none; b=Z7+wFGLM48bryl4kSYid95flKjQr8oqjw8bxMCzsYN1aO94AoNEek6rUKOnsui1PeMjrdsfRPamDJZWANlhc6hwE4odgHFTIH64V2efsLjGIWbkWdHLS3/8Zn0TY2JyLoAzrRn+Ej1l/dIivEnaEqxZ+NqHovOBtNIq9+Jr4ZyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072228; c=relaxed/simple;
	bh=m3VCMQ/U1FEvwdKAaBIXtcP4IcR4tq5vJkX2/sMfcD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOuy9eH30ALEN8qG78D1+oS4fAbbGDvHjqr0VCCmmM048R5M+7xrfn5JilhRrqZsO+3hBWZmVii2DeAouGag4y7FU0/KQjDQJBrRq5GBdDSZBrt8s2v+o1ZC0tiXDz/1i+KdtBrML0OshkhPMqOuI6a2GUxkspM1ObJ80N4ntos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QGpIqVNr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pTdZzF/9LfC8RZByD3JQpP/YAG+/UGBGUduKxb+sEnQ=; b=QGpIqV
	NrnJUE7foMNfFuoxZJl1xMG1aJVRVLm0tcQmhFU4JqBNxVUDo6aKWgftv4TftcLS
	o0MvmRLbr6wV3pJeu78DsNvv1DBXWDuH1YDuDtKYTH5Zu/VLy8KDhzdCWNQ2h3xw
	YOos6f2+4py/41rZtEEmgNtYzBn109KHrfiYKKYvUrqkPdPSIR+U2gBcaLUrZWt4
	HgblNACc782Hsqkb/u5rCaEReGzgGpqa+7FgGxfMR34JC0HBd3mzpcCHNe0iFEFW
	S8ZXi/pkcJx0MZ5o18T1+c5AKkHMvlW2XoApwd/1rNq3+lLQ7cslav/vk5qOlUIG
	mZXN4oNEbEPadmXw==
Received: (qmail 3546701 invoked from network); 4 Oct 2024 22:03:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:44 +0200
X-UD-Smtp-Session: l3s3148p1@GuUPK6wjNOpQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 5/9] watchdog: it87_wdt: don't print out if registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:08 +0200
Message-ID: <20241004200314.5459-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core will do this already.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/it87_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 3e8c15138edd..676cd134e677 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -349,10 +349,8 @@ static int __init it87_wdt_init(void)
 
 	watchdog_stop_on_reboot(&wdt_dev);
 	rc = watchdog_register_device(&wdt_dev);
-	if (rc) {
-		pr_err("Cannot register watchdog device (err=%d)\n", rc);
+	if (rc)
 		return rc;
-	}
 
 	pr_info("Chip IT%04x revision %d initialized. timeout=%d sec (nowayout=%d testmode=%d)\n",
 		chip_type, chip_rev, timeout, nowayout, testmode);
-- 
2.45.2


