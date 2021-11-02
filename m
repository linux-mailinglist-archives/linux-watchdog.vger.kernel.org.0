Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87604442B1C
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Nov 2021 10:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhKBJ6J (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Nov 2021 05:58:09 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:46410
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229778AbhKBJ6I (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Nov 2021 05:58:08 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 098393F1B5
        for <linux-watchdog@vger.kernel.org>; Tue,  2 Nov 2021 09:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635846933;
        bh=D5VCGyo/EkhIr12Vj9NeHrXDS/X5WmXY/nUH6wa2pHA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=k3Ky9KO/zSa1FRGTloYoiBLCcEuAbxyeCmykdiTaRclL9sZhwH1x8GJA3nHlba8BQ
         WIsfGx7d3B2C+Rq1jDM5+apztbJkmCstyzdOEajFwEtW/h4bK/PSWJtE7rWbieHveb
         tKyxtisR2kU7u9d0IJMQppDKGZiewol/JsPj3V1VBPidHl7c5iU/YZVeAdQfVWF9Y4
         jdfGRBFRZ3fitzEm8WmlwMD0zDkrBnpN8+e95pwfYzGS1Y1yFX+vPr9zCOr51qS2cD
         HBl6Ei82QXJUbCWtjylXVbSKTBrku9uIzANTPUnv8FC7Qi6tY4IFg4zEyQRV/MS3xK
         97TskJ092ukMg==
Received: by mail-lf1-f71.google.com with SMTP id d10-20020a0565123d0a00b004002359a671so1116810lfv.10
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Nov 2021 02:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D5VCGyo/EkhIr12Vj9NeHrXDS/X5WmXY/nUH6wa2pHA=;
        b=0shxoyyaqh/VpKdVnsUl4yTjg84YzZiB4bPFBHlvWLASv7KrUQdBdO/5gfF78oSoN4
         WCl9S59LmnEj7MfgvOLTeQ2jVAhidTkZrzu0pwQTS0pS1ZqJAZXxzMjrDXEZBGdQJG/q
         OQpTrRuwkYHNyYb8yC9ggOzCRUmbEmfRfo5brPsOe/RbJHUUiX6UmoAMCsb5H8IAiuwT
         uqS/n+CNonQgaTlg0o3ztUMbFkRN3E5OeT1C8neY/yFLCog35L61ymI49gQAXC6h8ukk
         FjsfNccIUMlo26FADEPmaiaXV/5S5u+mtcwFkoocpeGB6yyUJQ4I92znJqa67YWT8xCl
         AXdA==
X-Gm-Message-State: AOAM5323jltEGprzPeZ7DNfWz5QeUauxgg/wK6odNPRnct75LdDbRcJZ
        rwduDpHhp4CTr35fGAZt2yqIIt+MTZET6AgQSFmvEwQ6g/+ujNTlgSV8EzSdJozkwhgulRMJwDj
        yo6htwXdZ3Ew2OMUKaz/j5Ak32SLrmAd+zodxIZCE0NAH
X-Received: by 2002:a2e:a789:: with SMTP id c9mr16370089ljf.207.1635846932476;
        Tue, 02 Nov 2021 02:55:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykgYTwyNmlD0ClXvAZbn/Fd88xx1Po6qCMFLwUAPRSjJtbrNvKtBER1w8/MasJz6xZqJsHEw==
X-Received: by 2002:a2e:a789:: with SMTP id c9mr16370065ljf.207.1635846932330;
        Tue, 02 Nov 2021 02:55:32 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v138sm1645009lfa.51.2021.11.02.02.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 02:55:31 -0700 (PDT)
Message-ID: <bd4c2afb-ff86-9c18-b64e-1c87a8b6d0e6@canonical.com>
Date:   Tue, 2 Nov 2021 10:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 06/12] watchdog: s3c2410: Extract disable and mask code
 into separate functions
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-7-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-7-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> The s3c2410wdt_mask_and_disable_reset() function content is bound to be
> changed further. Prepare it for upcoming changes by splitting into
> separate "mask reset" and "disable reset" functions. But keep
> s3c2410wdt_mask_and_disable_reset() function present as a facade.
> 
> This commit doesn't bring any functional change to existing devices, but
> merely provides an infrastructure for upcoming chips support.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 54 ++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 19 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
