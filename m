Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB74567156
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Jul 2022 16:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiGEOkG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Jul 2022 10:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbiGEOkF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Jul 2022 10:40:05 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA65A445
        for <linux-watchdog@vger.kernel.org>; Tue,  5 Jul 2022 07:40:02 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v14so17874079wra.5
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Jul 2022 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=G+gm8hbgYAdy1B/RsK8Rmpw4XNewna1FlG8XZxsx5wg=;
        b=SNm4JJdVDuionLBY9g2YaG7c58bAq1IqZGYfxtQejR+q9qQy56Ihdys+1uANIlNnpO
         uPFScLMgu9QnUYIra/zTFW7YcREmzGkfcyvDnieEvEgiFIyLtrFmBSgFM/LiGygynOMF
         gOJbTIGC7M2NtuxEplS7z24+tkExxnrI+MlzGtXPCo06awO9VUbIVX1QxApu68eF4c1w
         e2vmu5n3zwW8XZbrVQ7iNPUrFzQQEShm5s7vbg0DPWKCP+Mt+PtRyd1hbq/UWjE181Lr
         yG2LAWhFjpELNfMXvn+0NyDibPESwSjt1fUxKlEWkMboYjo/+S5psS/5H/nfhoSvHFzw
         pzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=G+gm8hbgYAdy1B/RsK8Rmpw4XNewna1FlG8XZxsx5wg=;
        b=dK1SnwyK94sD3HVeIt1+WQdFq3lM39GTDdBoQIius5wFHaclmsuRoPmwvEoOny8Cdm
         RSWVYw3+O/wXy4Vry3ABL47E2P4A8qq7cRC5aDzwzrVQVJpSDZnC6Za+OWfMCeH7oxHS
         mm9kv/c7pVJRBz1OHiXz/4Tm8Ea3s8hGDnQBHQitNACCMNPVKiqEkVQ15Sj9kNfIQSwh
         7rT4WDzZqRN/xbVjXf0zBGAgAizV6bqKvMDHGqomdWj20dBHtHBMVGHuc6RcBb+1CF/A
         dsuQwHi8qHsy1z4vt0J+AEaDRThbBlhfZXB90iNKVPrg9yOho7/S52z3M0rNW/WWLZPZ
         PyoA==
X-Gm-Message-State: AJIora+6AOOrw1TB13xEsJcfSmxsw7BCA8H2b/YJKH2AmYIeuU5SqyxJ
        PAFq+H70VZ+h/sKq5yp1VXwFIw==
X-Google-Smtp-Source: AGRyM1vYaCJFbX/quJl74Iitkw8Y5M5ouj3I04kVpLciSnjrMyI4w/5rUY92GK5isUWTQSUVnGcznw==
X-Received: by 2002:adf:db12:0:b0:21b:970b:e882 with SMTP id s18-20020adfdb12000000b0021b970be882mr33503539wri.6.1657032000721;
        Tue, 05 Jul 2022 07:40:00 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3c4f:78be:dc90:14f9? ([2001:861:44c0:66c0:3c4f:78be:dc90:14f9])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b0039c457cea21sm22409891wml.34.2022.07.05.07.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 07:40:00 -0700 (PDT)
Message-ID: <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
Date:   Tue, 5 Jul 2022 16:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1] watchdog: meson: keep running if already active
Content-Language: en-US
To:     Philippe Boos <pboos@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220705142444.17063-1-pboos@baylibre.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220705142444.17063-1-pboos@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 05/07/2022 16:24, Philippe Boos wrote:
> If the watchdog is already running (e.g.: started by bootloader) then
> the kernel driver should keep the watchdog active but the amlogic driver
> turns it off.
> 
> Let the driver fix the clock rate then restart the watchdog if it was
> previously active.
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Please drop this review tag since it was done off-list

> Signed-off-by: Philippe Boos <pboos@baylibre.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..8c2c6f7f3bb5 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -146,6 +146,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct meson_gxbb_wdt *data;
>   	int ret;
> +	u32 regval;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
> @@ -177,6 +178,8 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
>   	watchdog_set_drvdata(&data->wdt_dev, data);
>   
> +	regval = readl(data->reg_base + GXBB_WDT_CTRL_REG); > +
>   	/* Setup with 1ms timebase */
>   	writel(((clk_get_rate(data->clk) / 1000) & GXBB_WDT_CTRL_DIV_MASK) |
>   		GXBB_WDT_CTRL_EE_RESET |
> @@ -186,6 +189,13 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>   
> +	if ((regval & GXBB_WDT_CTRL_EN) != 0) {
> +		ret = meson_gxbb_wdt_start(&data->wdt_dev);
> +		if (ret)
> +			return ret;
> +		set_bit(WDOG_HW_RUNNING, &data->wdt_dev.status);
> +	}
> +
>   	watchdog_stop_on_reboot(&data->wdt_dev);
>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>   }

I think it would be much claner to leave the watchdog enabled, and get the parameters
from the registers and update the wdt_dev accordingly.

Neil
