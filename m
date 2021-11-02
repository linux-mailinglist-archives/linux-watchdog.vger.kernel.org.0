Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9789442B6D
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Nov 2021 11:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhKBKPS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Nov 2021 06:15:18 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47100
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229770AbhKBKPR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Nov 2021 06:15:17 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7AA8D3F1AF
        for <linux-watchdog@vger.kernel.org>; Tue,  2 Nov 2021 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635847962;
        bh=l1YI4K+yZhbV4PJqCdoYeLxnDM8UrODJDMAQJiCQB2M=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=CA8fljvonDX/al3EUUVMmzJFm8VTzRdrD7vkGhKBLKCxFEL5Hqc9idsQmauV5e3ep
         lONMpf1SzAp7U5FZzeAN8ruxhRUolrsoM8re2D80DR7pRfiWfVMOXqSlssmHmfkRdO
         BTIt/W8kZz5tGjQ2wqYCjO1AmP9UOPs3tJUjr5ElZCWgNbUFADzNT38eRAQEGG8GQ3
         VgDOmYo7ZZ2Z7fmY2xhVDKQ/81ZVnqPKu+RGZTnlpejRGzc0Uo4JbvVEnPbDHAG3Mq
         VcOriN4ynMgYwPzbNUiSgheQwtBl1XJVFV7wEBD4Tvp2WhJRWywjce/rM6+By5k0FB
         rZ5cMkhZK+Vbw==
Received: by mail-lf1-f72.google.com with SMTP id t62-20020a19c341000000b004000224ab0cso2801030lff.8
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Nov 2021 03:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l1YI4K+yZhbV4PJqCdoYeLxnDM8UrODJDMAQJiCQB2M=;
        b=p/tmP8EQ2Dasu4YqwtSAKnxRbMrJ8a4sCdiH+OvUzIO8k8S5CSLSUg7Cvfbt4zvmcv
         NF8Yh13hoqiX8TGvLAVs9WZ5WeANZZ/UV+wrdU/IaTuj4rzAEdBckz3foKdwjm2wgJGw
         mT522bNxqknOEJ0njeI7oOezN7iwRq5Y6U/YLBsCmrO5bhbKhA7yDcoUglvBqVMww+fC
         zL4gD7BWUnnKCW0Ji17sFHasfnaW0x2oo3qQxzy2aQgzK9qd1f/m3VUtRKRPfyh7MlQj
         ByOvlWtWX5+WauAq8JoIbovvERurZ+ECmY/9k0dqaYsrfvNBiycGKvd3lfPcEp3vtQjq
         FHWg==
X-Gm-Message-State: AOAM531lJ14ivV9NEMk1G9hV1m26CY1MFrDlXz33y2XBDj3p4rPX8oHU
        KkVD5zIurNhxDiaJyR//BR1/QaLiipCKPzJQ7DjB55Hto4x0WmGoXL8FS7zvhiZhnuznkkX8w7N
        rf6NtdSegQG1YawhUtZUt037k0vgtv21+rB3I1WVptjsl
X-Received: by 2002:a05:6512:3d8e:: with SMTP id k14mr35051984lfv.116.1635847961890;
        Tue, 02 Nov 2021 03:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH/WU3w6clnIkoXTZyz6TpvOkVotILXcnAZmP4j/0UunyOcd+USzP3JUbn8e3EKkAiUTyhKA==
X-Received: by 2002:a05:6512:3d8e:: with SMTP id k14mr35051959lfv.116.1635847961710;
        Tue, 02 Nov 2021 03:12:41 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x14sm952112ljj.140.2021.11.02.03.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 03:12:41 -0700 (PDT)
Message-ID: <235f674b-bf75-764b-a386-ad46331f9bda@canonical.com>
Date:   Tue, 2 Nov 2021 11:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 09/12] watchdog: s3c2410: Cleanup PMU related code
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-10-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-10-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> Now that PMU enablement code was extended for new Exynos SoCs, it
> doesn't look very cohesive and consistent anymore. Do a bit of renaming,
> grouping and style changes, to make it look good again.
> 
> No functional change, just a refactoring commit.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 48 ++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index ec341c876225..fdb1a1e9bd04 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -56,17 +56,16 @@
>  #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
>  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c

Please document the meaning of each quirk with 1-2 sentences. Could be
in this commit (e.g. "Watchdog reset requests should be unmasked in
PMU", "Watchdog interrupt needs acking").

In general looks good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
