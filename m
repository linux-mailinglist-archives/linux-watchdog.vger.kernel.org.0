Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2303B442B79
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Nov 2021 11:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhKBKSS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Nov 2021 06:18:18 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47264
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229577AbhKBKSR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Nov 2021 06:18:17 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9BBD53F1B6
        for <linux-watchdog@vger.kernel.org>; Tue,  2 Nov 2021 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635848142;
        bh=DQUpFUGZ13OCH5xFHghe2q73BFVerQ09LvF/JJEZVyI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Xp/QWP2bnD1hWBlIlP3z2V4+ZFMjIsH98Ps6eWDUWTSTUegLlEiEDe+ywZQ5Rt/J9
         229QWYG5e0+bXFdN3m+6s+OmISfWxI8fXYieETJFD8ZrhyDF+X0Gaxvpwa7HeQyEyD
         R1Y3pyBgeiI74wYumIG3HFL0ZVdSG9c34mYlcuz2qV1DZtTmeFWKKtQqwx8g6VERoG
         pJZ1iki0GhqlxuJPvL2DsN235HpOy32hU6qZB82i7FqYLa5P7lyuPl/m4PAXI821jx
         bOB9wGj2ppf34UuxefCTjfSTKJpzdg3wSWttM+bCHxqMJMaSKqcn7/CovvkVn1uXxA
         Ju3/gIFVhbB5w==
Received: by mail-lj1-f198.google.com with SMTP id q6-20020a2e2a06000000b00212c856abc8so4273919ljq.4
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Nov 2021 03:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DQUpFUGZ13OCH5xFHghe2q73BFVerQ09LvF/JJEZVyI=;
        b=Q1DjVUu1Ssvril0gORzicyyj50G/vh2Shh3CgqZLrjJuChq8VfkoLycR3k7fB7OmjT
         Jlu4pt49u7hqRehajWfwsIu1uL5o2xvYTmrKsZGKzMaTjwXazRfDcV9Hr9fBNAIYpAQC
         9p8RVsIzCsnzIl14UeSZQHDhqJzfX/eePXbc2X9Lql/c18silJzNdslEJndBz6op48c/
         ekDfb1FRYehJwtcNebcojJSDDU45Muy1B5dRVl9/omh8roO9zebbvAZqeIyQsAyUfS8G
         24mZcLe0JuTCGL5tA44Jm/j2UxS7ChngM3FhN7b47gexjYfTcfSRNCzQJJ9125wN3WXw
         8J7A==
X-Gm-Message-State: AOAM530YvdeDdDtde7+EuVYU4y0Z1ZSTyLC+ifEU1OVdawNcoRZJW3Kw
        YxXN3qavKQZKm+i/dt86e/3HOfD4+oLli8SqX/9pw4PhW34vQ0E5MrYaza9z2QAQ6T7CiXltIWY
        tLHXfxb8PIwdMLX+Ex0ptlHInHJU+K1KoRtUU3HvGF3VK
X-Received: by 2002:a2e:bd88:: with SMTP id o8mr27745382ljq.197.1635848142069;
        Tue, 02 Nov 2021 03:15:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw19yBZU62Ix4yX551lPGweiYYrsBhZngk9OZDYsebEsKVhmI7gih9ogLJHPeQH/3HIlK/ycQ==
X-Received: by 2002:a2e:bd88:: with SMTP id o8mr27745341ljq.197.1635848141759;
        Tue, 02 Nov 2021 03:15:41 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y7sm709265ljy.88.2021.11.02.03.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 03:15:41 -0700 (PDT)
Message-ID: <a63f37a9-ea04-2606-e4f5-1170c4e59db2@canonical.com>
Date:   Tue, 2 Nov 2021 11:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 10/12] watchdog: s3c2410: Support separate source clock
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-11-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-11-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> Right now all devices supported in the driver have the single clock: it
> acts simultaneously as a bus clock (providing register interface
> clocking) and source clock (driving watchdog counter). Some newer Exynos
> chips, like Exynos850, have two separate clocks for that. In that case
> two clocks will be passed to the driver from the resource provider, e.g.
> Device Tree. Provide necessary infrastructure to support that case:
>   - use source clock's rate for all timer related calculations
>   - use bus clock to gate/ungate the register interface
> 
> All devices that use the single clock are kept intact: if only one clock
> is passed from Device Tree, it will be used for both purposes as before.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Reworded commit message to be more formal
>   - Used separate "has_src_clk" trait to tell if source clock is present
>   - Renamed clock variables to match their purpose
>   - Removed caching source clock rate, obtaining it in place each time instead
>   - Renamed err labels for more consistency
> 
>  drivers/watchdog/s3c2410_wdt.c | 52 +++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index fdb1a1e9bd04..c733917c5470 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -118,7 +118,9 @@ struct s3c2410_wdt_variant {
>  
>  struct s3c2410_wdt {
>  	struct device		*dev;
> -	struct clk		*clock;
> +	struct clk		*bus_clk; /* for register interface (PCLK) */
> +	struct clk		*src_clk; /* for WDT counter */
> +	bool			has_src_clk;

Why do you need the has_src_clk value? If clk_get() fails, just store
there NULL and clk API will handle it.

Best regards,
Krzysztof
