Return-Path: <linux-watchdog+bounces-2448-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7AD9D02EE
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Nov 2024 11:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5314B1F230DF
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Nov 2024 10:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321D57581A;
	Sun, 17 Nov 2024 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="q/oTSx/2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DB46AA7
	for <linux-watchdog@vger.kernel.org>; Sun, 17 Nov 2024 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731840116; cv=none; b=awDwL2nAyoUIza/dZRQAEElB59D5sXlvNsKi5pg0KJoiUaPC56XOmNpVZlgkEa9JqSobMVrZz7afk54TdTpBOTOydANs8gWCOwisB8/QK0zsE4Qa5jDXukb6LpYhbvbGb/gvWCyH3CQ+EdAOBBOvWQv6PIuo5DpJ4L7Y5GvgsSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731840116; c=relaxed/simple;
	bh=jiaCMg4PiaVnw+plOg4wkClSh7rAZg4biQivjNYq+RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rlon9nuD9hg98Cb64IE/ftgQs+VQrdPwALLDfM7qG5iHR59stTOgoCQ/GA3kScFw1h0zVInEltuosVoYtJM5V1nmX6DrabVP+MGM1UGw2Ink8SNHuo9iQq7vXOIgpdr/1sXIk6+qC3c0QaTNLWf61wyr4jjx625BD+R+fQOj3Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=q/oTSx/2; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 431D2409E9; Sun, 17 Nov 2024 11:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 431D2409E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1731837973;
	bh=jiaCMg4PiaVnw+plOg4wkClSh7rAZg4biQivjNYq+RI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/oTSx/2n/UeOIpIfTOoyC8MXtQRLyHkc8UovNWj9iq0u554+zeOqINoMyWpYTAyo
	 wrbyMtSh3ihQruiHkh5awEb5QiBlxzdx16vYIWjMLxCUJ7bfCW1DXlW6QCyxqrbpuO
	 pGYi9e3bdeaMrM192HZAzDZ/jXMCFZGZ+XH6b1Rw=
Date: Sun, 17 Nov 2024 11:06:12 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: Patches add for v6.13-rc1 in Linux-watchdog-next
Message-ID: <20241117100612.GA31413@www.linux-watchdog.org>
References: <20241106080907.GA14713@www.linux-watchdog.org>
 <CADvTj4qg0F5772jK=B3an9=_9f6z=2y8cfcWPZOjyJzJdJRyWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4qg0F5772jK=B3an9=_9f6z=2y8cfcWPZOjyJzJdJRyWA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi James,

> On Wed, Nov 6, 2024 at 1:38 AM Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
> >
> > Hi All,
> >
> > Following patches have been added in Linux-Watchdog-Next the last days:
> > [PATCH v3] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
> > [PATCH V3] watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms using clock frequency
> > [PATCH v2] dt-bindings: watchdog: Document Qualcomm QCS615 watchdog
> > [PATCH] watchdog: ziirave_wdt: Drop explicit initialization of struct i2c_device_id::driver_data to 0
> > [PATCH v1] MAINTAINERS: Update the maintainer of StarFive watchdog driver
> > [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
> > [PATCH v2 1/2] watchdog: apple: Actually flush writes after requesting watchdog restart
> > [PATCH v2 2/2] watchdog: apple: Increase reset delay to 150ms
> > [PATCH] watchdog: armada_37xx_wdt: remove struct resource
> > [RFC PATCH 1/9] watchdog: always print when registering watchdog fails
> > [RFC PATCH 2/9] watchdog: da9055_wdt: don't print out if registering watchdog fails
> > [RFC PATCH 3/9] watchdog: gxp-wdt: don't print out if registering watchdog fails
> > [RFC PATCH 4/9] watchdog: iTCO_wdt: don't print out if registering watchdog fails
> > [RFC PATCH 5/9] watchdog: it87_wdt: don't print out if registering watchdog fails
> > [RFC PATCH 6/9] watchdog: octeon-wdt: don't print out if registering watchdog fails
> > [RFC PATCH 7/9] watchdog: rti_wdt: don't print out if registering watchdog fails
> > [RFC PATCH 8/9] watchdog: rza_wdt: don't print out if registering watchdog fails
> > [RFC PATCH 9/9] watchdog: sl28cpld_wdt: don't print out if registering watchdog fails
> > [PATCH v3 1/2] dt-bindings: watchdog: airoha: document watchdog for Airoha EN7581
> > [PATCH v3 2/2] watchdog: Add support for Airoha EN7851 watchdog
> > [PATCH] watchdog: Delete the cpu5wdt driver
> > [PATCH v2 1/2] watchdog: da9063: Do not use a global variable
> > [PATCH v2 2/2] watchdog: da9063: Remove __maybe_unused notations
> > [PATCH v3] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
> 
> This v3 patch had a bug, a v4 with a fix was posted here:
> https://lore.kernel.org/all/20241025063441.3494837-1-james.hilliard1@gmail.com/

I checked it and I indeed used "[PATCH v4] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04".

> 
> > [PATCH] watchdog: Switch back to struct platform_driver::remove()
> > [PATCH v4 4/4] watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
> > [PATCH v3 2/3] watchdog: s3c2410_wdt: add support for exynosautov920 SoC
> > [PATCH] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs"
> > [PATCH][next] docs: ABI: Fix spelling mistake in pretimeout_avaialable_governors
> > [PATCH v1 1/3] dt-bindings: watchdog: Document Qualcomm QCS8300
> > [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing 'big-endian' property
> >
> > Kind regards,
> > Wim.
> >
> >

Kind regards,
Wim.


