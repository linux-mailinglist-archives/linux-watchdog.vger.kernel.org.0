Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBFC448041
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Nov 2021 14:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239924AbhKHN1R (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Nov 2021 08:27:17 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48674
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239934AbhKHN1Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Nov 2021 08:27:16 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8BD323F1C6
        for <linux-watchdog@vger.kernel.org>; Mon,  8 Nov 2021 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636377871;
        bh=/hm+frlIkfRbj18ggfJvfVA8HIIe4O3xDAkmIFBlwTA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=OxPhDQJjOKfSX3KaxdbjZrjSXPekrHcP6bpJEqt/4LTqtfr7z+dzRSCbNREXTlx/Q
         RSHi2Q+OrFVOZWfIj0eedoIbZPmKrbeceu3b7P5ZyZ80fHYO0nH7Srhzg1mYQM+r3K
         RIdSnPzbU5rfNax4SRQJ4vdNy8O04iLmQKDJ6ImrNl6qNJ5QSq5RdOlY4IPyUO5PpP
         19PgxDxb5eV0ZVQrWBqTCyeLKWRJ+iepMmWGUf5jMiFVzu0ravb0zz6o95aO6PHqzf
         rG6ALW+R8EJA0oQlzGTluw9A6W78ldBtEcAXtsJtXqlmoJ6pNWWfHvegez7d8Xy3rQ
         GhadsP7/EgbmA==
Received: by mail-lf1-f69.google.com with SMTP id bq29-20020a056512151d00b003ffce2467adso6440148lfb.3
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Nov 2021 05:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/hm+frlIkfRbj18ggfJvfVA8HIIe4O3xDAkmIFBlwTA=;
        b=dYrExu6KR9PiTe3ta9CW4D/tiNCNJVqQxFBgdc4kmxOEscy84FUodLn+aJDyvLPNsy
         YOaPAlik6Wa/FPWdh5wPl1iB66zIUu0z2ZyA0IL2IsnlS0A2jUVAoZT7CcB/L3VYqDZf
         1+nj1iLyZfcKrKVqjAjOT0sXAUow4AdfIClKNBc0eTViPMWWgXKGvLR0j3zqtEBbxVTE
         WXfAfY19fG1RSJwlwbyDvGN/4FHUSFckya2rT8cYfg0UqURJCPat9VUprO/lLhHdX98p
         sFbYeYrXccGJjYE0VWDMB3cwEQwnCK5/wpu/dTZPVCs/PJUuq7xxLAXDnCO7tl+nJ6hI
         au7A==
X-Gm-Message-State: AOAM531b1khVxL7iuMOeAgufg02gnBMf1EWI6dDnPeXD3ekbRarFB+v+
        VOt7X7BOs/NgJ3XDPnTuAgyv0TVbp+/2JJKKlm4zNcHcF5Q2H/W4my5PH8Sb4RPgTTEe/E6Ul/W
        fiPNDv7cCuGfd/dGXqNV5eZik9ewYPiNPPxoWPNnpHIMk
X-Received: by 2002:a2e:3803:: with SMTP id f3mr10888430lja.460.1636377869468;
        Mon, 08 Nov 2021 05:24:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjqrwH68UZei4PQ8gNRPh9hkUMStu/9MMdUsMdfRFhdPTou/EX5PUQAI5rB4VsmqAfR/889Q==
X-Received: by 2002:a2e:3803:: with SMTP id f3mr10888395lja.460.1636377869193;
        Mon, 08 Nov 2021 05:24:29 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l2sm1182683lfg.290.2021.11.08.05.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 05:24:28 -0800 (PST)
Message-ID: <f1a28b8f-c27d-19ae-a993-3fbe614d17b3@canonical.com>
Date:   Mon, 8 Nov 2021 14:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 10/12] watchdog: s3c2410: Support separate source clock
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-11-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211107202943.8859-11-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 07/11/2021 21:29, Sam Protsenko wrote:
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
> Changes in v3:
>   - Removed has_src_clk field: clk framework can handle NULL clk; added
>     s3c2410wdt_get_freq() function instead, to figure out which clock to
>     use for getting the rate
> 
> Changes in v2:
>   - Reworded commit message to be more formal
>   - Used separate "has_src_clk" trait to tell if source clock is present
>   - Renamed clock variables to match their purpose
>   - Removed caching source clock rate, obtaining it in place each time
>     instead
>   - Renamed err labels for more consistency
> 
>  drivers/watchdog/s3c2410_wdt.c | 56 +++++++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 15 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
