Return-Path: <linux-watchdog+bounces-2249-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B249A6C25
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 16:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18165B22331
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 14:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C671F9AAD;
	Mon, 21 Oct 2024 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI/BNJJ1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984310A1E;
	Mon, 21 Oct 2024 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729521155; cv=none; b=QN7S6wTWa3TzbLWProe1ovrjNN865vpl0ACMWv2tNtrotJCeDDDH9QyvzVr62AeaDrhD6iO4LmNPHOd1M2J2PQ3EkV1KAdpVs7gRA5HkkZjTm+jlbpcAAtlMH1ZY4LtfJrRmoqHuQ1S3X0hKRrSImfmGJ8GT9mu66p8/Z1dCj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729521155; c=relaxed/simple;
	bh=SKynN7upbrcKiEHZiccdRMTRIn+MEisXuhoKQ54Y6CI=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q6LvbZMhqRYCUFA9CWPYTmM9fSUH2GUvEDNPX0MbaY0cIM7siCxSJXusVsUxNdZdS414OwPTa6u9CgXMQTBLHDrjWXTB2UL5JCVNr27Pccrk0qWLXP6IYV548N4JP8g8qCxpZBAbn7FluuWNMZmOAZP9htTpNBXDH7ss/NW296s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI/BNJJ1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so501528066b.0;
        Mon, 21 Oct 2024 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729521151; x=1730125951; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=++UZr9PQbZadTgMH/kkDDCGV7AiFsRcPEYvhoc8RkHU=;
        b=MI/BNJJ1p41EfZRrF34IJ99hj7ZoHBdPcV8cZkfXrQT7GixuipIAjZtwMochipfkMO
         taqiXi87i5abUbDpwi6NUSoAHZKTepGy7qVTfqnQZrmON0fuSR9tt08Lzq0xQEyIwlZh
         bGvmPsgcvzBX9V6M57ZbkcaemLiYa2bdQKHvjUDjRn6C/WbOKkwBT5JHSN+h3BjQ9Xko
         cDIASDj3mxCkDpuAZPtvpuhpPZXZDYfKLaty4mvML2xvHMYRA01b/YcIFK68mFEeYEP0
         yRsmZW3MHRcnm/4e7IVpabhtSNZtlLsaNaaR8z5nxj6BiYOtD3jhufYAxXkBCFFkkEi/
         FUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521151; x=1730125951;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++UZr9PQbZadTgMH/kkDDCGV7AiFsRcPEYvhoc8RkHU=;
        b=JXSI5zQWEuhgtKuuljGbEq8DQ5kZQgZ2vDLDHIR1p+l+mKoGDdbaxJKZBOIUVMq0Vd
         iJKm5TXcoliMoSLXIYg0VVR7785MYhTId8KOlbHuuh9fN13Z+K+gkdJDSqzE/jla3dFI
         c+HVx3Q5J5fLMoWgFITWBitWf2EAY7rjmo9efYOz10GuOBUSXFMnrMHKdmDCHukWq6Fv
         fGicGEr2DS4qya39nl9A81Kpc2xbNVJlp1jEWuFaxio7zZcwp30mGd3p9Ka+1nGWLK8M
         d9Ode6dafhWyvFzEk16EVujiDVca17OxG+Bm43eeeBlFX0zw9sQMejhusMxBiAE/5NHk
         PQQA==
X-Forwarded-Encrypted: i=1; AJvYcCWR0Pdv4tebmef2cQudgWiOXd80KYvNovfP3W7VSZ6WZd3SElLtGjH0HBTYQ3fYhOv1aOtbfajPdJ/QPswm@vger.kernel.org, AJvYcCWRc6HxImALyfyz40EVjua7hkoKoW+dIpvWK4wISqj9XqmzzyfokCN0Ug9epEYF4JzRE5H3dJIpTxI8XGPxf14=@vger.kernel.org, AJvYcCXmgNmtV4aQuFxgpDAbus/Wi7MkxnzmO0olJp8AxqSx/vlmlVY7pkiuyoaHpP5Boso5pgsT1DRNzXce@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4csInalIobfUaqrj5nCBi04YmnYJXgPhhpuuow7djMb2WvUA5
	qEhkXCXb1b0mok413mxvRbuvSppPmL9rbZBy5skqcLpn0XhbJi7O
X-Google-Smtp-Source: AGHT+IHFsBGfdQeumuaHld7GyjAWhQPovdu4Pq47U4znM0Gwx2Pk+r27FwnNH4GkIvp+dZhxEiN96A==
X-Received: by 2002:a17:907:724e:b0:a9a:1739:91e9 with SMTP id a640c23a62f3a-a9a69a7638emr1209590566b.24.1729521150626;
        Mon, 21 Oct 2024 07:32:30 -0700 (PDT)
