Return-Path: <linux-watchdog+bounces-2148-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF2C99623F
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 10:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A698C280EF4
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1939D186E26;
	Wed,  9 Oct 2024 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="g360Lcbm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2946417C220
	for <linux-watchdog@vger.kernel.org>; Wed,  9 Oct 2024 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728461918; cv=none; b=cd/6nSgZZ3MCC2t3J7f1x5H0JkOWBkw7YZG5nDbUjOy+NpbP43kH3OkfN0Vax8JTHTa0NZCWECbFHnzzqUlHQA3B4JHdjnT+08Ae4m/NLEClzqwD378N81dRPQfWuFiSxKXI9WAzX+U5hhlkcijKXBlb5pKmJVzFJXHT8xoaoP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728461918; c=relaxed/simple;
	bh=9LHuyWaTTb+OHbKLa/jE5lFrhl+fzC9T/Zu5XX+ZipA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=im9q588ZMqC1iOfPo4WdOWwxTyEhQiWjQrNkR1ShYqNS7AYnCFp1WJbuWAAI58IOjWuKqtXXGC8hfScD2fN2hbWoO2siW9GSKYpXxpzd+XAsmZLE/JPRVUjz+husnZNh3zXzCgWNbvCE+gOMtELvACaPeXJIHQvDg6eDxZXnfn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=g360Lcbm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9932aa108cso657471066b.2
        for <linux-watchdog@vger.kernel.org>; Wed, 09 Oct 2024 01:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728461914; x=1729066714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUVCZs6FF5zExuXlSUHIIIcYWTginjrwLlNpSDmwoQY=;
        b=g360Lcbm6bLEmhIzfeMwnCOsEm1OZ63Dg2sXoSxeYnWzPBA3aVHe4E+uBDShgi8ZSL
         tiRS3OoqJa8I1RiaFI2DzB/AtOcMCdoINKe7UCHCAxxeqg0u9Lx1P9L25p37RkqApmUG
         o+FsqCAU876ypEsqoBfRQLQgPQ1I6fD713zAyfaoXBoKf6uxLZ7TV+l9s0InJEKT7Vnf
         GApMk+8sPls54Pvwo7woo4QkEMT0FlBO+7pFBBOhFU+ZHo8YighXZM6e/zL0K3HrrOTN
         9q/uBI6HZO57MLGZWZ/pj4YmvXr8IBALofDRYyFmiX6hawewATGz2mG6oLNoW+QqkgGC
         h/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728461914; x=1729066714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUVCZs6FF5zExuXlSUHIIIcYWTginjrwLlNpSDmwoQY=;
        b=WomNJsogT7GvdZvJ33zW0LHT8kVbVXjIKzdHhOVVDf+Ec7PItFyqiKrk1YXX8H+n/O
         9FnAFqxgoATHN1sTe50nY8a9kqBEos9dMmlinIa1n0WajQjjten22jZRCMOj7grLU7R4
         Mg5SaZijIU1iakuuB4ukH0f75G3asLi383L3SNbhgO8WITDMQ54e5jitOBVizHu40c6W
         8W2cKXiQADG++yaIz1h2/rYFjq9fkCYbezSHx1iSK5BQ/6ZSa0njVJBb1sOC7s2NsVue
         EkBpOwVKn6pD1zPwotx4gmholKs7nIAaN7dC58a2+afy0LcBymLqcBOxx8Z1JswIwG/f
         Y+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhU03xPL6Lw51wKIoUCeyupjOgnP4VZTosH6g/fk/QfO9VtSyFdK//PB/moLZ6l2x6PCTorSosHnGydRpNmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qcRXDa2sbZAhXNgWMgTxQXGACe0vEJX/cIZgWK01htuWUigx
	qAKltsxvA+8pEJlg9LvQnEHHOXtu378MWpyiuUESoPG6mIIodDMNqyOqLPH85o0=
