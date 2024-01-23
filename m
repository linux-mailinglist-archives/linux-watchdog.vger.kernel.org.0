Return-Path: <linux-watchdog+bounces-468-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039D8387D5
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Jan 2024 08:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9C46B21C7E
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Jan 2024 07:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0278551C3F;
	Tue, 23 Jan 2024 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N65QHdAN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA651036
	for <linux-watchdog@vger.kernel.org>; Tue, 23 Jan 2024 07:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705994016; cv=none; b=Wbla7LH3x4eLuUD7iFE+ZlO4gdkI2lNtRdy20aOczUfq2ti/+qA5MHH4SPYYeoWjCZ2pQdcCIB+DP8KnceyN3jOn+GTLIxTvuRMZ5m2Y4q1OgFR1lFVmYoOgDCeV0SQEDviLA7sn4vkw/TkqLc9d0aSRloqNaYwbmKX1Zq8BqEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705994016; c=relaxed/simple;
	bh=V9MrJ3xkqEmgfOldwHpgezsCJyTx9RPzrV6ws6QWYKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/c1ezYksA0MPVbRlSuoZlCR0et7BiL9wlKHQjuyrddWBggy3MIj02q1ZH/a4thq011cXKPFJT5Kk0Mk0+n4rKPnztodp3s9Y5OCBZKaa5ZRGCY6KSYt5HUSIGIf/Z7FHyNmkr0+GcNq36/pQxTGlISEf11B6eoHosqyv/4GnKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N65QHdAN; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so4529117a12.2
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 23:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705994013; x=1706598813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k70FL9z5OR2fcCPzPC1Tv4cFtZ4jvd++KS4IHYlFyBc=;
        b=N65QHdANN1T5BoOmG+C880NQ81UYwT6swtOkN9PdCruWf8LQOy8eR5zTFpm4Bg/+mD
         iyq1H7l/s4xvWWC/Hg+eRBxvIESq0mRKJo6lrHO7XrMLxWooQGMmOpwg/O3VvEjEcqnC
         w1sLL5sMSpsb9/1tZzCDdp401d8ZpVQSmCGx7HQoDfXM1oy7t6fU/YEXPShmQZdc1OIr
         nX0ZZHtd2/375w90zoQ0BCBEXAmIW9k4E5lCG2EAvZ5wTe7SYO8YINnG3i73L7f25kTZ
         nXEYpV8TVgHEQqtaCoMLH9oJKVXL7uvHsRHurgTnXZVrWwj2ttqRw3ADHxo1QrS2sTjZ
         ED7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705994013; x=1706598813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k70FL9z5OR2fcCPzPC1Tv4cFtZ4jvd++KS4IHYlFyBc=;
        b=IkJfiiXaKOiYUHy4HGPp1bbirw9x1DLhFoEtAImB5YhP9dNckHWKkYvZ+8tw6RnKrR
         fxpwE42o2KMjsBCqaErQcSU4p9c+gJm2C9Jn2n3Vt5Zr/EXOW/XPp8ehge9GM5ECUL/n
         OXd2hrnFA4ZUn76tXlChKsIC9zGTcS0sZsEJwHvAv9H70k0Qbb+ZOicDjflJ9+t0wRRS
         /vwEALE4FXTXo20AnkcgPSYycEB0nxQfCVqVtfJ82pm3eqR20Ga5ybGbTJKRfrNrTOXw
         64d1xReINaV9upiezebuO2pIz5Uv9cNrgb0Ike2co//c1a3dzUFL3jDtgNk+mTrorm9C
         uWbw==
X-Gm-Message-State: AOJu0YwgOlV0D4UWWNmem4cR+9Xlvy/AP0Pzi6GTM91UZs5bkpCog0k3
	uWRigozYxVXECGKH7io2ZnxgKyABHPAXOgegBGLwKOACWs27+LRIQtzHUYnVXzA=
X-Google-Smtp-Source: AGHT+IHSXfOQRrPeQb4qJFA6qTNr1G8f/qLCQBmHmU06J6jI0GUc4NZLGk3u4skG3IGwVbiJHRVB7A==
X-Received: by 2002:a17:906:bf42:b0:a30:b616:caac with SMTP id ps2-20020a170906bf4200b00a30b616caacmr265146ejb.41.1705994013419;
        Mon, 22 Jan 2024 23:13:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id hw15-20020a170907a0cf00b00a2ed5d9ea19sm7011693ejc.190.2024.01.22.23.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 23:13:33 -0800 (PST)
