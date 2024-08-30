Return-Path: <linux-watchdog+bounces-1637-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57176965918
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2024 09:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06ECA283FF9
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2024 07:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB6615886A;
	Fri, 30 Aug 2024 07:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="McXKdrvi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA414EC41
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Aug 2024 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004274; cv=none; b=puHDI1BSENCcUlb0TBga+KyOFktSrL+kGkKW36k0cVGSm+hhNDAgIanB/yTKWDp99nDuf5isMdNbnx2+mRQCJukORhGH/ZRwt0w/QlaCRjH/d30i+8yOntd3ohAE1X3+CDO9FDZDqUZk8RSKbrOEBibDpA0FrtQEAr7OcaDUgQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004274; c=relaxed/simple;
	bh=o8CRy5N/QP0vv90BvpY0TE1SD1145ZLfu4J9UgiIu1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAFtH0jgb55q1d05WpSj562RNRIlbORWpPBIRAPQfkEX4PDZ42YbyDPpdsuRI3lPYHCS8rnrSDPLRw03qiFZqHo+RRGBuIwROPXxlkDRzu3Z7wwdRg1Mp0OHobZUS23puurony8BL1WMF/27P44BIxqimCfA8bqF/kKCSbObBKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=McXKdrvi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-371893dd249so1078662f8f.2
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Aug 2024 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725004271; x=1725609071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLLFPhG/9ujRCh5Id3LnvAfy27Hvm1ve5EnAKTVni/g=;
        b=McXKdrviWxCp+vRLlESSQXwa35vFGmhhWNsUwRJfQZU0r55ZLSs0nKZ1aw9FZ8aCdW
         iN07Wn0d7HAvd6bGHh/0GO57k0+S2eXF+FK91DjrRl0uFLy3+j1UB3oGrLuAsGaa1AQq
         lm4R2ZMvdvHEUn/LfDBD2hZC2Gt2grY9/0GhuMQfGdmrpn2hFL/go7RGeCUh1te0biDV
         cTgOqrrfKWue37d7FqPoaSV0vROl67V8d2ZZ/PlI7uFExB8VyowPmhZZzukQsLqmrtwN
         UiJIdhlKNBfGUsxoKX3mgzrm8xhmXljFNKOhBEUEbiWM49uCtdyGymrDua7391iEVmSW
         oN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725004271; x=1725609071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLLFPhG/9ujRCh5Id3LnvAfy27Hvm1ve5EnAKTVni/g=;
        b=lRaiNIXkZ04suWbHt4OmFDAd7w2+xgvFON/8guBS9zaN+80voUEAraeuXCU7ffUOAW
         UnzD2A0ys070JV/R9y9xLe5fsSPZdI2SH4NB1FNShwz4i1Vc9L959r3YlCEgYw/PapTX
         ZzECk07PeDAYkd37Z2aK5rcjR5pCZeyO9npJm+h/DQms6LFXJq+abD9SlfXcScOhYfRn
         45+XvPVjdMR8SNXAV2nPPQUxdphevW7FtnXviT7v5vuzgS0pogMLOox5jEonZWSKLm9i
         5nxKChKffA5ObMNc43e9Qmv+p0wP8z63Tx0YkeWyQg5ywCAYdnc5ArzXTkrkiNQ9NVCL
         Uw7w==
X-Forwarded-Encrypted: i=1; AJvYcCU3vmwVppim+Zu8AktHnTdC4fjSBYD2QtQe0Ckfl8CEpZPnp7yNr18or9ipXD9w9444g2R2Z5iFmZVJH+XL/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjOPXRqoPjYsmYkyaXOvynWrmX0Y5hbL4m0g8JS1/e4ZgI9M/
	Kr9fN71XJHov7ULiw0JPhHsrgyMHx8JTlxbCXtQggJi5Kfw+oTrucXblApx7rd0=
X-Google-Smtp-Source: AGHT+IHDX9/slgT7/GdTZaLJCStso5CFJJOwulNYGKNVh415YS6OSuMHAUYkJOcO8PCpOKwoXIevOA==
X-Received: by 2002:a05:6000:1b0d:b0:371:8bc9:167c with SMTP id ffacd0b85a97d-3749b581bcbmr3787062f8f.41.1725004270786;
        Fri, 30 Aug 2024 00:51:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b67ff88dsm190333f8f.26.2024.08.30.00.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 00:51:10 -0700 (PDT)
Message-ID: <1ced21cf-9e67-41dd-8ee3-7f8d138d4fac@tuxon.dev>
Date: Fri, 30 Aug 2024 10:51:08 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: renesas: r9a08g045: Mark the watchdog and
 always-on PM domains as IRQ safe
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
 <20240828140602.1006438-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUcstyRDfaQ0Y=1NHgBYuRWjC0vuJj2j8USCTsEE1qKVA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUcstyRDfaQ0Y=1NHgBYuRWjC0vuJj2j8USCTsEE1qKVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 29.08.2024 15:45, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Aug 28, 2024 at 4:06 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> If the watchdog is part of a dedicated power domain (as it may be on
>> RZ/G3S) the watchdog PM domain need to be powered on in the watchdog
>> restart handler. Currently, only the clocks are enabled in the watchdog
>> restart handler. To be able to also power on the PM domain we need to
>> call pm_runtime_resume_and_get() on the watchdog restart handler, mark
>> the watchdog device as IRQ safe and register the watchdog PM domain
>> with GENPD_FLAG_IRQ_SAFE.
>>
>> Register watchdog PM domain as IRQ safe. Along with it the always-on
>> PM domain (parent of the watchdog domain) was marked as IRQ safe.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - changed patch title; it was "clk: renesas: rzg2l-cpg: Mark
>>   watchdog and always-on PM domains as IRQ safe"
> 
> Thanks for the update!
> 
>> --- a/drivers/clk/renesas/r9a08g045-cpg.c
>> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
>> @@ -259,7 +259,7 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
>>         /* Keep always-on domain on the first position for proper domains registration. */
>>         DEF_PD("always-on",     R9A08G045_PD_ALWAYS_ON,
>>                                 DEF_REG_CONF(0, 0),
>> -                               GENPD_FLAG_ALWAYS_ON),
>> +                               GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
>>         DEF_PD("gic",           R9A08G045_PD_GIC,
>>                                 DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
>>                                 GENPD_FLAG_ALWAYS_ON),
>> @@ -270,7 +270,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
>>                                 DEF_REG_CONF(CPG_BUS_REG1_MSTOP, GENMASK(3, 0)),
>>                                 GENPD_FLAG_ALWAYS_ON),
>>         DEF_PD("wdt0",          R9A08G045_PD_WDT0,
>> -                               DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)), 0),
>> +                               DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)),
>> +                               GENPD_FLAG_IRQ_SAFE),
>>         DEF_PD("sdhi0",         R9A08G045_PD_SDHI0,
>>                                 DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(0)), 0),
>>         DEF_PD("sdhi1",         R9A08G045_PD_SDHI1,
> 
> Can't you just do this for all domains (e.g. in rzg2l_cpg_pd_setup()),
> instead of limiting this to the wdt0 and always-on domains?

I thought about it but this, too, but I wasn't sure about the behavior of
the currently unexplored drivers for RZ/G3S. AFAICT from the current code
investigation, if this approach is implemented we need to be sure there is
no sleeping in drivers runtime PM APIs.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

