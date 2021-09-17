Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76C940F982
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 15:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbhIQNtW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 09:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234565AbhIQNtV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 09:49:21 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7BFC061574;
        Fri, 17 Sep 2021 06:47:59 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id k18-20020a4abd92000000b002915ed21fb8so3204341oop.11;
        Fri, 17 Sep 2021 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pl2ayV9f6vETiCVUpym4C6zXgC97b45e9byMiJdmjCI=;
        b=g0l9LSM8nQ0PQ4X2fAPhPgalkuweHiusk7jL5heBKlhjX6rgrS3I5Q+R4VwWVSpSsQ
         7DDhoz5nLI1mx9UnJli1goPCcch5xKYwnp9KsZOQxVh6rchj5GsHb207/zjF2rExmKHA
         RdMJ0Pi/9hj0wH5fT7zitEVb+p+n+jDEtgjEEsCThPVibCpU+Jn/pJ3j3Hhm3ZHQnk0T
         ClfDBUHZkhW9hWP+TfreOCy8KjbEFl7g8nbvUjMRdIKZ0Y1Jn8WiLXmpEdhH89mgWvNe
         IX/qgQgvVf5urfLa41Zo2KonfRBlT18EEJhU+OGpSRCHZ3uqapgK2y+NYNElfaNS90Yd
         Vy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pl2ayV9f6vETiCVUpym4C6zXgC97b45e9byMiJdmjCI=;
        b=SqHODw97HSOzsDnKQb/scdwDHqycQ/4fEUsO+Jv+rajScQ92Grpm1em0lVwpZ2376o
         Dz4xDSy138tkHtrUPnBhLZQazJMPo2o+3sQzc5VGxzf8d1DFxX6rBuRxxujGHXEbpMRm
         b3wkkP4WoWVUa1r1Fs0v6RJhUh9sJyu/qsyvE4b07CCgQs6yS2oSVFFGNy2HOq/4krVI
         453QfSzIkdBYHDEnHppU8+cPHDJWTp6CXHdoTmviFRL8MwUxGgYcsxZCIofBNtRTBo/x
         VJfSqw7IpY+9YLI74MV761HlYMuobGzX75f1LiW9ZLxnA9VPNbnhDT7VmRa7WQmyGzAG
         sZjg==
X-Gm-Message-State: AOAM530PnnmtVkuq2Q05Y2jk/00UdxtBeHFq/QlehM8fF/Q/W92+t1fU
        zVViFRRoSuvjqYbiJJx4p0sT3e2OErU=
X-Google-Smtp-Source: ABdhPJwdJYpNVuUU0njRBVZLwZs3kbQgahpFRQeJXNyBUfpO0enmrbcsy2S2O5iEfC7YhpfkNHuIgg==
X-Received: by 2002:a4a:ba86:: with SMTP id d6mr8918188oop.61.1631886478767;
        Fri, 17 Sep 2021 06:47:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y7sm1391929oov.36.2021.09.17.06.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 06:47:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: sbsa: drop unneeded MODULE_ALIAS
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <20210917092024.19323-1-krzysztof.kozlowski@canonical.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6cf2f403-f765-cfcd-aa54-bb4264982b7f@roeck-us.net>
Date:   Fri, 17 Sep 2021 06:47:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917092024.19323-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/17/21 2:20 AM, Krzysztof Kozlowski wrote:
> The MODULE_DEVICE_TABLE already creates proper alias for platform
> driver.  Having another MODULE_ALIAS causes the alias to be duplicated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/sbsa_gwdt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index ee9ff38929eb..87b496405871 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -411,4 +411,3 @@ MODULE_AUTHOR("Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>");
>   MODULE_AUTHOR("Al Stone <al.stone@linaro.org>");
>   MODULE_AUTHOR("Timur Tabi <timur@codeaurora.org>");
>   MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:" DRV_NAME);
> 

