Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9FE76A89F7
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Mar 2023 21:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjCBUCC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Mar 2023 15:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjCBUCA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Mar 2023 15:02:00 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147442005C
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Mar 2023 12:01:27 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id i4so402773ils.1
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Mar 2023 12:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677787251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=y1gtpjRpUqWMtqOkJwQw2lOGRTiBj3ZUiEXwyYi+oIA=;
        b=L1F5uGlVEFhTWL98NcFz8aTWD7DzoHUWmz/xayFFFp2FWKJXg4nhbu+6cU0zUciU3Q
         8uyJMae+oGtOIIb+p0KRpe8uHeyTNaIRcwx8KsUYl7bXjBBgPsQbtgEOtIA4YIh15n/V
         tk4UPygcfgMY2LlEV2Ed1XDoCPGKUnISzpQvN8vzlMuu0hmVFigFMbP/FPie5DzmgVN4
         M58S2QP6JxudNBzv+7NtuJq9KOya+gxL31ij6URrjkrmqA9sZA+We7ZTj6hitYz6z0hu
         Ou2/+r0MfSWN/8TRV1ofla+l2jGOX9sny6v8KuelujB3401U5OdjJOxRLEJHKYjotk22
         Pskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677787251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1gtpjRpUqWMtqOkJwQw2lOGRTiBj3ZUiEXwyYi+oIA=;
        b=j6Ymt9f1gJ+g4ZjLfH7A4yG9yzD0xmexSkIQQS+LAWCkFNWkcfP6RbBK+4aNFjU+li
         3qMN3kBEVHjEU/KT8NXsw0bFW0vydvxdn1aVYLb/hu8zfiQgcM2maVM7ZEsinEGUhZsj
         kNQ+vJ1Sd/DGD3qUvEXSC88JJXg7d6ZsaPJ5nLg1m7Kti6g1UNTM4LxY/lkB5dTpJhWq
         ornFitXjUIZxYUfvO0YFOxdhU9+uUnBeX2E8uAOxAx6OxmV3IwDRkdLOXol5kZN7MlPh
         UEly2+3RMqz83TlTQDzcASXo2BYQQRLDlUqM8Bfl6shkCYT7uuRXZbJ7mQIme5hzfV5g
         iMsQ==
X-Gm-Message-State: AO0yUKXGKselGG9/VJVJhr1V/bzZPpvAwzZf/P37vGY0LhQOZ/iSzeAh
        WKastvT2PEpKVbrXGcCTBiQ=
X-Google-Smtp-Source: AK7set87NXe6y3KwAjPrW8yct0ko2/r/DIsnVCooRdvx8H2Yb7rnzaO+xJdvwfNnou+9Vj8LirQUHw==
X-Received: by 2002:a92:c541:0:b0:318:a974:ab4a with SMTP id a1-20020a92c541000000b00318a974ab4amr2208043ilj.6.1677787251509;
        Thu, 02 Mar 2023 12:00:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u10-20020a02cb8a000000b003ea1dbd00d6sm124104jap.70.2023.03.02.12.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 12:00:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6ae3943d-8c2c-ad87-c27c-15ad34820b7b@roeck-us.net>
Date:   Thu, 2 Mar 2023 12:00:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] watchdog: sp5100_tco: Immediately trigger upon starting.
Content-Language: en-US
To:     Gregory Oakes <gregory.oakes@amd.com>,
        linux-watchdog@vger.kernel.org
Cc:     terry.bowman@amd.com
References: <20230301195001.26843-1-gregory.oakes@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230301195001.26843-1-gregory.oakes@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/1/23 11:50, Gregory Oakes wrote:
> The watchdog countdown is supposed to begin when the device file is
> opened. Instead, it would begin countdown upon the first write to or
> close of the device file. Now, the ping operation is called within the
> start operation which ensures the countdown begins. From experimenation,
> it does not appear possible to do this with a single write including
> both the start bit and the trigger bit. So, it is done as two distinct
> writes.
> 
> Signed-off-by: Gregory Oakes <gregory.oakes@amd.com>
> ---
> 
> I tested on several AMD client devices. I verified the countdown begins
> immediately upon the open ioctl and resets upon subsequent write ioctl's.
> 
>   drivers/watchdog/sp5100_tco.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index fb426b7d81da..18ab0e096f99 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -86,6 +86,8 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started."
>    * Some TCO specific functions
>    */
>   
> +static int tco_timer_ping(struct watchdog_device *wdd);
> +
>   static enum tco_reg_layout tco_reg_layout(struct pci_dev *dev)
>   {
>   	if (dev->vendor == PCI_VENDOR_ID_ATI &&
> @@ -115,7 +117,7 @@ static int tco_timer_start(struct watchdog_device *wdd)
>   	val |= SP5100_WDT_START_STOP_BIT;
>   	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
>   
> -	return 0;
> +	return tco_timer_ping(wdd);

I think something like

	val = readl(SP5100_WDT_CONTROL(tco->tcobase));
         val |= SP5100_WDT_START_STOP_BIT;
         writel(val, SP5100_WDT_CONTROL(tco->tcobase));
	val |= SP5100_WDT_TRIGGER_BIT;
	writel(val, SP5100_WDT_CONTROL(tco->tcobase));

would be better here to avoid the extra read operation.

Also please add a comment into the code explaining that a single
write operation is insufficient to avoid someone stepping in later
and trying to "optimize" the code.

Thanks,
Guenter

>   }
>   
>   static int tco_timer_stop(struct watchdog_device *wdd)

