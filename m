Return-Path: <linux-watchdog+bounces-1500-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 774489568EE
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2024 13:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7DC1C219F9
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2024 11:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E143116630F;
	Mon, 19 Aug 2024 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="q0tCAIx6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEDC1662F8
	for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2024 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724065535; cv=none; b=XyhIPaY+sui2me335TElrD0AUEv9oThdsYDD7dEMMsGO4bZFeK8uqm3gF1iE5SXCBPcm2hCZhgvE4VUYBt1QcDfxyYVJJbgX9CTDQ0z4XaTJmXXRKGnViz+UdBlFN15pHln45/o2Ypro+6CzxE9Ks3HuUA7o+z8UmkgA5AEZTrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724065535; c=relaxed/simple;
	bh=aQqI8/PvBkdCYH4Owyk1gyL+aMccBy8C/n1W3mMRor8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoAhH72XLr8DxjpJeBIVKb+5Deq+m+fMTeuznvTjqGi0n2rVahjQSrelnfsjNltHRt1j8xAJViw724BByIB/RwYDxpNNeZP4fjhsUSuWW3MR2ER0hY6VkB7y0ATMXtohZzoXDSIurVjNgLGsUfr7yPWZOyKx+xr9+Gdo7wNvoVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=q0tCAIx6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bed83487aeso2789018a12.2
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2024 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724065531; x=1724670331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VR0zD9PbDpkR3fyrzhpCpbjd6ZpNOkTNvRW/BRKBa/M=;
        b=q0tCAIx6EEbRBl3p5GpvOXDq3m1vjNnpxdPVVZWbQOx+6arOlOBDOrp5CW7B+h6ZGM
         PyAi7ygYEA75ZSSXAw11INQaCTDB0a36tO6xicVY5/WKie5ZIoOV+pvMwob1/2mMrSdg
         mGNNolASn94YJHS8E/WkIystsZQBPJqownklzGHImAauqQxTWiNL6DUdw30QBhQQw62x
         mFmflAgPoETR+cUGAFtgJYC5vYHulk0AxyAwyM08bDnnKGcNGiXAVr+mcZsY0itPekTy
         ZZfFhJUbJz9f7w9jrNhkBDuEy19YqeH+kzoB0dU3zykCjRtuCv7sy9pHP451ZruiEKcn
         d4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724065531; x=1724670331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VR0zD9PbDpkR3fyrzhpCpbjd6ZpNOkTNvRW/BRKBa/M=;
        b=qGI1GvRH2VDlFeCD1SWte9w/2wvAXy8QQ65aI5Ujv/dJHhv6xBWZWFMcbcdzM4Ogpu
         T4b2KO0qXpl4VVFutxN0uIwz9WXwWGeSev4jYsBv7wmurI1UsEOtF7kDoJR2KApj8non
         FQU6vEdzE2pfe5lxAQt/b97uW3qRmRPUb5lu0mT/p5CmB5lHxaFPoNhQawEsEi4qykce
         vS81jPQeJSxjSSLOLKpX4XQ3HmYoDYcP1f95JCmAVKAHUQ9e7V+vThjchy0GeWwE6Xqh
         tBhJdo3H7dk8faKaw8AJ+fRHK6CWkp9xJA8k6rgZ4jr/OZy2qK6iTN23IjizxiopzmIS
         Zy2w==
X-Forwarded-Encrypted: i=1; AJvYcCXloU5/kknQffz/lsZ0Lo3dMUq0CuCDlIUs8bOILdWhd2gRnF9k/9toq+xbTTBTKwuJx78aB4/3XcBaRETjxgAX34v7oiqolPiPTszoOEI=
X-Gm-Message-State: AOJu0YxHUCJIPdKxe77sgmDbQEeZlcN12OIjR8yXZQ7e456LenmCxn8u
	CEEUsnMBPxqwR31QTHOEubOCaWmORD/1OzojEh/18D+YHy3+Kfpc9CDggnHAk3M=
