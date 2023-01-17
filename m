Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F0E66DBED
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Jan 2023 12:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236181AbjAQLLP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 17 Jan 2023 06:11:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236595AbjAQLK5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 17 Jan 2023 06:10:57 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5A32B603
        for <linux-watchdog@vger.kernel.org>; Tue, 17 Jan 2023 03:10:56 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id h12-20020a05600c314c00b003da50afcb33so5581544wmo.4
        for <linux-watchdog@vger.kernel.org>; Tue, 17 Jan 2023 03:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcsXRu4v4Y+Ep4I0A49mvEOyXRqnaq/f1PWoI6xqQUE=;
        b=m6p1wGOnKJEDfkSA93hpergNA4e9NcWzqucHS531moH+87fERdNK56Ad1XCdBBqI/c
         oc3TV7PAlAhAzPbRIgRIkOwl+yW+L/z/t1+bbAlTO9H5u6TiKe7mwGMIGef31A398tGM
         R9j2j38lkdH4j99fwg/JWJpnPkepR2E9CSWcTGog9Ma7fO/GIuGliJyToAM0xVD9cqYN
         WYUBDt1axj9uyQFbrRTV+AWE339r6lJiuRgaZZ8bZuo+U7L+KeDIcg7DZPBN6hawzjqv
         oDoNZh7ypBYATwX9c+RfKmQ6LS8NqLUC744tjBfY88w9oYwLWLm2eAQudiKrXtqcTC2H
         sPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcsXRu4v4Y+Ep4I0A49mvEOyXRqnaq/f1PWoI6xqQUE=;
        b=UT8EF9NLGMZZFEOMocCb07m33ogGcH04c9gFhlV1Ruutb9oAC2nXWDho/2NQLC2fbb
         0UqFvf/2RblPw8hXCHeVXuxeNvIZ8uguZZUKhdS73B0k+1Oo1Ty4XH2mThZmYBzLQ50q
         6OgYifMlPX88ifIvmVlyYC7FlDACawan1oqSB0MVdu54A4CMJpELftbzjpLeUdFTEVHo
         Rk4FBu+sAGkCepF8/AccC1EJ6OSWuwCoFmEy20dy5oLm9e03ta/Vpf5BJdkjUdpUToEP
         hyFqClVUA/5+lnZNqN9kGJqi7xFkYTof/BFIb9GT5+z5TcEG9Mi+P1xrmrfJ/x7+gGqa
         h6dA==
X-Gm-Message-State: AFqh2kqtEyRDvKj9ns9m7+1N82k2p6NiQ8cnKj9Frngw3nxve37fRXCm
        Eyu3Vq9khzpPBj9fze17KJdgqTBthEvjUku8
X-Google-Smtp-Source: AMrXdXs5sqtStasZ70vT/y/3ZTdwSxJRFyq2ZIub+y2aoLJDZqkTDXaBvoYOfrS9eUJjmLN3LwETew==
X-Received: by 2002:a7b:c5cb:0:b0:3d3:4f99:bb32 with SMTP id n11-20020a7bc5cb000000b003d34f99bb32mr2539161wmk.36.1673953854842;
        Tue, 17 Jan 2023 03:10:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c4f9300b003db08be84e3sm1620011wmq.32.2023.01.17.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:10:54 -0800 (PST)
Message-ID: <3fea483a-2d33-e870-0dc0-f4073abff23a@linaro.org>
Date:   Tue, 17 Jan 2023 12:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: mtk-wdt: Add
 reset-by-toprgu support
Content-Language: en-US
To:     Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org
Cc:     Project_Global_Chrome_Upstream_Group@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230117014023.2993-1-allen-kh.cheng@mediatek.com>
 <20230117014023.2993-2-allen-kh.cheng@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117014023.2993-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 17/01/2023 02:40, Allen-KH Cheng wrote:
> In some applications, the mtk-wdt requires the TOPRGU (Top Reset
> Generation Unit) to reset timer after system resets. Add optional
> mediatek,reset-by-toprgu property to enable it.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

