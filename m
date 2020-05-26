Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3191E20FC
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 May 2020 13:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731568AbgEZLix (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 May 2020 07:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731446AbgEZLix (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 May 2020 07:38:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E82DC03E97E;
        Tue, 26 May 2020 04:38:53 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id nu7so1329593pjb.0;
        Tue, 26 May 2020 04:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Iljlr+ewe5/ZAqygu95XbTL7anNsxeZE5+R3IegUbw=;
        b=ERKvJcI5HccdMkWEC3bRhZ04fVxMBfrg3afcrYbBZLFodXreG4n+rFp/ehLg4RJaB8
         1S0r2FS3nUbXM2BHkHVd4xMVcTSL5kMnnKf11+m8ZNUixEAqmh8gUzhvXXcVPamZb5gc
         UoqlPyOnjOTsP4smJt4RR+IKD5SEAlMun9yztSqzXdb3mdoZQUT1ET3ghbueum7f38hl
         8zSRBQDNW5mS8mb2why6ny0LJCGH1i+w8x3g6iaGXdAdGV0tqlQr1lMdMViN6teHt+aS
         9jZ7n2Vd3Hlkuqf09HOMtHWfsjeQPLlWLauJZgDv1IFSDO3S9rKVv2sHdXCpHiYNMLdD
         7lAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+Iljlr+ewe5/ZAqygu95XbTL7anNsxeZE5+R3IegUbw=;
        b=UebduNrIvLeaj4B/RPa6xqrGZ+Wb0ytFbZ1aGEpKCvu3puxQDu27NhOUYuF0mqX1UQ
         z46G1pENJlB0fPP3VJvI1t4anz4w6+TzaKZqdUd24EkBqSN9Lru0Vso1GvpwzRoRb9Uu
         8jeQW4FDoeOt4sFYNFC6DGe6EAe4/k6DZNvxNH/vusatMxJUlNUuOC8Ag1OyYCI1DY71
         nS+vsgeKiCJxSLiV/N2sRUfWdYWyPHhOkq6xUkYx9hpzf22WahU1pxWaPMuvj2DTrBXT
         B01o+swuyKkSn3KCYTP00kJhOxCb2uC8cFdlWMFuEWO2UOEMTCJrb9QbW4qg21WPgg+0
         WJHQ==
X-Gm-Message-State: AOAM531A/1Sl8bOGvEnDisCE0cwTI+Vweocc410ieDtUI2MC8o63C0Gi
        mp/1ob1c3rw2G6chWoRh1zSYQCjo
X-Google-Smtp-Source: ABdhPJys3OhY5efhyCMGVx8qV5HQ9hA23P7XuvjtGIrWQXkpP16Ki1mlfSOXLUy2mQWapNMXc9GvVg==
X-Received: by 2002:a17:90b:a13:: with SMTP id gg19mr26181943pjb.49.1590493132520;
        Tue, 26 May 2020 04:38:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e19sm14760302pfn.17.2020.05.26.04.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 04:38:52 -0700 (PDT)
Subject: Re: watchdog: iTCO_wdt: cannot register miscdev on minor=130
 (err=-16).
To:     Paul Menzel <pmenzel@molgen.mpg.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        it+linux-watchdog@molgen.mpg.de
References: <a6e0f876-3a0f-49fd-7f45-715e75b6a779@molgen.mpg.de>
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
Message-ID: <95b7828b-2de2-6c29-f51d-c6d22b59d014@roeck-us.net>
Date:   Tue, 26 May 2020 04:38:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a6e0f876-3a0f-49fd-7f45-715e75b6a779@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/26/20 4:21 AM, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Linux 5.4.39 reports the watchdog messages below on a Dell PowerEdge T630 with 12x E5-2603 v4 @ 1.70GHz.
> 
>     DMI: Dell Inc. PowerEdge T630/0NT78X, BIOS 2.5.4 08/17/2017
> 
> ```
> handsomejack:~$ more /proc/version
> Linux version 5.4.39.mx64.334 (root@lol.molgen.mpg.de) (gcc version 7.5.0 (GCC)) #1 SMP Thu May 7 14:27:50 CEST 2020
> handsomejack:~$ grep TCO /boot/config-5.4.39.mx64.334
> CONFIG_NETCONSOLE=m
> CONFIG_NETCONSOLE_DYNAMIC=y
> # CONFIG_SP5100_TCO is not set
> CONFIG_ITCO_WDT=y
> CONFIG_ITCO_VENDOR_SUPPORT=y
> CONFIG_NV_TCO=y
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_EXTCON is not set
> handsomejack:~$ dmesg --level=err
> [   11.618887] watchdog: iTCO_wdt: cannot register miscdev on minor=130 (err=-16).
> [   11.627956] watchdog: iTCO_wdt: a legacy watchdog module is probably present.
> handsomejack:~$ dmesg | grep -e iTCO -e watchdog
> [   11.603138] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [   11.609888] iTCO_wdt: Found a Wellsburg TCO device (Version=2, TCOBASE=0x0460)
> [   11.618887] watchdog: iTCO_wdt: cannot register miscdev on minor=130 (err=-16).
> [   11.627956] watchdog: iTCO_wdt: a legacy watchdog module is probably present.
> [   11.636462] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
> [   11.643679] iTCO_vendor_support: vendor-support=0
> handsomejack:~$ ls -l /dev/watchdog
> crw------- 1 root root 10, 130 May 26 11:40 /dev/watchdog
> ```
> 
> Together the error and success messages are from the same module are confusing me a little. How can I find out the legacy watchdog module?
> 

/dev/watchdog is your legacy watchdog. You should also have /dev/watchdogN
(where N is a number, probably '0') which is the iTCO watchdog. The error
message refers to the inability to create /dev/watchdog because it already
exists, not to the inability to install the driver at all.

You might have some other log messages indicating which other watchdog
is installed. Otherwise you might need to use ioctls on /dev/watchdog
to determine its name. 'lsmod' might also be useful.

Guenter
