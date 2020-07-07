Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A0F216C0E
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jul 2020 13:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgGGLrK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jul 2020 07:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgGGLrJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jul 2020 07:47:09 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31CFC061755
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Jul 2020 04:47:09 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id z5so19890845pgb.6
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Jul 2020 04:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SYiExkGaj8ChzOjKtRmCIUhDqCYi0gNGJig9nLjegqI=;
        b=mTrI8JgGh25rWNtBrT0Ee68mqeAR6nBIx7YUJ5USKTIbJcsjL/TmLvDiW2ShYpz0Cm
         RZsTI45RCoYjwd7jVhd58tjeqcHJWXP+v6VWogIzxpOEfbMQsTWF2PrIoH/U3HW0ykys
         hRL9tam/jjsbWdqVJLz21KtEBgD4GtSkQzppdWebzKY6NLqIpr0P0aZ0W2erMyDYJcvd
         k738f7Y8THSTzyeVMOuQ6h0qDK0izdqdtwBJIhf1DZEGdsTM0AI7dIJ+pjb9xBgJiDtQ
         vW0ZY6IhGXXrw0SIZdzomDXJ2RDdZKZqfpsB8kobxEsbBHUuDkSjT55W2bPFRQKoroi0
         549w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SYiExkGaj8ChzOjKtRmCIUhDqCYi0gNGJig9nLjegqI=;
        b=CCaSG/0sNepIEb9EHiBbQ80Qfzw+9SNig1OVO9eoC5b4Y8uPUUcLPfuP689tfTcVD0
         pFeI/cx+dPvPmd6QnyQwtjkhvXYzqoNQKNn4N5aBuBR2fuzlEC/AmG1F1km21BNN1LnV
         EMLoi6OPIvgULuyt+RsHBKLlsJ9Ui7C3DLVR0Trwz+PzUK2rAJC0wqSIyr14JxZQl9qa
         n+owO/ZMkJ0UdTXRDNHHI5/uSbpv0IchcIvQTEXyClez93SrmCMvarTtQUvxrPmHN/XH
         19VMWvJykBN0qwP16bdsnCbyB+5rO3vZq9pO4QJfAhMEKnPOILY97jirBtUTE9E1xijb
         Bw4w==
X-Gm-Message-State: AOAM5337RAU47qz44OgVpLsGbEmKX/xyzpUspuaMAwt8CVv4vmXzYi1P
        yRXxKb2zGbtRhXBDWKCYYQFi+j/cM1U=
X-Google-Smtp-Source: ABdhPJxtp/8fXZOyUWSprCYCw5ZaOrwho0n6t2fxhigtEB3evuQ+VaxurOWH+sBFZXKojUZPI89faQ==
X-Received: by 2002:a63:4957:: with SMTP id y23mr1975849pgk.230.1594122429078;
        Tue, 07 Jul 2020 04:47:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y24sm16346426pfp.217.2020.07.07.04.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 04:47:08 -0700 (PDT)
Subject: Re: [PATCH v3] softdog: Add options 'soft_reboot_cmd' and
 'soft_active_on_boot'