Received: from [10.32.3.23] ([95.183.227.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91598f1csm210212966b.199.2024.10.21.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:32:29 -0700 (PDT)
Date: Fri, 18 Oct 2024 10:10:04 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-Id: <SKIJLS.S7FSW9OJT5K82@gmail.com>
In-Reply-To: <ccacc376-8494-4941-a4b8-dbb4d09914ee@collabora.com>
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
	<20230302124015.75546-3-y.oudjana@protonmail.com>
	<0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
	<f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
	<9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
	<WOMHLS.HLNVQWWVER5T1@gmail.com>
	<4e3545ce-5740-48b6-8c10-666548d31908@roeck-us.net>
	<ccacc376-8494-4941-a4b8-dbb4d09914ee@collabora.com>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed


On Thu, Oct 17 2024 at 17:16:54 +02:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 17/10/24 16:09, Guenter Roeck ha scritto:
>> On 10/16/24 23:43, yassine.oudjana@gmail.com wrote:
>> ...
>>>>> 
>>>>> Say I don't want to use the watchdog (which I don't, all I need 
>>>>> from TOPRGU is the resets, I don't care about the watchdog). 
>>>>> Not starting the watchdog means I can't reset the system 
>>>>> because all mtk_wdt_restart will do is make TOPRGU send me an 
>>>>> IRQ that I have no use for.
>>>> 
>>>> If you don't want to use the watchdog, then you don't need to care 
>>>> about bark
>>>> interrupts and you don't need any mtk_wdt_restart() functionality 
>>>> at all :-)
>>> 
>>> I need mtk_wdt_restart to restart my system. I shouldn't need to 
>>> take off my phone's back cover and remove the battery every time 
>>> :)
>>> 
>>>> 
>>> I think what Guenter said makes sense. We should make sure the 
>>> watchdog is started when calling mtk_wdt_restart or at least 
>>> configured in such a way that we are sure it will issue a system 
>>> reset.
>>> 
>> 
>> It is more than that. There is no limitation in the watchdog API 
>> that says
>> "you must only use the watchdog kernel driver to reset the system if 
>> the
>> watchdog has been activated from userspace". Such a limitation would 
>> be
>> completely arbitrary and not make any sense. It is perfectly fine to 
>> enable
>> the watchdog from the restart callback if needed. Actually, all 
>> restart
>> handlers in watchdog drivers have to do that if they indeed use a 
>> watchdog
>> to reset the system.
>> 
>> Actually, I am not entirely sure I understand what we are arguing 
>> about.
>> 
> 
> Guenter:
> We're arguing about bad configuration and lots of misunderstanding.
> 
> Regarding WDT_MODE_EXRST_EN: when enabled, it enables an external 
> output
> reset signal - meaning that it's going to flip the state of a GPIO to 
> active
> (high in Yassine's case - as that's configured through WDT_MODE 
> BIT(1) and
> his 0x5c means that it's flipped on), signaling to another chip 
> (usually,
> the PMIC...!) that we want to reset the system.
> 
> Explaining what Yassine is doing with this commit: he is flipping the 
> IRQ_EN
> bit [BIT(5)] in WDT_MODE.
> 
> When bit 5 *is set*, the watchdog bark event will only raise an 
> interrupt and
> will not reset the system (that's left to be done to an interrupt 
> handler in
> the driver).
> 
> When bit 5 *is NOT set*, the watchdog bark event will trigger a CPU 
> reset.
> 
> Now, my confusion came from the fact that he's trying to fix a 
> watchdog bark
> event so that it triggers system reset, but I didn't understand the 
> actual
> reason why he wants to do that - which is powering off the system!

I'm currently aiming for reboot, not poweroff. There was some point 
during development where holding the power button wasn't enough to 
force restart and I'm still not sure why that was happening but it's 
working now. That's why I was removing the battery to power it off then 
turn it on again with the power button.

> 
> 
> Yassine:
> 
> You don't *have to* rely on the watchdog to reset the system, and if 
> you use
> only that - especially on a smartphone - I'm mostly sure that you'll 
> get
> power leakage.

I did notice that when I tried poweroff. It didn't fully power off and 
eventually drained the battery. But again I'm not looking into fixing 
poweroff for the time being, I'm focusing on reboot. I'll probably ask 
you again about it when I look into fixing poweroff since you seem to 
know something about the matter.

> 
> Before you read the following - please note that this is platform 
> dependent
> so, take this with a grain of salt: it is the PMIC that should get 
> configured
> to take your system down! I have a hunch that this works for you only 
> because
> the platform will reboot, and then the bootloader will decide to turn 
> off the
> system for you by default (that, unless you send a warm reboot 
> indication).
> 
> That flow looks more like a hack than a solution for an actual 
> problem.
> 
> 
> Now - whether you want to fix your platform or not, this is out of 
> the scope
> of this commit, which is - in the end - still fixing something that 
> is wrong.
> 
> Effectively, as Guenter said, if the watchdog is never started, the 
> restart
> function is not going to reboot the system, so yes this problem needs 
> to be
> fixed.
> 
> There are two problems in this driver that can be solved with:
>  1. Disable IRQ generation when *no irq* is found in DT; and
>  2. Implement support for reboot in mtk_wdt_isr() by reading the 
> WDT_STA
>     register and by then taking appropriate actions.
> 
> Of course my preference would be N.2 because:
>  - The pretimeout way is already supported in the driver, and if you 
> specify
>    a pretimeout, then the watchdog will never trigger SYSRST->XRST: 
> this
>    is actually a bug (IMO!!), as declaring an IRQ in DT means losing 
> reset (!);
>  - The WDT_STA register tells you more than just "SW/HW watchdog 
> reset asserted"
>    and that can be extended in the future to support more than that.
> 
> However, I recognize that this may be too much work for you, so, if 
> there's no
> way for you to properly add support for N.2 - I can chime in.
> 
> As for N.1, the solution is simple: check if 
> platform_get_irq_optional fails
> and - if it does - force unsetting (WDT_MODE_IRQ_EN | 
> WDT_MODE_DUAL_EN) in
> WDT_MODE, if and only if WDT_EN is not set.. but that, in the probe 
> function!

I still honestly don't see the point in either solution. N.1 sounds 
like a hack; the interrupt should be described in DT even if we don't 
want to use it since DT is ultimately hardware description and the 
interrupt line exists whether we are using it or not. N.2 is 
unnecessarily complicating things. I mean why should we make the 
watchdog issue an interrupt then in the interrupt handler perform the 
reset? When someone calls the restart function they expect an immediate 
reset. As Guenter said we should configure the hardware to issue reset 
in the reset handler, and I believe that's what I did originally.




