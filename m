Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5A42AF791
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Nov 2020 18:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgKKRt1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Nov 2020 12:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgKKRt0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Nov 2020 12:49:26 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3247BC0613D1;
        Wed, 11 Nov 2020 09:49:26 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id l10so634610oom.6;
        Wed, 11 Nov 2020 09:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B2yxcAliu+rEA7dgtIDGwqpnjL9T+ErPIz7FeJL4aRE=;
        b=WGBl3+kKRHTE9UPp/K2ucBP0G5f90r53Ix9/x1KPrbemcfWyxNcL7yjslrI9FUGE+o
         F6+yoz+6MACZ9Ju4ULOitVAuoqtSzsdbyaeyw11yJAwkpck1nIgvP0jkB+polzx78q8H
         H3lks7+wQqxWASnkirAF0iFsSCZFD+nTKP7d5woDwyfVmxrDbTf4oZs2wJjWoZ6WU++P
         TlwU6p/tyYK7BW1ili4AQ9kV+P5K76uQm8U/NeAfBj8Yda1A8TfnpYYt8xe1VRs6AOk/
         Mf5pkqpMCY2aigkuoWDvpSiSdFHEu8AoqpsdWHhCDuoo0/IgmiHg/Ya+ceo//bH6hdCu
         Vhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=B2yxcAliu+rEA7dgtIDGwqpnjL9T+ErPIz7FeJL4aRE=;
        b=b57xDIINg6rQHL31KiQCYoSj9BMVLyV23de+/MNQUDZMlhc/uXAg4+c/lMK+UEYkcg
         RUw1/ezQbnrKm7Ww1FN4Tu54nTx9Oh3D29rTjWgyWuLF1d39OZwnIbdJTErFkyLx5szh
         9s5mApTjE7QLYFboDUcnsLd+yCe4klJjuadijKE3NDx8vWi8a6fh5nKJmbOtVcBdnude
         cfvIEgyPoxfoyERhCrv9BLE+yWx2vq31cva1luEDR2Duwx3u+Gh43EoXBo0+6ygANx6k
         oHQaG7ACpqHosA5gEvK+QZTA6SgjgBhl2H5fNx+WnjDlRIevHs1tH1AB+JFGHPNPYNOB
         vvfQ==
X-Gm-Message-State: AOAM533RW3q47W/oB+RNq+MRUjSS7eoFET1+PL0CvHWA5gR2p6Xiqf82
        huWm8+e4+f7Btwva8cUiuIdXWqTxUMo=
X-Google-Smtp-Source: ABdhPJzQz1Azu2GjTji3oH08jN74IbYydMPovPOQ6zOMpX/u+AMdFMJwaWVaNDjjEaUewGJ1K/TyQA==
X-Received: by 2002:a4a:b209:: with SMTP id d9mr17745894ooo.70.1605116965458;
        Wed, 11 Nov 2020 09:49:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n62sm629426ota.74.2020.11.11.09.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 09:49:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/1] watchdog: wdat_wdt: Fix missing kerneldoc reported by
 W=1
To:     vee.khee.wong@intel.com, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201111172205.17215-1-vee.khee.wong@intel.com>
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
Message-ID: <32eae86b-2242-9feb-3db0-b3bab89506ec@roeck-us.net>
Date:   Wed, 11 Nov 2020 09:49:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111172205.17215-1-vee.khee.wong@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/11/20 9:22 AM, vee.khee.wong@intel.com wrote:
> From: Wong Vee Khee <vee.khee.wong@intel.com>
> 
> Fix the following warning while compiling with W=1.
> 
> drivers/watchdog/wdat_wdt.c:48: warning: Function parameter or member 'instructions' not described in 'wdat_wdt'
> 
> Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/wdat_wdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
> index 3065dd670a18..cec7917790e5 100644
> --- a/drivers/watchdog/wdat_wdt.c
> +++ b/drivers/watchdog/wdat_wdt.c
> @@ -34,9 +34,9 @@ struct wdat_instruction {
>   * @period: How long is one watchdog period in ms
>   * @stopped_in_sleep: Is this watchdog stopped by the firmware in S1-S5
>   * @stopped: Was the watchdog stopped by the driver in suspend
> - * @actions: An array of instruction lists indexed by an action number from
> - *           the WDAT table. There can be %NULL entries for not implemented
> - *           actions.
> + * @instructions: An array of instruction lists indexed by an action number from
> + *                the WDAT table. There can be %NULL entries for not implemented
> + *                actions.
>   */
>  struct wdat_wdt {
>  	struct platform_device *pdev;
> 

