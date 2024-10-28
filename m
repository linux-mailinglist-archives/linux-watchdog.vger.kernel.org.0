Return-Path: <linux-watchdog+bounces-2359-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D5C9B2ED8
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 12:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B77A11F21EBB
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 11:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2241D95BC;
	Mon, 28 Oct 2024 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.b="KpsqjSJg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7A41D31B8
	for <linux-watchdog@vger.kernel.org>; Mon, 28 Oct 2024 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114656; cv=none; b=lmF6EvsS3+4VGTkbB7LsDUmRYoOEzOW6WqMqI9FXRtfIhl3+4bINMf2w6USKUM0xnCFXIkN0sozcuymMfnek0+NrTI0sy8iOEbTksZQWTfsuP5n+YZwINbOdkTsYVEQ8xp7iKQsBPWr46RsDNtFkqaH3l56FrPsBHDs1vJ5gPMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114656; c=relaxed/simple;
	bh=ItHaAeA3t5zCok+910i2whs/c6mfv3/gAIB7CAL5qPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qfZoLF8L3eZ614hnVcQQqgeh8Z+98DLJmTR+iu8ZUIArIqakjSRYpVNL86thzmAp1V5r/t25BM1i1vxOjN8N06qEkUHRd29Tg3T3EMxFI6Dr/3D3r52/vjCALYTLtCM2qqYiZX5HAuBPBs/hHKjohDgNsD6HtCpUegYNFy47GTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.b=KpsqjSJg; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241028112412241af58db7736bd71c
        for <linux-watchdog@vger.kernel.org>;
        Mon, 28 Oct 2024 12:24:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=60P486yFCSDAYHWuQ7gt3t6auAm6BcPA3MNAns79R/0=;
 b=KpsqjSJgHmPb2VaxzsR3ZAijglfiQa6Pq743EGQIMQRyviHaosz8VG9MKhYelgT0hdVukr
 3oIatBbevZS9QGGxsw+AKHPv6NFP+Tf7MFO9lcHeKMktuBiYWT0vxAiWX/sFk/t6Zz8od1HL
 HFIAotWUIxCctQtb9pnQdEVDDAycBRER41S3d1NZFP6w8Kle65rA+UcoXYYqcpOD1XzsdFyi
 +IIiA1MxFM7b2ZC8eIZJZFs8WW7oY6V36WqWfnfghWLg5KvvNHZ/9vaVZNgVb4tfU0sSwQAA
 +QofxWo69tSZcO96pED+htNF6mXyhprgt1RGDhP4ZdqkW+M49qaQucjQ==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: konstantin@linuxfoundation.org,
	baocheng.su@siemens.com,
	tobias.schaffner@siemens.com,
	pavel@ucw.cz,
	lee@kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	felix.moessbauer@siemens.com,
	christian.storm@siemens.com,
	quirin.gylstorff@siemens.com,
	chao.zeng@siemens.com
Subject: [PATCH 1/1] MAINTAINERS: replace bouncing maintainers
Date: Mon, 28 Oct 2024 12:23:59 +0100
Message-Id: <20241028112359.3333152-2-benedikt.niedermayr@siemens.com>
In-Reply-To: <20241028112359.3333152-1-benedikt.niedermayr@siemens.com>
References: <20241028112359.3333152-1-benedikt.niedermayr@siemens.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

Since complaints about bouncing maintainers raised [1] we have now a
replacement for maintainers that stepped away from their duties.

[1] https://www.spinics.net/lists/platform-driver-x86/msg47105.html

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7ff3c758535..c1b39fe9e356 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20274,16 +20274,16 @@ F:	drivers/media/usb/siano/
 F:	drivers/media/usb/siano/
 
 SIEMENS IPC LED DRIVERS
-M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
-M:	Xing Tong Wu <xingtong.wu@siemens.com>
+M:	Bao Cheng Su <baocheng.su@siemens.com>
+M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
 M:	Tobias Schaffner <tobias.schaffner@siemens.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	drivers/leds/simple/
 
 SIEMENS IPC PLATFORM DRIVERS
-M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
-M:	Xing Tong Wu <xingtong.wu@siemens.com>
+M:	Bao Cheng Su <baocheng.su@siemens.com>
+M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
 M:	Tobias Schaffner <tobias.schaffner@siemens.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
@@ -20292,8 +20292,8 @@ F:	include/linux/platform_data/x86/simatic-ipc-base.h
 F:	include/linux/platform_data/x86/simatic-ipc.h
 
 SIEMENS IPC WATCHDOG DRIVERS
-M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
-M:	Xing Tong Wu <xingtong.wu@siemens.com>
+M:	Bao Cheng Su <baocheng.su@siemens.com>
+M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
 M:	Tobias Schaffner <tobias.schaffner@siemens.com>
 L:	linux-watchdog@vger.kernel.org
 S:	Maintained
-- 
2.34.1


