Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDAC96B051E
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Mar 2023 11:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjCHKz4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Mar 2023 05:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbjCHKzu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Mar 2023 05:55:50 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A686EBA862
        for <linux-watchdog@vger.kernel.org>; Wed,  8 Mar 2023 02:55:36 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cw28so64016421edb.5
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Mar 2023 02:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678272935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4h2FY+X2SHJL5D/w63hFPZQVBBm0zbY0tUXPSa+dEU=;
        b=J+dLbTIne4bumfpOBr7e9LqYt+Wa+Z9T0zBInXT0GSS0qlSmlpiUYrmb9lHXgkj1BB
         ULUVqNV86biaEGn0lEdoahVFuHrqTyHZ6uIWcP1Se+iMJRIwWxB/TRZ05Yizj0GWM7np
         ICOGLEhdjgIFHHhdWVFGBEa31/z0C2RFBRZutfST+r5l7n8ckq6SBauls1hVD24sg6IE
         khUr+D/zpRwXVLum7KxqdJHoP+ISB3nVXd8bXCPRqnR8rrbxqA/8ea6Tq3LBxDS0FqhY
         5lBThWrCO3i+XlD98BL971vYS41YaECzX3vk0O/VBEkGvPofNT0wFiAYjzZ36RahNcM4
         dg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678272935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4h2FY+X2SHJL5D/w63hFPZQVBBm0zbY0tUXPSa+dEU=;
        b=lnWNPq2kzrmSNE8rDsMNxbFY8mDTspmvX1oZiGD/y2Emo+ZDfJC01FIwMC8LnHOiqD
         rJMMHl2eDzHmaXl34hf2gDexKx+AM2ivVGt9nn9u7wsQ7TiyJi5gAqm5w2zVy7gAM2Ne
         wd0hC3r6eOqHEhTZq2idv9P2ABvVwew1OG/UbbhULNAAktfKE8gfjTi+BtCRFevigKaj
         fmHymXFFCzZRFh7fshhnjpnn7oq6Ywuj/ZrGVXmr+jz+BZ4rdAlaB/HIlOF4MbHUGaqI
         heFkp9px+ih+l30+vIxqtNxcGeAQX75vhwrS1xUFyNfWazewSJJ7dS17TosombSrx5Zm
         vQxg==
X-Gm-Message-State: AO0yUKWkznMNsRm3kwzxb/Rkfrp+H/wpA5pOyPDsW4BNPeWKzkzaiqod
        JDn91hhRxtwzpXVo06qGlIapkw==
X-Google-Smtp-Source: AK7set/jz2AnF63tB8p00z47gnyjjREBhBa4nYjrJe4txxjqSyfWR9lCxSiLVcOC6zjDw4RWTaQ/Hw==
X-Received: by 2002:a17:906:af67:b0:8b1:2ebf:386c with SMTP id os7-20020a170906af6700b008b12ebf386cmr16593671ejb.11.1678272935154;
        Wed, 08 Mar 2023 02:55:35 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id p12-20020a17090628cc00b008b1797b77b2sm7340991ejd.221.2023.03.08.02.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:55:34 -0800 (PST)
Message-ID: <c3080319-b8c4-ab9d-334b-c0ce776b59a9@linaro.org>
Date:   Wed, 8 Mar 2023 11:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add binding for MediaTek MT6735
 TOPRGU/WDT
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-2-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302124015.75546-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 02/03/2023 13:40, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a DT binding for the MT6735 top reset generation unit/watchdog timer.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

