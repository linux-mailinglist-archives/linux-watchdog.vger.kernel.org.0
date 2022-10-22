Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A99D608E68
	for <lists+linux-watchdog@lfdr.de>; Sat, 22 Oct 2022 18:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiJVQUg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 22 Oct 2022 12:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJVQUf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 22 Oct 2022 12:20:35 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCDF58E94
        for <linux-watchdog@vger.kernel.org>; Sat, 22 Oct 2022 09:20:33 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-13ae8117023so7195060fac.9
        for <linux-watchdog@vger.kernel.org>; Sat, 22 Oct 2022 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oP+OivOlJKby7VX0wt07yv8oqh7iwPhSwvHGsEi8ePI=;
        b=tOG0B42BsdazxfhzuTyBJ7MA1j+4BSyU7mlZLhPC+gv21gipF1srZBPJ6Tl0G+18gn
         /9Rsu+duFErhwGXP51ACbYH9ri2zA30YUIdygtg91JoQYs5Oixg53edGQpekz86QBmG9
         +22xyQ8DP6kf5d829+L20tN78RFNfzI5s6nR9QYwnz5snTQ7IMePeC0GFnfdNqlhemkk
         bdoluDTNW8y/ISAzRbs493FQ2BX3RC7o5Rl6oZSZvlVehTYIKPHIR29KBbonMGjX84yB
         n7aSWintkxx6mWv2lSFDqIorHujWmSKhdETTdedqQK7ZpP/ROOUzdt1/QVsL86XuTrzl
         sWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oP+OivOlJKby7VX0wt07yv8oqh7iwPhSwvHGsEi8ePI=;
        b=M9kwLL63tkJfKykbLSixLwtFodIqL9PipzS8HBVdaMFPMR061KDCg00oXHySR12FFS
         grDgb2o5ugLdDJbk/EEZXOLrRjCUV5rYPFLnZ4DJPJwNqGLDk4Mwso0TuVtD5M9OL8QG
         hwuNK2orGAzamIK5BpwS18zZtdBiiIw4KOh0ixh3sRywToo6dW4zy9GO5Ck8npYxh1Zm
         3MgZ+JNeXdoC3ipCcpdhv8yMmzSiptTI0XLmBm+quRZ9v5CAdFmbVHj+O6W6SKXUR6ZG
         LxKOKGKiG92p1tMdGCBhZyfCTjdAKzbMvZqWDErezFsH4LYuA+1X0nUOOt6ysR9EVDf2
         RUUA==
X-Gm-Message-State: ACrzQf2gwQ4fWed6Wn+6Nxz38usEDyHnytSpSjbanJmzn7yN5OZMaJ7a
        //8uLkvFCrM0iGKuqL7KO4UpEIefPj1sWg==
X-Google-Smtp-Source: AMsMyM5HZNHKBt3bPjg0ZWDzXEdMLa6L5POsBmjhsTM00sVzPQsTy/DfF+ZSjY7MoJ8YpzkahPsDRQ==
X-Received: by 2002:a05:6870:c58b:b0:131:9324:60fd with SMTP id ba11-20020a056870c58b00b00131932460fdmr33558787oab.154.1666455633180;
        Sat, 22 Oct 2022 09:20:33 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id 32-20020a9d0323000000b00660d7fbf13dsm2373160otv.51.2022.10.22.09.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:20:32 -0700 (PDT)
Message-ID: <bac3646a-13f3-9031-c5e6-b5d24e0d9514@linaro.org>
Date:   Sat, 22 Oct 2022 12:20:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: aspeed: Document
 aspeed,pre-timeout-irq-us
Content-Language: en-US
To:     Eddie James <eajames@linux.ibm.com>, linux-watchdog@vger.kernel.org
Cc:     linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net, andrew@aj.id.au,
        joel@jms.id.au, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
References: <20221021151559.781983-1-eajames@linux.ibm.com>
 <20221021151559.781983-3-eajames@linux.ibm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021151559.781983-3-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 21/10/2022 11:15, Eddie James wrote:
> Document this new property for the pre-timeout interrupt.

Please convert bindings to DT schema first.

Best regards,
Krzysztof