To:     Woody Lin <woodylin@google.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <20200701110339.2833449-1-woodylin@google.com>
 <20200707040356.GA213018@roeck-us.net>
 <CAHn4DedP=r0UwN4bn=A3nH_2bcEFA24SEYSq4gJUcC9w9p0UKQ@mail.gmail.com>
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
Message-ID: <8e16b12c-1097-dea7-32d7-f3381568407a@roeck-us.net>
Date:   Tue, 7 Jul 2020 04:47:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHn4DedP=r0UwN4bn=A3nH_2bcEFA24SEYSq4gJUcC9w9p0UKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/7/20 1:46 AM, Woody Lin wrote:
> On Tue, Jul 7, 2020 at 12:04 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Wed, Jul 01, 2020 at 07:03:40PM +0800, Woody Lin wrote:
>>> Add module parameters 'soft_reboot_cmd' and 'soft_active_on_boot' for
>>> customizing softdog configuration; config reboot command by assigning
>>> soft_reboot_cmd, and set soft_active_on_boot to start up softdog
>>> timer at module initialization stage.
>>>
>>> Signed-off-by: Woody Lin <woodylin@google.com>
>>> ---
>>>  drivers/watchdog/softdog.c | 56 ++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
>>> index 3e4885c1545e..8c8d214b6aa7 100644
>>> --- a/drivers/watchdog/softdog.c
>>> +++ b/drivers/watchdog/softdog.c
>>> @@ -20,11 +20,13 @@
>>>  #include <linux/hrtimer.h>
>>>  #include <linux/init.h>
>>>  #include <linux/kernel.h>
>>> +#include <linux/kthread.h>
>>>  #include <linux/module.h>
>>>  #include <linux/moduleparam.h>
>>>  #include <linux/reboot.h>
>>>  #include <linux/types.h>
>>>  #include <linux/watchdog.h>
>>> +#include <linux/workqueue.h>
>>>
>>>  #define TIMER_MARGIN 60              /* Default is 60 seconds */
>>>  static unsigned int soft_margin = TIMER_MARGIN;      /* in seconds */
>>> @@ -49,11 +51,33 @@ module_param(soft_panic, int, 0);
>>>  MODULE_PARM_DESC(soft_panic,
>>>       "Softdog action, set to 1 to panic, 0 to reboot (default=0)");
>>>
>>> +static char *soft_reboot_cmd;
>>> +module_param(soft_reboot_cmd, charp, 0000);
>>> +MODULE_PARM_DESC(soft_reboot_cmd,
>>> +     "Set reboot command. Emergency reboot takes place if unset");
>>> +
>>> +static bool soft_active_on_boot;
>>> +module_param(soft_active_on_boot, bool, 0000);
>>> +MODULE_PARM_DESC(soft_active_on_boot,
>>> +     "Set to true to active Softdog on boot (default=false)");
>>> +
>>>  static struct hrtimer softdog_ticktock;
>>>  static struct hrtimer softdog_preticktock;
>>>
>>> +static int reboot_kthread_fn(void *data)
>>> +{
>>> +     kernel_restart(soft_reboot_cmd);
>>> +     return -EPERM; /* Should not reach here */
>>> +}
>>> +
>>> +static void reboot_work_fn(struct work_struct *unused)
>>> +{
>>> +     kthread_run(reboot_kthread_fn, NULL, "softdog_reboot");
>>> +}
>>> +
>>>  static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
>>>  {
>>> +     static bool soft_reboot_fired;
>>
>> Per coding style there should be an empty line here.
> 
> Ack.
> 
>>
>>>       module_put(THIS_MODULE);
>>>       if (soft_noboot) {
>>>               pr_crit("Triggered - Reboot ignored\n");
>>> @@ -62,6 +86,33 @@ static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
>>>               panic("Software Watchdog Timer expired");
>>>       } else {
>>>               pr_crit("Initiating system reboot\n");
>>> +             if (!soft_reboot_fired && soft_reboot_cmd != NULL) {
>>> +                     static DECLARE_WORK(reboot_work, reboot_work_fn);
>>> +                     /*
>>> +                      * The 'kernel_restart' is a 'might-sleep' operation.
>>> +                      * Also, executing it in system-wide workqueues blocks
>>> +                      * any driver from using the same workqueue in its
>>> +                      * shutdown callback function. Thus, we should execute
>>> +                      * the 'kernel_restart' in a standalone kernel thread.
>>> +                      * But since starting a kernel thread is also a
>>> +                      * 'might-sleep' operation, so the 'reboot_work' is
>>> +                      * required as a launcher of the kernel thread.
>>> +                      *
>>> +                      * After request the reboot, restart the timer to
>>> +                      * schedule an 'emergency_restart' reboot after
>>> +                      * 'TIMER_MARGIN' seconds. It's because if the softdog
>>> +                      * hangs, it might be because of scheduling issues. And
>>> +                      * if that is the case, both 'schedule_work' and
>>> +                      * 'kernel_restart' may possibly be malfunctional at the
>>> +                      * same time.
>>> +                      */
>>> +                     soft_reboot_fired = true;
>>> +                     schedule_work(&reboot_work);
>>> +                     hrtimer_add_expires_ns(timer,
>>> +                                     (u64)TIMER_MARGIN * NSEC_PER_SEC);
>>> +
>>> +                     return HRTIMER_RESTART;
>>> +             }
>>>               emergency_restart();
>>>               pr_crit("Reboot didn't ?????\n");
>>>       }
>>> @@ -145,12 +196,17 @@ static int __init softdog_init(void)
>>>               softdog_preticktock.function = softdog_pretimeout;
>>>       }
>>>
>>> +     if (soft_active_on_boot)
>>> +             softdog_ping(&softdog_dev);
>>> +
>>>       ret = watchdog_register_device(&softdog_dev);
>>>       if (ret)
>>>               return ret;
>>>
>>>       pr_info("initialized. soft_noboot=%d soft_margin=%d sec soft_panic=%d (nowayout=%d)\n",
>>>               soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
>>> +     pr_info("             soft_reboot_cmd=%s soft_active_on_boot=%d\n",
>>> +             soft_reboot_cmd, soft_active_on_boot);
>>
>> soft_reboot_cmd can be NULL, which makes the output a bit awkward.
> 
> Then how about change it to something like this:
> "soft_reboot_cmd=%s", soft_reboot_cmd ?: "<null> (emergency reboot)"
> Then we will see "soft_reboot_cmd=<null> (emergency reboot)" when it's NULL.

I'd rather see something like "<not set>". "<null>" looks like an error.
Also, it isn't correct to assume emergency reboot; that is only correct
if neither soft_noboot nor soft_panic is set.

Thanks,
Guenter


