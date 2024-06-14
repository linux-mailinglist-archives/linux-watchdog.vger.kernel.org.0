Return-Path: <linux-watchdog+bounces-1121-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963349083BC
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 08:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9A9EB232C3
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 06:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1E2148305;
	Fri, 14 Jun 2024 06:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSc7iHZA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230A145A05;
	Fri, 14 Jun 2024 06:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718347146; cv=none; b=rB/vEO+UTVaSqq+aGcq8FZhfWh8GhWapTZHVkgTpb8OMSOmTx4KnNdlXEB9zu844sSa8rw++0yAkV0QxPwBUZ2QxUuUQNd+kcTbmCfruMp9/og9XInVFHDjiHr91A02+JjXv3u3ra1HyHeE2mKCYdtnY02/qp1Fgk2tdNnBuLMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718347146; c=relaxed/simple;
	bh=KHpIL1DkdfxYt1BGetjKnKSYlKwSHTX3tLAPYhqZMss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkxGKUwoLdDRw90mZ8Gv73lRdfVastPYQY+9du151pzrbwUb3Utq/81+pFhVngQvfHV3D2LBA5yzrLU4WFijYlKFjbBHtCS1sL8f0uCAv/cw8wD8+SeJAz4qR1Tpu76yidZvDJP9QXRhlRiJYkvrqfMW11o+GIO2IyrsB9yWato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSc7iHZA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bbdb15dd5so2175827e87.3;
        Thu, 13 Jun 2024 23:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718347143; x=1718951943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZLQcxW42WTQ04EM2482xmMFoQSlTuqYFS39Z6tbXwU=;
        b=QSc7iHZAgnd9FmvJunlnK5HxuwKgBnbgd4A2rLeAg507uZA457mdcOdqDZTVSzMpt8
         qrBhzBZ8ve9BkmxSmattocAb9HCVNJtspWBINLQl7CV1JckRW6/DcAFbHwveW97QVN7Q
         IamruM1LqTpbj6Z7NvLwdYUD3hUQZoCeVHsI4nHxVozmemt+Il/9rk7NHpLCzE0hZSyg
         2OVvXwt29T4tb14DrhrY7nOJEN+ZVoLRsdhuwZOvJ6yQvUuim2bAXyd8MgD6Cfpi+/R+
         ZOswCwesp1rgDwCVibfe2xnTTd4DnMNrUCoF3NllmbIvCKF3d23FlNy17OWB3I519RzH
         1aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718347143; x=1718951943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZLQcxW42WTQ04EM2482xmMFoQSlTuqYFS39Z6tbXwU=;
        b=HmgXm2nffZUeL2SlDuVSMbsmOM0nbRx4sEFbd+i8DwIwMcLtC00maulH18hmUl/0v+
         RGdJVbNR+0EG3rSfOqHrEkA/22PQT7iIOULij0X8qHJKUNFmWzQuwxXIR9hU9j1O/G5I
         uB/ewzxLwU0/BfdkgbCpviwmtRpstbuOGncVaS5/++nZZAhqsSeegHJULiMrZYcXocyB
         RsXxrW6b9Yr2pC2NUo/dV3yEuv2+IU/nXyD8htyKyVKYBnM9RIF2XY8iyOtVLNicbf77
         ZqHrVbE0nQuHpf90ns2yNHJDB/2EisGyCwuFWIZBpQ+DFaNSzkBLpe+JPIdCiRSFCuVg
         0Y0A==
X-Forwarded-Encrypted: i=1; AJvYcCXmXuv92srpUKRva7SDxZI3TWJ5N8x8xqeE8OQvM8wenIk53BgLbFx5gU0JkG7OSY47lHOZBxsxJKBk0fXDzPr2vysgk5J8iN9pPgKS+oDJlIpDEKXNZxfUsSV3n42E4kob8fWLRgNYBLBMsSh/4kp/p2JFsXSuJUY5WERJxJH+ZjkrLuB/KD7A
X-Gm-Message-State: AOJu0YwqRSS7E1qhKq0hOhbv9q4AXJMplwbPPsU0A93bvMLu3RkrQqOM
	4/6A0M9vTAX7Y0AOhwuUq9cBwEwnV0fvEmva1AftP5HmD8vyxBCx
