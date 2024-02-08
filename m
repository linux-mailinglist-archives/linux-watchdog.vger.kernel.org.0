Return-Path: <linux-watchdog+bounces-631-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169484E14F
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Feb 2024 14:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E18285C7E
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Feb 2024 13:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA763763E1;
	Thu,  8 Feb 2024 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IwgxIbHM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14229763EA
	for <linux-watchdog@vger.kernel.org>; Thu,  8 Feb 2024 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707397350; cv=none; b=ngbDeflel3HI4YQ5w0dXrHRa0J/Hjif87KbEDpQ38VlqAjUdfY2s9EpfxMQl0zHySjcCVswlNNfZmvAVU4AxHAqhRmYu8k6T9P3KdO4njv1I1/L8Cb8f6hXfCftXNU1PgnmuKv+KkXBhEZ61PHdG5Ap0P8gIv11klum9qVw6g8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707397350; c=relaxed/simple;
	bh=PlpJiPv+jw1aT2k6PyxJHhvGRzCrE9cSPhqoqNUxN1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojpUhUYIbNeqCdSwaSiZANG8lekgnUDJGRu+3HwPh1a+6WFc5h188jkREpp2Q+LXfMXGZAuvayvHbEAYAOqwc9MKslQio2Nr0RaFi71eJW2eiFZiXMEh4FO3K8aUChtN7NTKLBLLJ1pQtHQAjtWsPdSfYqbh9eJGsCZLPaVMCUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IwgxIbHM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4101d4c5772so5282405e9.0
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Feb 2024 05:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707397347; x=1708002147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KslkqBZgMhr9Pa5UzxbX4ZtZqy31jeJRHoyaCwGBOVE=;
        b=IwgxIbHM8Q8+zHbtYvbOK/wFO/pqQn2WwW3f6zaGaAT3AfeUiRDNY6aAwRjiNNKGGW
         OYTGslRjOZNhOtLIjUaLFcuZaGk1utGFlKnFAaBGodkACCn/NLo/jrOPCDrj2veQJi4i
         BXuICyb30vCMjeqvMfEyxIJ0zLGNLOV+bOpBpWlq9BsW5Ty+QPdor64DszzvTeyVH/gT
         QT7uFNp96mYeMHvB23fgmM1baZzXi3FVXd02D9HMu0m+wij55wxRgWUihMOoWfimpDSq
         tfPPtJ7sOK0Z9DEvBoEbyY53rKg/Rykm/I01QQqmd/ELW++h7NYo8WokQ7piQQO9fcXA
         4yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707397347; x=1708002147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KslkqBZgMhr9Pa5UzxbX4ZtZqy31jeJRHoyaCwGBOVE=;
        b=m0/keA0tgZnucsrdrGryRiES0BpIfIVvtzx7oljTIypie1iDfA3X8CLKLtSMywkM3L
         MN+KB2d4S3sFAi9chiFL6qvaFZrPn7PUsEDo75c74cb3cqqO83w5qu0GRN6ApoqxBCjp
         bFbLmumwoL1lJaOUodlKncHTugtEjj+L1gsLlsDHJtL9adqye1Ay5KYh2gddqrZOYwxK
         /UoGEImTupGb2iL1QTMHTufZhU+eeGa0tGeHJNWIYV1354uhmvudtUL/6th2CrWUbpWg
         iFOsot1jTPS6TynaCiq+qFidOP+zM2ncMi1CCFIP8vcAAo77SBWSFt/I37iFgTP5l6fT
         dZAQ==
X-Gm-Message-State: AOJu0Yx+8dMItFTN26wBzFhFR0XRMrxGcIkSpeasem3Jz5j905M8IzcK
	6mp3uSmZ2J3Liy5pZOFhxkvbWvxi9l5cJhwgnh7KsCcw3+qxxTPRfugVu5ZGSRw=
X-Google-Smtp-Source: AGHT+IFyM+8GKV3anGRcdos8vbiQwAuAKSWFo3KY91hdLwqYwrpGtWj+zK257876QNpKlLzDzjeawA==
X-Received: by 2002:a05:600c:45c7:b0:40f:c2f0:7ed3 with SMTP id s7-20020a05600c45c700b0040fc2f07ed3mr1921728wmo.18.1707397347317;
        Thu, 08 Feb 2024 05:02:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdwXHNypH1uvDaGJJlWre62DtyvZEl42XjlTMZdtLVCOB7a5lRly6Ui04anloUq5UGoH3oN45LYduaVoORMjwuvVKwuJdaStp9eTVQLMjlq+us1d7DCpKaA1oFXRWXccxU6JOZ2m1KLmZFX/vA+TmnJALVRqZ6gYDwWy2Rr7uci9ewkDkG8dMnsQRngpPkv+4U2WkMwKe90KBTHmWWZ8bbPA9vimCljh96XR4y9YF2DwSTkGETeT3imwNBqOWxRQ1o9N8vcJZip5e3AgTvOaYXcBUmDyFFwidgk3+Q/L/B92HtNqsWN2VijoR30CmON01WnBOTtBRJg0C8emxjsCJYgDfwGvM74/9TAyS2ZrAm8dj9PXMUrTvVqQ4YUZ5ro7OIIRKEyHndG1Pf1NblKk9J1x+XHevdWol4+rHV+ChR0cxsjtYTKNxDygUsBdtk6e+6d9k69MzF0vEbdRTBrc2o2HFhL2tLE/QmdUFC6u4kZcc+bHFCh6l5PZ5g9BB+jgKunidcbpVpWRBdco/dkur2+rd24X20Z4+4sj8BXx/m1qo05KLZNvbr
Received: from [192.168.50.4] ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c4e9100b0040fd24653d4sm1565037wmq.36.2024.02.08.05.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 05:02:26 -0800 (PST)
Message-ID: <fea4f538-b3c2-4299-9af1-5e2b61d06ce4@tuxon.dev>
Date: Thu, 8 Feb 2024 15:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] watchdog: rzg2l_wdt: Make the driver depend on PM
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com,
 biju.das.jz@bp.renesas.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208105817.2619703-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdV+CryvbFkcFGthk2VM0j7m13rQJ_0GtumPg2f-hpuMvA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdV+CryvbFkcFGthk2VM0j7m13rQJ_0GtumPg2f-hpuMvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 08.02.2024 14:53, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:26 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The rzg2l_wdt watchdog driver cannot work w/o CONFIG_PM=y (e.g. the
>> clocks are enabled though pm_runtime_* specific APIs). To avoid building
>> a driver that doesn't work make explicit the dependency on CONFIG_PM.
>>
>> Suggested-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v6:
>> - update patch description
>> - fixed the dependency on COMPILE_TEST previously introduced
> 
> Thanks for the update!
> 
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -911,6 +911,7 @@ config RENESAS_RZN1WDT
>>  config RENESAS_RZG2LWDT
>>         tristate "Renesas RZ/G2L WDT Watchdog"
>>         depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
>> +       depends on PM
> 
> depends on PM || COMPILE_TEST

Isn't "depends on PM" enough? As of [1] ("If multiple dependencies are
defined, they are connected with '&&'") the above:

depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
depends on PM

are translated into:
depends on (ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST) && PM

Please let me know if I'm wrong.

Thank you,
Claudiu Beznea

[1] https://www.kernel.org/doc/html/next/kbuild/kconfig-language.html

> 
>>         select WATCHDOG_CORE
>>         help
>>           This driver adds watchdog support for the integrated watchdogs in the
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

