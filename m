Return-Path: <linux-watchdog+bounces-2220-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 548309A0572
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Oct 2024 11:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 041F6282E3D
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Oct 2024 09:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16484205E02;
	Wed, 16 Oct 2024 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1BXvJrO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B54E204F88;
	Wed, 16 Oct 2024 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070796; cv=none; b=hZ19MjWyRe4WBddI+f4yPQoJ90plbreZiQc1CZyd/xitkhDjVuGmZCJDPZkDoNRPtmAyX67g5hY862QEDUffddv4ZgpRSf7FX0ZHrgiwRMfLbzTUQ4LyslAeSvc2f7KHVizjckUjJLmr9ivBSafFgPQIg35EckdbNuMgFTN4Ve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070796; c=relaxed/simple;
	bh=xbv8g/d+YBrSH2U04+r+NIqzL9Cm0yWo2vxM2Km/75A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fqg2fUW48Ps6XmVxulPxaqNPMle+Npdv6LaI2hE2wcCLbpI38wbIpvtec8LkrCK6PrUOyCFtPR7eJ0BG8men3LnSOBbZ3JVmDK8D8C6d+QehRzn3yuaVRym2Wdgx3FSr/0LqB75jTJUVOJx/QMcpZHwjWD9qN1GNBxAyXIUrYUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1BXvJrO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a16b310f5so379478766b.0;
        Wed, 16 Oct 2024 02:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729070793; x=1729675593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMaOQqtMK7dh5z6AqS9oePkZV37kLn6/iI4c+MM8NYw=;
        b=I1BXvJrOyn5iKAaj9SV9QTzEf6yRC4p00uSN1RFBpCMgxH52l0LIdtyUETs3Vv9WHk
         W5pCYy1Jt8RGSeYJS2mc3iUrmPBcHCRfwiS4O28fBsggz2hRRb7/t9LToHysDLspeWKC
         sBHcAA418ebdr1h8tLK6iOO0trr0qKHPJF/nnowW6hW6FuDjMtkIZ/8T4Ly7E700iL61
         bPzWGQm2I2IxtxjLq6mXDdUYhjhHGf3xK6kgOgdNMlt8z49Cjx36O9LcMTnN83lhfgnI
         gAAmiZE7/g6IrfFR8Ekwdlaizo+BzZRvxteUTuSva/wPPfpIBaI5zY0CLuqK0u2D2rxA
         mFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070793; x=1729675593;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMaOQqtMK7dh5z6AqS9oePkZV37kLn6/iI4c+MM8NYw=;
        b=QEbMkJR9215u2g8ZWhnPeEoOsSoUnnFt1B5GJUF0vzATSvNjDhevmQmxWAs192pjLc
         FoMW9FWkXyifHx0EfG0sHcJkiWhXKY1lywYjpvegXMdYuHqwh+QSbU6TrI3jnN1o6xM5
         FZU4t25FWB+Wquaov3ba3OkrQ2+ZyGB4FVIIG6AJmzaR4DZmp/gC4ZzDdpoLMkWGH44A
         0ULxWNerFS9zWl9nBGhwj7bO4hzBKj/VZitytbdTugSOa0qpvHhQWIpHZ0on742LVOao
         PEW8/IUNjwgKYgy9xwczng883WqJPJ/jtYqDFm8ow1cbTl6OS74+UmSXmXM/0tBEiJwl
         /5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUBvij4Jw3PK6eqhpoaamyHfnRaonEUxrGa0ZPdbyf88NhUwyzRyREWjrjjaXpnLJBx8YGvxAG3XIyC@vger.kernel.org, AJvYcCWIsmApHFdjVdBvn5NU95EYNpCZ8sqRCkRPMDvvQCFRcI1o2Ph3jnKHsmWMsCHPgo/RkN2grwUgnjGoySk2@vger.kernel.org, AJvYcCXl+WtUJDwT4UMIKsw3sZreF0eYJyJRMavVdSqdHomU7cO0PkkiS3rStgzabaxSG5SfOnvT9qNczBmFYC9B41w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/X2y2ZT3ax1wcWjgmohLmvB3GSVagrjLcHAGn8RbGHSqtKjtI
	vtXIZvMSLUNbWrpfKDxzLnp1xCB8+GDloVvm1X0JZiIASPt++ZGO
X-Google-Smtp-Source: AGHT+IHMzxBtdEjtVgLCn4hmoAnv2sE5tdGFWFFOdsQvOO0VupDmPCb8kIWiZ+cHK0TgZ/yPcT5P7A==
X-Received: by 2002:a17:907:3fa0:b0:a99:f9e6:1d0 with SMTP id a640c23a62f3a-a99f9e61f50mr1161706966b.27.1729070792226;
        Wed, 16 Oct 2024 02:26:32 -0700 (PDT)
Received: from [10.34.14.228] ([95.183.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a298170fesm165347266b.142.2024.10.16.02.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 02:26:31 -0700 (PDT)
Message-ID: <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
Date: Wed, 16 Oct 2024 12:26:26 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-3-y.oudjana@protonmail.com>
 <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
Content-Language: en-US
In-Reply-To: <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/03/2023 6:15 pm, AngeloGioacchino Del Regno wrote:
> Il 02/03/23 13:40, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Add support for the watchdog timer/top reset generation unit found on 
>> MT6735.
>> Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU assert
>> the SYSRST pin instead of issuing an IRQ. This change may be needed in 
>> other
>> SoCs as well.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>> index a9c437598e7e..5a7a7b2b3727 100644
>> --- a/drivers/watchdog/mtk_wdt.c
>> +++ b/drivers/watchdog/mtk_wdt.c
>> @@ -10,6 +10,7 @@
>>    */
>>   #include <dt-bindings/reset/mt2712-resets.h>
>> +#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
>>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
>>   #include <dt-bindings/reset/mt7986-resets.h>
>>   #include <dt-bindings/reset/mt8183-resets.h>
>> @@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt2712_data = {
>>       .toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>>   };
>> +static const struct mtk_wdt_data mt6735_data = {
>> +    .toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
>> +};
>> +
>>   static const struct mtk_wdt_data mt6795_data = {
>>       .toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
>>   };
>> @@ -187,9 +192,15 @@ static int mtk_wdt_restart(struct watchdog_device 
>> *wdt_dev,
>>   {
>>       struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>       void __iomem *wdt_base;
>> +    u32 reg;
>>       wdt_base = mtk_wdt->wdt_base;
>> +    /* Enable reset in order to issue a system reset instead of an 
>> IRQ */
>> +    reg = readl(wdt_base + WDT_MODE);
>> +    reg &= ~WDT_MODE_IRQ_EN;
>> +    writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> 
> This is unnecessary and already done in mtk_wdt_start().
> If you think you *require* this snippet, you most likely misconfigured the
> devicetree node for your device :-)

Ok so mtk_wdt_start is never called. I'm still not quite sure how the 
watchdog works but it seems to me like it's supposed to be started from 
userspace. I also see some drivers calling it in probe.

Say I don't want to use the watchdog (which I don't, all I need from 
TOPRGU is the resets, I don't care about the watchdog). Not starting the 
watchdog means I can't reset the system because all mtk_wdt_restart will 
do is make TOPRGU send me an IRQ that I have no use for. According to 
the datasheet, setting WDT_MODE_IRQ_EN configures TOPRGU to send an IRQ 
on system reset event (either watchdog timeout or software watchdog 
reset) while clearing it makes it actually issue a system reset. What 
can I do in this case?

