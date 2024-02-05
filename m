Return-Path: <linux-watchdog+bounces-588-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE418493BD
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Feb 2024 07:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4FC1B20B0C
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Feb 2024 06:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68E1BE66;
	Mon,  5 Feb 2024 06:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fRaIQl0I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500DBE48
	for <linux-watchdog@vger.kernel.org>; Mon,  5 Feb 2024 06:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707113570; cv=none; b=gVsD7H31po0CPtfnPISZek1p8mRoEgTBUSHTGZwk583euEhzK7eO/k4grsamnouNEDJuVlg3Fq81W+e5+t/kEeOq3IQ94o8BjFY5vsjpVSBgpn6YEjOCaQK8Ir8k2QNMWomJdTHugbD9FO9rQpM6DJ4tILQExUpj4dcbHnCTfIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707113570; c=relaxed/simple;
	bh=AWjSQ6dM2gKtx0a1QmVBUdvVFBwjjsRw26vaIXY9PEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1haP0ZOKQVz4h/wTI7KnBUK7z2Tzze4u5aL83WFvztxievPOgU1SW91LtJ6ni/q2d3+PMxrgddAdutv/8gmjmjxluTBlddUt5I/D27YYGIHK9vtvmM8NhucwHSTSlfGYgEMXJZNJzG2Faz50bwkARvnhHBMrurBvdwYQfFhMA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fRaIQl0I; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40fc22f372cso30468055e9.1
        for <linux-watchdog@vger.kernel.org>; Sun, 04 Feb 2024 22:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707113567; x=1707718367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdBwXVM+SOAESELO/ytwkxUYV96TJJe0V6iZHZRVYmM=;
        b=fRaIQl0InGiN8ZcqVcWINoHkUFNZdXo8aS4BA4Xe0/lZ/oE02B9wEXaSQoKD8ltyc2
         F/rWomMuGqZ9owzHmjnpbLSzBfO/fVFA/O1IdhxwHu1KHW6rjHzET1Q0I8HbhQ2c+1sn
         exdGq2TpS9CFUvxElnv8sxQkwO5rIkwvpGez4lbk6S4tLsrF1IPC1EpeW5aAVdgrM2Pf
         HN6l3hQjHbYdhJ093EDqiw3092DIREQGvWedIcJEDrHKzM2KjzLdroTZ5G3QZFQWzeXx
         zmFP9s1oVuuPYRurqyqle6iWvq6h3+ySI2DZqqWd/CZCxxzU7AXcIURc5mAMcLibQh7A
         r5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707113567; x=1707718367;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdBwXVM+SOAESELO/ytwkxUYV96TJJe0V6iZHZRVYmM=;
        b=scOs/dkVj8TOVua8mA5JP2rt/9BbYBaElYAUXSYY7ftiIXtJFTtdrY3ixJIdV8XNvD
         0Y1Zzmxrr2q7gmeTZbyz8GJ93q2sEXQJKHLpNhMXSDYF8gGthPjBvp26eNNa3zZXM4XW
         /T/LMq81rLC50QU3Mnp1LbYgwSeq6rqRDTkoTEL/1VR26ThebZF0aXTZZV2Rv/+jqd6U
         a43DGz9W2y6NHgZyAcNVfNgDN/VuvtD8R9BFcJFGACvWtPGSCUFYJa+o+SuBboMYuMft
         G7oQLxVhMEkKE3PrQ0wMIyF2dE+bAQ5Ob6OpPvYcSqisjTC9gOB8bM1VXWpyCID5XzK2
         D20A==
X-Gm-Message-State: AOJu0YyxPk3Mds1cTJUyK0/3Vfdaga7FFeZIpyEBnvWqEaluzUPztUjL
	QxR9JoYGUdPFiA1QN1cDUCl2MnK1fZtadoz3z+806u7ebD6PfAJJZME2GIMbWVM=
