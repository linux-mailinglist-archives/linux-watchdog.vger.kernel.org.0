Return-Path: <linux-watchdog+bounces-5003-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GceIpdNoWkfsAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5003-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:53:59 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E91451B4245
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCE7630C1547
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 07:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762B7355F51;
	Fri, 27 Feb 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GDsbHRps"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4511428314B
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 07:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772178775; cv=none; b=Int6q4M0cDILx4+Jo9MZtLVY+pFsHc/eSI6+YNqYSY+jk9odNOiLNxLqYcAVbotFxkdrlYkb4KC9QXNrrWsRry82e6Ft9k/0mICjyF3KI55B8jkDYs0JKFYUwSPzHGpkzRLgKjnae3Tx91QU3o/yr5ZPS7Fb26KfxNzFty0O/4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772178775; c=relaxed/simple;
	bh=t/N8FP2PTycAc9OCBe7oikzfKFx5hflAKK47VGsJjP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qm9GgPd3f8Vcqwt4iuOts5wf8rt6iMe73e/v1rqpgO2x/fnELkx4+F+sHunoNJXse8SGAui986M4CUu16UdcqB6iECmC/U2dnpFV75O6ShWDzMuYtt0Ehr5Kkr9UkXLzxaaZVYvF3GgY8k2XwuejYyU4nJlpyHuiP+KTsw2Ex8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GDsbHRps; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B17F71A199B;
	Fri, 27 Feb 2026 07:52:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76D035FE46;
	Fri, 27 Feb 2026 07:52:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 334181036921D;
	Fri, 27 Feb 2026 08:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772178770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=XeSGj5Dm4pJG5BITfxYeiMkJ31GOO56vEhVegrdik1Y=;
	b=GDsbHRpskTwbgPCwbTo43xynJyZkgTgFYfyHpCTsnpwEHZpZCegYn4WbFulSq7CjsIYAYK
	mJrzWuXbigpntKfAPj/UMVo8J+bpYYQjVnMRYUtSKdcFYeA2AoHrZ3MQ7wRLJZUYlvHE83
	VVXalmgapClSSjRbBdOTDLXJNfyYdt+1da79GtxntUpwxIEQVoaEcmX8siASRnWz4o/GZD
	4/3b2U3gJzPmfUv7oebo/n/KCI5PB/Z7QTQIPnGaquuEEuv5bnIjQEH69WjFBhRzqFmGTZ
	iLkR4odNOe2XKtAClS6o6i0258v24jEmGHC1PZwoxvdiq4hwCo/EE9M9jP/RGQ==
Date: Fri, 27 Feb 2026 08:52:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrei Simion <andrei.simion@microchip.com>
Subject: Re: [PATCH 1/3] watchdog: at91sam9_wdt.h: Cleanup the header file
Message-ID: <202602270752399219b90c@mail.local>
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
 <20260227073116.30447-2-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227073116.30447-2-balakrishnan.s@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5003-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: E91451B4245
X-Rspamd-Action: no action

