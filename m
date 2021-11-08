Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E782448044
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Nov 2021 14:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239947AbhKHN2G (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Nov 2021 08:28:06 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48756
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239961AbhKHN14 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Nov 2021 08:27:56 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 591F13F1C6
        for <linux-watchdog@vger.kernel.org>; Mon,  8 Nov 2021 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636377911;
        bh=cQNVECNpHuXn3Gv40lUHf3vm0HMBLn3SO5kTNb9udHg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Xr0QgcLll4nIHDrkgRf1692DTjeVtsdoED8rrcLVJ4kYK0OJ5XqjDzkLap2O4pFKM
         YwBtsox5xnn2CNqFlHkpimqmXLQqcGXIlC+5bSUiQuP65wKrBLGTzWuUg7EQYDuauB
         D9PiFFyL5QaSnYnwOJqiAqQdazXnkZjVvqNZimcNZ02kAUzUgdeCPVEVLazmYWc8YW
         v4miPdtaENhm3lYXZGRQyxhEL61yGTAq+qOfLL3WZiuse/ljO1CSpRWma2tEfQMl6n
         FDEgavs8GneddPn0A/F6nXHJyUVA6gBKD1eHycJDWGsIj5yloMxt7r28YOfRaQTG4N
         OF4bqYfSVK9tA==
Received: by mail-lj1-f197.google.com with SMTP id v13-20020a2e2f0d000000b0021126b5cca2so5202664ljv.19
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Nov 2021 05:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cQNVECNpHuXn3Gv40lUHf3vm0HMBLn3SO5kTNb9udHg=;
        b=iIP128q/KsO8jVA4Wybra0rs+DyLcUniDYMl2NfquXw/ZmqOuwnlynnXPRAm5z7OoH
         5kyswyA27EjhL2bNWkN6Maui4AUoADdZcHobtmdvaoCGwZr3OaIWabKqaS4V1H8wElBt
         eIWN9GN/GzeKnVXMLWU50+ecdb0JRhtkntxBwVHEDB4HS8JErw+XzQOT9XGdN8OzsLCm
         SUpjdBexdIsnw3bkmApMuzOiw7HpBWa7ezodxaDJdEQcdufw9bi99WwzDpcTT3lqD9As
         fbKpiC3Mtw2C7OVAMXy264lFbDudFXiMjkv3fDtGHlGQUKPCs0WudnJjKZAXJjw65S6c
         9J2w==
X-Gm-Message-State: AOAM531EuQ5queJl1gxwAri33RrGVvlqSRBUgGVYo6bI0f9yWDMcAEWo
        IPfwBUfvClpME1/9oMZjrc0YaLjTH9mqpoFD65KTxm/oG4Sh5I66ECm2KlaTljnlRdUs9DZgQCh
        Wghu8ocH+uzysMJHq++pIwk3dg5F1sfRRUTFAJKMdBXKR
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr74616244lfr.415.1636377910760;
        Mon, 08 Nov 2021 05:25:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVkWMjaG1ydKUi2N53zvF6W6a1WDL4riE4vI34E9xDpFmNKcciyZDkrjMVTWlTTUO5Qz090A==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr74616212lfr.415.1636377910531;
        Mon, 08 Nov 2021 05:25:10 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c23sm1550726ljr.85.2021.11.08.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 05:25:10 -0800 (PST)
Message-ID: <0bf73f1a-3be0-5135-747c-f31eb4007314@canonical.com>
Date:   Mon, 8 Nov 2021 14:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 12/12] watchdog: s3c2410: Add Exynos850 support
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-13-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211107202943.8859-13-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 07/11/2021 21:29, Sam Protsenko wrote:
> Exynos850 is a bit different from SoCs already supported in WDT driver:
>   - AUTOMATIC_WDT_RESET_DISABLE register is removed, so its value is
>     always 0; .disable_auto_reset callback is not set for that reason
>   - MASK_WDT_RESET_REQUEST register is replaced with
>     CLUSTERx_NONCPU_IN_EN register; instead of masking (disabling) WDT
>     reset interrupt it's now enabled with the same value; .mask_reset
>     callback is reused for that functionality though
>   - To make WDT functional, WDT counter needs to be enabled in
>     CLUSTERx_NONCPU_OUT register; it's done using .enable_counter
>     callback
> 
> Also Exynos850 has two CPU clusters, each has its own dedicated WDT
> instance. Different PMU registers and bits are used for each cluster. So
> driver data is now modified in probe, adding needed info depending on
> cluster index passed from device tree.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>   - Renamed "samsung,index" property to more descriptive
>     "samsung,cluster-index"
>   - Used pre-defined and completely set driver data for cluster0 and
>     cluster1
> 
> Changes in v2:
>   - Used single compatible for Exynos850, populating missing driver data
>     in probe
>   - Added "index" property to specify CPU cluster index
> 
>  drivers/watchdog/s3c2410_wdt.c | 62 +++++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
