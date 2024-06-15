Return-Path: <linux-watchdog+bounces-1144-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89329098ED
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 17:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73B3F2825F2
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 15:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CB44963A;
	Sat, 15 Jun 2024 15:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyd4CdzW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9362E3BBD7
	for <linux-watchdog@vger.kernel.org>; Sat, 15 Jun 2024 15:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718465353; cv=none; b=AqGMYYZTMGoXoGaVj/vEPoTZYySYG8duLIVvTGMQEoIyTUqlRwm0OJatvJiHrROZuIJG2cosPpcgpDNt4CkA746da8fV6/9llYtYKX8iQLg1bQOlSxTizX5iYuxKev8V4VbmbxzytRn7RP129OI1RTKpLpkVpMedA1G8Nz0T91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718465353; c=relaxed/simple;
	bh=+IKcDRrK3Yf9NpM7JW1XTPQvEZWRKxw+gASymx/EBC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rn3lQrar8BjsASnDL7jDrIIJSfOXRaB8EnZsPHVFOGtVnT9XwhbGS6R88SqAR1kJIrzZden4uEayublIAQ2RALeuctJllNXMwCYvQCNtd29YNhzSE1yhNJDUcRTeK26pVHzN6msvkj8Xylyq/LPXjnksbPwL28HXqiT+wTlXuiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyd4CdzW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70109d34a16so2784926b3a.2
        for <linux-watchdog@vger.kernel.org>; Sat, 15 Jun 2024 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718465351; x=1719070151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KjbGlRNTPFA52XKTRivBpgz1uUkCb0j4NvGuuOm5beg=;
        b=kyd4CdzWuvpKqInU7vqdbn6egrYGRMKcG7HgJRgsmqz7g6GHlrE3drWsvn7JgMgF77
         gpOv6nAG/y/COtUrVGcmN1+Aq0mG6i73xlEaNoG5o1tVKR3XbrNz0nswb5laF6RgdiKt
         FKsu7TzGaojutZDdstM7twoOtosETMVJLf5kxabSEEmCZW4kaBt2/lC/Tt1WuJE3qkpA
         Kdde3HM83FFjtaRmcAlLC/dOfWZ3bwL/XOAWh/U//gTatwJJkDGPLNwoyFNnhqGVyNcQ
         hvIGNDiFRDq5IXcOhXHGf2OogQ4ilPRnaVo3CQroB1vpnwFvWItxJnj3kuhiT5c8M3dk
         275Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718465351; x=1719070151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjbGlRNTPFA52XKTRivBpgz1uUkCb0j4NvGuuOm5beg=;
        b=tV+5jc6SJjlJmY0YHrPVyOWB5EaPuqFmyyoGr9VWl2fdoeZcQQB8kxGEL9dzI7mnw4
         u9YTelMfj9auj9TzZtxqG5IUUuQAADfmAIcETGS7QRKeyE4+qtqPH25yBziOm+0xerlo
         ZaMgSyjsa3R6OwSvaBBk40YQmUBDh9fEswcISPVMr3mymujrrgZB3pipw/GPLq94bf7z
         fc28zyeUi0enoVD4w8w2Lr+AMZA9U4pL3AbEzEAdcZaz43gq3TG5C4JkXzYf1mRaz0bt
         va9zaSd62AxFQti8ZGxv2t2YeAQYwwVDeH1MWcAKK9CrP/tZIv1LZ0vVvauqVynU7UfW
         M/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWKSi+7uFeBvDpAvNEyCNlasKk2NomT0CNuqd2BVFjTGQ4G7EQtKmwik2BpUBjiKWrNa3dSYsrzNh6hrKjYJRdR9vVxwHbecBejohDpUL8=
X-Gm-Message-State: AOJu0YxomkPv/CoXWl4V0iXgToaww6di7rHk19vbzyofLPd752dpWizx
	5NCD8Em6NWAaKCPKg6ih4RgvHRnys+J7QHfGC3ZMe8SMG3CpLaLg
