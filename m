Return-Path: <linux-watchdog+bounces-5038-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDKHA7ufpWl7CwAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5038-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 15:33:31 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E60641DAE71
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 15:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC1493026907
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 14:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9286401483;
	Mon,  2 Mar 2026 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CI9pZs5T"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7003FFAB6
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Mar 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461948; cv=none; b=sNRKN+ca0/uxNoiKUoVid8laYD54HW6s2+PIfl2sdnAbl5hObCh9u78Mu/M/ZRQbVVOHMoKLEiNbe/olrZwvs3vfWZhNFkdyCgOnza/pmfo/P6a3fbBMgYvKE2O0pEGy8KnEKM4xaScPGmoL24yLToAhxvWUXysA75yR5RK9jK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461948; c=relaxed/simple;
	bh=EJKmjh4ykcryDz5QJhfaGfhHI9qUMrWAnwPGjs3WXc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6G07LFALDTf8BbnTxn/f4rroZIgadcTw1NCEhj5pXpa49BraG2m8Ht0YmdN9MDdGLPZld0DwvUyV0tRvlPKQ3ZZ58JfHuURxsKndDLgZfqoJwKS9diITmohXFqqMP1lDHoY1rFvfFvxQIUatI+bg25WnfA84OrH/QxmIAr37Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CI9pZs5T; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 61D1B1A1F34;
	Mon,  2 Mar 2026 14:32:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 355495FE89;
	Mon,  2 Mar 2026 14:32:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 495681036957F;
	Mon,  2 Mar 2026 15:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772461940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=crFdN56rHBOSnUuDgnkJFYDo/gXmmtU8J/jgcFR9SXo=;
	b=CI9pZs5TE1aVKq8tU8SQq5Jz4KyuJAFCyhf7y6ExAE/HaXjb0mbX1jscduPmv+9867GhfA
	4AyrBPw6BBBksk2WczzTcYVKFRWCuXikDgG6AjwACOLhITCi+jrBzMwCjSf+J1nlGbIKcg
	ltMeiBZZVcpY79thkEWxvdxfUfeK1N7e+OnktmKhXEaTKJVpY/YZN2g90rWBVFnoOUz1b+
	Nwf8sBDWRqKGjov8bA7Zj9F/OnhJK0NPXT7FlcdTim6fCv9vJZuN1Ey/DLxqCQViMnknEg
	xiMt1pNrpZBfN8xx198fuiWTUIEqW1S/4n0OsHRwpZ+Cn7IwHi7GTQQUd6OQnw==
Date: Mon, 2 Mar 2026 15:32:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net, andrei.simion@microchip.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: Re: [PATCH 1/2] watchdog: sama5d4_wdt: Fix WDDIS detection on
 SAM9X60 and SAMA7G5
Message-ID: <202603021432151ded59a4@mail.local>
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
 <20260302113310.133989-2-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302113310.133989-2-balakrishnan.s@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: E60641DAE71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5038-lists,linux-watchdog=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 02/03/2026 17:03:09+0530, Balakrishnan Sambath wrote:
