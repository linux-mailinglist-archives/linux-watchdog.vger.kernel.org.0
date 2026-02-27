Return-Path: <linux-watchdog+bounces-5004-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFlhKmNQoWkfsAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5004-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 09:05:55 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2138E1B43D5
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 09:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBB9B3020EE4
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A067136C5B6;
	Fri, 27 Feb 2026 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fuwcPkNI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65202363C62
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179552; cv=none; b=r55AX8HbDGZ7yL/Q9T5Nz/n0/t1/8VmOygYRsNOtvUTo/flvpmzVT13eClieQt2u9jE3MTRLO+BjhEc72kTJ/q7WufuaKIemeN90Ss3qccoSg4gms3gcKL1avVME1zQnzAERdTwjHi+4YaibXb5wmHx7bMIIeZEcmaqFulu5p6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179552; c=relaxed/simple;
	bh=8vMlyj5+K3QHYlqiJa7cuxd5I27rINhbGwwXgU2azPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUlYSIjHOEGZwnefjPFLRcmcxRcmxSj2l130j/dbp9eVEV/zHaAyFfQX2aDIgi0BafL6If5tzoP7bcq+8QCfUTgvKHsBM7DauYNtNcEbuFvbv1oSkR5sdbYdvhTTcEVCe1obkMPNjLmZbiWp7iUuTI0idviabpZCyz+lOFfMo5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fuwcPkNI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4528B4E412D9;
	Fri, 27 Feb 2026 08:05:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2B495FE46;
	Fri, 27 Feb 2026 08:05:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53F571036921D;
	Fri, 27 Feb 2026 09:05:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772179544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mZ2lmpe/2UEZpwu4p6qAL5ErXEbZanTZJPC9VCwCH+E=;
	b=fuwcPkNINtXJwwowcYRKZTLE9TgHnHLq5ZD3195jGCTSoF/P3CwfO/fdwcS0/+d8MRJiNY
	0CHlmA+pRtKiIZZ1dmYTWk1dc8n7ct4pJ48/Ndz2+j4z9wmlgRfriqh6iqt+e7xGrIVNHe
	J9CrK2XFsctUq0UvFJTNedxDMYp7X0wt7sZReX8lUfuDBVgwlwoSf6abNaofXqrbjNxQJy
	LWYK/qKfQUqKf2D4pwDNJXqi5ImW9Df0Bn6KZhNKKj7SK9uBoMpEjQtSdSZWZygNGjRrXB
	AwzL+jt9FVMwGFz31wkaMwQG3ifnu+Nfu40PifRH2USU4lp+SnqhRAox36sIxw==
Date: Fri, 27 Feb 2026 09:05:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrei Simion <andrei.simion@microchip.com>
Subject: Re: [PATCH 2/3] watchdog: sama5d4_wdt: Refactor the driver
Message-ID: <2026022708054233bc5648@mail.local>
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
 <20260227073116.30447-3-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227073116.30447-3-balakrishnan.s@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5004-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:dkim,microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2138E1B43D5
X-Rspamd-Action: no action

On 27/02/2026 13:01:15+0530, Balakrishnan Sambath wrote:
> From: Andrei Simion <andrei.simion@microchip.com>
> 
> This patch cleans up and refactors the Atmel SAMA5D4 Watchdog Driver
> to be more readable and to fixup Reset issue introduced
> by commit 266da53c35fc ("watchdog: sama5d4: readout initial state").
> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> [Use per-device WDDIS mask and sync MR shadow WDDIS state]
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  drivers/watchdog/sama5d4_wdt.c | 156 ++++++++++++++++-----------------
>  1 file changed, 77 insertions(+), 79 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 13e72918338a..b422d0bd75f9 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -24,44 +24,58 @@
>  #define WDT_DEFAULT_TIMEOUT	MAX_WDT_TIMEOUT
>  
>  #define WDT_SEC2TICKS(s)	((s) ? (((s) << 8) - 1) : 0)
>  
>  struct sama5d4_wdt {
>  	struct watchdog_device	wdd;
>  	void __iomem		*reg_base;
>  	u32			mr;
>  	u32			ir;
> +	u32			wddis_mask;

Introducing this should simply remove the need for 3/3, use this instead
of AT91_WDT_WDDIS everywhere.

>  	unsigned long		last_ping;
>  	bool			need_irq;
> -	bool			sam9x60_support;
> +	bool			is_modern_chip;

The previous name was better.

>  };
>  
> +static inline bool wdt_enabled(struct sama5d4_wdt *wdt, u32 mr)
> +{
> +	return !(mr & wdt->wddis_mask);
> +}
> +

