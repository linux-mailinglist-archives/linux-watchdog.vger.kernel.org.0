Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A84A2709BF
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Sep 2020 03:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgISBuD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Sep 2020 21:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgISBuD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Sep 2020 21:50:03 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC398C0613CE;
        Fri, 18 Sep 2020 18:50:02 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x69so9369614oia.8;
        Fri, 18 Sep 2020 18:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T5oRG7A9sspcw8WqFONyRzmQrSqE2V1Au1c14tTBR+g=;
        b=CEGCusT2L1JULAHBH3RSIEqnh6AJ3EqRQJU0/zvCaycj63nCMeY0bCUVPaEvEg0Ocw
         X6amDeHzlMAOLJzOlYm7kIN4mwThb8wAzLnppNJvDC63CvW4TilpdEnRAblD/oieUNDj
         5nR3oFkyonZP8nbjHH9T266HkloAYzPIRAnS4oM5az8n0DFoIUn+v7ugYhRVaFpKPaJf
         sLo9FTJWiYgCXCK6uiIQSrSIGbnrfgTVSbGHjTAbK/uindavNd8MfB/d9ytYC47XrhRq
         TqFyLSVAL1yq/zjc63s8G6ky9i1OBVac6HezMYQG7QprL+Y6rYg1eglQ3YZ7zc47Fgf3
         HjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=T5oRG7A9sspcw8WqFONyRzmQrSqE2V1Au1c14tTBR+g=;
        b=ZOz4qu9DRQp5NnxYw8iX+fiHdF3RWdz60hBve5+vVeLvKze0Lu6yGkEm4+uIBlrSDB
         GqmUd8XGob/tNJvjMeG5+vu08tiH7BH/KhdcEjGaORxRqBho8M8APuf3S/am47eZXUmh
         0ma6mwIYuiyFBcCexYeMpQjUe+MqDfqfYYoh3u16LmYEqhk2lA0BxvKy24xwjHn5+2rT
         v2w9N1wcoCbE7sxDbFu+WxQ4vSyZYIlQU0Huf9FIDQOpMkCpVqd9ixsX5rVJZ11boRBQ
         CxBpjCBTCoFN5UINqavbwnYeVeNwgBwJ7wp1PrGZoGh5KmZI+VvFsLAXrdXz9QZXhwge
         ec6w==
X-Gm-Message-State: AOAM533jPJHZSynfCV+E9mL2CvogBVH8A37fZMck2QZXzspy16pwpayn
        yRVhG4WjzCN1Y/NanvyDw7A=
X-Google-Smtp-Source: ABdhPJw6pua/Vz4+STc7U43CXObmna6ixtmwxeLL3nln5LRIXuyEXXxAUAP8QGrDFrLNldFrRMXnUw==
X-Received: by 2002:a54:4895:: with SMTP id r21mr11354214oic.83.1600480202142;
        Fri, 18 Sep 2020 18:50:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h24sm3564289otj.33.2020.09.18.18.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 18:50:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 4/6] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
 <1993b8516fefd3d8ea16e926c4db379b89ae4096.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
 <2683bcbd-7ff2-f451-2e6c-79a2ff9e69ea@roeck-us.net>
 <3b9d7ba7f59b5c6787c40f86e0258f55fe73e10c.camel@fi.rohmeurope.com>
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
Message-ID: <7c642388-68c9-a0aa-d661-93d13322240d@roeck-us.net>
Date:   Fri, 18 Sep 2020 18:49:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3b9d7ba7f59b5c6787c40f86e0258f55fe73e10c.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/17/20 11:06 PM, Vaittinen, Matti wrote:
> Thanks (again) for review Guenter!
> 
> On Thu, 2020-09-17 at 22:45 -0700, Guenter Roeck wrote:
>> On 9/17/20 1:03 AM, Matti Vaittinen wrote:
>>> Add Watchdog support for ROHM BD9576MUF and BD9573MUF PMICs which
>>> are
>>> mainly used to power the R-Car series processors. The watchdog is
>>> pinged using a GPIO and enabled using another GPIO. Additionally
>>> watchdog time-out can be configured to HW prior starting the
>>> watchdog.
>>> Watchdog timeout can be configured to detect only delayed ping or
>>> in
>>> a window mode where also too fast pings are detected.
>>>
>>> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>>> ---
>>>  drivers/watchdog/Kconfig      |  13 ++
>>>  drivers/watchdog/Makefile     |   1 +
>>>  drivers/watchdog/bd9576_wdt.c | 295
>>> ++++++++++++++++++++++++++++++++++
>>>  3 files changed, 309 insertions(+)
>>>  create mode 100644 drivers/watchdog/bd9576_wdt.c
> 
>>
>>> +
>>> +	ret = of_property_read_u32(np,
>>> +				   "hw_margin_ms", &hw_margin);
>>
>> Line splits are arbitrary. Why is this "hw_margin_ms" and not
>> "rohm,hw_margin_ms" ?
> 
> "hw_margin_ms" is an existing binding for specifying the maximum TMO in
> HW (if I understood it correctly). (It is used at least by the generig
> GPIO watchdog) I thought it's better to not invent a new vendor
> specific binding when we have a generic one.
> 
> https://elixir.bootlin.com/linux/v5.9-rc2/source/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> 
>>
>>> +	if (ret) {
>>> +		if (ret != -EINVAL)
>>> +			return ret;
>>> +
>>> +		hw_margin = BD957X_WDT_DEFAULT_MARGIN;
>>> +	}
>>> +
>>> +	ret = of_property_read_u32(np, "rohm,hw-margin-min-ms",
>>> &hw_margin_min);
>>> +	if (ret == -EINVAL)
>>> +		hw_margin_min = 0;
>>> +	else if (ret)
>>> +		return ret;
>>
>> Please use a single mechanism to handle -EINVAL after
>> of_property_read_u32().
> 
> Sorry Guenter - I am probably a bit slow today but I am unsure if I
> understand the suggestion. Do you mean something like:
> 

    if (ret) {
>>> +		if (ret != -EINVAL)
>>> +			return ret;
>>> +
>>> +		hw_margin = BD957X_WDT_DEFAULT_MARGIN;
>>> +	}

vs.

>>> +	if (ret == -EINVAL)
>>> +		hw_margin_min = 0;
>>> +	else if (ret)
>>> +		return ret;

is not very consistent to me.

Guenter

> hw_margin_min = 0;
> 
> ret = of_property_read_u32(np, "rohm,hw-margin-min-ms",
> &hw_margin_min);
> if (ret && ret != -EINVAL)
> 	return ret;
> 
> Other than that - all findings are clear to me. I'll craft a new
> version but I'll wait for a while to see if Lee has time to send some
> feedback on MFD so I could get both WDG and MFD fixes to same version
> :)
> 
> Best Regards
> 	--Matti
> 
> 
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland
> SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> 
> Simon says - in Latin please.
> "non cogito me" dixit Rene Descarte, deinde evanescavit
> 
> (Thanks for the translation Simon)
> 