On 27/02/2026 13:01:14+0530, Balakrishnan Sambath wrote:
> From: Andrei Simion <andrei.simion@microchip.com>
> 
> This patch reorganizes the header file by renaming the registers using
> a general pattern also this patch simplifies the watchdog disable logic
> in the at91sam9_wdt.h header by differentiating between modern
> (SAM9X60, SAMA7G5, SAM9X7) and legacy (SAMA5, AT91SAM9261) chips based
> on the watchdog disable bit.
> For modern chips, the disable bit is at bit 12, while for legacy chips
> it is at bit 15.
> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> [Remove Kconfig-based WDDIS selection and define explicit legacy and
> modern masks]
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  drivers/watchdog/at91sam9_wdt.h | 65 ++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index 298d545df1a1..1e0aeecb489f 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -3,59 +3,58 @@
>   * drivers/watchdog/at91sam9_wdt.h
>   *
>   * Copyright (C) 2007 Andrew Victor
>   * Copyright (C) 2007 Atmel Corporation.
>   * Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries
>   *
>   * Watchdog Timer (WDT) - System peripherals regsters.
>   * Based on AT91SAM9261 datasheet revision D.
>   * Based on SAM9X60 datasheet.
> + * Based on SAMA7G5 datasheet.
> + * Based on SAM9X75 datasheet.
>   *
>   */
>  
>  #ifndef AT91_WDT_H
>  #define AT91_WDT_H
>  
>  #include <linux/bits.h>
>  
> -#define AT91_WDT_CR		0x00			/* Watchdog Control Register */
> -#define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
> -#define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
> -
> -#define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
> -#define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
> -#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> -#define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
> -#define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
> +#define AT91_WDT_CR		0x00		/* Watchdog Control Register */
> +#define  AT91_WDT_WDRSTT	BIT(0)		/* Restart */
> +#define  AT91_WDT_KEY		(0xa5UL << 24)	/* KEY Password */
> +#define AT91_WDT_MR		0x04		/* Watchdog Mode Register */
> +#define  AT91_WDT_WDV		(0xfffUL << 0)	/* Counter Value */
>  #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> -#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
> -#define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
> -#define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
> -#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> -#define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
> -#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
> -#define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
> -#define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
> -
> +#define  AT91_WDT_WDRSTEN	BIT(13)
> +#define  AT91_WDT_WDRPROC	BIT(14)
> +#define  AT91_WDT_WDD		(0xfffUL << 16)
> +#define  AT91_WDT_WDDBGHLT	BIT(28)
> +#define  AT91_WDT_WDIDLEHLT	BIT(29)
>  #define AT91_WDT_SR		0x08		/* Watchdog Status Register */
>  #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
>  #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
>  
> -/* Watchdog Timer Value Register */
> -#define AT91_SAM9X60_VR		0x08
> +#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> +#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
>  
> -/* Watchdog Window Level Register */
> -#define AT91_SAM9X60_WLR	0x0c
> -/* Watchdog Period Value */
> -#define  AT91_SAM9X60_COUNTER	(0xfffUL << 0)
> -#define  AT91_SAM9X60_SET_COUNTER(x)	((x) & AT91_SAM9X60_COUNTER)
> +#define AT91_WDT_VR		0x08	/* Watchdog Timer Value Register */
> +#define AT91_WDT_ISR		0x1c	/* Interrupt Status Register */
> +#define AT91_WDT_IER		0x14	/* Interrupt Enable Register */
> +#define AT91_WDT_IDR		0x18	/* Interrupt Disable Register */
> +#define AT91_WDT_WLR		0x0c	/* Watchdog Window Level Register */
> +#define AT91_WDT_PERIODRST	BIT(4)	/* Period Reset */
> +#define AT91_WDT_RPTHRST	BIT(5)		/* Minimum Restart Period */
> +#define  AT91_WDT_PERINT	BIT(0)	/* Period Interrupt Enable */
> +#define  AT91_WDT_COUNTER	(0xfffUL << 0)	/* Watchdog Period Value */
> +#define  AT91_WDT_SET_COUNTER(x)	((x) & AT91_WDT_COUNTER)
>  
> -/* Interrupt Enable Register */
> -#define AT91_SAM9X60_IER	0x14
> -/* Period Interrupt Enable */
> -#define  AT91_SAM9X60_PERINT	BIT(0)
> -/* Interrupt Disable Register */
> -#define AT91_SAM9X60_IDR	0x18
> -/* Interrupt Status Register */
> -#define AT91_SAM9X60_ISR	0x1c
> +/*
> + * WDDIS bit differs by SoC:
> + *   - SAMA5, AT91SAM9261: bit 15
> + *   - SAM9X60, SAMA7G5, SAM9X75: bit 12
> + * Select at runtime via compatible string.
> + */
> +#define AT91_WDT_WDDIS_LEGACY   BIT(15)
> +#define AT91_WDT_WDDIS_MODERN   BIT(12)

This is bad naming, we are going to end up with
AT91_WDT_WDDIS_LEGACY_LEGACY, AT91_WDT_WDDIS_MODERN_LEGACY and
AT91_WDT_WDDIS_MODERN next time. The proper name would use the name of
the SoC introducing the new position.

>  
>  #endif
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

