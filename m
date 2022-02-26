Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9EB4C54CC
	for <lists+linux-watchdog@lfdr.de>; Sat, 26 Feb 2022 10:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiBZJQg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 26 Feb 2022 04:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiBZJQf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 26 Feb 2022 04:16:35 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFE1257951;
        Sat, 26 Feb 2022 01:16:01 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j15so13210661lfe.11;
        Sat, 26 Feb 2022 01:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QJazx2cJf5ZdTHcqxXP+EOlF6Z2u1b+F0PrhhVh6sN0=;
        b=iflXdRqwOm0bitmzuO5JMgYm2/p87H8AAPhbrsdFzq83U/Ttmsen5h5GYlxu49/77D
         i3Amd2NC7YMSIC2mt09Mm36yNXVBb6Q+cgnp4KmwSBUn2c8m3HB+0XO/Gwh60FPd6AuS
         +hDPiAJKP9WBPecXx78U6LHV0PioNvRSfW8ualmTWfEWqe4NfS8jKRfSaCv92xEUWTCL
         0510Lbu6hlg9bbgsq2y6Kiz3wa+atuRj5m73vxZQa19inznhmATVapXR/ja0/0IdiGSb
         vJOY0TUxuXs5BDTbhJ8ldRcNyMktSRcUd+4qzS64oeOyiMsc0xgythnOMWiFCdm1hKIg
         Q4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QJazx2cJf5ZdTHcqxXP+EOlF6Z2u1b+F0PrhhVh6sN0=;
        b=SNYodN8X0f2M2jEzGQyaOqSHbQN4Mrfk+oLO3ffJP1utBoloYGK6f5gZ3V3217r3Vd
         0oP9imKmQwmvh/s/ojj81UFSDzz9SHlCjkjxKnY5tRvrdf0FiiLfTmPfcf/i5y+gfWca
         Ry4gV2iLuQMKYsRPxSuHPc8nhwSjuOuhF8i0Nn/RHIp0RQcOFPwqUQkUvLyCohPAWZ9d
         HYH2MgMi+2c+XxXevKoff2HThpD8VE4l7f+Auh5QabjeYYol5x8LRyCL2yIHIQOSQ95a
         iH0kvNtO0mpTxsg61HJbNwYkrJV2p1ALoGU46HH29epxt5tU53M3raNDL6UAWBik7uJZ
         +Igg==
X-Gm-Message-State: AOAM530n2MohJ81TpgFt/bvtr0DtP5ByPzwujZYErQfE/kJaz6KwRETR
        bPkoBun8ge3F2COmFUPIJlcbJCeJUlA=
X-Google-Smtp-Source: ABdhPJxUvc+V4Y2c1YMUKpm6u+IvR8fvScpC+NdJJGP0PKLRuPOf037S2T8qSwCm9iz5u7ATf+cSaQ==
X-Received: by 2002:a05:6512:3e13:b0:443:3055:97d3 with SMTP id i19-20020a0565123e1300b00443305597d3mr7332135lfv.658.1645866959515;
        Sat, 26 Feb 2022 01:15:59 -0800 (PST)
Received: from [192.168.1.103] ([178.176.75.229])
        by smtp.gmail.com with ESMTPSA id u13-20020a056512094d00b0043e6c108925sm410434lft.136.2022.02.26.01.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Feb 2022 01:15:58 -0800 (PST)
Subject: Re: [PATCH v5 5/7] watchdog: rzg2l_wdt: Add error check for
 reset_control_deassert
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
 <20220225175320.11041-6-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <425f9f1c-2007-a623-c4ba-0b78ce156c81@gmail.com>
Date:   Sat, 26 Feb 2022 12:15:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220225175320.11041-6-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello!

On 2/25/22 8:53 PM, Biju Das wrote:

> If reset_control_deassert() fails, then we won't be able to
> access the device registers. Therefore check the return code of
> reset_control_deassert() and bailout in case of error.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
[...]

> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 88274704b260..73b667ed3e99 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -203,7 +203,10 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
>  				     "failed to get cpg reset");
>  
> -	reset_control_deassert(priv->rstc);
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert");

   Deassert what? :-)

[...]

MBR, Sergey
