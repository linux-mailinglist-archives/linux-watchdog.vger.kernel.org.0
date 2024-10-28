Return-Path: <linux-watchdog+bounces-2358-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B39B2EC3
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 12:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BA171C21CA0
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 11:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33BD42A82;
	Mon, 28 Oct 2024 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.b="YK1ouhSF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0D1D3648
	for <linux-watchdog@vger.kernel.org>; Mon, 28 Oct 2024 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114413; cv=none; b=pYu7mR24jFCgUNTTOwVcq27dvbnIF6Uo9HdphYD1aF+FDHQOF1Ck0qtIyRcPjHCa3tZcsG36VIkzomWhwbVqvOnSywQm97tcbAHWq9d5kFejlWB7QftUQxch5tOWN/DU16tVVcXfAzf6UUfllnqL/moHEN+tvrVpvHeFCT3CTts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114413; c=relaxed/simple;
	bh=ItHaAeA3t5zCok+910i2whs/c6mfv3/gAIB7CAL5qPA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NY87xvm9cBVga1R3uUk1zviZoYWrwf+EM5VJk4zX2uGlPOow1buO6gT3mN3k3dBKAs2iJ++izPlKx5Rzz2nIBMxgR9l2uv8rK3hYa+ELolx21s+TQPKo+HjLccqP538WNrvfq6PBxETf9Bv83/DXuU6DIWjO1O4FpPNfYjGhizM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.b=YK1ouhSF; arc=none smtp.client-ip=185.136.65.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20241028112000e9745799d9bed13ee9
        for <linux-watchdog@vger.kernel.org>;
        Mon, 28 Oct 2024 12:20:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=60P486yFCSDAYHWuQ7gt3t6auAm6BcPA3MNAns79R/0=;
 b=YK1ouhSFLNLqqTW2fxklzWXfUPXW6WWP7sCIfzUlA3d+qiFLSm3fJ0JDgA+R4MmYg/rJr7
 PHBINPLLzfLHSbYmQQUlRECx3g/M8f7mg7i+zN1MiGRnebNujoviOwQyyQCprRTcRcC5Xley
 lC9lF0Ri+LApX4lzHx61LSf8pJFEyilMMW36/fWqClavSWbxUZy+OcyP/xTL1Sz2O0Yx2jKB
 kUo311ngSIz9PGkYyD2iUhhtZWcyAaYqhjvQim8tBAvpNoCUOhiP65Q7NPYFYoGexcl1xhQ1
 fpgZEnXOwImq51tqbrASeZ0MFLcMWEoLUFJ6sMEGO0G1G7zcN/w1mTqA==;
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
Date: Mon, 28 Oct 2024 12:19:53 +0100
Message-Id: <20241028111953.3329169-2-benedikt.niedermayr@siemens.com>
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


