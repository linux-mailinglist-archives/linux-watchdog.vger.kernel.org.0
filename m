Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2325F5861
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Oct 2022 18:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbiJEQem (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Oct 2022 12:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiJEQeW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Oct 2022 12:34:22 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A727EFC6
        for <linux-watchdog@vger.kernel.org>; Wed,  5 Oct 2022 09:33:59 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 10so26350839lfy.5
        for <linux-watchdog@vger.kernel.org>; Wed, 05 Oct 2022 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fsDytsrXABRiHHLdkomit3W/4SQyAKiKJzv17uaMpSE=;
        b=f79WZ1CmFqHwvH+p6fcw9MAZwCeE4Y0jytRrvpG5oNagbKEN/cGNhxlPfDTgAilmIL
         LRJwD/J5nWGLRSi7njSfd3FVREwQ5CEX8IOzVdF8u0kyJJ57IRIkLXOTvPecNi3A9V9c
         Tz6NWbOT3Cj04sVi1gyeZRh0uso8A2pmY0qHVA+8lFrgZB7eBS4xucXwtn0L7zGYI9fF
         C8gxBR7Zms4ORtGFCduxQONtzzsoZa2j+6tbzxtCyXlvoRLjKxFUjNKeC8uYEs2nSqUA
         WNq3lUsL8gxqYu3m7vVS+ON5miMOz0ikYD84TvhHaFFINKRHkJrfywUbvmNlradLvDPa
         qE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fsDytsrXABRiHHLdkomit3W/4SQyAKiKJzv17uaMpSE=;
        b=2VkFF403v8Nl+cqAGskeIxUpjo1g1d8ngq6gtbT/s3R3zBlMHsQLlwX17OWY9aHZR5
         YH80gtmpX215ye9IfyVNLY32EoJ2MSKMMACF5smk1tc/omJT5hmLmfihFpkwAVim4iiL
         XRAnBdF7TyJxObJLP7ffQS99TZhap5UZcqN61DKKVh9NpWKlGGLGEsNJ7APwbTbv2AX3
         fMkkt9XIeSozclwW9dhuYNeaPpN9XrU/1Qus+782+byWV7uXO2CTZufvoV5RvWAe16eU
         Ckslh5DG1NkiPxWeE2ZW+Tk6XAg4xquK1becLcyglA7635Gg8+NyxNvgJsuN7eXq355g
         wUjg==
X-Gm-Message-State: ACrzQf0vqiZWdsu/5PT5TB+r8AKoZS5nOp5adHj8B2bM4/sU7Msli8w9
        s8nobqSMbS4F9i8Fkwegik6aTQ==
X-Google-Smtp-Source: AMsMyM6R1rJ0EDep0X30zwEZyQnjfv12SmZCyEK74LSEbsUR/NHwNWRbzWm06v352s5lwPYFNRhPig==
X-Received: by 2002:a05:6512:6d4:b0:4a2:5045:db6a with SMTP id u20-20020a05651206d400b004a25045db6amr249061lff.199.1664987630856;
        Wed, 05 Oct 2022 09:33:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k16-20020a05651210d000b0048cf43c3a85sm2388561lfg.238.2022.10.05.09.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 09:33:50 -0700 (PDT)
Message-ID: <1f3ebf6f-117f-62a7-8e02-3e8a3bcf7e9f@linaro.org>
Date:   Wed, 5 Oct 2022 18:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek: Convert mtk-wdt to
 json-schema
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, wim@linux-watchdog.org
Cc:     linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        allen-kh.cheng@mediatek.com, seiya.wang@mediatek.com,
        tinghan.shen@mediatek.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
 <20221005113517.70628-4-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005113517.70628-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 05/10/2022 13:35, AngeloGioacchino Del Regno wrote:
> Convert the MediaTek watchdog bindings to schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

There is already work in progress:

https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@mediatek.com/

Best regards,
Krzysztof

