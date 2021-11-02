Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B23442B81
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Nov 2021 11:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhKBKTj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Nov 2021 06:19:39 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33624
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229924AbhKBKTh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Nov 2021 06:19:37 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4FABC3F1A6
        for <linux-watchdog@vger.kernel.org>; Tue,  2 Nov 2021 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635848222;
        bh=ZnYrLeHuEgfuM05nu3pyL3JiHzUr3XDV8sCLOsuYLD4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=hLB/bCAhzMR6TIiPREiBvv1yIeGe4AV3fipvh4gdbAu4BAKSrcxBxPy4y6ZpTDS95
         IeaxGzVGygAsHfpqikn8IS5zLChTPNnWdBnNfP7/GZW+kp35ujp638T0706f/ft0fG
         /AQbt8w6dvFf8kYmQ7CUmAINC4z4RxVLYuUP3TMNU1/UHz90VQeZysf11tUvVIAiZR
         T92KV4c/1GEM3Ky/I+5z143Ic8axt6UGzNnXugognE4UdqVUaXG4CNI4tYRNSeCA9J
         qjfy1ju4l3JH7wfISP42e2pfSUmisEPzAMK0eRSvBqnOrMSzoOBGzUSj0IrxjTSf6E
         gBvrzdlyu6V4g==
Received: by mail-lf1-f72.google.com with SMTP id z1-20020a056512308100b003ff78e6402bso6853969lfd.4
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Nov 2021 03:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZnYrLeHuEgfuM05nu3pyL3JiHzUr3XDV8sCLOsuYLD4=;
        b=JHgePsjgxtnaliMeRH/+4d2edmb9Bw7Oc6j9AR7ywygpm0pzU02X1nuUhobVS9bQcu
         uMO7Cji8aQEWbfWxGoAA3OMU0z31Ytk6o7EAZrrPq2z8oDCe45uwuc0cpOVk0pvI+9G6
         4L1wdlVHu2gvT+vw92PriwZa5XWhVyjs5kTAUKaGT/BzysyOxbQIuN8zfwZUy9i5vvtk
         4YiB5eaReUrgFUeuRLaa1GFMqojiM2CBSKmWbAuAPt/2QYzxrFEY9OnTRQDYQ7yZY+m5
         5bNP/Cot6nOygMRy6PSZPu6BgmMEUSxMeTKYahaHsS0y+7ecMCVPWJ5R7uBko926D/Lr
         hn7A==
X-Gm-Message-State: AOAM532MDzQ5fEFcZawkNU1DfxbSagAeyopHMyTmZV4Kjh/NDLzVO3jZ
        uiSsA+7QufNq2pGYgIHR9DResTDOvt3koyBmD7ckPYTRHNqNAB17xZkfV7wPtAYPJKBEA3EPmMJ
        H8kImIUH8+Co4FLKNXdJQfXtMvxUKDhdz595DZd2mjBrO
X-Received: by 2002:ac2:5965:: with SMTP id h5mr1767550lfp.436.1635848221848;
        Tue, 02 Nov 2021 03:17:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw4CLm4v8vZx2M+lvaxwy0bY7pA4e/hJAEXJ8SsRUMw7zK5v0ms6nBbPJ5Yl+B9eg/oQapIg==
X-Received: by 2002:ac2:5965:: with SMTP id h5mr1767539lfp.436.1635848221691;
        Tue, 02 Nov 2021 03:17:01 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u19sm941645lfr.154.2021.11.02.03.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 03:17:01 -0700 (PDT)
Message-ID: <645dbbca-eddb-52e6-5f7a-9eeb819e85a6@canonical.com>
Date:   Tue, 2 Nov 2021 11:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 11/12] watchdog: s3c2410: Remove superfluous err label
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-12-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-12-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> 'err' label in probe function is not really need, it just returns.
> Remove it and replace all 'goto' statements with actual returns in
> place.
> 
> No functional change here, just a cleanup patch.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