X-Google-Smtp-Source: AGHT+IF+RTY8Mc5Y4QDpOu5pSnyj1yytrBqNaKWSxPAKfIOt+KORUehPKsu2YUBaEqqQNuBrLDhuSw==
X-Received: by 2002:a17:907:9625:b0:a99:529d:8199 with SMTP id a640c23a62f3a-a998d33172bmr129577166b.62.1728461914465;
        Wed, 09 Oct 2024 01:18:34 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a997a6b7013sm173247666b.70.2024.10.09.01.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:18:34 -0700 (PDT)
Message-ID: <90990ed5-5c98-4a10-8593-bb3331a8c3a4@tuxon.dev>
Date: Wed, 9 Oct 2024 11:18:32 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: renesas: rzg2l-cpg: Move PM domain power on
 in rzg2l_cpg_pd_setup()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240902132402.2628900-1-claudiu.beznea.uj@bp.renesas.com>
 <20240902132402.2628900-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWF=3svkFT8sVEtTahtDh3tJG4FjqmqhJJKs9JYNd+WCQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWF=3svkFT8sVEtTahtDh3tJG4FjqmqhJJKs9JYNd+WCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 07.10.2024 17:18, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, Sep 2, 2024 at 3:24 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Move the PM domain power on in rzg2l_cpg_pd_setup(). With this the
>> previously always-on power domains got
>> struct generic_pm_domain::{power_on, power_off} populated (and
>> registered with simple_qos_governor if #power-domain-cells = <1> and
>> with pm_domain_always_on_gov if #power-domain-cells = <0>). The values for
>> struct generic_pm_domain::{power_on, power_off} are now populated for
>> all registered domains but used by core only for the domains that can
>> use them (the PM domain should be non always-on and registered with
>> simple_qos_governor). Moreover, the power on/off functions check if the
>> mstop support is valid. The mstop is populated only by the RZ/G3S
>> initialization code at the moment.
>>
>> This approach was chosen to keep the code simple and use the same code
>> across different implementations. There should be no issues with this
>> approach as the always on domains are registered with GENPD_FLAG_ALWAYS_ON
>> and the PM domain core takes care of it.
>>
>> This approach allows doing further cleanups on the rzg2l_cpg power domain
>> registering code that will be handled by the next commit.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - none; this patch is new
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -1680,23 +1680,26 @@ static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
>>         return 0;
>>  }
>>
>> -static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
>> +static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd,
>> +                                    struct dev_power_governor *governor)
>>  {
>> -       struct dev_power_governor *governor;
>> +       bool always_on = !!(pd->genpd.flags & GENPD_FLAG_ALWAYS_ON);
>> +       int ret;
>>
>>         pd->genpd.flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
>>         pd->genpd.attach_dev = rzg2l_cpg_attach_dev;
>>         pd->genpd.detach_dev = rzg2l_cpg_detach_dev;
>> -       if (always_on) {
>> -               pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
>> -               governor = &pm_domain_always_on_gov;
>> -       } else {
>> -               pd->genpd.power_on = rzg2l_cpg_power_on;
>> -               pd->genpd.power_off = rzg2l_cpg_power_off;
>> -               governor = &simple_qos_governor;
>> -       }
>> +       pd->genpd.power_on = rzg2l_cpg_power_on;
>> +       pd->genpd.power_off = rzg2l_cpg_power_off;
>> +
>> +       ret = pm_genpd_init(&pd->genpd, governor, !always_on);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (governor == &simple_qos_governor && always_on)
>> +               ret = rzg2l_cpg_power_on(&pd->genpd);
> 
> I think you can drop the check for simple_qos_governor: in the single

I remember I tried this but I don't remember for sure why I kept it like
here. I'll double check it anyway.

Thank you,
Claudiu Beznea

> clock domain case, pd->conf.mstop is zero, so rzg2l_cpg_power_{off,on}()
> become no-ops.  That would also allow you to drop passing the governor
> as a parameter, as it can be set based on the always_on flag, as before.
> 
> Regardless:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

