Return-Path: <linux-watchdog+bounces-2083-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7258991036
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BEC1281ED7
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990131ADFE1;
	Fri,  4 Oct 2024 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WiCHI4k2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B21DDA3D
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Oct 2024 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072229; cv=none; b=frl7kMC9cZajpHNZoKoHZxeX7u1x7XQ6pAp2Ng11RJpeGG5SX7MjZc/8oBlti5NiIdEJFAtJpQ34GzcsX88S7TJuj2oQrEVAKZ7vYrdHKkZVfGT6nn3BWAcjf2B0gHQ3sk4MQuBE6kboyr3EMKEYnnEq+NZV81u90tvRsrpNySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072229; c=relaxed/simple;
	bh=GGpzR4li786PN5PUE3f4cZLEni1LVNkbHAKggrlJcDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJGVSosDAWi+mrry7gygSi3Gh8Z+V5Vg52HHkFf38r7p+dU7EOOK2vgxlR4iPo46rxfS3B/Oq8xKNtX8Mikqzxqw0e3uuhMLFycEWZbosxNNDR81mBnsTfAp10GnxXOGmVOkgvoh3j4YjWk/qfzBuetZamrCHjUxPYSUzZG9uSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WiCHI4k2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pdDyDAZIh0KmjP6JAW4l4+Vl1dTUdRC71wOIAK0OA3Q=; b=WiCHI4
	k21NLRaEIjgPWrNJB9hMmXVqYlzcdVJehG75RpSPFXTQGOvUVkan7dorV1emLBg1
	u2UYQLzarxmD9sInwAAgLg2DDOier7p2iCcDJmoHVLsEwYzi3JKSk5+5BRZEPHjS
	euf2hbhOTmT5txeArXgjQ/BDQqvz0krIZcwmMKOEk7CYlk7XMxKTgAM7vIR0Ia+C
	3wohO6T8vSdlOTvZFwaItHwhfOFXsGjzJ3yFA2+oQnrrofEDKOqLFuQe6++UQvSL
	gTvMI/RYtVbbkCp9gsw40Nfr9Qlsp8qGAollkes6sXhMZIKtEUQvZlySvkWY6gPM
	uWMVTplS8xKknx9Q==
Received: (qmail 3546758 invoked from network); 4 Oct 2024 22:03:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:45 +0200
X-UD-Smtp-Session: l3s3148p1@QognK6wjQOpQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 7/9] watchdog: rti_wdt: don't print out if registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:10 +0200
Message-ID: <20241004200314.5459-8-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/rti_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 4895a69015a8..e319fa0787c2 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -336,10 +336,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	watchdog_init_timeout(wdd, heartbeat, dev);
 
 	ret = watchdog_register_device(wdd);
-	if (ret) {
-		dev_err(dev, "cannot register watchdog device\n");
+	if (ret)
 		goto err_iomap;
-	}
 
 	if (last_ping)
 		watchdog_set_last_hw_keepalive(wdd, last_ping);
-- 
2.45.2


