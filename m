Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5277C23F2EC
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Aug 2020 21:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgHGTBA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 15:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGTBA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 15:01:00 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F50CC061756;
        Fri,  7 Aug 2020 12:01:00 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y206so1494742pfb.10;
        Fri, 07 Aug 2020 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=saLQk+mB1SUD13WmocNiXHXzR672Cu6mqFYivPpQKHw=;
        b=HAO3pCy2kEji9Lds8wW0lfaIDfrSt0SUU7AOYctfve3MUHJ+BwyKkPv02Iw81ULNRU
         VgybYfzW+NKNww+hz0u9y6n01CVc1iZlvadEY4sLSp/tiCE4YT1/UeKTxxwMzWDAyR1Y
         h20MaGHAQpJSab6T1ZEN8QXRpR99h1eIts3sYeQ5PCoZNaj4eYCB2JOpdl2Qh0WWTbmw
         17xFatieZmOlvLY8dx9IBCjmloen4NMvYHmQdpBdnXhTO6MIrAecvh2WOkFZJcCSbt4S
         GfjFsBPqnsO8rAOaEyJ6pDO9OSs3NBTQeydt8ZerdBe64KKO5OAwW5O2+x7H6uTkaPGn
         IFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=saLQk+mB1SUD13WmocNiXHXzR672Cu6mqFYivPpQKHw=;
        b=C62+4iUl19kwk0id/bW2tXOH5LgzjwfApWpr2Lk7Z+58cv2yB4EPcPCD9u+UV9a1RD
         Y7aniBFExv8konhN4HFNEM+GtQmvyvxUcddXVwqJMtKgJGbidaSYOLN2+pzC6UwiNHbk
         bCkp5lb7p57MW6aWbQ8bQv8H0xR3eAnJTsRZ3OSTRxvDIILG67oIDhOwAmY+HL32mu+B
         sd8lVN3/SDx5p32AgBJ6+imUVL9iMb3TTpuKrwK3Pg921m8SLI1wRK+trIdeweJ/ubQ6
         FWt1/Io1kRZuMV+hCuVyRe8Lk3BQyf4yl3fO809mYPVashPtSiJ6v2b4Mh1wR6TaHggG
         gQxA==
X-Gm-Message-State: AOAM532zTX9x4glcaX+CBGx+5iOPYCEJQsn0InpZN7hCxqQDJUIxE1UF
        NiUBCKDOiQgsuwnN/AAhFhc=
X-Google-Smtp-Source: ABdhPJwoFFYkyyiRbGPG2s3FpLHLUamdnqKkjtrnXXY2PZ9dZ+3WyGy+oiWXBAr0SCKFcJzkjLPWsQ==
X-Received: by 2002:a62:7785:: with SMTP id s127mr14215549pfc.196.1596826859559;
        Fri, 07 Aug 2020 12:00:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f27sm13282080pfk.217.2020.08.07.12.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 12:00:58 -0700 (PDT)
Subject: Re: [ldv-project] [PATCH] drivers: watchdog: rdc321x_wdt: Fix race
 condition bugs
To:     Evgeny Novikov <novikov@ispras.ru>,
        "madhuparnabhowmik10@gmail.com" <madhuparnabhowmik10@gmail.com>
Cc:     "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
 <20200807162141.GA41980@roeck-us.net> <507311596824581@mail.yandex.ru>
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
Message-ID: <6fb7fc90-1577-98ac-2be3-a8aa631f11ef@roeck-us.net>
Date:   Fri, 7 Aug 2020 12:00:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <507311596824581@mail.yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/7/20 11:30 AM, Evgeny Novikov wrote:
> 07.08.2020, 19:21, "Guenter Roeck" <linux@roeck-us.net>:
>> On Fri, Aug 07, 2020 at 04:59:02PM +0530, madhuparnabhowmik10@gmail.com wrote:
>>>  From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>>
>>>  In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
>>>  after misc_register(), hence if ioctl is called before its
>>>  initialization which can call rdc321x_wdt_start() function,
>>>  it will see an uninitialized value of rdc321x_wdt_device.queue,
>>>  hence initialize it before misc_register().
>>>  Also, rdc321x_wdt_device.default_ticks is accessed in reset()
>>>  function called from write callback, thus initialize it before
>>>  misc_register().
>>>
>>>  Found by Linux Driver Verification project (linuxtesting.org).
>>>
>>>  Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Having said that ... this is yet another potentially obsolete driver.
>> You are really wasting your (and, fwiw, my) time.
> 
> Static analysis tools are not aware about obsolete drivers.
> It would be great if there will be some formal way to filter them out.
> Maybe some file will enumerate all obsolete drivers, or there will be
> something within their source code, or something else.
> 

In general, all watchdog drivers not implementing the watchdog API
are effectively obsolete and should not be touched. If they are still
in use (meaning someone has a means to test them), they should be
converted to use the watchdog API instead.

Guenter
