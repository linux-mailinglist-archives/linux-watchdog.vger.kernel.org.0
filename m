Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5DA382DA6
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 15:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237442AbhEQNmo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 09:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237414AbhEQNml (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 09:42:41 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA58C061573
        for <linux-watchdog@vger.kernel.org>; Mon, 17 May 2021 06:41:24 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id 197so5666242qkl.12
        for <linux-watchdog@vger.kernel.org>; Mon, 17 May 2021 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OG7vZEvNBsToH7JZriktJz2uT0xCgopXQHhNB3zh1S4=;
        b=C8hxr0wNXKrstfUMiWjr8tC3k4nvVPLFaWb+9OlUBe8+XwUmSW1smq/sjq0c9rLBMN
         +1aCayEJQVOgKkmfvFnuLlzPPhdeYa1P5OeRPF6soc7VN11GchkwX0Z+qQJIL1XKGuhG
         /uq0Eiv3abmnKYQ1SKwTMz5qW4XW46lmMdWCgTuL8Am9wY8KCDmMxdAFOcV5f9TFm/xx
         DY9Nr9zhkY2Me+Bjz55wIberCyr1nNeqGNpjFGCQRYesvdqBj8EPSwHHHy7sTF8gNzzm
         s1zHStyYBsfatPlYghW28pzOyY6VVkSwCIKlwTbVPlXwsjdfvIEY7j+G9Crbovt0M/TP
         mBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OG7vZEvNBsToH7JZriktJz2uT0xCgopXQHhNB3zh1S4=;
        b=oLVPyM2Epb6feqiafd6KmififjTCpRGcArx2wZgrgWn0k3OddXbS+EMDI425uK3sV/
         mbpud1tJMYQL1wtuElYRiH9uKeWWY4hXU1HFjgbnicq8Xzqd07Xo17dMOx71O1grF/nw
         /o1FOw9RxaUEUEkGGjDK6J+yxZ6AEdm4mkLHsmVXBHE4S+gTMgOOAUKEEGGQrIH7nQK0
         pSnmohspOMuEN3qKqLM8FCRDPZ86nH2V7rpf+Y2fXiiJVd4uR8J3xwnJwZ9VthyW3BDY
         wIB7EW/5n8ZN4DNj/2X17TLWxDp5PkxAj++BwekMpslu4f5m3G2yCG4lJhOTttxVQnwv
         ZlkQ==
X-Gm-Message-State: AOAM532PIJXVLUqPLByn8WNzjdjSNFMLNDf/UDevEe/QMZPxLqRX4Pyy
        1gR3ZAvrf9fK3ls1BMl4RyU=
X-Google-Smtp-Source: ABdhPJzTve4clbadZFJZoA0oJOgkuvyC5yCnrBG5lO268UNivIINHtN49k5sbaFtM9RRCuH+nI0Q6A==
X-Received: by 2002:ae9:f310:: with SMTP id p16mr1351714qkg.267.1621258884178;
        Mon, 17 May 2021 06:41:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q13sm10569013qkj.43.2021.05.17.06.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 06:41:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] watchdog: sbsa: Support architecture version 1
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Al Stone <al.stone@linaro.org>,
        Jianchao Hu <hujianchao@hisilicon.com>,
        Huiqiang Wang <wanghuiqiang@huawei.com>
