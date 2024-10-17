Return-Path: <linux-watchdog+bounces-2226-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2889A2714
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Oct 2024 17:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0956282732
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Oct 2024 15:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1611DE8AE;
	Thu, 17 Oct 2024 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd8uU3PG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698C71DED6D;
	Thu, 17 Oct 2024 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179579; cv=none; b=HTfH4mp7FzqZi35FkIE+YRki2doPGHT7i80SNgNboPC74QNxCNsqzKrY8WVAjXhLnf65k+b5acEJ8717cqOHsttox2dzDsCSxAkJQHQHf4oIdHPiA8sBSHcWNekXTkaTllgl4vz0t/bpQ9SXLIFeGHq9X9EWiH/9dJB9K5NaQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179579; c=relaxed/simple;
	bh=KyVTTejXbhCBNLR7khPJoR8Bam5/0xPMRGTtfLh+2H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2iR30c5/2irQTbeNXwiVWbfMM14yaHTugDLEFtKQgvPm/nsfeEd/IX0ILq22Kx21laf+s+XMdcWZrDfbgBzUZVZ4qSunmjXDHKaB0HhVgifqivBDpxvmlLKWGEOf+nbOWJY5AX2YVyDQLUhmys6kJmPXXZOctSq+YxyXU6ronM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd8uU3PG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2e2d09decso1673623a91.1;
        Thu, 17 Oct 2024 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729179577; x=1729784377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VvAga5xwX0rRxvDHmLIo8Qf/bzcjf1eWW7j9B0AUwng=;
        b=Qd8uU3PGy2J1H+e6jRFNSLMCmnVY8wBHsHkyClNIXe3d4nzhDSy29b3KY3DeSCQF4I
         0qqO22VV85xaXWtu601zMCEAfMbRsffizH17woeCxg+8ZkhUM5heTFUBN1eEOCFO5b76
         50i1QJNKUlQ4k8OBbtTDPpyZ1Ma+jPXH19+ak4n68ssyZ7Hbmxd6QGxps90nXzos+QVO
         2RpoW4GC+QSfIgF9A26CZzFO/nmt56ME1oIIKCrkzDxpDc3H8FrntmDzy7xELE2LFtmn
         aU+/C3l++vj/y8L6/jgwKWlsVoKHzoKpEvthIWKD/XS9VWN0+uWFO60s5v17inQpUsEK
         AMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729179577; x=1729784377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvAga5xwX0rRxvDHmLIo8Qf/bzcjf1eWW7j9B0AUwng=;
        b=D1CbETTD8wIb5eTybaUD14Smwkx8aH9BTltIiYTvXGawJhbHl0XJwCJhi9Zy3UF2U8
         eSC39uZxhnVzfBFDvlJIJVO3l69S/GiSOXck7nzsVV1V05u5elsAErHZqZQr/2TxYLcc
         Rs9zEq8/GMLx38QyKTKptrmONvTxqnFHUg/JhKl98zu6SxjOIkWiVO5xR8zf2xSY7cgM
         6yidAZCKeI63MbXxZLeb54yGe99dEHSCExUsEu7q5vXGPm8txLjElLiGeyrV7+SoSwfu
         rHtzOdz3jeBqpdOEWJeGcCeEJTHz+Etx+TKpobrnFeGlNQ51A+V/UyuMiwUkALHhFVeH
         jJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCV6c/vQ/tvm6vQnccuUIaq+sX6yshJ4C6Tq+HcpY6S1hpOOGkfo0oKjcVuE6se6/nI12YGJXPYdb2y4JnGf@vger.kernel.org, AJvYcCW3r2CH/5w0aoLwwQ3FQ6GE62bbwzYeq/pgdwSBQ67URRnc73OcBDMW5oiz42l/t+V49NZtxJtQyUCe@vger.kernel.org, AJvYcCW5csYQR9Gsc7oLECVam0ZhekbSuPQfRt9OJvPs7STZFhWBZJ7etGGfXLDoQopzqYaJeXV/BMfu1pWjc0VmEH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+SY+swWKI3UP1ztSJKfCozZNaL8SoUCPMClNS00WpSUlUAogm
	A+Be0yOKvSIZguVA8C/KkDYY6SGpdMG1iEvsb2DXRFWWWR3c66yT
X-Google-Smtp-Source: AGHT+IFVD+4JI4wY3+UA4f0Iqjz1YCMgk/L4NjXO6qa+RYzrrWbfExF5A8c2gn5O0jFKuON3XLfTJw==
X-Received: by 2002:a17:90b:4c12:b0:2d8:a744:a81c with SMTP id 98e67ed59e1d1-2e3dc1d9a5cmr5589204a91.1.1729179576631;
        Thu, 17 Oct 2024 08:39:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08c0484sm2104423a91.13.2024.10.17.08.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 08:39:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <14eb9404-a71c-4f8f-a808-8d3c1cf50c49@roeck-us.net>
Date: Thu, 17 Oct 2024 08:39:34 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yassine.oudjana@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-3-y.oudjana@protonmail.com>
 <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
 <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
 <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
 <WOMHLS.HLNVQWWVER5T1@gmail.com>
 <4e3545ce-5740-48b6-8c10-666548d31908@roeck-us.net>
 <ccacc376-8494-4941-a4b8-dbb4d09914ee@collabora.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ccacc376-8494-4941-a4b8-dbb4d09914ee@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/17/24 08:16, AngeloGioacchino Del Regno wrote:
