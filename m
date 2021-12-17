Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFE74787C5
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Dec 2021 10:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhLQJfP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Dec 2021 04:35:15 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48988
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231814AbhLQJfO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Dec 2021 04:35:14 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6623D402EA
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Dec 2021 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639733712;
        bh=z2ulb+DVZsgqJd2LDgGlq8D+/PB9tFXsgdrZEe6FKTw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=dGr7HKPDvmMNTlGHP350Rq2sxz2mYrR04S0Mb2aUqxNrrYQHJpOd19+199fdLsNRM
         oIkCexFFiGFG5hojPV+UYl40F2UTTh1G7EHQXoV0u86Ri4P24pynJ2LSzazIHTpiVQ
         xCL5nRzSqPgQhZIAKYCtY5of+LHpx1dkCDLRnbe5zSblblqhg8U1nX3VgE2Ew2e2zx
         3i6XBjG+d1OXSCgNO1w6EHu5mcltPiyZHhCKwxNW9iOi0oLticnd95aW+sVbYki2cu
         nbagT4IvpyTfaipv2uTncbyI2WdEIhfS2mpM9/bLxI3bh9Os95Lmr2h1IKV5NQ7SGg
         x4w9a/fkK66ow==
Received: by mail-lj1-f200.google.com with SMTP id t25-20020a2e8e79000000b0021b5c659213so425933ljk.10
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Dec 2021 01:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z2ulb+DVZsgqJd2LDgGlq8D+/PB9tFXsgdrZEe6FKTw=;
        b=AqotLq6EiqSk8OgLkke1HZC09W2cMJ+jWHPbPbVEMSRyq48ZyC3AzYhbanpn5GcEmG
         k1AjrhbmY7t5Q92q8SQVt4srnfTrErlUDcxXcHiQvSsqYfbDuYQAgSs6jpRyMrNGw40N
         O6czt3xVbQA6S3giuLCDNN/Bk435pD86ET0dYnUdDl7NpVqPr2PfBmd4Et5jTVAHT3nd
         Gnz9fjuYHAwqkvmcUBEQVuEWqFkfUfiHelbePIlaFCRgZe4MWl1ZrZRdhcOdZ7Qk4M2R
         phinDcH5N553S9AnxAayrUeAxnEZ6PCZ5pOFzn1v16VZaAt+Rm+oLPYmHs+d6it86G3j
         Q0/A==
X-Gm-Message-State: AOAM533an2I6bEGggBtRlX65azGF2qN5edeVOUNhaw3+KCfOfrPbUna8
        H6ADFSzZIZrrHrEKf0YishITAFBtJ2VfohBLA+GWlpl8vM+cjwT6ZCgxW+wK5MGM5j8lcjqwNhP
        GbVuqo4nDy0NnQzxYjsKqkwcH8HAPVRuiIf359khiisiI
X-Received: by 2002:a05:6512:261b:: with SMTP id bt27mr2134396lfb.68.1639733711849;
        Fri, 17 Dec 2021 01:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3vfcxbokbMTir1a2F1ktl93PTYnZK69spGTwWf5wxnVgnRpbKDs2qjbIy8UtGLc3PLoeRVA==
X-Received: by 2002:a05:6512:261b:: with SMTP id bt27mr2134385lfb.68.1639733711553;
        Fri, 17 Dec 2021 01:35:11 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w15sm1300450lfe.245.2021.12.17.01.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 01:35:10 -0800 (PST)
Message-ID: <4e0ab991-1149-5e40-2109-d0a2405dd7de@canonical.com>
Date:   Fri, 17 Dec 2021 10:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2] watchdog: s3c2410: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20211216214747.10454-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211216214747.10454-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 16/12/2021 22:47, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypassed the hierarchical setup and messed up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * Dropped goto and directly returned on error
> ---
>  drivers/watchdog/s3c2410_wdt.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