References: <1621253408-23401-1-git-send-email-zhangshaokun@hisilicon.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <83bbdf36-a3be-c261-3cd7-76eb208f3ad4@roeck-us.net>
Date:   Mon, 17 May 2021 06:41:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621253408-23401-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/17/21 5:10 AM, Shaokun Zhang wrote:
> For Armv8.6, The frequency of CNTFRQ_EL0 is standardized to a
> frequency of 1GHz, so Arm Base System Architecture 1.0[1] has
> introduced watchdog revision 1 that increases the length the
> watchdog offset register to 48 bit, while other operation of
> the watchdog remains the same.
> 
> The driver can determine which version of the watchdog is
> implemented through the watchdog interface identification
> register (W_IID). If the version is 0x1, the watchdog
> offset register will be 48 bit, otherwise it will be 32 bit.
> 
> [1] https://developer.arm.com/documentation/den0094/latest
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
> Cc: Al Stone <al.stone@linaro.org>
> Cc: Jianchao Hu <hujianchao@hisilicon.com>
> Cc: Huiqiang Wang <wanghuiqiang@huawei.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> ChangeLog
> v1-->v2:
>      1. Addressed Guenter's comments
>      2. Remove some dead mailboxs and rewrite comments.
>      
>   drivers/watchdog/sbsa_gwdt.c | 54 +++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index f0f1e3b2e463..ee9ff38929eb 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -73,16 +73,21 @@
>   #define SBSA_GWDT_WCS_WS0	BIT(1)
>   #define SBSA_GWDT_WCS_WS1	BIT(2)
>   
> +#define SBSA_GWDT_VERSION_MASK  0xF
> +#define SBSA_GWDT_VERSION_SHIFT 16
> +
>   /**
>    * struct sbsa_gwdt - Internal representation of the SBSA GWDT
>    * @wdd:		kernel watchdog_device structure
>    * @clk:		store the System Counter clock frequency, in Hz.
> + * @version:            store the architecture version
>    * @refresh_base:	Virtual address of the watchdog refresh frame
>    * @control_base:	Virtual address of the watchdog control frame
>    */
>   struct sbsa_gwdt {
>   	struct watchdog_device	wdd;
>   	u32			clk;
> +	int			version;
>   	void __iomem		*refresh_base;
>   	void __iomem		*control_base;
>   };
> @@ -113,6 +118,30 @@ MODULE_PARM_DESC(nowayout,
>   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
>   /*
> + * Arm Base System Architecture 1.0 introduces watchdog v1 which
> + * increases the length watchdog offset register to 48 bits.
> + * - For version 0: WOR is 32 bits;
> + * - For version 1: WOR is 48 bits which comprises the register
> + * offset 0x8 and 0xC, and the bits [63:48] are reserved which are
> + * Read-As-Zero and Writes-Ignored.
> + */
> +static u64 sbsa_gwdt_reg_read(struct sbsa_gwdt *gwdt)
> +{
> +	if (gwdt->version == 0)
> +		return readl(gwdt->control_base + SBSA_GWDT_WOR);
> +	else
> +		return readq(gwdt->control_base + SBSA_GWDT_WOR);
> +}
> +
> +static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
> +{
> +	if (gwdt->version == 0)
> +		writel((u32)val, gwdt->control_base + SBSA_GWDT_WOR);
> +	else
> +		writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
> +}
> +
> +/*
>    * watchdog operation functions
>    */
>   static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
> @@ -123,16 +152,14 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
>   	wdd->timeout = timeout;
>   
>   	if (action)
> -		writel(gwdt->clk * timeout,
> -		       gwdt->control_base + SBSA_GWDT_WOR);
> +		sbsa_gwdt_reg_write(gwdt->clk * timeout, gwdt);
>   	else
>   		/*
>   		 * In the single stage mode, The first signal (WS0) is ignored,
>   		 * the timeout is (WOR * 2), so the WOR should be configured
>   		 * to half value of timeout.
>   		 */
> -		writel(gwdt->clk / 2 * timeout,
> -		       gwdt->control_base + SBSA_GWDT_WOR);
> +		sbsa_gwdt_reg_write(gwdt->clk / 2 * timeout, gwdt);
>   
>   	return 0;
>   }
> @@ -149,7 +176,7 @@ static unsigned int sbsa_gwdt_get_timeleft(struct watchdog_device *wdd)
>   	 */
>   	if (!action &&
>   	    !(readl(gwdt->control_base + SBSA_GWDT_WCS) & SBSA_GWDT_WCS_WS0))
> -		timeleft += readl(gwdt->control_base + SBSA_GWDT_WOR);
> +		timeleft += sbsa_gwdt_reg_read(gwdt);
>   
>   	timeleft += lo_hi_readq(gwdt->control_base + SBSA_GWDT_WCV) -
>   		    arch_timer_read_counter();
> @@ -172,6 +199,17 @@ static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
>   	return 0;
>   }
>   
> +static void sbsa_gwdt_get_version(struct watchdog_device *wdd)
> +{
> +	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
> +	int ver;
> +
> +	ver = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
> +	ver = (ver >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
> +
> +	gwdt->version = ver;
> +}
> +
>   static int sbsa_gwdt_start(struct watchdog_device *wdd)
>   {
>   	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
> @@ -252,10 +290,14 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>   	wdd->info = &sbsa_gwdt_info;
>   	wdd->ops = &sbsa_gwdt_ops;
>   	wdd->min_timeout = 1;
> -	wdd->max_hw_heartbeat_ms = U32_MAX / gwdt->clk * 1000;
>   	wdd->timeout = DEFAULT_TIMEOUT;
>   	watchdog_set_drvdata(wdd, gwdt);
>   	watchdog_set_nowayout(wdd, nowayout);
> +	sbsa_gwdt_get_version(wdd);
> +	if (gwdt->version == 0)
> +		wdd->max_hw_heartbeat_ms = U32_MAX / gwdt->clk * 1000;
> +	else
> +		wdd->max_hw_heartbeat_ms = GENMASK_ULL(47, 0) / gwdt->clk * 1000;
>   
>   	status = readl(cf_base + SBSA_GWDT_WCS);
>   	if (status & SBSA_GWDT_WCS_WS1) {
> 

