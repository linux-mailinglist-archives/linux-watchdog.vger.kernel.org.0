Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B886D1EB557
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Jun 2020 07:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgFBFfA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Jun 2020 01:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgFBFfA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Jun 2020 01:35:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B81C061A0E;
        Mon,  1 Jun 2020 22:35:00 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y11so873807plt.12;
        Mon, 01 Jun 2020 22:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D+a+suwb7uaMqwJYIVWihfWByp8JLlKu3D+JE5bFcoI=;
        b=CLc0i+zAEOMFaBCRrVD6vOrggXZlKZGcFhXzNZya0nJPyl9MbtGjtBJDuGZLixNMvq
         umagLYZp8pmSvV1A6W+mkdXDiNPiPPpuiaab52OZG4rhiKDTckE7Ac9CH51UgWRaKUWh
         Ha+nmToXv0jEIzBEG7XPs117Ii5fUzWpOrepnpumJdMk2YZmrvKxG4IrHt2GLv/ikfQZ
         OmU3Qm8usDOxVB16/R8yZNFrH7+GJQgtYRsAlhmD3UvjxDZe83VtvRqe5lPpg1oICewq
         c50ESnYL8Oft8WBNVwKrZECrp0uTq+/CpvydjsiLY+gLSwmkYHZQVd0mPvfrtZI22I3+
         GffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=D+a+suwb7uaMqwJYIVWihfWByp8JLlKu3D+JE5bFcoI=;
        b=W1waB68+lKPQEi4lyvyhMH9JJUivsCTeIBKDkwmKspxjG5gpBvh67LTemS6KuXWtLP
         PP0ak9BP3Czxb9iNVpPriCjx00jX1ofU1F+aPzSWB8i/7/E6fxgWHjEc/GttwYQzCpkA
         k8YUny1IaY0uGaHrGVkgt+ZG9Mk2DsmQhZklGi+DDnMilsc3zxWaTA1mozYYFw2/4pcL
         opOE+ZgM4qRZKeCaHXIhlcbk9Y0j0+wgDejAMz3fMAitwZJBhS6VSCXif4QIg0XXJxob
         awBX8ZSTeBcQik0cySVfWQpjTHzPc/YLfONF1VbySJ7CNNCqZzv+AKr/6QNX+wD80kWr
         Czzw==
X-Gm-Message-State: AOAM532cyvTdrlrHGQqpHOOIQYXy05VQxcqeIw5BC3dzFoUVrFNbXhe3
        es+z7QVduMbCT18vtlnrJO9/2HjM
X-Google-Smtp-Source: ABdhPJwrvSODtc24xHkkwlsSE9GGqYxwqSEV4sPgVs/DoQlYABkOct1b3azQuvnjGzMJsaV1IkgXOw==
X-Received: by 2002:a17:90a:1a8a:: with SMTP id p10mr3371114pjp.236.1591076099668;
        Mon, 01 Jun 2020 22:34:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x11sm1073138pfq.169.2020.06.01.22.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 22:34:58 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Julius Werner <jwerner@chromium.org>,
        Evan Benn <evanbenn@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net>
Date:   Mon, 1 Jun 2020 22:34:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/1/20 10:21 PM, Lukas Bulwahn wrote:
> Commit 5c24a28b4eb8 ("dt-bindings: watchdog: Add ARM smc wdt for mt8173
> watchdog") added the new ARM SMC WATCHDOG DRIVER entry in MAINTAINERS, but
> slipped in a minor mistake.
> 
> Luckily, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches F: devicetree/bindings/watchdog/arm-smc-wdt.yaml
> 
> Update file entry to intended file location.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Julius, Evan, please ack.
> 
> Wim, please pick this minor patch into your -next tree.
> 
> applies cleanly on next-20200529
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b045b70e54df..dcfb09700b96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1489,7 +1489,7 @@ ARM SMC WATCHDOG DRIVER
>  M:	Julius Werner <jwerner@chromium.org>
>  R:	Evan Benn <evanbenn@chromium.org>
>  S:	Maintained
> -F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
> +F:	Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
>  F:	drivers/watchdog/arm_smc_wdt.c
>  
>  ARM SMMU DRIVERS
> 

