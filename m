Return-Path: <linux-watchdog+bounces-3182-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C673A76263
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Mar 2025 10:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F45D7A3C2D
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Mar 2025 08:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895C81DE3A8;
	Mon, 31 Mar 2025 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RmaafcCx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB961DE3A7
	for <linux-watchdog@vger.kernel.org>; Mon, 31 Mar 2025 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409707; cv=none; b=rc5dTjML9Hvef8+7yzq0FKNwMgAiSnR5s4mNPnD5XlHETDm8zQ3+Se1Ky/uT/MaVMBFtkcDNva3wLTySiCasP/ebzyzxyQVBNBJyT+62kMoaH3HY9DbVbLDi9FyLog7YEeb9XwLEt/KrfkafmOf+r6s2vFAd+UHBp8r5uDxTxT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409707; c=relaxed/simple;
	bh=lxTzjdnUlqwd1wh7uCrpKmj4jJohE91AjWU0MottzVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEtMiW9VHgtMz7vd5T5+CQm3UM7sOwipiEfNHagu9SS43fIAeldoy0545NGBZgFo8aPSNOEjpXBFR4gIWUA8wi/PsNQvTfbfIu30yqykTuPyN89B2NDjL8++b8LtS6l7cHr8hrA8wtixnqjt4g55DL2dwpaXrMGBrstggySbr14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RmaafcCx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3326506f8f.2
        for <linux-watchdog@vger.kernel.org>; Mon, 31 Mar 2025 01:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409704; x=1744014504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lBFYadEH0JYr+A7Tag8qSHkvFrIqZwuIEnr/hAhq2Q=;
        b=RmaafcCxIew7u3vdPLidKSNse9OUFvIEoclp9cUK0LBbozIldX2mW2naXnhDljjYHN
         yzq617AIqk7R3qSJodFpRVp8dlA1Ew6Vrb9FF3M7SpgjzTTM8l0q5fWV4BMEXAuG7hwM
         VXFZuNyYgMEWht9PCRi8S/Gls+OiZf2MMS/S3mYbYdv2SGhiCERDacYJVnhrSoSG4Ymh
         bP+yANrtkERdbbcZ0hnUXm/JIbC7oj47/WZuo6FRaMOdIxsyptWc5DQpA9znESrS9Zsd
         vtIDhbt8AtN1t0XGxj+fN9nBMrcn2mULQrQY5DiS1j4Jnrl/jZ/JHVDWuM31rCjcg+8a
         7+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409704; x=1744014504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lBFYadEH0JYr+A7Tag8qSHkvFrIqZwuIEnr/hAhq2Q=;
        b=NLzzLt7ki5fmHbKe/XJZLDKT4l7CY+C3IRz42jqGGlKUvQre8J4D4tBsXo7K1hHCQM
         Vzh8vOS4JKMl4I9zp8+OthhsPDqFf7KtjHq0Uiq0WOns+XwFUn6j1nqF8DHPhADpxOIm
         vVr7M28suVxS6zHru4b0MXbZqXoUgKjmoyM8u+eoW8edPwT7uWaGGWJjeN4owiNb+vJF
         hbKO2nKIXvz2Qn5MCHOgAjW4/jO/nbwCs7rGRSmJBkbklsjP7/NLGprH5pmDMU5zwEpl
         PMVp/pqXmvYP6cfjj1WFWu+ldlEFObYrP3J7KX6YmAxMUYqFfneEr3fXUk6UlBSJTPqF
         QxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH9dJsBh+JhuxtvWVlPXwdQILypDSqdUj2ZqK/8gDm6XiQgga+sWkt2tV9qkWcX+0neEcJDsYP9MqUyYtV4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLkz8nprsZHH0OWcJmDnCq+irGJ/TwISuDfVGgSZ2vbCmRrZE/
	m4sqWxL8FeVh/js1vkjb2TxvL13kj5/7Z0H2R/pjFG3xsoLZuYDanBCe7yjfL08=
