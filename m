Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A671F52ECAF
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 May 2022 14:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349417AbiETMwx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 May 2022 08:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239729AbiETMww (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 May 2022 08:52:52 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07F16EC7C
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 05:52:50 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h8so9562300ljb.6
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SopF2N8XTzLZMDGjgkzB6nuIuYpC23HvcvyMMR8tDGo=;
        b=ivcgdwd3dlE3wLIfNCi7ceN6Uy9TrjDgj1g15j78Yo01UxTTlXpfNsTXwPPG1qUUJB
         0230aVzbxG1/ya7MwmsXIZK2VUGdZasBLaCA3YqGu9CE5nsgJUsR65hYJwt3pwyjGj5U
         rjYymvBrZrwcMBl5GleTXmbOHaIhzlqRMRm4JUf8rDmxOnqrnHbFggKdMx6LLlSO9hg5
         di3Qd0fCA3twUwKXHlshwrrrfaMqFik0NGujUzwOjHComSss4z1S+7mhINyU9D0TysN0
         6hNTepoVsdnO/9040C4X6MC01gJ0eqQcuKsC2CUs+sukAs6r1/NPM8TzGpeJidGlqcfC
         rxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SopF2N8XTzLZMDGjgkzB6nuIuYpC23HvcvyMMR8tDGo=;
        b=K3hlesUJpoGnbDhI0Z3YjeK5dBHXWXFLcKLCIowueHRVP5GCzjLGaXVzFo0fAu5wQr
         jXy1UQIglERU61+ON6QtVrRwuJE/JDBa6bG/mSh8MPkE15EB0dKjJ8+GuTpdZR5RmFhy
         QvvVDFC3i7UA/pfEH5qt95/wq/P4PlBCLTsopaiazpLfiRQF1NRbRzcwh3PZcZigR+5W
         T/4tddZBxmet5+6l3AYfuWOE7xsb4AQMQxlCqZmgeBmNu520JdjjKsstsExpFOiK3yX2
         S7KLWWjbA77hKQa5Blf2VuNbJcbiCzmS/AUpjhuSroQF5CpIsOqPusKLoc/Pj/HUvTSK
         7AoQ==
X-Gm-Message-State: AOAM530VlXuc9aowGghAanPpzpt2HAbza8PUSMUyZnJHBMmnvKbgwtpH
        qXzlK3cGL89VgRU96rLsg17MN/3so0Bu9xRr
X-Google-Smtp-Source: ABdhPJzRQ+gxNlbmSfW+2I63rnHAL0U8CxUMqFLb6xp7HepMndBrBLuvoNzoVUkQD+uqipo+h9Y8xw==
X-Received: by 2002:a2e:884b:0:b0:253:d431:45f0 with SMTP id z11-20020a2e884b000000b00253d43145f0mr4915198ljj.70.1653051169243;
        Fri, 20 May 2022 05:52:49 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j4-20020a056512344400b0047255d211c9sm648470lfr.248.2022.05.20.05.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 05:52:48 -0700 (PDT)
Message-ID: <e30bcd8f-9302-c38a-3778-db64a463c190@linaro.org>
Date:   Fri, 20 May 2022 14:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: add exynosautov9 compatible
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220520121750.71473-1-chanho61.park@samsung.com>
 <CGME20220520121722epcas2p359f331c9276eeac5d027b0fe068296f1@epcas2p3.samsung.com>
 <20220520121750.71473-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520121750.71473-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 20/05/2022 14:17, Chanho Park wrote:
> Adds "samsung,exynosautov9-wdt" to samsung-wdt compatible. This has two
> cpu watchdogs like exynos850.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
