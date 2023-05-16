Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADCB704D1F
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 May 2023 13:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbjEPLyl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 May 2023 07:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbjEPLyb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 May 2023 07:54:31 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7184698
        for <linux-watchdog@vger.kernel.org>; Tue, 16 May 2023 04:54:24 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bc040c7b8so21191449a12.2
        for <linux-watchdog@vger.kernel.org>; Tue, 16 May 2023 04:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684238063; x=1686830063;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=01pGuLaNPZiP/h7oP1bbANfkWz5JoL6SoLLTkcSWbjk=;
        b=bmOLq/tFxzqJqEwncNw3euD1ztQZuQkH0b/jpx/KbSESUxaVfgpydgf3NLLHaxyxcM
         FsI6gC+4OGbNTFz6Wh3mWcPCB9wR/3SBXG9Q+9fBJ1PAI3JbK/sFR2WbUlJOEfpBaO6+
         4gzUSkN4cqYGTA8yMPdnI6TtpFLvRJjoBweKA74crxikW2zdSKPGZ56G5p1vs95CPT95
         KyG7Bc8Fu+wlZadUyfHCLbRXrKaWsqMVGAERcTr+0VU5iU+TVwD8qfVKSgGKAWcTY2y0
         79QcBexBKhZ1kYp35VSkNfWoPSO6Z6gZAaatVfJv6hcVLPEnl2AAX5wWoMr/lkMfMwSV
         SphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684238063; x=1686830063;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=01pGuLaNPZiP/h7oP1bbANfkWz5JoL6SoLLTkcSWbjk=;
        b=dNE2Wb2TyCfHzRxgXOVEgtkG4Hwdfa7rFiMKFDl/hI/P92YvkzVHxfysH9DilnHxt7
         kvRC7VCCY+eS45LNglhqQAPP0dyzwjXNBCYK7yOhwEFoXIE8p1B9r4X6Nwoen3YFDbEF
         QPkVeHgp2zUl6SuBqHtUtGJ8/n0R9cw0DAHa+pqgk03YzfmJrBwMhabeBOUGTNbNHOJ3
         ionkvJAA19Am7Vsvk7eMB7SHKA6UVbTXJ8+8kTrSd9qDsBMqrIAvdFXL2H8Ock5WnuHa
         XXV1DToQdG5NB5hxUHqQ0wl41s2wELgFE+qJ5Z+zKVsmiAsQAtA/zAhd/dBnKGnIvkbw
         OOGw==
X-Gm-Message-State: AC+VfDwpBQTN/N4woGxnhO670USxYzUDEW4FJ/5HnXnF2UpFh9JupkX/
        jIdYLsyXcmiT2bKG/fvqYtzMWA==
X-Google-Smtp-Source: ACHHUZ5GO02CbtyRzS64jRe4YwxdoaRpG3D956slM1Mli1XvIZZ9t2Vx85yPErLITgu+TH8VYXXrdg==
X-Received: by 2002:a17:907:5c6:b0:939:e870:2b37 with SMTP id wg6-20020a17090705c600b00939e8702b37mr34031591ejb.70.1684238063075;
        Tue, 16 May 2023 04:54:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id e28-20020a170906845c00b0094e84314762sm10878333ejy.187.2023.05.16.04.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 04:54:22 -0700 (PDT)
Message-ID: <a370f2af-a894-b102-1836-8964c39d7a86@linaro.org>
Date:   Tue, 16 May 2023 13:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXT] Re: [PATCH 1/2 v7] dt-bindings: watchdog: marvell GTI
 system watchdog driver
Content-Language: en-US
To:     Sunil Kovvuri Goutham <sgoutham@marvell.com>,
        Bharat Bhushan <bbhushan2@marvell.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230508131515.19403-1-bbhushan2@marvell.com>
 <ea9ae4c9-2808-bf22-70a3-bb7e7b1168d0@linaro.org>
 <DM5PR1801MB1883175A2538B85FEF571B7AE3769@DM5PR1801MB1883.namprd18.prod.outlook.com>
 <8119eec8-0190-b6a5-85a7-301bcb81b0c9@linaro.org>
 <DM5PR1801MB1883A414F47BB56E9537673AE3769@DM5PR1801MB1883.namprd18.prod.outlook.com>
 <8b540cc2-bc0d-9d8b-45e6-98410322b3f6@linaro.org>
 <BY3PR18MB4737947E20CB44CE6DAB940DC6799@BY3PR18MB4737.namprd18.prod.outlook.com>
 <578a743e-dee4-59b7-2f4e-290b551211e0@linaro.org>
 <BY3PR18MB47373D22B01071D5DC2B5F5DC6799@BY3PR18MB4737.namprd18.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY3PR18MB47373D22B01071D5DC2B5F5DC6799@BY3PR18MB4737.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 16/05/2023 13:24, Sunil Kovvuri Goutham wrote:
> 
> Also this is the same naming we have been using in other drivers as well.
> drivers/net/ethernet/marvell/octeontx2
> drivers/net/ethernet/marvell/octeontx2/af/rvu_cn10k.c
> 
> drivers/perf/marvell_cn10k_ddr_pmu.c
> static const struct of_device_id cn10k_ddr_pmu_of_match[] = {
>         { .compatible = "marvell,cn10k-ddr-pmu", },
>         { },

BTW, I don't understand this part. We do not talk about fallback
compatible, so what does it prove? Of course driver will look like that,
but we established it some time ago, didn't we?

Best regards,
Krzysztof

