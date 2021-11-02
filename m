Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3F6442B11
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Nov 2021 10:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhKBJzJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Nov 2021 05:55:09 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60666
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229778AbhKBJzJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Nov 2021 05:55:09 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 14ED73F1A7
        for <linux-watchdog@vger.kernel.org>; Tue,  2 Nov 2021 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635846754;
        bh=XRqTNhzYv9GwlgIV1twPbEH66lBurcSMPW0liEplDkQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Tp1UWfIiRflkcwtLqcJLYkrdv6yj921b6Wfu4nTVAPPZzqW8XxEG+kiNWu1lWSSH1
         8PgCJRnl0I8dDUwce7FqqdUkqQPxx0CVc4bxRnQdQz4YCN44BvC3gEy2ZBJbvqJaGS
         vb7CM7IAeo9hqiNWD47rmLH7PPaZWpoxEH1EmZpmgHPIDSa1tQVn0tSRB91rfKOxuX
         GBQH1EeMPjsuXBeLH5eDMS0QajYP3rzxsDf68jgamoExWTsvh6c/T6UJtI+WHOHDvf
         h3zxk80OHZCoGDspMt5RPf9VQ+/x3Lf6CpaQ2LpCUahAyiFUup+lqsFj4lkILqwGSI
         gLvXX6srgcTGQ==
Received: by mail-lj1-f199.google.com with SMTP id h19-20020a2eb0f3000000b00211a00d15acso7434619ljl.12
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Nov 2021 02:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XRqTNhzYv9GwlgIV1twPbEH66lBurcSMPW0liEplDkQ=;
        b=MrGJmEA7nvrzWNJnKH36CzzX9Aq7XsKeeroiWEBTaW2I/+8xBgLUuR5ybeqPXUCPOr
         mYYk052J+Q7BMoJVk3O+kvtDtNky5qVYqP9vpYjny9e9d7h9cycKATqP9aKjDnX1vZVI
         wdX6RlkPIeE7Gc0sc0JlwViUVpSj1d0cD/lrYofX2KDBG35CemYSx6nMQtCwIEYsul5V
         7SssThzNsZxdd+Ys/2ZbZXWBYfD4R2Q2bwD9vIAeyKWDzYVKfVljy2odjI2bPFXqxDFF
         tQumOCaZL6eufnCrcogyCjDT2BSRK+tUIXUcdIq+9kqfcrTxvkj+eWw3z4+WkXr/ib8g
         kjgQ==
X-Gm-Message-State: AOAM53330tTP7MVP1ipQ4Mw1mNWUfPPrTRhIZ/Tf3nXLuZ9TI5IvmtNP
        JVzNlh9HNS1CQLDhS19+Qr+DdshSslaE1vnAjLzs4No8pVW8Ff9nn8dXrOAKghrDRSuoaVDqTd0
        60extNa988SPF+OGEpJcUotz8LWXELRTYQxmvU19GVBlo
X-Received: by 2002:a05:651c:1601:: with SMTP id f1mr12613658ljq.34.1635846753551;
        Tue, 02 Nov 2021 02:52:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylAQt6mahxpMwyiXSJ50n4Vn8kidCqoFzoThZHoc7kvOdGVy09XjkSnciUNsz2OK/XITBmPQ==
X-Received: by 2002:a05:651c:1601:: with SMTP id f1mr12613642ljq.34.1635846753387;
        Tue, 02 Nov 2021 02:52:33 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 77sm54429ljj.118.2021.11.02.02.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 02:52:33 -0700 (PDT)
Message-ID: <9846cb60-4628-0d06-4ec2-5687cfaefece@canonical.com>
Date:   Tue, 2 Nov 2021 10:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 05/12] watchdog: s3c2410: Make reset disable register
 optional
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> On new Exynos chips (e.g. Exynos850 and Exynos9) the
> AUTOMATIC_WDT_RESET_DISABLE register was removed, and its value can be
> thought of as "always 0x0". Add correspondig quirk bit, so that the
> driver can omit accessing it if it's not present.
> 
> This commit doesn't bring any functional change to existing devices, but
> merely provides an infrastructure for upcoming chips support.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Used quirks instead of callbacks for all added PMU registers
>   - Used BIT() macro
>   - Extracted splitting the s3c2410wdt_mask_and_disable_reset() function
>     to separate patch
>   - Extracted cleanup code to separate patch to minimize changes and
>     ease the review and porting
> 
>  drivers/watchdog/s3c2410_wdt.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 0845c05034a1..048ca47d0b8a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -59,10 +59,12 @@
>  #define QUIRK_HAS_PMU_CONFIG			(1 << 0)
>  #define QUIRK_HAS_RST_STAT			(1 << 1)
>  #define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
> +#define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
> -						 QUIRK_HAS_RST_STAT)
> +						 QUIRK_HAS_RST_STAT | \
> +						 QUIRK_HAS_PMU_AUTO_DISABLE)
>  
>  static bool nowayout	= WATCHDOG_NOWAYOUT;
>  static int tmr_margin;
> @@ -137,7 +139,7 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
>  	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>  	.rst_stat_bit = 20,
>  	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> -		  | QUIRK_HAS_WTCLRINT_REG,
> +		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
> @@ -147,7 +149,7 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
>  	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>  	.rst_stat_bit = 9,
>  	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> -		  | QUIRK_HAS_WTCLRINT_REG,
> +		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> @@ -157,7 +159,7 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>  	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>  	.rst_stat_bit = 23,	/* A57 WDTRESET */
>  	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> -		  | QUIRK_HAS_WTCLRINT_REG,
> +		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
>  static const struct of_device_id s3c2410_wdt_match[] = {
> @@ -213,11 +215,13 @@ static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
>  	if (mask)
>  		val = mask_val;
>  
> -	ret = regmap_update_bits(wdt->pmureg,
> -			wdt->drv_data->disable_reg,
> -			mask_val, val);
> -	if (ret < 0)
> -		goto error;
> +	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
> +		ret = regmap_update_bits(wdt->pmureg,
> +				wdt->drv_data->disable_reg,
> +				mask_val, val);

While shuffling the code, please align the arguments with opening
parentheses.

Beside that looks ok:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
