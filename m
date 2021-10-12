Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A87429F3D
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Oct 2021 10:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbhJLIF5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Oct 2021 04:05:57 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52562
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234716AbhJLICX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Oct 2021 04:02:23 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 441113FFD9
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634025621;
        bh=7PRVUyNivfUo5mGBjKlH+dFLTQLBD7eFzbeKxjYBNh4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=g+hh6CEDnAwHw8zfFlqOI3Hb6rruTxdjtRjYqXQ6B+bOOL7mccXG3vd+YO0648v4A
         pdI/2EQ2yu7RfyJcqGBBS4xbFG/Useq2n1MMszhMfPe5Fx0ZIItNALSPjIQXelJQsZ
         P+jOtuYH8LoiR5H8nsCmBYfaTTsaLLvWD8tS+ZoKudPXYbp8NbjXpWkYkz2Q6m91+C
         DTNMpIvpPvvXpXL2HzYRWXQqvzIarpGreEHQ5IYzgnMOA/iJ7g7DV8Iej5VwcXNeXZ
         xYKPVc3HkeLUCAuWXbrdEA1I6YQUo4g2T6k6U0hnJqtyQvpxDruQDtullMRURWgJZR
         rS8n6iRFQUDhw==
Received: by mail-lf1-f70.google.com with SMTP id g10-20020a05651222ca00b003fda3f05c17so261025lfu.11
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 01:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7PRVUyNivfUo5mGBjKlH+dFLTQLBD7eFzbeKxjYBNh4=;
        b=TO9lEuzTRND7Kme0IvJI5Jqs2ZKGWLciyN8czW47af87MT9q3fGnmzrLfIXEYSDvLT
         /y/vtZVdEeQ1XhATPiEJzESgyG2aFJ71m+Oy0pMDePZ5ujlc5xQEgDG6TsWnIWpslOWO
         46rV1GMXRneHoB648IL+RthfuK7tzsVplQVxONX5cAgz3M7Xd9TgyKY3PKY5KUhdxtwK
         ciRCwSr+o12vbqCbMCdeSXbI/g7EfoiuG3lB43/cKJSMEGma25GBnt/vtPJ6KGqA5mOF
         vkfy6Cb9XWDm+Mxu5E0oa54QmlxGcdy1dy4iwWX7m/v3jI3HP+LIO9/WPdes7aGPU0PX
         EoVg==
X-Gm-Message-State: AOAM532MsL32FoxyRR7NiLel7sBa8MZx4zFRqTT3PcUqBkv8ubY39g6G
        9k8ctF8Kyh6O/paAHdPcHLl6Ct+iRIufxRS83SEfbiPzYL5wKwyVTR/eXjGVnB1Nv7lBkP3ZOZb
        PW7i0KkwRv/LgVCkfdqdgPf3pYZJWR9SlDmdN4d999Kfj
X-Received: by 2002:a2e:bba2:: with SMTP id y34mr13112997lje.258.1634025620737;
        Tue, 12 Oct 2021 01:00:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8PoMd4G/2DBakGPF5Wot83guPDedVlWBzwBW1lNr9ehYO/3shVL0inJnAxg6sMEAxZMQJEA==
X-Received: by 2002:a2e:bba2:: with SMTP id y34mr13112971lje.258.1634025620592;
        Tue, 12 Oct 2021 01:00:20 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br38sm953244lfb.305.2021.10.12.01.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:00:20 -0700 (PDT)
Subject: Re: [PATCH 2/8] rtc: max77686: convert comments to kernel-doc format
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-3-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <83a59a03-dc4f-af0e-b453-b548ecd95395@canonical.com>
Date:   Tue, 12 Oct 2021 10:00:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-3-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/10/2021 17:56, Luca Ceresoli wrote:
> Convert the comments documenting this struct to kernel-doc format for
> standardization and readability.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  drivers/rtc/rtc-max77686.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index eae7cb9faf1e..bac52cdea97d 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -61,24 +61,27 @@ enum {
>  	RTC_NR_TIME
>  };
>  


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