X-Google-Smtp-Source: AGHT+IHBl+UkMri4ML2Fx6tsedZ/8KR1gRyMF6CY+XVovF5fGEV95OwcwH6JYbJ9dCgk06wPP8xsSA==
X-Received: by 2002:a5d:47a2:0:b0:33b:4197:75dc with SMTP id 2-20020a5d47a2000000b0033b419775dcmr234935wrb.14.1707113566851;
        Sun, 04 Feb 2024 22:12:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWPhXf6VHwYhyci11Q+EWL+w6Br2kQpm3ghemyLnvqzSMQH9s0mDxe08St6xFvT3e5p7hJp4nrH/Z58MHLYA026fsUopecCJf3T8Zif/I0Dr0d26m/aJg+PdrSFH4Vz25cuWO6H2uhCrx2nOQ5ReLKsw/EtRbXwGHtS0h8S56ZxLDuKhlUVgQipc4utfxR2DwWX5Wmql6BRRBdW863eySR/zUSWc94RDP0pOTNMEz8Ho7mljzgqOssvW05c/cY7THxDxwrJy6JckAMdiYC0eiqAVJeJuw9rFEl+6V7xKvKJT43OWGY/KeBH8v8So/J7hN71BOHMfpsVuFhoOD5ChWAXeBCQGq7zV9JRInsDMTcN8cq9H7rxvf44CvMEvKrW7q0KH2E0B1652qtK6XYkqy460hKYVbd4woDjhw/Uno82ggNEJCUDtDZXLANTVaaRKOp2Zrf69K+t8KRSdqZRocpACTEGMPmRlbTEG62OImeVJInGz6V3Yf44wGugY6x+cx88eydj
Received: from [192.168.50.4] ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id v23-20020adfa1d7000000b0033b37fe0577sm2604930wrv.54.2024.02.04.22.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 22:12:46 -0800 (PST)
Message-ID: <54cd6cdb-0dc5-497b-aada-23f53aff402d@tuxon.dev>
Date: Mon, 5 Feb 2024 08:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] watchdog: rzg2l_wdt: Select PM
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org"
 <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240202075849.3422380-1-claudiu.beznea.uj@bp.renesas.com>
 <20240202075849.3422380-2-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB112694BA3A47579AE8BC1752B86422@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269B343C70AA99CBDB3BD8586422@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269FECF0067E0DC7D7CA0C986422@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TYCPR01MB11269FECF0067E0DC7D7CA0C986422@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 02.02.2024 10:29, Biju Das wrote:
>>> -----Original Message-----
>>> From: Biju Das
>>> Sent: Friday, February 2, 2024 8:03 AM
>>> Subject: RE: [PATCH v3 1/8] watchdog: rzg2l_wdt: Select PM
>>>
>>> Hi Claudiu Beznea,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: Friday, February 2, 2024 7:59 AM
>>>> Subject: [PATCH v3 1/8] watchdog: rzg2l_wdt: Select PM
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The rzg2l_wdt watchdog driver cannot work w/o CONFIG_PM=y (e.g. the
>>>> clocks are enabled though pm_runtime_* specific APIs). To avoid
>>>> building a driver that doesn't work make it depend on CONFIG_PM.
>>>>
>>>> Suggested-by: Guenter Roeck <linux@roeck-us.net>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>> Changes in v3:
>>>> - make driver depend on PM; with that the "unmet direct dependency"
>>>>   Reported-by: kernel test robot <lkp@intel.com>
>>>>   was also fixed
>>>> - adapt commit message
>>>>
>>>> Changes in v2:
>>>> - this patch is new
>>>>
>>>>  drivers/watchdog/Kconfig | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>>> index 7d22051b15a2..c9abe8f307bb 100644
>>>> --- a/drivers/watchdog/Kconfig
>>>> +++ b/drivers/watchdog/Kconfig
>>>> @@ -910,7 +910,7 @@ config RENESAS_RZN1WDT
>>>>
>>>>  config RENESAS_RZG2LWDT
>>>>  	tristate "Renesas RZ/G2L WDT Watchdog"
>>>> -	depends on ARCH_RENESAS || COMPILE_TEST
>>>> +	depends on (ARCH_RENESAS && PM) || COMPILE_TEST
>>>
>>> Since you are touching here, maybe ARCH_RZG2L?? like other RZ/G2L
>> drivers.
>>
>> Also RZ/V2M "ARCH_R9A09G011" as both these families using same driver.

Ok, I'll have another patch for that.

> 
> Also commit header it is "Depend on" not "Select"?

Ok!

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju

