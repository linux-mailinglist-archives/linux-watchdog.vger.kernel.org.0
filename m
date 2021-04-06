Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3BB355538
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Apr 2021 15:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344432AbhDFNdV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Apr 2021 09:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234917AbhDFNdU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Apr 2021 09:33:20 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F015AC06174A;
        Tue,  6 Apr 2021 06:33:12 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so14600265ote.6;
        Tue, 06 Apr 2021 06:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+iLnv1t7rndaK/hz8TyA5c0uwu4qvp0/LjTjnFu9otE=;
        b=JXo0k7egohjPox6fqRLDI27Dmxabxo+C8L+/NjgIpBi43t1zOfGwWVjgF4FItkbONh
         ChR/mZUYSfohOLaEnCA06lfgkDKqskEfIQfonx6wQrJvBcV1kJbPdLWnyaAvBkxzxlQy
         saMpQJqVwxHlC0Cv4x10OceknrQGzYBjtDuJTpSA+rcDy5PSjuGGtjd9E1DIAZ51fsKS
         R4W9Ycin5e5XK3Z8iS+ieCVQy+DVENPQGmOfqv7/8z4NtamR6Q18XCNn0rKRZOWI1xrJ
         NUJelnDNmfNGKjjzgj6/9FWpDW8lzvjga+gHIACllmtBUw2OPKxXec2zLcYnKHshM2aa
         ZdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+iLnv1t7rndaK/hz8TyA5c0uwu4qvp0/LjTjnFu9otE=;
        b=O7S38aqbmB4U1Oth2sg4L3Dsf1BvCqARgfK3oN9SMJ7wy4ynkTtqoRev6lxx2BPja4
         Jh9QHWLr+eDA8Gcv+do7nRYvXpdFg8dIxas7uMwdNO1AAOBBT07vs+XV8BnH+IRiPdYB
         ADxpFoGC41d9ejEoagtkmIZEIHNY+Rgot9rA5BlaNz/H0eOhRuVE90FK0aQgxDhlb8yR
         PA0dT3yoLpcpX0/rxkrd/ROoAWtOWL5u9dDzq1aktVmqXsu+M9nMcqmi2iQZn7EjL+Nw
         q37xk2dPTB4Tq3V8l6lca/hlluLE8bCDRebDWGs7RbeIzTpIXWxpeHfKdbFqSIlqMMtS
         6U7A==
X-Gm-Message-State: AOAM530tBxrarQ9jwmUNspqsq2PMfRYb/CusTzBKBARQaV3Sm4za2dXq
        KWiPX5QXUyS977wAIqXYxhMvk+sDfUM=
X-Google-Smtp-Source: ABdhPJzp3QTV6yb/JWXtcYGSclN6B/GqaxVyNq/3WQRnr7DUjWVZhsKjAOMJs5bFpeVqL0g96hjOmw==
X-Received: by 2002:a9d:17e7:: with SMTP id j94mr27027942otj.41.1617715991983;
        Tue, 06 Apr 2021 06:33:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l191sm3698970oih.16.2021.04.06.06.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 06:32:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] softdog: make pretimeout available when
 SOFT_WATCHDOG_PRETIMEOUT enabled
To:     Wang Qing <wangqing@vivo.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1617702277-17647-1-git-send-email-wangqing@vivo.com>
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
Message-ID: <30170c12-663a-bd5e-05a1-058a1726dc9f@roeck-us.net>
Date:   Tue, 6 Apr 2021 06:32:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617702277-17647-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/6/21 2:44 AM, Wang Qing wrote:
> Although softdog supports pretimeout, there is no way to set pretimeout, 
> so pretimeout will never be processed in softdog_ping(). 
> 
This is wrong. The pretimeout can be set using WDIOC_SETPRETIMEOUT, as with
every other driver supporting it. There is no need for a module parameter.

Guenter

> Here add the configuration mechanism for pretimeout and the default value
> is 1 second, so when CONFIG_SOFT_WATCHDOG_PRETIMEOUT is enabled, the 
> pretimeout function defaults available.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/watchdog/softdog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
> index 7a10962..79e52791
> --- a/drivers/watchdog/softdog.c
> +++ b/drivers/watchdog/softdog.c
> @@ -35,6 +35,14 @@ MODULE_PARM_DESC(soft_margin,
>  	"Watchdog soft_margin in seconds. (0 < soft_margin < 65536, default="
>  					__MODULE_STRING(TIMER_MARGIN) ")");
>  
> +#ifdef CONFIG_SOFT_WATCHDOG_PRETIMEOUT
> +#define PRE_TIMER_MARGIN	1		/* Default is 1 seconds */
> +static unsigned int soft_pretimeout = PRE_TIMER_MARGIN;	/* in seconds */
> +module_param(soft_pretimeout, uint, 0);
> +MODULE_PARM_DESC(soft_pretimeout,
> +	"Watchdog soft_pretimeout in seconds. (0 < soft_pretimeout < soft_margin, default=1)");
> +#endif
> +
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout,
> @@ -177,6 +185,9 @@ static struct watchdog_device softdog_dev = {
>  	.min_timeout = 1,
>  	.max_timeout = 65535,
>  	.timeout = TIMER_MARGIN,
> +#ifdef CONFIG_SOFT_WATCHDOG_PRETIMEOUT
> +	.pretimeout = PRE_TIMER_MARGIN,
> +#endif
>  };
>  
>  static int __init softdog_init(void)
> 

