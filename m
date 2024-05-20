Return-Path: <linux-watchdog+bounces-1063-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B87E8C9CB8
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2024 13:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5ED71C21FB8
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2024 11:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FBF47F7A;
	Mon, 20 May 2024 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JnxtWrNn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B3C53384
	for <linux-watchdog@vger.kernel.org>; Mon, 20 May 2024 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716206130; cv=none; b=GG22ldxFFGMHJ198S/BXN+HfoquEDXSnT06aIYmqztDPY7pY6tycHM0y0Oa+S3SZJe5FZ+u9D29Knk++hfI0AWUKxBDCj8h0zH21auKasTWEtnatm5onZLV+jlFfgtHGr1Okttxrtt0XoycgR0LoN6QhhoXKBp6EC6bBCjIzQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716206130; c=relaxed/simple;
	bh=kEoGgqB0rzX9HUVUIPEKmyOuoLj4yGARQKNBWGYuBtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFiYxqReIu13NRrFyhC7GFFN0xrOuO3jebqTeMjgp7L4k+KCS7IGLBoOQxXDjbpp5Qf1hNo8yEXbOfDoTaoE2vYRH5wS4h0AS2X4yJ+JQyrnfwblOvemB5U8iv8xPXkDWiziXBkCJAgv1ZunwXN2IsAR0m4wkXaerWLsziIATN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JnxtWrNn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-351cda41b53so1907828f8f.2
        for <linux-watchdog@vger.kernel.org>; Mon, 20 May 2024 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1716206127; x=1716810927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J52kMpMDHoKvOAndzN0rC/vV/Kub3GsExDvSDouYLys=;
        b=JnxtWrNn/i+nS87br6CxiUNNov5H1ZeYDfntBGPoelIRMrqOGKC9e+sfZ4bNf9Uuer
         nzsxA8+ZFEBvFZEbBCt22/Jj5y4N4qs2cJmuyIugpiLJizbVUtqIi9S2wKlwP4IXAgeO
         yy0jUKxtJoahWzDC6CdEQBVD7pLvVcXD8rLZ0f8I6jeT5Ur8fya3ykB6Sbl+HKTUZI/s
         C1AAr3KehqEQNz2RrC21FTvLNu3u0tNb1uBzP4T8iONuA/YdQaWqd1K3Xwim/AUMN4Zn
         MBvh7O1NIJzsKHAX1vI6fJbwMDP2FRckNuCvN9dOLYvy4h8F8w+as59N02tLlYvnQ4B0
         BLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716206127; x=1716810927;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J52kMpMDHoKvOAndzN0rC/vV/Kub3GsExDvSDouYLys=;
        b=KPoEz8mFwvYPOFLsl9jdIs1TpYMaWTkjASpYSHnP6R0/bg+wkrfRwXw3XxQC0ngjIU
         OckaI04N9nN0rvm1F/mkyC0gHSniXpQbxY2Eir58hL2c+QYRo/VhCpxFV33gHhjf/b0W
         Ab6nV7j89bjZDbyqgi9oF4vlZlyRKWkqzyCCiCtBwAfeXnf4mpNHrXe2BSu8jPhkR5Ba
         DgrBKUco/BOQ20qoP5iLUQ36gX9KKeTLJzXvbAzvik8+faTQPG9gThJrEyOKIAQ4a3e4
         hNLpnBe2mmORqxdmSxeQc8CKeyT3Zzt1vrt8d1DO5uhFpXQ9F4molePZ4GBtQ+94IyRL
         8GQw==
X-Forwarded-Encrypted: i=1; AJvYcCU5KagOzrs6zOevmp/hXm8+SF652Dcp4mOsacO23IVkckTtQSdT/MHhPmHbzoev/wjuSIQ+zl828MHcNllDCzEgDZXS4c6lBazH4BsOt9w=
X-Gm-Message-State: AOJu0YzvS/a6iibmqPti3zrYBCmGEjTbiSfwHZfYZ3OMLiPVg3L+nyf+
	SAnqib9/NfJ5hnEstr5QcRVfwoJhSUuiJ/R5lYvUuaWyRiycaXSr6p/UpRB0JgQ=
X-Google-Smtp-Source: AGHT+IFlvSqANMGIFrY7ueIY75b5WZsPp07glKW9CXJYkzLlO1bcGTsSAd5RIIjQcSQBq4MnYIRKvQ==
X-Received: by 2002:adf:c7cb:0:b0:351:b7fa:ccbf with SMTP id ffacd0b85a97d-351b7facde5mr23107427f8f.61.1716206126884;
        Mon, 20 May 2024 04:55:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbca98sm29018734f8f.112.2024.05.20.04.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 04:55:26 -0700 (PDT)
