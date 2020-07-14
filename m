Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A7421E75F
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jul 2020 07:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgGNFPo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jul 2020 01:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNFPo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jul 2020 01:15:44 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E0EC061755;
        Mon, 13 Jul 2020 22:15:44 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u5so7074826pfn.7;
        Mon, 13 Jul 2020 22:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W9UVk4gZaipFsdW7t22iyOeVUpzp++syTMoL3wspcvY=;
        b=LkFUHuIcYcQQ8XTucst+0IhhaAASsxTz9xT7f7VAn8Dzt0vEo9DmqFI2r4AJx7Tgmp
         b/RMXgeKCfizz0uSBRBDKv4IMAmlhj/QpAtGm8Qa3Vl1TcuBYlYsD9QerC7ajG+h5KgQ
         BV5MQqw50rJbBQAUpVwoB/7i2uFrd39iBUaJ16imRIfZPBQ/SBAY+Ob33rnYHWuSPDzM
         qL9omz/PKpmmw3nsfXK9io21o7b3YxiP6HMDpntunET8kdqaV+P9PFCeSujMc9G1z5F1
         P5zpcZy716SM0NnUrtJlA7cSTcPN1E6vtl73wHBELxpiB2XCaAMQ6Roh5oX+PNpg+iKh
         Cj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=W9UVk4gZaipFsdW7t22iyOeVUpzp++syTMoL3wspcvY=;
        b=ed5OBbIbujrvCnxc7sCHdaZp0EzSdBVtjXILvec5oYPvcP2jZ2XQW1WOG0uG23lDH+
         cmijTVSlXHQjUjmbCOfZc+8z0ReN+Xi6UYeTnWCJBAqHQPigibWoRsmTHYXMwh8Y36iz
         p0rkLG/KsKjlm0D/jsvKxySCWxrtwZQ+BEjH5yjvEndZzc1w0NfTSLJGmKnbrjtWs22g
         VHKvkut1AY83FQpgcoxDSrE3L6Ig4nsdenhhrmthDbn5mH6eGf3MZQt4eKwvFklciO6c
         Z83DHAcbjxa5/rhBYPftca7J81FRDdkMFcupf8i10WQuCj7U2eIYyrAaLbzdZ2sleO0v
         szQQ==
X-Gm-Message-State: AOAM5337fKrhw5f3LpVefVfBXYrc/aHle4/gbfKQ6zy/fgz+Ft+NkJOJ
        VIvyj0Z2nKEp7aqIcwYJgkZ4K1f9U7I=
X-Google-Smtp-Source: ABdhPJypC/8zrLwweRUDPrF1TaJKQLqmRCPrI/P1QjC8tJGsToCVMmdzTUNrSZ+WtW8Lttg6O3BGmQ==
X-Received: by 2002:a63:7e55:: with SMTP id o21mr2091666pgn.263.1594703743589;
        Mon, 13 Jul 2020 22:15:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r16sm15740446pfh.64.2020.07.13.22.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 22:15:42 -0700 (PDT)
Subject: Re: [PATCHv3 3/4] watchdog: rti-wdt: attach to running watchdog
 during probe
To:     Tero Kristo <t-kristo@ti.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jan.kiszka@siemens.com
References: <20200713131818.825-1-t-kristo@ti.com>
 <20200713131818.825-4-t-kristo@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <0c69734d-b301-7762-7614-0644e2a719ba@roeck-us.net>
