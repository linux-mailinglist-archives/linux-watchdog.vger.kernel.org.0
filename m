Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 617136E3763
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Apr 2023 12:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjDPKWz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 16 Apr 2023 06:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjDPKWB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 16 Apr 2023 06:22:01 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D668A5BAF
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Apr 2023 03:19:20 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id xd13so22889907ejb.4
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Apr 2023 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681640357; x=1684232357;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQ2pSbWS+VnJQa+rka9MRnpcuYtmOv6aRPbfjmRczfo=;
        b=CHgLPHJr3sdJV5BUyzdFwSkUgyZixULskPWaSH2Hn9KzlENG3/SlIOd9rPjsK1RerT
         itBE8Uwcpdo3b8x7BM8vdCKIADKOOi1aOHJ1TqXjOCtKmyfPJ+knH+CPr1P4eoDQfW73
         iYcwAa8c3MgtJAXDlW9GlBp+Y33jia14jaBYANBRn3k9FhtOBNbjJ8Te4voHCAOh2Z8u
         kEPPbqFIgBdAFC9uQn4PEw8wT0P9VQke1ryhMEmaT1f9SP5NnFeZ8gbVo6eE5X0jsvDB
         v+EdBbr+/p5OLefORpS3BBxWjAuIFyQUFLgc2k2VFjIP/22gcq8NxpyAdr4nPULmDR4z
         rO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681640357; x=1684232357;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQ2pSbWS+VnJQa+rka9MRnpcuYtmOv6aRPbfjmRczfo=;
        b=fx19tdUeIJoVHBhWUWN8umpZQf5BuSjqtiXV5WeMSZ9t2yRImR+pVDI+0JhbU+HIdQ
         1G2ryxJwN5DLKA2XhKuHy0I2aEsLUqwAF7vBJN69j1gn3HYMMwiJ5zA+fC/Ks/dIXYNG
         XpTkzKae1n6WLPLOR38NDw0RC/VIJ50dtMzsu9UbsD5RdgGYO/UB8++Izpzne/33xMcl
         C7AEuq6nksq0Txnli42PuO57bemrhkPhZE9QcUyuuO2Jyqc2EaFI08WiGRu1UnURyCzH
         GlA6mIeniRTIzKAsA3E0/uUg7QzGWvbxDaOshkuZ3q0Ixkwa4CSX+VE1GQEwMrtb+xE/
         uoQQ==
X-Gm-Message-State: AAQBX9dQMYjVdkmrD5mPir+DrO+1jaGWXv9kj25xBkoSCKP9bvEc1e/J
        7iSBRUwIvc6Pro+VV/yg4R8o3A==
X-Google-Smtp-Source: AKy350ZJ3oonRhplCGqgST+8seRhbMoZGcq/ItBJs9vGaQcqM0VK6aBZd2ELjWPgX3Z9uNPSET+PWw==
X-Received: by 2002:a17:907:2c42:b0:94f:2948:b15e with SMTP id hf2-20020a1709072c4200b0094f2948b15emr2730962ejc.5.1681640356716;
        Sun, 16 Apr 2023 03:19:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id xi11-20020a170906dacb00b0094f62181917sm394859ejb.138.2023.04.16.03.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 03:19:16 -0700 (PDT)
Message-ID: <1613da77-d77e-94c6-802a-b2d856c5b40f@linaro.org>
Date:   Sun, 16 Apr 2023 12:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2 1/2] dt-bindings: watchdog: qcom-wdt: add
 qcom,apss-wdt-ipq5332 compatible
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230320104530.30411-1-quic_kathirav@quicinc.com>
 <20230320104530.30411-2-quic_kathirav@quicinc.com>
 <0569ed09-2241-d981-4e0c-209caa7483ab@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0569ed09-2241-d981-4e0c-209caa7483ab@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 13/04/2023 06:39, Kathiravan T wrote:
> 
> On 3/20/2023 4:15 PM, Kathiravan T wrote:
>> Add a compatible for the IPQ5332 platform's APSS watchdog.
> 
> Guenter,
> 
> 
> Without this patch, I see dtbs_check failure in linux-next.
> 
> 
> I see you reviewed the V1 of this patch, can you pick up this patch? I don't see it in https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=watchdog-next
> I'm not sure if I am looking at the right tree, Please correct me if I am wrong.

Are you sure that patch still applies?

Best regards,
Krzysztof

