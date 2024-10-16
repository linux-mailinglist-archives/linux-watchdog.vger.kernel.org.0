Return-Path: <linux-watchdog+bounces-2222-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DA69A0ABA
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Oct 2024 14:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88F7D1C2978F
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Oct 2024 12:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3696206E71;
	Wed, 16 Oct 2024 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zuw/v+H1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30DE522A;
	Wed, 16 Oct 2024 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083090; cv=none; b=QfOz338wzxZ8xXz5pZsepe5YBsbTFfBm1ajpzOJsq4ZMGoIZaiGpOXTqw4MqAE7iUK3RQ4Pv+RvUDgeSqc10jWFGQp1pt0s19ySQEsgPe26WwtVt085Ewp3rKS3WPZegk9fKxpd5Mt+cJiZVl0OWbKe2hvcm4uEJAF7XV91Etzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083090; c=relaxed/simple;
	bh=ZZKf8QPACRZowekMZhC7FG9lH/f5iwcN2kvrPeLvuPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lc1oedC9EutYG3mNyRqbbIBvM5BVT7GLJk47fgQvQTDf7v94T09gNlhcVKLToy2fDEP6CME9kDV014t971k/Pn6+GaHYHTFL8oeuJ3hQdlssw6/LkDPhzLtsTsmPGNjTmE835JY+5Qzxn7Z8XobIIxcCiaIrQSzm97BwPcwHmXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zuw/v+H1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e625b00bcso2562153b3a.3;
        Wed, 16 Oct 2024 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729083088; x=1729687888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw/zthgp3ghBqEnsSRpEt2u1kq8lfx5zFQFEXf/umW4=;
        b=Zuw/v+H1qHbYrkQs36/MXI5vTzH0J6+VyfY2D62Sy7W8HURe1XHrIrB8D2jUA5/pQo
         1V2LV182xkQpddB6aZ6wH/SETKxGzT79bAzTL2pJMnilWHni0dDRO+UTXYKaB1w+RYg/
         36Mlt+y2hg/vYohedi02LKUskKHZPLhPYbyRbUs/zke6ZjLdk0RqE7TwczBO8u7nE/Ym
         zpRqSh/ovyd5HtK2Y4qL9QQJZpM1hGer+53ZtsRd8F/b9S7iaWk7YMeaRKuDk/dmB3Ic
         Vkbfc2ejjBBdU7J8VnJGN9iYMJl8s0fDYqWe4GUEUQIXXAEAaNnnvsccRjmuC6kA8sB1
         HU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083088; x=1729687888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw/zthgp3ghBqEnsSRpEt2u1kq8lfx5zFQFEXf/umW4=;
        b=bbnEm4p0pfT/9Zzrf7gurcRgSrS1nMuFkatrJVs6oTrpXNHbvmeOF1HQS0hRaruy6c
         8STNxuMzOogDcH6kYogKEjRRLWfKPRjG74RFQqraGFo6+BAhDBIg6by/0BA9q0l1/8De
         ico3kiXQBY2pTeId0d3zZ+9lDd/3QXJIVbc8V0erj7UqJ09GIX6hjoT+AyopRhK3GXiZ
         ErbUhrK48RwMe5wpGSzRu212+/l0US+Q3dhhk66UOOzUd2wsadU5bd+1zS3+srG6H7VE
         h3jmZK4Sy16CUbxeoHXCLTU6r2Mp+owRX53hLb/ttFr/bYKP8El5kYGkNzKB0T2hF1Jv
         upqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUidRdpohUpNoTglA8ccglPXGjfcnr/mP67iiAygTauvSSBhmZUrTBi9K92ouvh1XD37TplK7naPG/@vger.kernel.org, AJvYcCUWEREGJOymPMas52Y6GqeuBVYWIIrNG1grnj/eRvBHIMH2P6vAic4GupKnZWPCaUbfDMqDVHWC5cjKC1YJj5g=@vger.kernel.org, AJvYcCXGfi0HXB2ijYl2GLBxsvXwQabZcE6m3zUoIYTI0WQ5WBbTP/1ZrrGClRsf1mre0Xf9+EOPRJ5uqFCz+I/g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs1ggwZTSoDXiF5qQJEs2VeOloaooF2sXvto7bPSE0vniZ0/zN
	ugZGq1tSkOZuRsJX/2YNOSZayFY6ibX6bqYpe/TlcL99XQ7ti8H/
X-Google-Smtp-Source: AGHT+IE2WDEUri/0niQPSHTzuGoKqevEw+vQH/+KYN2UGRl4RxmXw2NIdVtd6cMybX5jSMSn8Pnzlw==
X-Received: by 2002:a05:6a00:c90:b0:71e:7e8e:f684 with SMTP id d2e1a72fcca58-71e7e8ef71dmr4415283b3a.9.1729083088017;
        Wed, 16 Oct 2024 05:51:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774a41a2sm2970341b3a.124.2024.10.16.05.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 05:51:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7b0d5ea4-b3a2-40f2-8762-5a828c2dc485@roeck-us.net>
Date: Wed, 16 Oct 2024 05:51:24 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
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
 <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
 <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/24 02:56, AngeloGioacchino Del Regno wrote:
> Il 16/10/24 11:26, Yassine Oudjana ha scritto:
>> On 02/03/2023 6:15 pm, AngeloGioacchino Del Regno wrote:
>>> Il 02/03/23 13:40, Yassine Oudjana ha scritto:
>>>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>>
>>>> Add support for the watchdog timer/top reset generation unit found on MT6735.
>>>> Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU assert
>>>> the SYSRST pin instead of issuing an IRQ. This change may be needed in other
>>>> SoCs as well.
>>>>
>>>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> ---
>>>>   drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>>> index a9c437598e7e..5a7a7b2b3727 100644
>>>> --- a/drivers/watchdog/mtk_wdt.c
>>>> +++ b/drivers/watchdog/mtk_wdt.c
>>>> @@ -10,6 +10,7 @@
>>>>    */
>>>>   #include <dt-bindings/reset/mt2712-resets.h>
>>>> +#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
>>>>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
>>>>   #include <dt-bindings/reset/mt7986-resets.h>
>>>>   #include <dt-bindings/reset/mt8183-resets.h>
>>>> @@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt2712_data = {
>>>>       .toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>>>>   };
>>>> +static const struct mtk_wdt_data mt6735_data = {
>>>> +    .toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
>>>> +};
>>>> +
>>>>   static const struct mtk_wdt_data mt6795_data = {
>>>>       .toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
>>>>   };
>>>> @@ -187,9 +192,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>>>>   {
>>>>       struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>>>       void __iomem *wdt_base;
>>>> +    u32 reg;
>>>>       wdt_base = mtk_wdt->wdt_base;
>>>> +    /* Enable reset in order to issue a system reset instead of an IRQ */
>>>> +    reg = readl(wdt_base + WDT_MODE);
>>>> +    reg &= ~WDT_MODE_IRQ_EN;
>>>> +    writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
>>>
>>> This is unnecessary and already done in mtk_wdt_start().
>>> If you think you *require* this snippet, you most likely misconfigured the
>>> devicetree node for your device :-)
>>
>> Ok so mtk_wdt_start is never called.
> 
> mtk_wdt_init() says
> 
>      if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
>          set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
>          mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>      }
> 
> Your bootloader starts the watchdog. This driver will set WDOG_HW_RUNNING and
> will hence prevent calling the .start() callback - that's why.
> 

FWIW, if the bootloader _doesn't_ start the watchdog, and the watchdog device
is never opened, the restart handler has to start the watchdog.

Guenter