Message-ID: <559ad243-b43b-471a-99a4-2f42e0930a64@tuxon.dev>
Date: Mon, 20 May 2024 14:55:24 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 09/10] watchdog: rzg2l_wdt: Power on the PM
 domain in rzg2l_wdt_restart()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 geert+renesas@glider.be, magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
 <20240410134044.2138310-10-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFqq+gMDHx_-g-j9rO3nBDcXRSoXRjJK9D51=VaQ5XaGvw@mail.gmail.com>
 <af9c6747-120e-48c1-8c04-9594c9b49666@tuxon.dev>
 <2d674a18-006f-4182-bc85-bcfa50615495@tuxon.dev>
 <CAPDyKFp+8VnxDfhDzvP1KWCN_oRHrVMCru9BXO_55GkF=gHUBA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAPDyKFp+8VnxDfhDzvP1KWCN_oRHrVMCru9BXO_55GkF=gHUBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ulf,

On 29.04.2024 17:19, Ulf Hansson wrote:
> On Wed, 24 Apr 2024 at 13:14, claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>>
>> Hi, Ulf,
>>
>> On 12.04.2024 17:02, claudiu beznea wrote:
>>> Hi, Ulf,
>>>
>>> On 12.04.2024 14:14, Ulf Hansson wrote:
>>>> On Wed, 10 Apr 2024 at 16:19, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The rzg2l_wdt_restart() is called from atomic context. Calling
>>>>> pm_runtime_{get_sync, resume_and_get}() or any other runtime PM resume
>>>>> APIs is not an option as it may lead to issues as described in commit
>>>>> e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait context'")
>>>>> that removed the pm_runtime_get_sync() and used directly the
>>>>> clk_prepare_enable() APIs.
>>>>>
>>>>> Starting with RZ/G3S the watchdog could be part of its own software
>>>>> controlled power domain (see the initial implementation in Link section).
>>>>> In case the watchdog is not used the power domain is off and accessing
>>>>> watchdog registers leads to aborts.
>>>>>
>>>>> To solve this the patch powers on the power domain using
>>>>> dev_pm_genpd_resume() API before enabling its clock. This is not
>>>>> sleeping or taking any other locks as the power domain will not be
>>>>> registered with GENPD_FLAG_IRQ_SAFE flags.
>>>>>
>>>>> Link: https://lore.kernel.org/all/20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>> ---
>>>>>
>>>>> Changes in v8:
>>>>> - none, this patch is new
>>>>>
>>>>>  drivers/watchdog/rzg2l_wdt.c | 12 ++++++++++++
>>>>>  1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
>>>>> index c8c20cfb97a3..98e5e9914a5d 100644
>>>>> --- a/drivers/watchdog/rzg2l_wdt.c
>>>>> +++ b/drivers/watchdog/rzg2l_wdt.c
>>>>> @@ -12,6 +12,7 @@
>>>>>  #include <linux/module.h>
>>>>>  #include <linux/of.h>
>>>>>  #include <linux/platform_device.h>
>>>>> +#include <linux/pm_domain.h>
>>>>>  #include <linux/pm_runtime.h>
>>>>>  #include <linux/reset.h>
>>>>>  #include <linux/units.h>
>>>>> @@ -164,6 +165,17 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>>>>>         struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>>>>>         int ret;
>>>>>
>>>>> +       /*
>>>>> +        * The device may be part of a power domain that is currently
>>>>> +        * powered off. We need to power it up before accessing registers.
>>>>> +        * We don't undo the dev_pm_genpd_resume() as the device need to
>>>>> +        * be up for the reboot to happen. Also, as we are in atomic context
>>>>> +        * here there is no need to increment PM runtime usage counter
>>>>> +        * (to make sure pm_runtime_active() doesn't return wrong code).
>>>>> +        */
>>>>> +       if (!pm_runtime_active(wdev->parent))
>>>>> +               dev_pm_genpd_resume(wdev->parent);
>>>>> +
>>>>
>>>> I doubt this is the correct solution, but I may be wrong. Unless this
>>>> is invoked at the syscore stage?
>>>
>>> On my case I see it invoked from kernel_restart(). As of my code reading,
>>
>> With the above explanations, do you consider calling dev_pm_genpd_resume()
>> here is still wrong?
> 
> Yes. At least, those genpd functions were not added to cope for cases like this.