X-Google-Smtp-Source: AGHT+IGmrzSTMDejilr8oPKbsiJFCmB+sJBnlGtfxwJcqCEmHpKyyZvtwPf9bi/j7AuLPW02Tcjubg==
X-Received: by 2002:a05:6512:794:b0:52c:8271:5252 with SMTP id 2adb3069b0e04-52ca6e65155mr1067973e87.16.1718347142810;
        Thu, 13 Jun 2024 23:39:02 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287a883sm426351e87.191.2024.06.13.23.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 23:39:02 -0700 (PDT)
Message-ID: <acc2edb5-ed9b-4ab8-b2a9-e51808a12478@gmail.com>
Date: Fri, 14 Jun 2024 09:39:00 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] mfd: support ROHM BD96801 PMIC core
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <97cd372d4502597bf051f0ff52f718eab9b186aa.1717486682.git.mazziesaccount@gmail.com>
 <20240613161508.GM2561462@google.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240613161508.GM2561462@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/24 19:15, Lee Jones wrote:
> On Tue, 04 Jun 2024, Matti Vaittinen wrote:
> 
>> The ROHM BD96801 PMIC is highly customizable automotive grade PMIC
>> which integrates regulator and watchdog funtionalities.
>>
>> Provide INTB IRQ and register accesses for regulator/watchdog drivers.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> Changelog:
>> v2 =>:
>> - No changes
>>
>> v1 => v2:
>> - Drop unused enum
>> - Improve error prints
>> - improve comments
>>
>>   RFCv2 => v1:
>> - drop ERRB interrupts (for now)
>> - bd96801: Unlock registers in core driver
>>
>> Changelog: RFCv1 => RFCv2
>> - Work-around the IRQ domain name conflict
>> - Add watchdog IRQ
>> - Various styling fixes based on review by Lee
>> ---
>>   drivers/mfd/Kconfig              |  13 ++
>>   drivers/mfd/Makefile             |   1 +
>>   drivers/mfd/rohm-bd96801.c       | 273 +++++++++++++++++++++++++++++++
>>   include/linux/mfd/rohm-bd96801.h | 215 ++++++++++++++++++++++++
>>   include/linux/mfd/rohm-generic.h |   1 +
>>   5 files changed, 503 insertions(+)
>>   create mode 100644 drivers/mfd/rohm-bd96801.c
>>   create mode 100644 include/linux/mfd/rohm-bd96801.h
> 
> Pretty nice.  Uses generic interfaces.  Just a couple of nits.

Thanks :)

I'll try to send the next version of this series Today. I will only 
include the patches 1-6, which I believe are pretty much good to be 
merged (but the watchdog has not yet been acked by Guenter so no 
guarantees), and which should result a working driver for many of the 
predicted use-cases. Then I plan to be mostly off of my computer for a 
few weeks. (I may do some very minor fixes.)

The 7-10 will have to wait until the irqdomain name conflict can be 
reasonably resolved. I plan to return to this when I'm back from my "off 
time", and when we see what direction the irqdomain work by Herve has 
evolved :)

...

> 
>> +	{
>> +		.name = "bd96801-wdt",
>> +		.resources = wdg_intb_irqs,
>> +		.num_resources = ARRAY_SIZE(wdg_intb_irqs),
>> +	}, {
>> +		.name = "bd96801-pmic",
> 
> I thought this was the PMIC?
> 
> What is this device?  Regulators?
> 
> "bd96801-regulator"?

Yep. Thanks!

> 
>> +		.resources = regulator_intb_irqs,
>> +		.num_resources = ARRAY_SIZE(regulator_intb_irqs),
>> +	},
>> +};

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


