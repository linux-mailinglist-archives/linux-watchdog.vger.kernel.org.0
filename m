Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B833429F77
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Oct 2021 10:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234697AbhJLIPW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Oct 2021 04:15:22 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39144
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234616AbhJLIPU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Oct 2021 04:15:20 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C26A33FFFE
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634026397;
        bh=Lax03IkPZGcQafL4kTdaW6vPwzUHxB/DSvDB2xM2dOc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=m8lb4tSa4MMZ3TSHVMpWZHYiCiOzp/XTeoTFOJzy42sIbmnT/TErwUmGWA0gsfTgf
         GmzufoNFBrk1DY+UfTaCEsA86UMzUHS/nZGWTQWw/QvEDs5QBEpRB1CIAndg7inmTu
         xu+Pa4vs5t45SIaefnEuiG1exMuxE6OJJW4uN8LBg6ZD3Df5zOXnIEJyrwxFsq33NA
         kKIRCPZPTRBHKxchqFKs0qNr8ofYOt5MaP+VtgCCys2zD63WjurdvxZ0LKIyR90K9U
         kNOZ/lhXIl/FSqIkgA4AEKwv+dUo3xKjwWsC7I8YaXEvIp2JiCJXAy4xNTrZGLavGJ
         +IJNbdMB683sQ==
Received: by mail-lf1-f72.google.com with SMTP id x33-20020a0565123fa100b003fcfd99073dso14613585lfa.6
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 01:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lax03IkPZGcQafL4kTdaW6vPwzUHxB/DSvDB2xM2dOc=;
        b=X5Yuzqn63ZqW7ai9mtJirIQP4PYlO/QsOGIl+9V7rge0rbtAiu/O/xRQomI31Gfi5j
         N0hJmXWAKEQpxSsSzkMWXMtLLxPh/1pkQPNEZqEaiyEulKG9ISAbelyAv+DLfOfKZAdb
         ju2efYxEp1MpBcj8QfP2rt2GkjdWApm/tUWXpDjAltdFqiLlkB/xv8RkFf7o7RRRBafT
         Od9o2si+VLPT0C586o09KYfTEoaikuvwGftccn0SOdVxfq406fsDtNz0kuqbnaS8eN/U
         pZcUinCumNvnt0tXz9mIEHritCJ0oFfxM9Ne/c6W23s3qUhkA7mFPDfC+27bYzkD9ReF
         +rNg==
X-Gm-Message-State: AOAM530dJE9eWx4XFYnkhybwO4IONFbQ8x5nHpZEpcSoIq1G27edV/UE
        TKdKyMe7ACOlyMSXNTOiOlpiu98o/mFJBn3LZ6leYdUlxqVjCN3ocgvyVw0dgNPVbY7Tpxt4bgU
        Q4djd+ivHFVHNssL5rBMhCKtlILga8zPncjqSuE1VQTAR
X-Received: by 2002:ac2:4c42:: with SMTP id o2mr32319691lfk.504.1634026397254;
        Tue, 12 Oct 2021 01:13:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5X496iLorhVFLrMc5Twzlh/1BiNaH21JTd0dWSkDt/8M4LBAfRGxFndv7DEG3Nxmhp451sw==
X-Received: by 2002:ac2:4c42:: with SMTP id o2mr32319681lfk.504.1634026397094;
        Tue, 12 Oct 2021 01:13:17 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t12sm957129lfc.55.2021.10.12.01.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:13:16 -0700 (PDT)
Subject: Re: [PATCH 3/8] rtc: max77686: rename day-of-month defines
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
 <20211011155615.257529-4-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <757a941a-1b3c-8b5b-af40-0942b7a07239@canonical.com>
Date:   Tue, 12 Oct 2021 10:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-4-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/10/2021 17:56, Luca Ceresoli wrote:
> RTC_DATE and REG_RTC_DATE are used for the registers holding the day of
> month. Rename these constants to mean what they mean.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  drivers/rtc/rtc-max77686.c           | 16 ++++++++--------
>  include/linux/mfd/max77686-private.h |  4 ++--
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index bac52cdea97d..7e765207f28e 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -57,7 +57,7 @@ enum {
>  	RTC_WEEKDAY,
>  	RTC_MONTH,
>  	RTC_YEAR,
> -	RTC_DATE,
> +	RTC_MONTHDAY,
>  	RTC_NR_TIME
>  };



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