Sorry to bother you, do you have some suggestions on this topic?

On my side I did some investigation to see how else it could be implemented
but I don't have much clue how to go forward.

Would you prefer to have a separate API to deal with domain power on in
this scenario? Maybe one that should run only in the reboot context?

Would you consider only updating the description of  dev_pm_genpd_resume()
and genpd_sync_power_on() to specify that it could run in a reboot context?

Would you consider updating the genpd_switch_state() to take into system
reboot state and do locking based on that, too?


> 
> Moreover, you still need to find another solution as
> clk_prepare_enable() can't be called in this path.

The clock driver doesn't implement clk_ops::prepare in all
micro-architectures that this watchdog driver is used. This may be the
reason the clk_prepare_enable() was used on this path from the beginning.

Even though, a simple solution I have in mind for this is to keep the clk
prepared all the time.

Thank you,
Claudiu Beznea

> 
>>
>> Do you have any suggestions I could try?
> 
> Not at the moment, but I will try to circle back to this topic more
> thinking next week, when I have some more time.
> 
>>
>> Thank you,
>> Claudiu Beznea
> 
> Kind regards
> Uffe
> 
>>
>>> at that point only one CPU is active with IRQs disabled (done in
>>> machine_restart()). Below is the stack trace decoded on next-20240410 with
>>> this series
>>> (https://lore.kernel.org/all/20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com/)
>>> on top and the one from here (adding power domain support):
>>> https://lore.kernel.org/all/20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com/
>>>
>>> Hardware name: Renesas SMARC EVK version 2 based on r9a08g045s33 (DT)
>>> Call trace:
>>> dump_backtrace (arch/arm64/kernel/stacktrace.c:319)
>>> show_stack (arch/arm64/kernel/stacktrace.c:326)
>>> dump_stack_lvl (lib/dump_stack.c:117)
>>> dump_stack (lib/dump_stack.c:124)
>>> rzg2l_wdt_restart (drivers/watchdog/rzg2l_wdt.c:180)
>>> watchdog_restart_notifier (drivers/watchdog/watchdog_core.c:188)
>>> atomic_notifier_call_chain (kernel/notifier.c:98 kernel/notifier.c:231)
>>> do_kernel_restart (kernel/reboot.c:236)
>>> machine_restart (arch/arm64/kernel/process.c:145)
>>> kernel_restart (kernel/reboot.c:287)
>>> __do_sys_reboot (kernel/reboot.c:755)
>>> __arm64_sys_reboot (kernel/reboot.c:715)
>>> invoke_syscall (arch/arm64/include/asm/current.h:19
>>> arch/arm64/kernel/syscall.c:53)
>>> el0_svc_common.constprop.0 (include/linux/thread_info.h:127
>>> arch/arm64/kernel/syscall.c:141)
>>> do_el0_svc (arch/arm64/kernel/syscall.c:153)
>>> el0_svc (arch/arm64/include/asm/irqflags.h:56
>>> arch/arm64/include/asm/irqflags.h:77 arch/arm64/kernel/entry-common.c:165
>>> arch/arm64/kernel/entry-common.c:178 arch/arm64/kernel/entry-common.c:713)
>>> el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:731)
>>> el0t_64_sync (arch/arm64/kernel/entry.S:598)
>>>
>>> The watchdog restart handler is added in restart_handler_list and this list
>>> is invoked though do_kernel_restart(). As of my code investigation the
>>> restart_handler_list is invoked only though do_kernel_restart() and only
>>> though the stack trace above.
>>>
>>> Thank you,
>>> Claudiu Beznea
>>>
>>>>
>>>>>         clk_prepare_enable(priv->pclk);
>>>>>         clk_prepare_enable(priv->osc_clk);
>>>>>
>>>>> --
>>>>> 2.39.2
>>>>>
>>>>>
>>>>
>>>> Can you redirectly me to the complete series, so I can have a better
>>>> overview of the problem?
>>>
>>> This is the series that adds power domain support for RZ/G3S SoC:
>>> https://lore.kernel.org/all/20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com/
>>>
>>> This is the series that adds watchdog support for RZ/G3S SoC:
>>> https://lore.kernel.org/all/20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com/
>>>
>>> Thank you for your review,
>>> Claudiu Beznea
>>>
>>>>
>>>> Kind regards
>>>> Uffe

