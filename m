Return-Path: <linux-watchdog+bounces-5039-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMzlN8SfpWl5CwAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5039-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 15:33:40 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC4C1DAE90
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 15:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D432E3030D8F
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 14:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAEA3FD145;
	Mon,  2 Mar 2026 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2mj8G7QZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1FB3E0C45
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Mar 2026 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461957; cv=none; b=JzwI6pNscuL54t8UJzEggHygx1kTseOnq2TZ0Ly3UYNw3+IbaCJCvP9XovXiMCfeNnDIBxJ+87VnQOs0YjpUzVyYSWd40OySOdWhBnJhzQEId98QgmcsIw9agnGB6kH7qh2XASyRRvw99Z6PK38n5WeMl5lFu20ZTks1Fn/pSCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461957; c=relaxed/simple;
	bh=6WyqfHBuB48/Zu6WDENi9GsDVaA6jgcqLjEH19+GGaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEhFy1j9ostXTp3ZVYRZLNwX3iq6L6t5DAXU7ZOO60UlaC2bZST2y4prG6DXO9KpgwOoZDc8D5Dh7dNCYW3tWnN9ALiTqouIC1PYL9mnG/rFCWcMj+U6tyQSrU5AkWEpcTpjwWAzKK53ZsnO3iQyLFkr8BO7PFsBAxHi26QOROw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2mj8G7QZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E9A2C40F8F;
	Mon,  2 Mar 2026 14:32:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64BED5FE89;
	Mon,  2 Mar 2026 14:32:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B6341036957C;
	Mon,  2 Mar 2026 15:32:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772461953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zfGNkbKgTG/J+johr+2sZrHoxOYXdblvBYXU1VNSY1A=;
	b=2mj8G7QZHcfaxNjWN4ntfTgZIkLlG7iz0c/GowqvqEXEArJITWKXJVwQEdJQZT69bAhG4K
	JLr3p+0UvmXjqU18OkX2RWhdbWabjTIFR5jfEc3QqV3Z6mddZmtxO+3BAanuOHb2Oh3YMx
	Fif4mPQikIjaCeUrBRjjWyg++xITXl3MD2VCVbIgmF119N+qLqU5ynPMnbFNFQi7CJHDzm
	R5MN7xvFMfo7+Ayp46xfjU4n+eKl0tpCyGfLTCF3wM3rezDGUu8I27m8kV/zgqcS6s1wuW
	/QYHEqUcfq8KiuTXXj97kyDM4YXbAqGHXFs1nqOuxmBJJZqBRad5Z82TOtyBXQ==
Date: Mon, 2 Mar 2026 15:32:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net, andrei.simion@microchip.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 2/2] watchdog: at91sam9_wdt.h: Document WDDIS bit
 position per SoC family
Message-ID: <20260302143231d1fcff60@mail.local>
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
 <20260302113310.133989-3-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302113310.133989-3-balakrishnan.s@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 8FC4C1DAE90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5039-lists,linux-watchdog=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 02/03/2026 17:03:10+0530, Balakrishnan Sambath wrote:
> AT91_WDT_WDDIS (bit 15) applies to SAMA5/AT91SAM9261 and
> AT91_SAM9X60_WDDIS (bit 12) to SAM9X60/SAMA7G5/SAM9X75. Update
> comments to reflect this and add SAMA7G5 and SAM9X75 datasheet
> references to the file header.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/watchdog/at91sam9_wdt.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index 298d545df1a1..2020694f8f6f 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -3,40 +3,42 @@
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
>  #define AT91_WDT_CR		0x00			/* Watchdog Control Register */
>  #define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
>  #define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
>  
>  #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
>  #define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
>  #define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
>  #define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
>  #define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
>  #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> -#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
> +#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable (SAM9X60, SAMA7G5, SAM9X75) */
>  #define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
>  #define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
> -#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> +#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable (SAMA5, AT91SAM9261) */
>  #define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
>  #define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
>  #define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
>  #define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
>  
>  #define AT91_WDT_SR		0x08		/* Watchdog Status Register */
>  #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
>  #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
>  
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