X-Google-Smtp-Source: AGHT+IHO4S8AdSKKOY37vliaEkMlycJkvKZxWe5CIw13tBNdTGfGqudTUPDxixX5EL2h5Bzu0I7FzA==
X-Received: by 2002:a05:6402:5114:b0:5be:e1bc:2320 with SMTP id 4fb4d7f45d1cf-5bee1bc262emr4890577a12.4.1724065531317;
        Mon, 19 Aug 2024 04:05:31 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc08109esm5446529a12.81.2024.08.19.04.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 04:05:30 -0700 (PDT)
Message-ID: <c854caf4-5de4-42ab-b119-2a6e7fe0c511@tuxon.dev>
Date: Mon, 19 Aug 2024 14:05:29 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] watchdog: rzg2l_wdt: Power on the PM domain in
 rzg2l_wdt_restart()
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, rafael@kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, geert+renesas@glider.be,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com>
 <20240619120920.2703605-4-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFq1EX1Spedhkek=50EdwmHY5erNTmvegVGbxfLzTqYjEA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAPDyKFq1EX1Spedhkek=50EdwmHY5erNTmvegVGbxfLzTqYjEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ulf,

Sorry for the late reply, I was off last week.

On 13.08.2024 16:56, Ulf Hansson wrote:
> On Wed, 19 Jun 2024 at 14:09, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The rzg2l_wdt_restart() is called in atomic context. Calling
>> pm_runtime_{get_sync, resume_and_get}() or any other runtime PM resume
>> APIs is not an option as it may lead to issues as described in commit
>> e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait context'")
>> that removed the pm_runtime_get_sync() and enabled directly the clocks.
>>
>> Starting with RZ/G3S the watchdog could be part of its own
>> software-controlled power domain. In case the watchdog is not used the
>> power domain is off and accessing watchdog registers leads to aborts.
>>
>> To solve this, the patch powers on the power domain using
>> dev_pm_genpd_resume_restart_dev() API after enabling its clock. This is
>> not sleeping or taking any other locks as the watchdog power domain is not
>> registered with GENPD_FLAG_IRQ_SAFE flags.
> 
> Would it be a problem to register the corresponding genpd using the
> GENPD_FLAG_IRQ_SAFE?

Should be no problem, AFIK.

> 
> Assuming it wouldn't, it looks like we should be able to make the
> watchdog device irq-safe too, by calling pm_runtime_irq_safe() during
> ->probe().
> 
> In that case it should be okay to call pm_runtime_get_sync() in atomic
> context, right?

Right! I registered the watchdog domain with GENPD_FLAG_IRQ_SAFE as well as
it's parent domain (the always-on domain) and all looks good. However I
need to run further testing to be sure nothing is broken.

Thank you,
Claudiu Beznea

> 
> Kind regards
> Uffe
> 
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/watchdog/rzg2l_wdt.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
>> index 6e3d7512f38c..bbdbbaa7b82b 100644
>> --- a/drivers/watchdog/rzg2l_wdt.c
>> +++ b/drivers/watchdog/rzg2l_wdt.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/reset.h>
>>  #include <linux/units.h>
>> @@ -169,6 +170,17 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>>         clk_enable(priv->pclk);
>>         clk_enable(priv->osc_clk);
>>
>> +       /*
>> +        * The device may be part of a power domain that is currently
>> +        * powered off. We need to power it on before accessing registers.
>> +        * We don't undo the dev_pm_genpd_resume_restart_dev() as the device
>> +        * need to be on for the reboot to happen. Also, as we are in atomic
>> +        * context here, there is no need to increment PM runtime usage counter
>> +        * (to make sure pm_runtime_active() doesn't return wrong code).
>> +        */
>> +       if (!pm_runtime_active(wdev->parent))
>> +               dev_pm_genpd_resume_restart_dev(wdev->parent);
>> +
>>         if (priv->devtype == WDT_RZG2L) {
>>                 ret = reset_control_deassert(priv->rstc);
>>                 if (ret)
>> --
>> 2.39.2
>>