> Il 17/10/24 16:09, Guenter Roeck ha scritto:
>> On 10/16/24 23:43, yassine.oudjana@gmail.com wrote:
>> ...
>>>>>
>>>>> Say I don't want to use the watchdog (which I don't, all I need from TOPRGU is the resets, I don't care about the watchdog). Not starting the watchdog means I can't reset the system because all mtk_wdt_restart will do is make TOPRGU send me an IRQ that I have no use for.
>>>>
>>>> If you don't want to use the watchdog, then you don't need to care about bark
>>>> interrupts and you don't need any mtk_wdt_restart() functionality at all :-)
>>>
>>> I need mtk_wdt_restart to restart my system. I shouldn't need to take off my phone's back cover and remove the battery every time :)
>>>
>>>>
>>> I think what Guenter said makes sense. We should make sure the watchdog is started when calling mtk_wdt_restart or at least configured in such a way that we are sure it will issue a system reset.
>>>
>>
>> It is more than that. There is no limitation in the watchdog API that says
>> "you must only use the watchdog kernel driver to reset the system if the
>> watchdog has been activated from userspace". Such a limitation would be
>> completely arbitrary and not make any sense. It is perfectly fine to enable
>> the watchdog from the restart callback if needed. Actually, all restart
>> handlers in watchdog drivers have to do that if they indeed use a watchdog
>> to reset the system.
>>
>> Actually, I am not entirely sure I understand what we are arguing about.
>>
> 
> Guenter:
> We're arguing about bad configuration and lots of misunderstanding.
> 
> Regarding WDT_MODE_EXRST_EN: when enabled, it enables an external output
> reset signal - meaning that it's going to flip the state of a GPIO to active
> (high in Yassine's case - as that's configured through WDT_MODE BIT(1) and
> his 0x5c means that it's flipped on), signaling to another chip (usually,
> the PMIC...!) that we want to reset the system.
> 
> Explaining what Yassine is doing with this commit: he is flipping the IRQ_EN
> bit [BIT(5)] in WDT_MODE.
> 
> When bit 5 *is set*, the watchdog bark event will only raise an interrupt and
> will not reset the system (that's left to be done to an interrupt handler in
> the driver).
> 
> When bit 5 *is NOT set*, the watchdog bark event will trigger a CPU reset.
> 
> Now, my confusion came from the fact that he's trying to fix a watchdog bark
> event so that it triggers system reset, but I didn't understand the actual
> reason why he wants to do that - which is powering off the system!
> 
> 
> Yassine:
> 
> You don't *have to* rely on the watchdog to reset the system, and if you use
> only that - especially on a smartphone - I'm mostly sure that you'll get
> power leakage.
> 
> Before you read the following - please note that this is platform dependent
> so, take this with a grain of salt: it is the PMIC that should get configured
> to take your system down! I have a hunch that this works for you only because
> the platform will reboot, and then the bootloader will decide to turn off the
> system for you by default (that, unless you send a warm reboot indication).
> 
> That flow looks more like a hack than a solution for an actual problem.
> 
> 
> Now - whether you want to fix your platform or not, this is out of the scope
> of this commit, which is - in the end - still fixing something that is wrong.
> 
> Effectively, as Guenter said, if the watchdog is never started, the restart
> function is not going to reboot the system, so yes this problem needs to be
> fixed.
> 
> There are two problems in this driver that can be solved with:
>   1. Disable IRQ generation when *no irq* is found in DT; and
>   2. Implement support for reboot in mtk_wdt_isr() by reading the WDT_STA
>      register and by then taking appropriate actions.
> 

That won't work because interrupts are likely disabled when the reset callback
executes. The reset handler must not depend on an interrupt. It has to be
self-contained: It has to configure the hardware to issue a reset.
On some systems, that is done by setting the watchdog timeout to a really low value
and enabling it. Others have a special configuration in the watchdog register set
which triggers a reset immediately. If the hardware supports pretimeout, that would
have to be disabled because the idea is to trigger a reset signal, not an interrupt.

To repeat, setting up the system and then waiting for an interrupt to do something
defeats the purpose of the reset handler, which is to issue a reset signal.
Somehow. If that can be done from an interrupt handler, it can and should be done
immediately instead.

> Of course my preference would be N.2 because:
>   - The pretimeout way is already supported in the driver, and if you specify
>     a pretimeout, then the watchdog will never trigger SYSRST->XRST: this
>     is actually a bug (IMO!!), as declaring an IRQ in DT means losing reset (!);
>   - The WDT_STA register tells you more than just "SW/HW watchdog reset asserted"
>     and that can be extended in the future to support more than that.
> 
> However, I recognize that this may be too much work for you, so, if there's no
> way for you to properly add support for N.2 - I can chime in.
> 
> As for N.1, the solution is simple: check if platform_get_irq_optional fails
> and - if it does - force unsetting (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN) in
> WDT_MODE, if and only if WDT_EN is not set.. but that, in the probe function!
> 

All that should be configured in the reset handler. It has to disable interrupts
even if there is interrupt support because that is not what is wanted at this point.

Thanks,
Guenter


