Return-Path: <linux-watchdog+bounces-1549-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2B961EFF
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Aug 2024 08:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8101F24B85
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Aug 2024 06:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F361799F;
	Wed, 28 Aug 2024 06:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="CHBvSDxj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95F51BC3F
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Aug 2024 06:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824961; cv=none; b=lmNdYFaBjqmExx49LnOLilihY1RHDhUMWiIePrm8geu9dgbpuBEw1K6oe/lGCNBVVi+3xFYBaDgoJjoCZyX3VfPyBj46eyEMuIJhrLmorSPL7HIltNVtbDDQx5cqOeL8TOxBZXxNjpxvTmpEmHgDrtSMJKK2f68uYF1kDKyZpdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824961; c=relaxed/simple;
	bh=FvBT3h1Xa8I2Y3mCMfwRtWfJWu+GpEK7IXsGp0OigKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3Hk/sLjy1VTD3W5O/B/oyCBfFRBquqFzs5fx8bQaCXzSNSRidfsCl1nU81O9G7cOl+g6UZcfuzj+nNEn3s49URcmwF6yzXCsxvdmjPt3htyVP239bcsD/IglyLOTd41MxFV/roaqlp6nnjL9oj0oGPPuDCQFYm+sEcLzdaddGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=CHBvSDxj; arc=none smtp.client-ip=185.136.64.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202408280602270b1aa39bc741e954b0
        for <linux-watchdog@vger.kernel.org>;
        Wed, 28 Aug 2024 08:02:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2HKrDtu25MK5ywPsuytQgOjM2ceet9Kd7IxyYEl3hmk=;
 b=CHBvSDxjonVaQWBf9JzK+TeK++ZAg/8WjX2CF2Pta/hfND1wuTXWqncwFgaovYhN2k3tk5
 sTrolHgFkyYW/F1JNgiTukhO6nAovc8f/xG/Z9B2miYhyNQpuZEaDYFF8uUXrJC2cmzJWuDe
 SeCTqWUFGsZgRqdWkhuYhvRaIhp0cy+FtZVXZRkx2ZmJVg1+gkdEvZw/pAO4Y5t6aChWOdT9
 aoBgVmhRUKgtOoch6Nz103HeZRji4SPnWudR5uE+/1zUUZkgFXiyHas8Ud9r7Q8Vd0wCzxuf
 dcs3DNxRWrQ4ROgdgGTRvGnTAaHNnUW1IVF4g2vAZ4YPWCOQsEAIpsTg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-watchdog@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev
Subject: [PATCH] watchdog: imx_sc_wdt: detect if already running
Date: Wed, 28 Aug 2024 08:02:10 +0200
Message-ID: <20240828060212.108608-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Firmware (SC) WDT can be already enabled in U-Boot. Detect this case and
make CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED functional by setting
WDOG_HW_RUNNING.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/watchdog/imx_sc_wdt.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index e51fe1b78518..e6d567b11795 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -56,6 +56,25 @@ static int imx_sc_wdt_ping(struct watchdog_device *wdog)
 	return 0;
 }
 
+static bool imx_sc_wdt_is_running(void)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_START_WDOG,
+		      0, 0, 0, 0, 0, 0, &res);
+
+	/* Already enabled (SC_TIMER_ERR_BUSY)? */
+	if (res.a0 == SC_TIMER_ERR_BUSY)
+		return true;
+
+	/* Undo only if that was us who has (successfully) enabled the WDT */
+	if (!res.a0)
+		arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_STOP_WDOG,
+			      0, 0, 0, 0, 0, 0, &res);
+
+	return false;
+}
+
 static int imx_sc_wdt_start(struct watchdog_device *wdog)
 {
 	struct arm_smccc_res res;
@@ -183,6 +202,9 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (imx_sc_wdt_is_running())
+		set_bit(WDOG_HW_RUNNING, &wdog->status);
+
 	watchdog_stop_on_reboot(wdog);
 	watchdog_stop_on_unregister(wdog);
 
-- 
2.46.0


