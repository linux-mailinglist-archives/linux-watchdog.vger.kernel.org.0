Return-Path: <linux-watchdog+bounces-1143-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2019098E9
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 17:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D4A7B20ABE
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 15:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B45481A5;
	Sat, 15 Jun 2024 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSfi+YE6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D294482EB
	for <linux-watchdog@vger.kernel.org>; Sat, 15 Jun 2024 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718465192; cv=none; b=pPc8eBWxab8KCaPwT8w30Xirzm2HNrkSSkXHGJgOJ3QxDqAEkf7Laa6/eehww5XoOG7Qd6g90fPjG76BPV4JiJOCB6QNgaKQjdH77B81Vc1RRdWZGV5P7KPj1tRfsXys38fKehDALsFaL7Addcq8QHLyjxwMvAxxFFGqoQRlJ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718465192; c=relaxed/simple;
	bh=4f6dCfAUMBr+yzedC7GOm5w5X2Xw16tmt8HGB8+/KXk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QzB6tCUGy0zI/hKJJ44GgnXEk3P/IYgVl76oth3B2rzLcyy8AQlm8MEGnZMd+DHevYr1kLl/aSZBY0q0AY2SJEP+CrCUNlJdcCoIC7WTg/g0TH+bjEMGg+13cIyJRlco8b5y+2F2S3c647GhHt9N76UY+5Ck8CqT7laHBnknYrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSfi+YE6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-705c0115192so2759078b3a.1
        for <linux-watchdog@vger.kernel.org>; Sat, 15 Jun 2024 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718465190; x=1719069990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qpnyp13Za6SgJlUsHkg1RuoKHFZYKkZtL5dRcQMT3C0=;
        b=bSfi+YE6lRGJdd24pzl3v6G9Z1CmnVfQcqUf8NzYljlf8yqWhIpavHL5pdKHT6hpHQ
         K8wXTy2wsd5eTjBTIwAg1osZMeZdNlQDLR+B8mZ/y+070pIvVVi5fz7XPWULF4RJZlrB
         UftweqmBXlL4AWYSMaiHd14RvRx0AEAHOc7gY+I2lF1z4ZVYsm1D4HL8E5WIoVIyI0pl
         nkQqawSlVGWlYd1dJYucl3IX8h3GkdMqNYvYPKsBNg2ZywCF86nsLxpmQJW+GYjNaaVR
         60GmUduu4jAn9G6A8S/5FxB9KzuVoh+wGCW3BqAw/lTDNj1Rc9ez+LRWXWsVzWyOf4j+
         UTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718465190; x=1719069990;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpnyp13Za6SgJlUsHkg1RuoKHFZYKkZtL5dRcQMT3C0=;
        b=vtn4ry7QcluaROGakvt9s1wq7j41dZ3EqL1c9lPuwtPxsiSoOykERv3g80urwrDGNA
         9gvTfEzYlQCIVg+UOtoQ2SZg1dpSER97xOVVxbZJ45DwsHmUzlYi/eo9VzzQ24BkrAX0
         XdEWi/RHOiu4Eo588je6BVzcKWg7Lnda5GX/7hxdEIrqKnOQ7zZfl2fd+EpweRJjBgxX
         LA5NStA3wnPxNAmV2T5eR8tOepdB/cFRvTjXTqtCNyxtPLtVPfw9F12kQD5lhTmf1RB7
         kPvyQ0rPvmcSvKx0u2/QDKicFld5/qsou1VEAkq1amJ6v5XLyY9S21FjatcbJCd6dsoF
         mQmw==
X-Forwarded-Encrypted: i=1; AJvYcCW4NwcpwgZeXZunmU9mO//3mJMIoSaLLzJQyVLuSW/jBb4uZdaN40G7thbhafwHs7XkyiOcEseagblTxutGPlNZ+M5LjW8NtL96LZvkNQ4=
X-Gm-Message-State: AOJu0YxDIqBz1udXE8O68xwEkAagSDmdmSRzOLEWPVGi+CP5ms9cDUW9
	3r5PqXeilLETU5VezLUxkB1y1ytfHTrKkY/Io2fJU97sj20dbUeD
X-Google-Smtp-Source: AGHT+IHEh6WEYq9qWxdgdlF9p5ojaFmZtp6yXbgEXamZ5jENinuwE3o61Z+j0J8e46btb709WP763Q==
X-Received: by 2002:a05:6a00:4b97:b0:705:b3b1:8fa8 with SMTP id d2e1a72fcca58-705d7104d35mr6098995b3a.2.1718465189831;
        Sat, 15 Jun 2024 08:26:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc921b41sm4807607b3a.5.2024.06.15.08.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jun 2024 08:26:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <95ee7772-7d5a-4d94-8eb2-93382554a769@roeck-us.net>
Date: Sat, 15 Jun 2024 08:26:27 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: imx2_wdg: Save the actual timeout value
From: Guenter Roeck <linux@roeck-us.net>
To: LongQiang <lqking7735@163.com>, wim@linux-watchdog.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240615141059.345076-1-lqking7735@163.com>
 <8db871d7-154d-48c3-b934-e480991ad8a8@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <8db871d7-154d-48c3-b934-e480991ad8a8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/15/24 07:18, Guenter Roeck wrote:
> On 6/15/24 07:10, LongQiang wrote:
>> When setting the timeout, the effective timeout value should be saved.
>> Otherwise, the illegal timeout will take effect at 'start'.
>>
>> Signed-off-by: LongQiang <lqking7735@163.com>
>> ---
>>   drivers/watchdog/imx2_wdt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
>> index 42e8ffae18dd..d4a4d4c58c3f 100644
>> --- a/drivers/watchdog/imx2_wdt.c
>> +++ b/drivers/watchdog/imx2_wdt.c
>> @@ -196,7 +196,7 @@ static int imx2_wdt_set_timeout(struct watchdog_device *wdog,
>>       actual = min(new_timeout, IMX2_WDT_MAX_TIME);
>>       __imx2_wdt_set_timeout(wdog, actual);
>> -    wdog->timeout = new_timeout;
>> +    wdog->timeout = actual;
>>       return 0;
>>   }
> No, that would be wrong.
> 
To add more detail, ->timeout is the soft timeout, handled by the watchdog
core. The start function calls imx2_wdt_set_timeout() again, which will set
the chip timeout to no more than IMX2_WDT_MAX_TIME. So the claim that
"the illegal timeout will take effect at 'start'" is simply not correct.

Guenter


