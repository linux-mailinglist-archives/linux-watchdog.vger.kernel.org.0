Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A469C53A38A
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jun 2022 13:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241726AbiFALGI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Jun 2022 07:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345880AbiFALGH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Jun 2022 07:06:07 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761F4880EF
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Jun 2022 04:06:05 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id v19so1667911edd.4
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Jun 2022 04:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zmUkWzeg4eeXLMNd3lfhrjjKEKVUaxqNRQUp3Ckt2Z4=;
        b=qocjSTMUZH9T2IQW3/obAwuW9pk070LbB8GfsSOVnRtrD9fopdPRvwtZ/JfC2x2L4J
         s5/HxRxzngbaSRGdruiCod/zCu5dVCoKc7Njqlylpz7FZev1Vq0oO8Ob0TDA/S9e0fyw
         jPZaEZBDl9f10zp324+0LbUUd6G1CNhCgcyGBGJtqyelHCqjhjGgm7MobkfDjJGItaHW
         0cVEkxV9zabA0mHtS1vCKHvyUb173mglxwrPfO/75smUNJEHUn4ROWpiZ5pwtUKt5Oik
         hd6Zz89OHoU3KlvkUQe5g9svtxh4Al9HXjzYeelvrQKXepE9z3xt6+d99zSfaPQzBsCI
         BOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zmUkWzeg4eeXLMNd3lfhrjjKEKVUaxqNRQUp3Ckt2Z4=;
        b=a7PcIP2BNpWBFTKrAKpMID7znTElCGkHGhqRcNHNrfJ/NXzUDvDz6P4HIm3JBA2zCc
         k8PliOKg6Ua5A97js83MY8qg9qcXY/5dTbtOxP6WzLYQjpfV7mVJDqEWkI9e9pp/cdHP
         v2MM8QpmZ6L9Hz9i9qWPo7OH68Vmy6AZnAic0IUfpn8mVXcIemGH3e2fWXgGWXkStbNY
         aN1mftvgrTBzpqCdot8PmG3biu+8pXtwGgIQiJyEYI2KFlW8ScEKLGzBBmpFJ52Zx6/G
         op1qIsGB10eCXHlMVEIlsHy8F3GTbaCQDCRpGUk5Q7v4JPpKLTQ3HbZK4Vr9FjI0mL0u
         2s6A==
X-Gm-Message-State: AOAM530wX+G2dX+p3W0bsJVf1kTq25/84VB5BnPeIJNCJhcpjlzrU3hn
        ppiv5JIawe3W800TX8O/3GcDXg==
X-Google-Smtp-Source: ABdhPJxGZfvPCA32qvZADlQLYkYuCMi7rvAeDhPjUHEigzmSsilnTNVK6tD84n4NNi8pnBGkqXJV0Q==
X-Received: by 2002:a05:6402:2553:b0:42a:ef31:4444 with SMTP id l19-20020a056402255300b0042aef314444mr69111155edb.46.1654081564014;
        Wed, 01 Jun 2022 04:06:04 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170906b0c200b006fef557bb7asm572545ejb.80.2022.06.01.04.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 04:06:03 -0700 (PDT)
Message-ID: <3389a816-0f51-ab83-1026-2201017a2f12@linaro.org>
Date:   Wed, 1 Jun 2022 13:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 08/11] ARM: dts: qcom: sdx65-mtp: Increase the vmalloc
 size
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        manivannan.sadhasivam@linaro.org
References: <1654080312-5408-1-git-send-email-quic_rohiagar@quicinc.com>
 <1654080312-5408-9-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1654080312-5408-9-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 01/06/2022 12:45, Rohit Agarwal wrote:
> Increase the size of vmalloc using the bootargs in sdx65
> mtp board.
> It is failing to alloacte the size needed for firmware and
> giving the error logs due to actual vmalloc region lesser than requested.
> 
> cat /proc/meminfo shows the size of VmallocTotal as 245760 kB.
> 
> [ 10.980356] vmap allocation for size 268439552 failed: use vmalloc=<size> to increase size
> [ 10.980505] qcom_q6v5_pas 4080000.remoteproc: unable to map memory region: 0x90800000+10000000
> [ 10.988542] In adsp alloc memory: adsp_probe 482
> [ 10.988592] remoteproc remoteproc0: releasing 4080000.remoteproc
> [ 11.001598] qcom_q6v5_pas: probe of 4080000.remoteproc failed with error -16
> 
> Thus, increasing the size to 300000000 as modem is not the only one using vmalloc region.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  arch/arm/boot/dts/qcom-sdx65-mtp.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> index 85ea02d..966385f 100644
> --- a/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> +++ b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> @@ -21,6 +21,7 @@
>  
>  	chosen {
>  		stdout-path = "serial0:115200n8";
> +		bootargs = "vmalloc=300000000";

I understand that issue comes from SoC-related driver but this is not a
property of the hardware. This could be added by bootloader if needed,
but in regular case this is a system setup parameter, so it does not
belong to DTS.

Best regards,
Krzysztof
