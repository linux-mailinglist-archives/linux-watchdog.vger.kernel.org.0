Return-Path: <linux-watchdog+bounces-2223-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A565B9A1ADB
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Oct 2024 08:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8DCC1C21172
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Oct 2024 06:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7D4192586;
	Thu, 17 Oct 2024 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWcJDhEQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E1714A91;
	Thu, 17 Oct 2024 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729147438; cv=none; b=C4r6ubNxfRqZanO1Xq5pU1I9pKElJxA3KzTfp8A7rM3Zs8hfOJLfMGuNwgjrd1H+UNRxr02n+m9VUg1TBOWA767WgMk9M3tTcidPOF9yzc4pzAefLkGh/xiKluNNvmo89NhpmR9zjzWvPMl5E8Z1vhLsf1SECjrhFjvKLHW7Hvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729147438; c=relaxed/simple;
	bh=Iz4Etax56QYWeKwlS7GNbcrEUuMkc+Ke6Ajc6SwFfxw=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHUxkk1mGl20nzkWgYjEmVa6W0RMXiOp0zsMnyKsl0T4lehiHV1133bech/RT5Glwk9vJUQmJognhOLJI7kTSNxSIS/IBYIlKdp8mcPaQW6TG1GIUJ0xaJC65Sv8NxkpBllXJiIGwrpIIMfL0p1M7XCNngfknHUPe09N2bBBSqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWcJDhEQ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c9428152c0so756032a12.1;
        Wed, 16 Oct 2024 23:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729147433; x=1729752233; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYcD/jtdAJ+4/L32a30+2vo9k1U4HQBEXCOgxpnG3RM=;
        b=EWcJDhEQBW3Delc2s7pr3Zpy1GqDECzk75azx/74QloWXukZVuMRWLVFDXCH5I4Khm
         rRdt9OIT6fdfiJhbR0NO/1I+kqHe33aiDI30cYoPBoze6hI+chJ3rJKmSaNJZ/gP23M7
         dR/ue6zm9QM8IdlKQDZAV8iYcOVtk3sfJiFF42SWL1uXpCiInsjW9xLBnyHJ3MNiQPcK
         /oKvnplukWPAm1DfaVZJA+HVD+G/7oVVOsSih+0ZTk8+pgp0ID1WuYtcTdqqDiq3DMHg
         m0xPvaDDX5Uw0lZicAq26QtAL+eUG/G/SN2FXBVRg3lStYYViIpZlyPByLeiYNbK8W+S
         oQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729147433; x=1729752233;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYcD/jtdAJ+4/L32a30+2vo9k1U4HQBEXCOgxpnG3RM=;
        b=QTeCw/DMab+6WN/+11JcDPqZQRUhV1VusdX16BA1pAtHw/tTM3li+MWEFTHkDe0uIW
         dX4A9XklklcAZE0RFORDQuqNM3C37JCDiN+WkhaCCP4tGYchXrlnE3YegE7LGld80eHV
         yk6K5DcLetnrwB0lAsSX3Pb6dMeBF41CIR86BO4SjjQNmJTU6jk6k4j5WWuEasNYSBsu
         zhqG554jUiOr4hbbWvQYOLBJmioHT5ip31uee2RKTUc3VRFgu/5M/prGFtgLlQ2DF8sV
         fw+gRHC/7ba/TuVd7+gN3OkzIVnUZHtX2cwQkZcfiRDVFPumWv3B0dKPr3ZNskgg0qgA
         t7ag==
X-Forwarded-Encrypted: i=1; AJvYcCVzJfzNBNiTG+EztDOeAcbQ8vVEBsssejTnj8f66XkZx2rrCQkdQRqjHwsqMceyYR6Qwi7DOmSW+gPJhPmSzWg=@vger.kernel.org, AJvYcCWwiT0571A7bvpFkrqjiNBXxELKH4tLE+be7B8R8iqE1aIXBYP/5W7VVvdFSR9mdHlOuhryCUIxaXXJmW1c@vger.kernel.org, AJvYcCXbj/OA3E9WSRRXgJYL+5h73A/ryzNT2zAy3pgjEzOzO+QzbJMa/5to/y5SWG4hbhozdR86480sRC32@vger.kernel.org
X-Gm-Message-State: AOJu0YwcYt8cXzF3x2h0EVCk4fxrxjG/LzCKs4YuOnxGK4LALQamr5er
	e7KvBqv6cJHHM1wgPCDn+NbzgYpKyVilCwQn1r8SQHaQPVXi6NPX
