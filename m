Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBE9471BF5
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Dec 2021 18:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbhLLRuL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 Dec 2021 12:50:11 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47998
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229584AbhLLRuJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 Dec 2021 12:50:09 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DA8103F4B3
        for <linux-watchdog@vger.kernel.org>; Sun, 12 Dec 2021 17:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639331407;
        bh=WCCvwpT22jrWbgMHRE3RsRLnwwEuukRNrzKAgDnW7I4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Z6PYwsJjDE0HyuJJb27t+MZbrAnbADY4Gjl3/vTRi2tn9htuxZCDyOUfmibrGPAyr
         H82EXeWQn0BUBaDYdt/sBhStMB4qNz5l6/yGyWi/qqfIII7WxM0OUmbo77OXhi/Hwe
         lFis7Tmlel1wiEFw64ld5ZiMqFOsdMRemVhc+ch/PKDZoOxHOAVx1Qa4ny/kC4MiXJ
         +WJA3RmDCTHzHSa0V2uvKTOiNDoFUwPNiJFLc9+Lye4heU5GQp92/nLxXkPWUIUYDJ
         xgojAn4iaktH0Z14tXsloWhVaxxR1msls+6HZB1vyVWRBaM3rQ0jjp5c2PeobLLiNz
         oshwUAmPIzAfQ==
Received: by mail-lf1-f69.google.com with SMTP id bq6-20020a056512150600b0041bf41f5437so6460339lfb.17
        for <linux-watchdog@vger.kernel.org>; Sun, 12 Dec 2021 09:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WCCvwpT22jrWbgMHRE3RsRLnwwEuukRNrzKAgDnW7I4=;
        b=ihtAUpt1dz76HpnwX0Xr5a265j6DEw089qqwb/kM/vNgyg/5Ys8wSIgz9Oadks+pcs
         2m9GkKmSId3uH+B0ofw47tQRieoFJ3nT+P7MxkH9DOnfin1JXbnUT7uoHM1NTfU90TTg
         NCyb5RPTLCAatIrlhtAvgwlZVtSsYOwlgORBcIotM8mkqU+pYnqgmtR+8F/3egV5gXXX
         s4SG3KDQAFz4yr46nuFfVJk5QQ/Wdk5LSIgyc6DtbOEHmEqrORIUJhDoK4pfyVe3/kHO
         Sk7tGX3HRt1xmVeIMKxx4ecWQczqX9JeyCnSbRBfVUb2AQxujFpaskXilx9fZkwUwEQN
         rs9w==
X-Gm-Message-State: AOAM533BlN+sdCbK2T1bAlpIZsVJwpkd+EPT4dFDVaF9QBFvBdwaxSFj
        zmgmIa4JhqDoDvZqu71MZBUA41/4AbcTmU6chQDRUC/ERb9samnf9T3TzzepYHYMavBYY/e/Jdz
        v2aRUzYOdiVEKUQRlHwpxb2T/YxIfJ6Pcm7OjzRzywfLW
X-Received: by 2002:a05:6512:2820:: with SMTP id cf32mr24881727lfb.510.1639331407210;
        Sun, 12 Dec 2021 09:50:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUu1cZVv3akhdYGI1KReu7wig7sZszq46hRcYvBeAwNUtzmKOFPO3wTQxMzJmtsBvtBD/ddg==
X-Received: by 2002:a05:6512:2820:: with SMTP id cf32mr24881715lfb.510.1639331407044;
        Sun, 12 Dec 2021 09:50:07 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u7sm1135220lja.58.2021.12.12.09.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 09:50:06 -0800 (PST)
Message-ID: <b618ff5b-ee41-2c29-5074-24fd4d0f0933@canonical.com>
Date:   Sun, 12 Dec 2021 18:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] watchdog: s3c2410: Fix getting the optional clock
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211212170247.30646-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211212170247.30646-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/12/2021 18:02, Sam Protsenko wrote:
> "watchdog_src" clock is optional and may not be present for some SoCs
> supported by this driver. Nevertheless, in case the clock is provided
> but some error happens during its getting, that error should be handled
> properly. Use devm_clk_get_optional() API for that. Also report possible
> errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
> clock provider is not ready by the time WDT probe function is executed).
> 
> Fixes: a4f3dc8d5fbc ("watchdog: s3c2410: Support separate source clock")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
