Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7767B3542EF
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Apr 2021 16:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236080AbhDEOma (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Apr 2021 10:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236072AbhDEOm3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Apr 2021 10:42:29 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7419C061756
        for <linux-watchdog@vger.kernel.org>; Mon,  5 Apr 2021 07:42:23 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so11535417otb.7
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Apr 2021 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d40Bwx8riruLamWhBAuILelPIMMmf1IE6PbDqQLkpr0=;
        b=LzYlDR6Hx14DfIE4H8AnP6owqTc2jcQdHOdOpvpHWAeFXvB6UUT0dVxf267eGgt44o
         lxEeLnn3ftXlcjQH7GrsSi5WjqtYThD5Z9wTFNYxisR9hn04gQAss5GqqkOGsIS/Ue07
         6+KR1CB9kOjqoq5Z8LX3senDXcrawvDVijuaDsQpF9sR8wPQeiVfmAxVqrrIB3respZ5
         QirXWCMuoq7YaU2JY6QyrKwZdTNPYtsaBPdeonprpv+t7/NDVg+G5PENiEysm+0pUXMJ
         e3jJn7tp0KScVtnVjhb/iTqZo+/02xM8SNYqHBnXkNtzELAHctCNke3h41PMREqsz2Z7
         UvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=d40Bwx8riruLamWhBAuILelPIMMmf1IE6PbDqQLkpr0=;
        b=sGZQCjfantuxrf0IQGIfWcPsac8Xg+/aCo8aHDs5jJ2MQWLloM1FCaEVctPtP3NZrk
         x/M2ioRwD9QCd6wBa7Ou6qmj60IHEZnj+mMTPMTZzdpRDyabYh4+9Kr4vlLkKASvs2Fq
         /+XpaHamMRS89NO0LyJMHCTlCHkleazSpgRJA0gjAkaVFYES+tj4wb5RGPSC9QNonYMn
         QneiJNwlml6kj2JBqDl7FzO1qGvfVyZmr3Rgp1Q7rhgQ8TpbIXa87/R+MTDtu2m787ac
         i/DjV9qvUSMjdHSMLDZpnEiDOEKc+0WuFinOOPMtdfxIM5chx7trymTPlF9sMB/vXUQL
         vYFA==
X-Gm-Message-State: AOAM530buAobxExs6MuY6Xo0kT4dGqHBRB4ZYKNEfBT+P7C/bmbMSbQ7
        FXHT+3HoscEOyP3SHgoMw+U=
X-Google-Smtp-Source: ABdhPJw404bznuYVKKmFppYTxjnS2ItovyZVTLzQi9ogZCqBdVa5JxOo6LvGrOcQbNkzpg57Tu0lLw==
X-Received: by 2002:a9d:3a4a:: with SMTP id j68mr22317448otc.4.1617633743143;
        Mon, 05 Apr 2021 07:42:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j72sm3087113oih.46.2021.04.05.07.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 07:42:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: imx_sc_wdt: fix pretimeout
To:     eichest@gmail.com, linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20210405125946.369230-1-eichest@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <2580102e-4459-c55e-0aab-2882af8e9ae7@roeck-us.net>
Date:   Mon, 5 Apr 2021 07:42:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210405125946.369230-1-eichest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/5/21 5:59 AM, eichest@gmail.com wrote:
> From: Stefan Eichenberger <eichest@gmail.com>
> 
> If the WDIOF_PRETIMEOUTE flag is not set when registering the device the

WDIOF_PRETIMEOUT

> driver will not show the sysfs entries or register the default governor.
> By moving the registering after the decision whether pretimeout is
> supported this gets fixed.
> 

This is problematic. If the notifier is called and the watchdog is not yet
registered, it will call watchdog_notify_pretimeout on an unregistered
watchdog device which would crash the system. The notifier function needs
to handle that situation. This is for both registration and removal: On
removal, the watchdog device would be unregistered first (because of the
use of devm_ functions) and, again, the notifier could be called on an
unregistered watchdog device.

> Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
> ---
>  drivers/watchdog/imx_sc_wdt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index e9ee22a7cb45..eddb1ae630e0 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -183,10 +183,6 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_reboot(wdog);
>  	watchdog_stop_on_unregister(wdog);
>  
> -	ret = devm_watchdog_register_device(dev, wdog);
> -	if (ret)
> -		return ret;
> -
>  	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
>  				       SC_IRQ_WDOG,
>  				       true);
> @@ -213,6 +209,10 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>  	else
>  		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
>  
> +	ret = devm_watchdog_register_device(dev, wdog);
> +	if (ret)
> +		return ret;
> +
>  	return 0;

This is equivalent to just "return ret;".

>  }
>  
> 

