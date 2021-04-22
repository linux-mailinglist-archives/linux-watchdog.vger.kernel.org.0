Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562F736782C
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Apr 2021 06:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhDVECm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Apr 2021 00:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhDVECm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Apr 2021 00:02:42 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEF3C06174A;
        Wed, 21 Apr 2021 21:02:06 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i26-20020a9d625a0000b02902a2119f7613so4146670otk.10;
        Wed, 21 Apr 2021 21:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ITBmDLLHz4eUEAesx065LH4ASYqLeFzaAtVhvUxkuzo=;
        b=pxOuQRsIHGzibblHMbiIsI0bVr8qo7MFIzg00Lviq4sYlEIlTCyM1GeESgKrUfWE8Q
         ZIPr+qUteAuxIGKZud6QfdMvVhOCzaRiFf//VC1LzxzmUrUZWMOJOHJBQVCMyzpGO4b8
         ra3adM3/Z8+2vYbwk/YnLVgDOhDTunxXJndQR3ZIIrcmFY69oE8xzXomn9aCw7y072Kj
         NpngQm2pihVTJxFraf3WsEtJ5LrjmJgFvNkCoGp+0mSBQn6cNQzm3smBmRRGSVZ/FgbF
         YezP31SVAUehk5Z7h9Wvj4jDPY3OAWaI5E6wbhspFKJrslwALC3dpAp1Fnt87GqEiP8n
         kZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ITBmDLLHz4eUEAesx065LH4ASYqLeFzaAtVhvUxkuzo=;
        b=YfI3lgXYx4inr9Gh5fNSnGsYzG9geE92UKkZTs2ZSSQFsgA0Xhq7nC4/57/k6gIvIV
         pAWb130At7qa84cSciKZZ9gk9KgdQTKua/rYW09bcbSCQ08rNIjobbfXLiFqU9O9ZvCO
         C6ilXBG7pnEuHLc0MOlMZdu7YHPBCMVcahe4DwA/68diO+8BXQoefscOPpg96O3r65yh
         t/kYFL3cYl95vJjawesZgO8dLqkOyW2PEgQN8vGrPamq7ajGHBTfmwfRBTfYPZuNNCmb
         OWlMuGAjMK4NbgWlTB6j6fKEmyhh7U5/yfONpmHBNEdZ+7EwRvEvnixvcEBYfLgoO8nG
         ftaQ==
X-Gm-Message-State: AOAM533aLizP3kfMxbaExIKJHIv7M/bQl/WJaKkE5/gLrkiJTzeR4MzC
        kI3Kezphcd3ELJ62AUMxTe059h2JcJA=
X-Google-Smtp-Source: ABdhPJwZn+kalZMmuwlslp4kjozhVPGyz+amC40rMJBjJ3+5HjN8KZ84FN09nCgiflwBKIM7LWhZNw==
X-Received: by 2002:a9d:6749:: with SMTP id w9mr1198603otm.24.1619064125556;
        Wed, 21 Apr 2021 21:02:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2sm358399otk.70.2021.04.21.21.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 21:02:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V6 1/2] watchdog: mtk: support pre-timeout when the bark
 irq is available
To:     =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <AJYA1QBSDhatYsq-n3vbqqrl.3.1619063178146.Hmail.wangqing@vivo.com>
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
Message-ID: <26bed2e5-6ec8-72ae-ff2c-c707c00d5125@roeck-us.net>
Date:   Wed, 21 Apr 2021 21:02:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AJYA1QBSDhatYsq-n3vbqqrl.3.1619063178146.Hmail.wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/21/21 8:46 PM, 王擎 wrote:
> 
>> On 4/21/21 7:45 PM, Wang Qing wrote:
>>> Use the bark interrupt as the pretimeout notifier if available.
>>>
>>> When the watchdog timer expires in dual mode, an interrupt will be
>>> triggered first, then the timing restarts. The reset signal will be
>>> initiated when the timer expires again.
>>>
>>> The pretimeout notification shall occur at timeout-sec/2.
>>>
>>> V2:
>>> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
>>>
>>> V3:
>>> - Modify the pretimeout behavior, manually reset after the pretimeout
>>> - is processed and wait until timeout.
>>>
>>> V4:
>>> - Remove pretimeout related processing. 
>>> - Add dual mode control separately.
>>>
>>> V5:
>>> - Fix some formatting and printing problems.
>>>
>>> V6:
>>> - Realize pretimeout processing through dualmode.
>>>
>>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>>> ---
>>>  drivers/watchdog/mtk_wdt.c | 53 +++++++++++++++++++++++++++++++++++++++++-----
>>>  1 file changed, 48 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>> index 97ca993..ebc648b
>>> --- a/drivers/watchdog/mtk_wdt.c
>>> +++ b/drivers/watchdog/mtk_wdt.c
>>> @@ -25,6 +25,7 @@
>>>  #include <linux/reset-controller.h>
>>>  #include <linux/types.h>
>>>  #include <linux/watchdog.h>
>>> +#include <linux/interrupt.h>
>>>  
>>>  #define WDT_MAX_TIMEOUT		31
>>>  #define WDT_MIN_TIMEOUT		1
>>> @@ -184,15 +185,22 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>>>  {
>>>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>>> +	unsigned int timeout_interval;
>>>  	u32 reg;
>>>  
>>> -	wdt_dev->timeout = timeout;
>>> +	timeout_interval = wdt_dev->timeout = timeout;
>>> +	/*
>>> +	 * In dual mode, irq will be triggered at timeout/2
>>> +	 * the real timeout occurs at timeout
>>> +	 */
>>> +	if (wdt_dev->pretimeout)
>>> +		timeout_interval = wdt_dev->pretimeout = timeout/2;
>>
>> Please run checkpatch --strict and fix what it reports.
>> Also, there should be a set_pretimeout function to set the
>> pretimeout. It is ok to update it here, but it should be set
>> in its own function to make sure that the actual value
>> is reported back to userspace.
>>
>> Thanks,
>> Guenter
> 
> The reason why the set_pretimeout interface is not provided is 
> because the pretimeout is fixed after the timeout is set,  we need
> to modify timeout after setting pretimeout, which is puzzling.
> 

What you need to do is to set pretimeout = timeout / 2 if a pretimeout
is set to a value != 0. Just like we adjust timeout to valid values
when set, we adjust pretimeout as well. I don't see a problem with that.

Guenter