Date:   Mon, 13 Jul 2020 22:15:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713131818.825-4-t-kristo@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/13/20 6:18 AM, Tero Kristo wrote:
> If the RTI watchdog is running already during probe, the driver must
> configure itself to match the HW. Window size and timeout is probed from
> hardware, and the last keepalive ping is adjusted to match it also.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/watchdog/rti_wdt.c | 111 +++++++++++++++++++++++++++++++++----
>  1 file changed, 101 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index d456dd72d99a..45dfc546e371 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -35,7 +35,11 @@
>  
>  #define RTIWWDRX_NMI	0xa
>  
> -#define RTIWWDSIZE_50P	0x50
> +#define RTIWWDSIZE_50P		0x50
> +#define RTIWWDSIZE_25P		0x500
> +#define RTIWWDSIZE_12P5		0x5000
> +#define RTIWWDSIZE_6P25		0x50000
> +#define RTIWWDSIZE_3P125	0x500000
>  
>  #define WDENABLE_KEY	0xa98559da
>  
> @@ -48,7 +52,7 @@
>  
>  #define DWDST			BIT(1)
>  
> -static int heartbeat;
> +static int heartbeat = DEFAULT_HEARTBEAT;
>  
>  /*
>   * struct to hold data for each WDT device
> @@ -79,11 +83,9 @@ static int rti_wdt_start(struct watchdog_device *wdd)
>  	 * be petted during the open window; not too early or not too late.
>  	 * The HW configuration options only allow for the open window size
>  	 * to be 50% or less than that; we obviouly want to configure the open
> -	 * window as large as possible so we select the 50% option. To avoid
> -	 * any glitches, we accommodate 5% safety margin also, so we setup
> -	 * the min_hw_hearbeat at 55% of the timeout period.
> +	 * window as large as possible so we select the 50% option.
>  	 */
> -	wdd->min_hw_heartbeat_ms = 11 * wdd->timeout * 1000 / 20;
> +	wdd->min_hw_heartbeat_ms = 500 * wdd->timeout;
>  
>  	/* Generate NMI when wdt expires */
>  	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
> @@ -110,7 +112,48 @@ static int rti_wdt_ping(struct watchdog_device *wdd)
>  	return 0;
>  }
>  
> -static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
> +static int rti_wdt_setup_hw_hb(struct watchdog_device *wdd, u32 wsize)
> +{
> +	/*
> +	 * RTI only supports a windowed mode, where the watchdog can only
> +	 * be petted during the open window; not too early or not too late.
> +	 * The HW configuration options only allow for the open window size
> +	 * to be 50% or less than that.
> +	 */
> +	switch (wsize) {
> +	case RTIWWDSIZE_50P:
> +		/* 50% open window => 50% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 500 * heartbeat;
> +		break;
> +
> +	case RTIWWDSIZE_25P:
> +		/* 25% open window => 75% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 750 * heartbeat;
> +		break;
> +
> +	case RTIWWDSIZE_12P5:
> +		/* 12.5% open window => 87.5% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 875 * heartbeat;
> +		break;
> +
> +	case RTIWWDSIZE_6P25:
> +		/* 6.5% open window => 93.5% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 935 * heartbeat;
> +		break;
> +
> +	case RTIWWDSIZE_3P125:
> +		/* 3.125% open window => 96.9% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 969 * heartbeat;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned int rti_wdt_get_timeleft_ms(struct watchdog_device *wdd)
>  {
>  	u64 timer_counter;
>  	u32 val;
> @@ -123,11 +166,18 @@ static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
>  
>  	timer_counter = readl_relaxed(wdt->base + RTIDWDCNTR);
>  
> +	timer_counter *= 1000;
> +
>  	do_div(timer_counter, wdt->freq);
>  
>  	return timer_counter;
>  }
>  
> +static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	return rti_wdt_get_timeleft_ms(wdd) / 1000;
> +}
> +
>  static const struct watchdog_info rti_wdt_info = {
>  	.options = WDIOF_KEEPALIVEPING,
>  	.identity = "K3 RTI Watchdog",
> @@ -148,6 +198,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  	struct watchdog_device *wdd;
>  	struct rti_wdt_device *wdt;
>  	struct clk *clk;
> +	u32 last_ping = 0;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>  	if (!wdt)
> @@ -169,6 +220,14 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * If watchdog is running at 32k clock, it is not accurate.
> +	 * Adjust frequency down in this case so that we don't pet
> +	 * the watchdog too often.
> +	 */
> +	if (wdt->freq < 32768)
> +		wdt->freq = wdt->freq * 9 / 10;
> +

So this is now only a problem is the window size was set restrictively
in the BOS/ROMMON. Meaning it is still a problem. How is this better than
before ? Why not just always set the window size to something reasonable ?


>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret) {
> @@ -185,11 +244,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  	wdd->min_timeout = 1;
>  	wdd->max_hw_heartbeat_ms = (WDT_PRELOAD_MAX << WDT_PRELOAD_SHIFT) /
>  		wdt->freq * 1000;
> -	wdd->timeout = DEFAULT_HEARTBEAT;
>  	wdd->parent = dev;
>  
> -	watchdog_init_timeout(wdd, heartbeat, dev);
> -
>  	watchdog_set_drvdata(wdd, wdt);
>  	watchdog_set_nowayout(wdd, 1);
>  	watchdog_set_restart_priority(wdd, 128);
> @@ -201,12 +257,47 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  		goto err_iomap;
>  	}
>  
> +	if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
> +		u32 time_left_ms;
> +		u64 heartbeat_ms;
> +		u32 wsize;
> +
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		time_left_ms = rti_wdt_get_timeleft_ms(wdd);
> +		heartbeat_ms = readl(wdt->base + RTIDWDPRLD);
> +		heartbeat_ms <<= WDT_PRELOAD_SHIFT;
> +		heartbeat_ms *= 1000;
> +		heartbeat_ms /= wdt->freq;

Ah yes, the pitfalls of 64-bit divide operations.

> +		if (heartbeat_ms / 1000 != heartbeat)
> +			dev_warn(dev, "watchdog already running, ignoring heartbeat config!\n");
> +
> +		heartbeat = heartbeat_ms / 1000;
> +
> +		wsize = readl(wdt->base + RTIWWDSIZECTRL);
> +		ret = rti_wdt_setup_hw_hb(wdd, wsize);
> +		if (ret) {
> +			dev_err(dev, "bad window size.\n");
> +			goto err_iomap;
> +		}
> +
> +		last_ping = heartbeat_ms - time_left_ms;
> +		if (time_left_ms > heartbeat_ms) {
> +			dev_warn(dev, "time_left > heartbeat? Assuming last ping just before now.\n");
> +			last_ping = 0;
> +		}

All that complexity makes me wonder if it wouldn't be better to just reprogram
the watchdog if it is already running. Any reason for not doing that ?

> +	}
> +
> +	watchdog_init_timeout(wdd, heartbeat, dev);
> +
>  	ret = watchdog_register_device(wdd);
>  	if (ret) {
>  		dev_err(dev, "cannot register watchdog device\n");
>  		goto err_iomap;
>  	}
>  
> +	if (last_ping)
> +		watchdog_set_last_hw_keepalive(wdd, last_ping);
> +
>  	return 0;
>  
>  err_iomap:
> 