X-Google-Smtp-Source: AGHT+IFrfI2HAZMkZ8D1+eTOCon91HjyLxJhnwYjO8VjENlVeHOpEnzt3mBKsRWFEE5DsGpqp/od9Q==
X-Received: by 2002:a05:6a00:788:b0:705:c5d4:7861 with SMTP id d2e1a72fcca58-705d712024amr5404255b3a.6.1718465350412;
        Sat, 15 Jun 2024 08:29:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb9195asm4785956b3a.209.2024.06.15.08.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jun 2024 08:29:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <480b0513-01c4-42a3-bc8b-5ee6e711a1a1@roeck-us.net>
Date: Sat, 15 Jun 2024 08:29:08 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: imx2_wdg: Save the actual timeout value
To: "L.Q" <lqking7735@163.com>
Cc: "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 =?UTF-8?Q?linux-watchdog=40vger=2Eke=E2=80=A6?=
 <linux-watchdog@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,
 =?UTF-8?Q?linux-arm-kernel=40lists=2Ein=E2=80=A6?=
 <linux-arm-kernel@lists.infradead.org>
References: <20240615141059.345076-1-lqking7735@163.com>
 <8db871d7-154d-48c3-b934-e480991ad8a8@roeck-us.net>
 <57e6bc77.319eb.1901c76a5fa.Coremail.lqking7735@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <57e6bc77.319eb.1901c76a5fa.Coremail.lqking7735@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/15/24 08:14, L.Q wrote:
> Well
> If I first set a timeout value greater than 128 and then start the watchdog, the watchdog timeout value is illegal.
> In the function 'imx2_wdt_start', there is no validity check on the timeout value
> 

static int imx2_wdt_start(struct watchdog_device *wdog)
{
         struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);

         if (imx2_wdt_is_running(wdev))
                 imx2_wdt_set_timeout(wdog, wdog->timeout);
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
         else
                 imx2_wdt_setup(wdog);
...

static int imx2_wdt_set_timeout(struct watchdog_device *wdog,
                                 unsigned int new_timeout)
{
         unsigned int actual;

         actual = min(new_timeout, IMX2_WDT_MAX_TIME);
	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
         __imx2_wdt_set_timeout(wdog, actual);
                                      ^^^^^^
         wdog->timeout = new_timeout;
         return 0;
}

Please point out the code path where an attempt is made to write
a value larger than IMX2_WDT_MAX_TIME into the chip.

Guenter

> ---- Replied Message ----
> From	Guenter Roeck<linux@roeck-us.net> <mailto:undefined>
> Date	6/15/2024 22:18
> To	LongQiang<lqking7735@163.com>,
> <mailto:lqking7735@163.com><wim@linux-watchdog.org> <mailto:wim@linux-watchdog.org>
> Cc	<shawnguo@kernel.org>,
> <mailto:shawnguo@kernel.org><s.hauer@pengutronix.de>,
> <mailto:s.hauer@pengutronix.de><kernel@pengutronix.de>,
> <mailto:kernel@pengutronix.de><festevam@gmail.com>,
> <mailto:festevam@gmail.com><linux-watchdog@vger.kernel.org>,
> <mailto:linux-watchdog@vger.kernel.org><imx@lists.linux.dev>,
> <mailto:imx@lists.linux.dev><linux-arm-kernel@lists.infradead.org> <mailto:linux-arm-kernel@lists.infradead.org>
> Subject	Re: [PATCH] watchdog: imx2_wdg: Save the actual timeout value
> 
> On 6/15/24 07:10, LongQiang wrote:
> 
>     When setting the timeout, the effective timeout value should be saved.
>     Otherwise, the illegal timeout will take effect at 'start'.
> 
>     Signed-off-by: LongQiang <lqking7735@163.com>
>     ---
>     drivers/watchdog/imx2_wdt.c | 2 +-
>     1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
>     index 42e8ffae18dd..d4a4d4c58c3f 100644
>     --- a/drivers/watchdog/imx2_wdt.c
>     +++ b/drivers/watchdog/imx2_wdt.c
>     @@ -196,7 +196,7 @@ static int imx2_wdt_set_timeout(struct watchdog_device *wdog,
> 
>     actual = min(new_timeout, IMX2_WDT_MAX_TIME);
>     __imx2_wdt_set_timeout(wdog, actual);
>     -  wdog->timeout = new_timeout;
>     +  wdog->timeout = actual;
>     return 0;
>     }
> 
> No, that would be wrong.
> 
> NACK.
> 
> Guenter
> 


