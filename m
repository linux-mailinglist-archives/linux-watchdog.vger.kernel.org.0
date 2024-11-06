Return-Path: <linux-watchdog+bounces-2417-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF019BE127
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 09:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7A71F24568
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 08:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94B01D79A5;
	Wed,  6 Nov 2024 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="QDMY5Ias"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8892B1D5171
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Nov 2024 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882193; cv=none; b=UEYl1qLfp0Yqq/AJBZ9AyZ16GuOLA5zFGxssjq7fMCrpxM3wVKkGlihMN/rdbzjALMaqCk8iMx6VtMkUcIPra08uozXaoY6r7dM/MwvPUryVumKssjHt6UDp7VF4zRoLENS38xAe/jVnU7Cxg18jewrgprWZI1BTFAI4ifPnP0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882193; c=relaxed/simple;
	bh=EAIRbyCqw2/wS3P03tLp0qleY32RBgs9qcUtao2s1Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YeMN/h5/WDqxDPevgj8/O4s7eYwRoRkLwxlUrjhhvcEp+OUnoPpOLi+vs/J6+aR26gFvN9w7VHZAN/FaZaO2hGUO826hnDGEyjmq+38mbwOsldO1k9q1oB8TfUhbvMmHa5VUTxXQkdVapo7v1XRcmA2ttLwChNvOZY9FMGXS8Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=QDMY5Ias; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id EEE54409F8; Wed,  6 Nov 2024 09:09:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org EEE54409F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730880548;
	bh=EAIRbyCqw2/wS3P03tLp0qleY32RBgs9qcUtao2s1Ys=;
	h=Date:From:To:Cc:Subject:From;
	b=QDMY5Ias/NBlASI5Hip1Yv1JjTUS2hMl8odPNKtFNvCRGFGtqDRBh8Y/EiNSYCEAE
	 t0KTbyo6ioStuVf4r1UAngEfq9e4RNQPI9KKCz82k7EEVJzUCZAVebGU7q3uivR9y0
	 rnmPdIXozW0k6oxAYaNbvfinRNf/P8kiRyk/ayWU=
Date: Wed, 6 Nov 2024 09:09:07 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Byoungtae Cho <bt.cho@samsung.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Fabio Estevam <festevam@denx.de>, Harini T <harini.t@amd.com>,
	James Hilliard <james.hilliard1@gmail.com>,
	Jean Delvare <jdelvare@suse.de>, lijuang <quic_lijuang@quicinc.com>,
	Marek Vasut <marex@denx.de>, Nick Chan <towinchenmi@gmail.com>,
	Oleksandr Ocheretnyi <oocheret@cisco.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rosen Penev <rosenp@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Xin Liu <quic_liuxin@quicinc.com>, Yan Zhen <yanzhen@vivo.com>
Subject: Patches add for v6.13-rc1 in Linux-watchdog-next
Message-ID: <20241106080907.GA14713@www.linux-watchdog.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi All,

Following patches have been added in Linux-Watchdog-Next the last days:
[PATCH v3] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
[PATCH V3] watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms using clock frequency
[PATCH v2] dt-bindings: watchdog: Document Qualcomm QCS615 watchdog
[PATCH] watchdog: ziirave_wdt: Drop explicit initialization of struct i2c_device_id::driver_data to 0
[PATCH v1] MAINTAINERS: Update the maintainer of StarFive watchdog driver
[PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
[PATCH v2 1/2] watchdog: apple: Actually flush writes after requesting watchdog restart
[PATCH v2 2/2] watchdog: apple: Increase reset delay to 150ms
[PATCH] watchdog: armada_37xx_wdt: remove struct resource
[RFC PATCH 1/9] watchdog: always print when registering watchdog fails
[RFC PATCH 2/9] watchdog: da9055_wdt: don't print out if registering watchdog fails
[RFC PATCH 3/9] watchdog: gxp-wdt: don't print out if registering watchdog fails
[RFC PATCH 4/9] watchdog: iTCO_wdt: don't print out if registering watchdog fails
[RFC PATCH 5/9] watchdog: it87_wdt: don't print out if registering watchdog fails
[RFC PATCH 6/9] watchdog: octeon-wdt: don't print out if registering watchdog fails
[RFC PATCH 7/9] watchdog: rti_wdt: don't print out if registering watchdog fails
[RFC PATCH 8/9] watchdog: rza_wdt: don't print out if registering watchdog fails
[RFC PATCH 9/9] watchdog: sl28cpld_wdt: don't print out if registering watchdog fails
[PATCH v3 1/2] dt-bindings: watchdog: airoha: document watchdog for Airoha EN7581
[PATCH v3 2/2] watchdog: Add support for Airoha EN7851 watchdog
[PATCH] watchdog: Delete the cpu5wdt driver
[PATCH v2 1/2] watchdog: da9063: Do not use a global variable
[PATCH v2 2/2] watchdog: da9063: Remove __maybe_unused notations
[PATCH v3] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
[PATCH] watchdog: Switch back to struct platform_driver::remove()
[PATCH v4 4/4] watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
[PATCH v3 2/3] watchdog: s3c2410_wdt: add support for exynosautov920 SoC
[PATCH] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs"
[PATCH][next] docs: ABI: Fix spelling mistake in pretimeout_avaialable_governors
[PATCH v1 1/3] dt-bindings: watchdog: Document Qualcomm QCS8300
[PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing 'big-endian' property

Kind regards,
Wim.