This is unrelated to the actual fix. This patch does to much and is
difficult to review and to backport, please separate the actual fix
about wddis and the rest.


>  static int wdt_timeout;
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  
>  module_param(wdt_timeout, int, 0);
>  MODULE_PARM_DESC(wdt_timeout,
>  	"Watchdog timeout in seconds. (default = "
>  	__MODULE_STRING(WDT_DEFAULT_TIMEOUT) ")");
>  
>  module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout,
>  	"Watchdog cannot be stopped once started (default="
>  	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> -#define wdt_enabled (!(wdt->mr & AT91_WDT_WDDIS))
>  
>  #define wdt_read(wdt, field) \
>  	readl_relaxed((wdt)->reg_base + (field))
>  
>  /* 4 slow clock periods is 4/32768 = 122.07µs*/
>  #define WDT_DELAY	usecs_to_jiffies(123)
>  
> +static bool check_is_modern_chip_by_compatible(struct device *dev)
> +{
> +	if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
> +	    of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
> +		return true;
> +
> +	return false;
> +}
> +
>  static void wdt_write(struct sama5d4_wdt *wdt, u32 field, u32 val)
>  {
>  	/*
>  	 * WDT_CR and WDT_MR must not be modified within three slow clock
>  	 * periods following a restart of the watchdog performed by a write
>  	 * access in WDT_CR.
>  	 */
>  	while (time_before(jiffies, wdt->last_ping + WDT_DELAY))
>  		usleep_range(30, 125);
> @@ -71,322 +85,306 @@ static void wdt_write(struct sama5d4_wdt *wdt, u32 field, u32 val)
>  
>  static void wdt_write_nosleep(struct sama5d4_wdt *wdt, u32 field, u32 val)
>  {
>  	if (time_before(jiffies, wdt->last_ping + WDT_DELAY))
>  		udelay(123);
>  	writel_relaxed(val, wdt->reg_base + field);
>  	wdt->last_ping = jiffies;
>  }
>  
> -static int sama5d4_wdt_start(struct watchdog_device *wdd)
> +static int wdt_start(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	if (wdt->sam9x60_support) {
> -		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IER);
> -		wdt->mr &= ~AT91_SAM9X60_WDDIS;
> -	} else {
> -		wdt->mr &= ~AT91_WDT_WDDIS;
> -	}
> +	if (wdt->is_modern_chip)
> +		writel_relaxed(wdt->ir, wdt->reg_base + AT91_WDT_IER);
> +	wdt->mr &= ~wdt->wddis_mask;
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
>  }
>  
> -static int sama5d4_wdt_stop(struct watchdog_device *wdd)
> +static int wdt_stop(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	if (wdt->sam9x60_support) {
> -		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IDR);
> -		wdt->mr |= AT91_SAM9X60_WDDIS;
> -	} else {
> -		wdt->mr |= AT91_WDT_WDDIS;
> -	}
> +	if (wdt->is_modern_chip)
> +		writel_relaxed(wdt->ir, wdt->reg_base + AT91_WDT_IDR);
> +	wdt->mr |= wdt->wddis_mask;
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
>  }
>  
> -static int sama5d4_wdt_ping(struct watchdog_device *wdd)
> +static int wdt_ping(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
>  	wdt_write(wdt, AT91_WDT_CR, AT91_WDT_KEY | AT91_WDT_WDRSTT);
>  
>  	return 0;
>  }
>  
> -static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
> -				 unsigned int timeout)
> +static int wdt_set_timeout(struct watchdog_device *wdd,
> +			   unsigned int timeout)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  	u32 value = WDT_SEC2TICKS(timeout);
>  
> -	if (wdt->sam9x60_support) {
> -		wdt_write(wdt, AT91_SAM9X60_WLR,
> -			  AT91_SAM9X60_SET_COUNTER(value));
> +	if (wdt->is_modern_chip) {
> +		wdt_write(wdt, AT91_WDT_WLR,
> +			  AT91_WDT_SET_COUNTER(value));
>  
>  		wdd->timeout = timeout;
>  		return 0;
>  	}
>  
>  	wdt->mr &= ~AT91_WDT_WDV;
>  	wdt->mr |= AT91_WDT_SET_WDV(value);
>  
>  	/*
>  	 * WDDIS has to be 0 when updating WDD/WDV. The datasheet states: When
>  	 * setting the WDDIS bit, and while it is set, the fields WDV and WDD
>  	 * must not be modified.
>  	 * If the watchdog is enabled, then the timeout can be updated. Else,
>  	 * wait that the user enables it.
>  	 */
> -	if (wdt_enabled)
> -		wdt_write(wdt, AT91_WDT_MR, wdt->mr & ~AT91_WDT_WDDIS);
> +	if (wdt_enabled(wdt, wdt->mr))
> +		wdt_write(wdt, AT91_WDT_MR, wdt->mr & ~wdt->wddis_mask);
>  
>  	wdd->timeout = timeout;
>  
>  	return 0;
>  }
>  
>  static const struct watchdog_info sama5d4_wdt_info = {
>  	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
>  	.identity = "Atmel SAMA5D4 Watchdog",
>  };
>  
>  static const struct watchdog_ops sama5d4_wdt_ops = {
>  	.owner = THIS_MODULE,
> -	.start = sama5d4_wdt_start,
> -	.stop = sama5d4_wdt_stop,
> -	.ping = sama5d4_wdt_ping,
> -	.set_timeout = sama5d4_wdt_set_timeout,
> +	.start = wdt_start,
> +	.stop = wdt_stop,
> +	.ping = wdt_ping,
> +	.set_timeout = wdt_set_timeout,
>  };
>  
> -static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
> +static irqreturn_t wdt_irq_handler(int irq, void *dev_id)
>  {
>  	struct sama5d4_wdt *wdt = platform_get_drvdata(dev_id);
>  	u32 reg;
>  
> -	if (wdt->sam9x60_support)
> -		reg = wdt_read(wdt, AT91_SAM9X60_ISR);
> +	if (wdt->is_modern_chip)
> +		reg = wdt_read(wdt, AT91_WDT_ISR);
>  	else
>  		reg = wdt_read(wdt, AT91_WDT_SR);
>  
>  	if (reg) {
>  		pr_crit("Atmel Watchdog Software Reset\n");
>  		emergency_restart();
>  		pr_crit("Reboot didn't succeed\n");
>  	}
>  
>  	return IRQ_HANDLED;
>  }
>  
> -static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
> +static int of_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
>  {
>  	const char *tmp;
>  
> -	if (wdt->sam9x60_support)
> -		wdt->mr = AT91_SAM9X60_WDDIS;
> -	else
> -		wdt->mr = AT91_WDT_WDDIS;
> +	wdt->mr = wdt->wddis_mask;
>  
>  	if (!of_property_read_string(np, "atmel,watchdog-type", &tmp) &&
>  	    !strcmp(tmp, "software"))
>  		wdt->need_irq = true;
>  
>  	if (of_property_read_bool(np, "atmel,idle-halt"))
>  		wdt->mr |= AT91_WDT_WDIDLEHLT;
>  
>  	if (of_property_read_bool(np, "atmel,dbg-halt"))
>  		wdt->mr |= AT91_WDT_WDDBGHLT;
>  
>  	return 0;
>  }
>  
> -static int sama5d4_wdt_init(struct sama5d4_wdt *wdt)
> +static int wdt_init(struct sama5d4_wdt *wdt)
>  {
> +	struct watchdog_device *wdd = &wdt->wdd;
>  	u32 reg, val;
>  
>  	val = WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT);
> +
>  	/*
>  	 * When booting and resuming, the bootloader may have changed the
>  	 * watchdog configuration.
> -	 * If the watchdog is already running, we can safely update it.
> -	 * Else, we have to disable it properly.
> +	 * If the watchdog is not running, we need to disable it properly.
> +	 * Otherwise, we can safely update it.
>  	 */
> -	if (!wdt_enabled) {
> -		reg = wdt_read(wdt, AT91_WDT_MR);
> -		if (wdt->sam9x60_support && (!(reg & AT91_SAM9X60_WDDIS)))
> -			wdt_write_nosleep(wdt, AT91_WDT_MR,
> -					  reg | AT91_SAM9X60_WDDIS);
> -		else if (!wdt->sam9x60_support &&
> -			 (!(reg & AT91_WDT_WDDIS)))
> -			wdt_write_nosleep(wdt, AT91_WDT_MR,
> -					  reg | AT91_WDT_WDDIS);
> +	reg = wdt_read(wdt, AT91_WDT_MR);
> +	if (wdt_enabled(wdt, reg)) {
> +		wdt->mr &= ~wdt->wddis_mask;
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +	} else {
> +		wdt->mr |= wdt->wddis_mask;
>  	}
>  
> -	if (wdt->sam9x60_support) {
> +	if (wdt->is_modern_chip) {
>  		if (wdt->need_irq)
> -			wdt->ir = AT91_SAM9X60_PERINT;
> +			wdt->ir = AT91_WDT_PERINT;
>  		else
> -			wdt->mr |= AT91_SAM9X60_PERIODRST;
> +			wdt->mr |= AT91_WDT_PERIODRST;
>  
> -		wdt_write(wdt, AT91_SAM9X60_IER, wdt->ir);
> -		wdt_write(wdt, AT91_SAM9X60_WLR, AT91_SAM9X60_SET_COUNTER(val));
> +		wdt_write(wdt, AT91_WDT_IER, wdt->ir);
> +		wdt_write(wdt, AT91_WDT_WLR, AT91_WDT_SET_COUNTER(val));
>  	} else {
>  		wdt->mr |= AT91_WDT_SET_WDD(WDT_SEC2TICKS(MAX_WDT_TIMEOUT));
>  		wdt->mr |= AT91_WDT_SET_WDV(val);
>  
>  		if (wdt->need_irq)
>  			wdt->mr |= AT91_WDT_WDFIEN;
>  		else
>  			wdt->mr |= AT91_WDT_WDRSTEN;
>  	}
>  
>  	wdt_write_nosleep(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
>  }
>  
> -static int sama5d4_wdt_probe(struct platform_device *pdev)
> +static int wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct watchdog_device *wdd;
>  	struct sama5d4_wdt *wdt;
>  	void __iomem *regs;
>  	u32 irq = 0;
> -	u32 reg;
>  	int ret;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>  	if (!wdt)
>  		return -ENOMEM;
>  
>  	wdd = &wdt->wdd;
>  	wdd->timeout = WDT_DEFAULT_TIMEOUT;
>  	wdd->info = &sama5d4_wdt_info;
>  	wdd->ops = &sama5d4_wdt_ops;
>  	wdd->min_timeout = MIN_WDT_TIMEOUT;
>  	wdd->max_timeout = MAX_WDT_TIMEOUT;
>  	wdt->last_ping = jiffies;
> -
> -	if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
> -	    of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
> -		wdt->sam9x60_support = true;
> +	wdt->is_modern_chip = check_is_modern_chip_by_compatible(dev);
> +	if (wdt->is_modern_chip)
> +		wdt->wddis_mask = AT91_WDT_WDDIS_MODERN;
> +	else
> +		wdt->wddis_mask = AT91_WDT_WDDIS_LEGACY;
>  
>  	watchdog_set_drvdata(wdd, wdt);
>  
>  	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
>  
>  	wdt->reg_base = regs;
>  
> -	ret = of_sama5d4_wdt_init(dev->of_node, wdt);
> +	ret = of_wdt_init(dev->of_node, wdt);
>  	if (ret)
>  		return ret;
>  
>  	if (wdt->need_irq) {
>  		irq = irq_of_parse_and_map(dev->of_node, 0);
>  		if (!irq) {
>  			dev_warn(dev, "failed to get IRQ from DT\n");
>  			wdt->need_irq = false;
>  		}
>  	}
>  
>  	if (wdt->need_irq) {
> -		ret = devm_request_irq(dev, irq, sama5d4_wdt_irq_handler,
> +		ret = devm_request_irq(dev, irq, wdt_irq_handler,
>  				       IRQF_SHARED | IRQF_IRQPOLL |
>  				       IRQF_NO_SUSPEND, pdev->name, pdev);
>  		if (ret) {
>  			dev_err(dev, "cannot register interrupt handler\n");
>  			return ret;
>  		}
>  	}
>  
>  	watchdog_init_timeout(wdd, wdt_timeout, dev);
>  
> -	reg = wdt_read(wdt, AT91_WDT_MR);
> -	if (!(reg & AT91_WDT_WDDIS)) {
> -		wdt->mr &= ~AT91_WDT_WDDIS;
> -		set_bit(WDOG_HW_RUNNING, &wdd->status);
> -	}
> -
> -	ret = sama5d4_wdt_init(wdt);
> +	ret = wdt_init(wdt);
>  	if (ret)
>  		return ret;
>  
>  	watchdog_set_nowayout(wdd, nowayout);
>  
>  	watchdog_stop_on_unregister(wdd);
>  	ret = devm_watchdog_register_device(dev, wdd);
>  	if (ret)
>  		return ret;
>  
>  	platform_set_drvdata(pdev, wdt);
>  
>  	dev_info(dev, "initialized (timeout = %d sec, nowayout = %d)\n",
>  		 wdd->timeout, nowayout);
>  
>  	return 0;
>  }
>  
> -static const struct of_device_id sama5d4_wdt_of_match[] = {
> +static const struct of_device_id wdt_of_match[] = {
>  	{
>  		.compatible = "atmel,sama5d4-wdt",
>  	},
>  	{
>  		.compatible = "microchip,sam9x60-wdt",
>  	},
>  	{
>  		.compatible = "microchip,sama7g5-wdt",
>  	},
>  
>  	{ }
>  };
> -MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
> +MODULE_DEVICE_TABLE(of, wdt_of_match);
>  
> -static int sama5d4_wdt_suspend_late(struct device *dev)
> +static int wdt_suspend_late(struct device *dev)
>  {
>  	struct sama5d4_wdt *wdt = dev_get_drvdata(dev);
>  
>  	if (watchdog_active(&wdt->wdd))
> -		sama5d4_wdt_stop(&wdt->wdd);
> +		wdt_stop(&wdt->wdd);
>  
>  	return 0;
>  }
>  
> -static int sama5d4_wdt_resume_early(struct device *dev)
> +static int wdt_resume_early(struct device *dev)
>  {
>  	struct sama5d4_wdt *wdt = dev_get_drvdata(dev);
>  
>  	/*
>  	 * FIXME: writing MR also pings the watchdog which may not be desired.
>  	 * This should only be done when the registers are lost on suspend but
>  	 * there is no way to get this information right now.
>  	 */
> -	sama5d4_wdt_init(wdt);
> +	wdt_init(wdt);
>  
>  	if (watchdog_active(&wdt->wdd))
> -		sama5d4_wdt_start(&wdt->wdd);
> +		wdt_start(&wdt->wdd);
>  
>  	return 0;
>  }
>  
>  static const struct dev_pm_ops sama5d4_wdt_pm_ops = {
> -	LATE_SYSTEM_SLEEP_PM_OPS(sama5d4_wdt_suspend_late,
> -				 sama5d4_wdt_resume_early)
> +	LATE_SYSTEM_SLEEP_PM_OPS(wdt_suspend_late,
> +				 wdt_resume_early)
>  };
>  
>  static struct platform_driver sama5d4_wdt_driver = {
> -	.probe		= sama5d4_wdt_probe,
> +	.probe		= wdt_probe,
>  	.driver		= {
>  		.name	= "sama5d4_wdt",
>  		.pm	= pm_sleep_ptr(&sama5d4_wdt_pm_ops),
> -		.of_match_table = sama5d4_wdt_of_match,
> +		.of_match_table = wdt_of_match,
>  	}
>  };
>  module_platform_driver(sama5d4_wdt_driver);
>  
>  MODULE_AUTHOR("Atmel Corporation");
>  MODULE_DESCRIPTION("Atmel SAMA5D4 Watchdog Timer driver");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