X-Google-Smtp-Source: AGHT+IFZsVgs21n7csKGlALlguHVpL+24Dw635J/TiEfmVftcGCaSNRhB5+QSoo3kSsvKr84n2LrXA==
X-Received: by 2002:a17:907:96a7:b0:a9a:6d7:9c4 with SMTP id a640c23a62f3a-a9a34d3b465mr668339966b.12.1729147433207;
        Wed, 16 Oct 2024 23:43:53 -0700 (PDT)
Received: from [10.31.14.61] ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29740e1fsm252028766b.51.2024.10.16.23.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:43:52 -0700 (PDT)
Date: Thu, 17 Oct 2024 09:43:44 +0300
From: yassine.oudjana@gmail.com
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-Id: <WOMHLS.HLNVQWWVER5T1@gmail.com>
In-Reply-To: <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
	<20230302124015.75546-3-y.oudjana@protonmail.com>
	<0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
	<f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
	<9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed


On Wed, Oct 16 2024 at 11:56:31 +02:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 16/10/24 11:26, Yassine Oudjana ha scritto:
>> On 02/03/2023 6:15 pm, AngeloGioacchino Del Regno wrote:
>>> Il 02/03/23 13:40, Yassine Oudjana ha scritto:
>>>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> 
>>>> Add support for the watchdog timer/top reset generation unit found 
>>>> on MT6735.
>>>> Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU 
>>>> assert
>>>> the SYSRST pin instead of issuing an IRQ. This change may be 
>>>> needed in other
>>>> SoCs as well.
>>>> 
>>>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> ---
>>>>   drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>> 
>>>> diff --git a/drivers/watchdog/mtk_wdt.c 
>>>> b/drivers/watchdog/mtk_wdt.c
>>>> index a9c437598e7e..5a7a7b2b3727 100644
>>>> --- a/drivers/watchdog/mtk_wdt.c
>>>> +++ b/drivers/watchdog/mtk_wdt.c
>>>> @@ -10,6 +10,7 @@
>>>>    */
>>>>   #include <dt-bindings/reset/mt2712-resets.h>
>>>> +#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
>>>>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
>>>>   #include <dt-bindings/reset/mt7986-resets.h>
>>>>   #include <dt-bindings/reset/mt8183-resets.h>
>>>> @@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt2712_data = {
>>>>       .toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>>>>   };
>>>> +static const struct mtk_wdt_data mt6735_data = {
>>>> +    .toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
>>>> +};
>>>> +
>>>>   static const struct mtk_wdt_data mt6795_data = {
>>>>       .toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
>>>>   };
>>>> @@ -187,9 +192,15 @@ static int mtk_wdt_restart(struct 
>>>> watchdog_device *wdt_dev,
>>>>   {
>>>>       struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>>>       void __iomem *wdt_base;
>>>> +    u32 reg;
>>>>       wdt_base = mtk_wdt->wdt_base;
>>>> +    /* Enable reset in order to issue a system reset instead of 
>>>> an IRQ */
>>>> +    reg = readl(wdt_base + WDT_MODE);
>>>> +    reg &= ~WDT_MODE_IRQ_EN;
>>>> +    writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
>>> 
>>> This is unnecessary and already done in mtk_wdt_start().
>>> If you think you *require* this snippet, you most likely 
>>> misconfigured the
>>> devicetree node for your device :-)
>> 
>> Ok so mtk_wdt_start is never called.
> 
> mtk_wdt_init() says
> 
> 	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
> 		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
> 		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
> 	}
> 
> Your bootloader starts the watchdog. This driver will set 
> WDOG_HW_RUNNING and
> will hence prevent calling the .start() callback - that's why.

It doesn't.

WDT_MODE reads 0x5c in mtk_wdt_init if you want to see exactly how the 
bootloader is configuring it.

> 
>> I'm still not quite sure how the watchdog works but it seems to me 
>> like it's supposed to be started from userspace.
> 
> No, it's not meant to be just only used in userspace.
> 
>> I also see some drivers calling it in probe.
>> 
>> Say I don't want to use the watchdog (which I don't, all I need from 
>> TOPRGU is the resets, I don't care about the watchdog). Not 
>> starting the watchdog means I can't reset the system because all 
>> mtk_wdt_restart will do is make TOPRGU send me an IRQ that I have 
>> no use for.
> 
> If you don't want to use the watchdog, then you don't need to care 
> about bark
> interrupts and you don't need any mtk_wdt_restart() functionality at 
> all :-)

I need mtk_wdt_restart to restart my system. I shouldn't need to take 
off my phone's back cover and remove the battery every time :)

> 
I think what Guenter said makes sense. We should make sure the watchdog 
is started when calling mtk_wdt_restart or at least configured in such 
a way that we are sure it will issue a system reset.




