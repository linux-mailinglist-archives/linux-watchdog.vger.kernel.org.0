Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7DD58FEA2
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Aug 2022 16:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbiHKO4U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Aug 2022 10:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbiHKO4S (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Aug 2022 10:56:18 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC941A39B;
        Thu, 11 Aug 2022 07:56:17 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so5368668pjl.0;
        Thu, 11 Aug 2022 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=DFNIMFu05tsw3j5rRzMSQ0WodN3OTGaRJRy12XpVg+A=;
        b=it451sscft1eHt3M5wQgmfK0jVQQ0quYcQZA6dVqf80zeqgw7nxBNi5Vschc3nB56M
         8kLISTV+shF8w924y9/rNV8L5ypL3fogAOkDghYwHh4QmftEn6kd5rKYJMAIXLQgKm5r
         /eocvujdb74djrflxicK5dEsd4prMcLclha/PQVhfTgjJ6r/twk+tDYIFDhX4VmAjYbA
         9QRr3hi1neiZWFyoB4JxU9LraXuifgLGpPoiKeayouSGi4EvK5fGyicTYgMcnj8TnP4u
         qoQnsMb2+JmtAx6j1diUfMpqDs2JgBQoYodj8LgHzjgqRRgUu07e+kwKAwO+DYGk1zd5
         I3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=DFNIMFu05tsw3j5rRzMSQ0WodN3OTGaRJRy12XpVg+A=;
        b=6HqmysDD6lZd9HwReqpONbjsgieOHHvwsGIhUl/pWlqnq+nMdA0+quM9BZDvobNODU
         a/RPef+4igL+5C9RMMIv58TOaiA7H9Pfmj6rfXo0l2AHRt8zWWLlHRrDprws2vyf62YU
         x2JDY+9btmcQSuMEPZFeuA+h1zLEi1//27fJQZQsBiVNlzHAHcCc0lCmkJWo/qgWZKH2
         JSqpaWTc/9/kSsmXk2wKTcHb9p74i7WoFCEZ6IwErrKLp01rdnHxX6xFJ3f+xSXnJERZ
         tnP3ypw2FypNBzVACSdk76ByBvCinl4LQ1hRobOrtF+3B+EPmTfbgxC+LqRFBV4yMxK1
         DVxg==
X-Gm-Message-State: ACgBeo3RDMiOesLlmHP+cWubGjyhek/t/U0AGtEkiW2HlPiO+go8eme5
        Wt5Qe/wtB8QUL6sObm4AYFs=
X-Google-Smtp-Source: AA6agR7Ry48Zx98bFth0jHSAduY/6Ick8JcGjweQle7VcLcmC14gNBM1N1Msp6mhkTPpeMtJQFewPQ==
X-Received: by 2002:a17:90a:2b42:b0:1f4:fc9a:be32 with SMTP id y2-20020a17090a2b4200b001f4fc9abe32mr9044867pjc.221.1660229777325;
        Thu, 11 Aug 2022 07:56:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 194-20020a6216cb000000b005286124df03sm4160555pfw.87.2022.08.11.07.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 07:56:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58e5401d-262f-a931-cd7d-93a3eefc395e@roeck-us.net>
Date:   Thu, 11 Aug 2022 07:56:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: fix test for platform_get_irq()
 failure
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YvTgRk/ABp62/hNA@kili>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YvTgRk/ABp62/hNA@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/11/22 03:56, Dan Carpenter wrote:
> This code assumes that platform_get_irq() function returns zero on
> failure.  In fact, platform_get_irq() never returns zero.  It returns
> negative error codes or positive non-zero values on success.
> 
> Fixes: eca10ae6000d ("watchdog: add driver for Cortina Gemini watchdog")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/ftwdt010_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
> index 21dcc7765688..02112fc264bd 100644
> --- a/drivers/watchdog/ftwdt010_wdt.c
> +++ b/drivers/watchdog/ftwdt010_wdt.c
> @@ -156,7 +156,7 @@ static int ftwdt010_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq) {
> +	if (irq > 0) {
>   		ret = devm_request_irq(dev, irq, ftwdt010_wdt_interrupt, 0,
>   				       "watchdog bark", gwdt);
>   		if (ret)