X-Gm-Gg: ASbGncvjm+i0sBn16isPMYDq+YBGgVJCDpMjVv873BODSgIMRZBsPQdAQS8Voi/8vuW
	/vEp7pwtnkz280lxHvIgViEPPK0Bl3tCmC8ImL+iw+QSZS08b4gUleO0+UZG/tBIEYk5dPZFEWx
	HyTg6/ZWXKtkRkE8l1/3GiR6que7L3IfgIG6qApp/BD5PKyLPj1iByLbMNm+uVXqjNtCGQrTx7W
	I/DRQyBS8qONeKC6E57QTph0kMLQMUrQMpWkx29FBbZloT6nMII5XIiM1SmnWH23pg2SvhP9zIu
	lOLguCMP1YzwSyVQxidGrGd1OUGifaOe3t43sqD2K96nFhmOhClb8JFPkqnX2thlYpEerJqJk/K
	B6SmOKvK8x8t6AX1zJBM=
X-Google-Smtp-Source: AGHT+IG+QqD1a/f3WhMCZ1jy40WeCRBd/LiAu07w3st8nU2ZWaYZZ+kyOq/5OHtkc3dfLikLwis98w==
X-Received: by 2002:a5d:6d8d:0:b0:399:7f2b:8531 with SMTP id ffacd0b85a97d-39c12117d1cmr5883612f8f.38.1743409703819;
        Mon, 31 Mar 2025 01:28:23 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0basm10781860f8f.63.2025.03.31.01.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:28:23 -0700 (PDT)
Message-ID: <8e74c3b4-a4fd-407b-aef7-ccdc94490f11@linaro.org>
Date: Mon, 31 Mar 2025 10:28:22 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: Add the Software Watchdog Timer for the NXP
 S32 platform
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <20250328151516.2219971-2-daniel.lezcano@linaro.org>
 <1873723e-de75-4e9f-b61c-a22f3b85758b@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <1873723e-de75-4e9f-b61c-a22f3b85758b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/03/2025 05:55, Krzysztof Kozlowski wrote:
> On 28/03/2025 16:15, Daniel Lezcano wrote:
>> +
>> +struct s32g_wdt_device {
>> +	int rate;
>> +	void __iomem *base;
>> +	struct watchdog_device wdog;
>> +};
>> +
>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>> +module_param(nowayout, bool, 0);
>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>> +
>> +static unsigned int timeout_param = S32G_WDT_DEFAULT_TIMEOUT;
>> +module_param(timeout_param, uint, 0);
>> +MODULE_PARM_DESC(timeout_param, "Watchdog timeout in seconds (default="
>> +		 __MODULE_STRING(S32G_WDT_DEFAULT_TIMEOUT) ")");
> 
> Timeout is provided by DT.

Yes, but we may want to change the default timeout when loading the driver.

[ ... ]

>> +static int s32g_wdt_ping(struct watchdog_device *wdog)
>> +{
>> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
>> +
>> +	__raw_writel(S32G_WDT_SEQ1, S32G_SWT_SR(wdev->base));
>> +	__raw_writel(S32G_WDT_SEQ2, S32G_SWT_SR(wdev->base));
> 
> I am confused why you do not use standard writel or don't have any
> barriers here. I think this is very error prone and in general
> discouraged practice (was for example raised by Arnd multiple times on
> the lists).

Yes, that's a good point. I'll sort it out with Arnd

>> +static int s32g_wdt_start(struct watchdog_device *wdog)
>> +{
>> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
>> +	unsigned long val;
>> +
>> +	val = __raw_readl(S32G_SWT_CR(wdev->base));
>> +
>> +	val |= S32G_SWT_CR_WEN;
>> +
>> +	__raw_writel(val, S32G_SWT_CR(wdev->base));
>> +
>> +	return 0;
>> +}
>> +
> 
> ...

[ ... ]

>> +static struct platform_driver s32g_wdt_driver = {
>> +	.probe = s32g_wdt_probe,
>> +	.driver = {
>> +		.name = DRIVER_NAME,
>> +		.owner = THIS_MODULE,
> 
> Drop, that's some ancient downstream code.
> 
>> +		.of_match_table = s32g_wdt_dt_ids,
>> +	},
>> +};
>> +
>> +module_platform_driver(s32g_wdt_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("Watchdog driver for S32G SoC");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:" DRIVER_NAME);
> 
> Drop, not needed. Fix your table module device Id instead... or start
> from other recent driver as a skeleton to avoid repeating the same
> issues we already fixed.

Ok, thanks for spotting it



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