Message-ID: <2af40ace-2779-45a0-a244-e7e9e5cc510c@tuxon.dev>
Date: Tue, 23 Jan 2024 09:13:30 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] watchdog: rzg2l_wdt: Add suspend/resume support
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
 <20240122111115.2861835-8-claudiu.beznea.uj@bp.renesas.com>
 <a5a807c1-76ef-4cf7-a2cf-bc432c420ded@roeck-us.net>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <a5a807c1-76ef-4cf7-a2cf-bc432c420ded@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22.01.2024 19:39, Guenter Roeck wrote:
> On 1/22/24 03:11, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The RZ/G3S supports deep sleep states where power to most of the IP blocks
>> is cut off. To ensure proper working of the watchdog when resuming from
>> such states, the suspend function is stopping the watchdog and the resume
>> function is starting it. There is no need to configure the watchdog
>> in case the watchdog was stopped prior to starting suspend.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>   drivers/watchdog/rzg2l_wdt.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
>> index 9333dc1a75ab..186796b739f7 100644
>> --- a/drivers/watchdog/rzg2l_wdt.c
>> +++ b/drivers/watchdog/rzg2l_wdt.c
>> @@ -279,6 +279,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>>       priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
>>         watchdog_set_drvdata(&priv->wdev, priv);
>> +    dev_set_drvdata(dev, priv);
>>       ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable,
>> &priv->wdev);
>>       if (ret)
>>           return ret;
>> @@ -300,10 +301,35 @@ static const struct of_device_id rzg2l_wdt_ids[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
>>   +static int rzg2l_wdt_suspend_late(struct device *dev)
>> +{
>> +    struct rzg2l_wdt_priv *priv = dev_get_drvdata(dev);
>> +
>> +    if (!watchdog_active(&priv->wdev))
>> +        return 0;
>> +
>> +    return rzg2l_wdt_stop(&priv->wdev);
>> +}
>> +
>> +static int rzg2l_wdt_resume_early(struct device *dev)
>> +{
>> +    struct rzg2l_wdt_priv *priv = dev_get_drvdata(dev);
>> +
>> +    if (!watchdog_active(&priv->wdev))
>> +        return 0;
>> +
>> +    return rzg2l_wdt_start(&priv->wdev);
>> +}
>> +
>> +static const struct dev_pm_ops rzg2l_wdt_pm_ops = {
>> +    LATE_SYSTEM_SLEEP_PM_OPS(rzg2l_wdt_suspend_late,
>> rzg2l_wdt_resume_early)
>> +};
>> +
>>   static struct platform_driver rzg2l_wdt_driver = {
>>       .driver = {
>>           .name = "rzg2l_wdt",
>>           .of_match_table = rzg2l_wdt_ids,
>> +        .pm = pm_ptr(&rzg2l_wdt_pm_ops),
> 
> I think this will create a build error if CONFIG_PM=n because rzg2l_wdt_pm_ops
> will be unused but is not marked with __maybe_unused.

The necessity of __maybe_unused has been removed along with the
introduction of LATE_SYSTEM_SLEEP_PM_OPS() and friends (and
*SET_*LATE_SYSTEM_SLEEP_PM_OPS along with the other helpers were marked
deprecated for that) and we can use pm_ptr() along with
LATE_SYSTEM_SLEEP_PM_OPS() to avoid build errors you mentioned.

FYI, I just build the driver with CONFIG_PM=n and all good.

> But then the driver
> won't be
> operational with CONFIG_PM=n, so I really wonder if it makes sense to
> include any
> such conditional code instead of making the driver depend on CONFIG_PM.

That's true. The driver wouldn't work if the CONFIG_PM=n but then it
depends on COMPILE_TEST which is exactly for this (just to compile test it
for platforms that don't support it). I see many watchdog drivers depends
on COMPILE_TEST.

Give this, please let me know would you like me to proceed with it.

Thank you,
Claudiu Beznea

> 
> I really don't think it is desirable to suggest that the driver would work
> with
> CONFIG_PM=n if that isn't really true.
> 
> Guenter
> 
>>       },
>>       .probe = rzg2l_wdt_probe,
>>   };
> 