> The driver hardcoded AT91_WDT_WDDIS (bit 15) in wdt_enabled and the
> probe initial state readout. SAM9X60 and SAMA7G5 use bit 12
> (AT91_SAM9X60_WDDIS), causing incorrect WDDIS detection.
> 
> Introduce a per-device wddis_mask field to select the correct WDDIS
> bit based on the compatible string.
> 
> Fixes: 266da53c35fc ("watchdog: sama5d4: readout initial state")
> Co-developed-by: Andrei Simion <andrei.simion@microchip.com>
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/watchdog/sama5d4_wdt.c | 48 +++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 13e72918338a..704b786cc2ec 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -24,37 +24,41 @@
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
>  	unsigned long		last_ping;
>  	bool			need_irq;
>  	bool			sam9x60_support;
>  };
>  
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
> +static inline bool wdt_enabled(struct sama5d4_wdt *wdt)
> +{
> +	return !(wdt->mr & wdt->wddis_mask);
> +}
>  
>  #define wdt_read(wdt, field) \
>  	readl_relaxed((wdt)->reg_base + (field))
>  
>  /* 4 slow clock periods is 4/32768 = 122.07µs*/
>  #define WDT_DELAY	usecs_to_jiffies(123)
>  
>  static void wdt_write(struct sama5d4_wdt *wdt, u32 field, u32 val)
>  {
> @@ -75,55 +79,49 @@ static void wdt_write_nosleep(struct sama5d4_wdt *wdt, u32 field, u32 val)
>  		udelay(123);
>  	writel_relaxed(val, wdt->reg_base + field);
>  	wdt->last_ping = jiffies;
>  }
>  
>  static int sama5d4_wdt_start(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	if (wdt->sam9x60_support) {
> +	if (wdt->sam9x60_support)
>  		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IER);
> -		wdt->mr &= ~AT91_SAM9X60_WDDIS;
> -	} else {
> -		wdt->mr &= ~AT91_WDT_WDDIS;
> -	}
> +	wdt->mr &= ~wdt->wddis_mask;
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
>  }
>  
>  static int sama5d4_wdt_stop(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	if (wdt->sam9x60_support) {
> +	if (wdt->sam9x60_support)
>  		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IDR);
> -		wdt->mr |= AT91_SAM9X60_WDDIS;
> -	} else {
> -		wdt->mr |= AT91_WDT_WDDIS;
> -	}
> +	wdt->mr |= wdt->wddis_mask;
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
>  }
>  
>  static int sama5d4_wdt_ping(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
>  	wdt_write(wdt, AT91_WDT_CR, AT91_WDT_KEY | AT91_WDT_WDRSTT);
>  
>  	return 0;
>  }
>  
>  static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
> -				 unsigned int timeout)
> +				    unsigned int timeout)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  	u32 value = WDT_SEC2TICKS(timeout);
>  
>  	if (wdt->sam9x60_support) {
>  		wdt_write(wdt, AT91_SAM9X60_WLR,
>  			  AT91_SAM9X60_SET_COUNTER(value));
>  
>  		wdd->timeout = timeout;
> @@ -134,20 +132,20 @@ static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
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
> +	if (wdt_enabled(wdt))
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
> @@ -178,22 +176,19 @@ static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
>  	}
>  
>  	return IRQ_HANDLED;
>  }
>  
>  static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
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
> @@ -207,27 +202,23 @@ static int sama5d4_wdt_init(struct sama5d4_wdt *wdt)
>  	u32 reg, val;
>  
>  	val = WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT);
>  	/*
>  	 * When booting and resuming, the bootloader may have changed the
>  	 * watchdog configuration.
>  	 * If the watchdog is already running, we can safely update it.
>  	 * Else, we have to disable it properly.
>  	 */
> -	if (!wdt_enabled) {
> +	if (!wdt_enabled(wdt)) {
>  		reg = wdt_read(wdt, AT91_WDT_MR);
> -		if (wdt->sam9x60_support && (!(reg & AT91_SAM9X60_WDDIS)))
> -			wdt_write_nosleep(wdt, AT91_WDT_MR,
> -					  reg | AT91_SAM9X60_WDDIS);
> -		else if (!wdt->sam9x60_support &&
> -			 (!(reg & AT91_WDT_WDDIS)))
> +		if (!(reg & wdt->wddis_mask))
>  			wdt_write_nosleep(wdt, AT91_WDT_MR,
> -					  reg | AT91_WDT_WDDIS);
> +					  reg | wdt->wddis_mask);
>  	}
>  
>  	if (wdt->sam9x60_support) {
>  		if (wdt->need_irq)
>  			wdt->ir = AT91_SAM9X60_PERINT;
>  		else
>  			wdt->mr |= AT91_SAM9X60_PERIODRST;
>  
>  		wdt_write(wdt, AT91_SAM9X60_IER, wdt->ir);
> @@ -267,18 +258,21 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  	wdd->ops = &sama5d4_wdt_ops;
>  	wdd->min_timeout = MIN_WDT_TIMEOUT;
>  	wdd->max_timeout = MAX_WDT_TIMEOUT;
>  	wdt->last_ping = jiffies;
>  
>  	if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
>  	    of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
>  		wdt->sam9x60_support = true;
>  
> +	wdt->wddis_mask = wdt->sam9x60_support ? AT91_SAM9X60_WDDIS
> +						: AT91_WDT_WDDIS;
> +
>  	watchdog_set_drvdata(wdd, wdt);
>  
>  	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
>  
>  	wdt->reg_base = regs;
>  
>  	ret = of_sama5d4_wdt_init(dev->of_node, wdt);
> @@ -300,20 +294,20 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  		if (ret) {
>  			dev_err(dev, "cannot register interrupt handler\n");
>  			return ret;
>  		}
>  	}
>  
>  	watchdog_init_timeout(wdd, wdt_timeout, dev);
>  
>  	reg = wdt_read(wdt, AT91_WDT_MR);
> -	if (!(reg & AT91_WDT_WDDIS)) {
> -		wdt->mr &= ~AT91_WDT_WDDIS;
> +	if (!(reg & wdt->wddis_mask)) {
> +		wdt->mr &= ~wdt->wddis_mask;
>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
>  	}
>  
>  	ret = sama5d4_wdt_init(wdt);
>  	if (ret)
>  		return ret;
>  
>  	watchdog_set_nowayout(wdd, nowayout);
>  
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

