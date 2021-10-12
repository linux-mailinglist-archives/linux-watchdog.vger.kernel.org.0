Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1134C429FF4
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Oct 2021 10:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbhJLIeu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Oct 2021 04:34:50 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40120
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235087AbhJLIet (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Oct 2021 04:34:49 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A0DD240010
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634027567;
        bh=rxpJUqkEVuFsAxhh0zAsqbW2aumtYMUwejgjgmIhak4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=uoI55WidR1GHHfUqTl2VIUbfiKyWRpWVDsZWROzMsJk7hwsPAYccQw1TX+yk9wKEl
         RQJzZ4Se5nO0fO3jPPkIAVpZbPaglFBRiIY8AKMZhXijSG+EAWNNPRvxa24WHO0FUD
         nUEEKnGrygeTPDzWek0yMOKkPCl4DKQav6OKe8zKDruuK5QhTmapYY4/VZfnwzs3yB
         2qlz6w2GGML4gDrThupZBXRChxBvpcRSrreaVeVAh7CeUN6LrcVXxWKKwoBBSSCT6k
         EpIE+RUoMrlFDYpJh/vK/FnW0X/360SGkFEtIoi2ytClHez8aE4hqdovamJIyqp0Z4
         GJXD12/tLDKXQ==
Received: by mail-lf1-f72.google.com with SMTP id br42-20020a056512402a00b003fd94a74905so3079248lfb.7
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 01:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rxpJUqkEVuFsAxhh0zAsqbW2aumtYMUwejgjgmIhak4=;
        b=yBkLx/W5YNajVWC0re6KJOfmLoFhQJDn/DYqT4ykUm6g8z7o/pnayHBQBHZfxZTxAB
         bP1RapD1TuC/99BXzBWGndmSMDT1qjZbKVxRajWRMUgz3rThTvBPxWhA4vjPm47dbbz2
         IIcnD0+Ue3uHtJru0kLmJismqTNO/c4kbMkJy9G4uAerPz6cvraPSiJ5YqolhWUIM7SJ
         SjwQTrghAf3/hzSC21cZvLI4ZxnIN9HlJoE5h2xU7vJUfptpenZ1dzj6WUyu0OolkJGC
         dpd9R9/iHSlF7MOtG3C3Q99VHsnHv1e9favQZZqTvFYbv2DVRcDhAm143T+lpKzW2sad
         uo6A==
X-Gm-Message-State: AOAM532dHJoaP6R8KUAGHAYb2Uq+lhV0feLSs9Mm1t87W4GZuc1eKCSR
        8ib6LoSg2CkeKjb3bL7xCtoJ205rCFRqGtW0dpN0WGoIq5EdBHAWorDiS74KKb+HgbToE3RbI9u
        Bmt4WYKdo6wyz2/OGG3zjpkpbatQh2IMrgt77ceY7ScoL
X-Received: by 2002:a2e:bf28:: with SMTP id c40mr28374549ljr.127.1634027566893;
        Tue, 12 Oct 2021 01:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJx050qTkZ1ZsS32VRk99r1cu/L1Up0p9CveWPlBdkJAuC2Wh/kH0zOSMzK0MEQG0M19ACzw==
X-Received: by 2002:a2e:bf28:: with SMTP id c40mr28374534ljr.127.1634027566708;
        Tue, 12 Oct 2021 01:32:46 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p18sm965940lfc.6.2021.10.12.01.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:32:46 -0700 (PDT)
Subject: Re: [PATCH 6/8] mfd: max77714: Add driver for Maxim MAX77714 PMIC
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
 <20211011155615.257529-7-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b2355acf-94a5-1acf-122b-d661c6d9bb1b@canonical.com>
Date:   Tue, 12 Oct 2021 10:32:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-7-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/10/2021 17:56, Luca Ceresoli wrote:
> Add a simple driver for the Maxim MAX77714 PMIC, supporting RTC and
> watchdog only.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  MAINTAINERS                  |   2 +
>  drivers/mfd/Kconfig          |  14 ++++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/max77714.c       | 151 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/max77714.h |  68 ++++++++++++++++
>  5 files changed, 236 insertions(+)
>  create mode 100644 drivers/mfd/max77714.c
>  create mode 100644 include/linux/mfd/max77714.h
> 

(...)

> +
> +static const struct of_device_id max77714_dt_match[] = {
> +	{ .compatible = "maxim,max77714" },
> +	{},
> +};

When converting to module - don't forget the MODULE_DEVICE_TABLE

> +
> +static struct i2c_driver max77714_driver = {
> +	.driver = {
> +		.name = "max77714",
> +		.of_match_table = of_match_ptr(max77714_dt_match),

Kbuild robot pointed it out - of_matc_ptr should not be needed, even for
compile testing without OF.

> +	},
> +	.probe_new = max77714_probe,
> +};

Best regards,
Krzysztof
