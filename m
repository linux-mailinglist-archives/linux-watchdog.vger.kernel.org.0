Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFEF755F921
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 09:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbiF2Hg2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 03:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbiF2Hg1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 03:36:27 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A4F35DFE
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 00:36:26 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id o9so20920823edt.12
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bPXiVn6Pb7F2l4c7bgqIfqtL2gpKtRVep1Vk1dOzNLs=;
        b=YRIAwZtnksko0gShIVaLFi1lVENHUCkhB42FPcIPtwStjQsfP6CeB+v0fWeZOUdmhc
         teecEw6g3oHTuLKa02sAl0gVjuvFOvSxRZXqbKBdKsGRdrYXdYGODVNSLkETedcCusM3
         OVvtcRnZ4HpLBe7v8oH7S9n/Fp5P0a9HNNTXrS2sxGQf1mqkW/2zwYeRGYi6tLi7bVer
         sXlmD/4/XgEpa13fPTBB6Y/87lqBMg1NXLZut3TGZ97S8ALTyalurRMZl5i2y89smqdF
         MWTXEq2U5vyJXxusOhR7p72c71jRSxee2lhI5yUxzx7RjXSpXw40DtHTS0AEclLStudZ
         Hv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bPXiVn6Pb7F2l4c7bgqIfqtL2gpKtRVep1Vk1dOzNLs=;
        b=ewDrfqjUeTUm0xCnyCXWUhpFVRicz7vEs1lRpYt1q7c6nwe1eoAOTDN8Ay7H6BmXqm
         pxZuMqcf2Ut1hP40M7us6nTo41xfIHp2P554WxV1Q4dtT+3OWqqrkIAlWc8VEIkEC4bf
         zqnAx56BMfagTlT8KFz5OCBGL9RxPUglBohE0a1tEz+/EqKuRAp1JFZuGVXHTjhmKDps
         PRg9Gl9oBCjgrGANByaFw6RlVnatmnap7SKhMwjFaM1X6PMQStTMCsz3ITkgxTSnbCuS
         SyjQwPgENgbQWHre9rtDscDopBT5t07/uyZg4z3f+IEW8jIzn7jxAKNb2A6B3kV0r+ZS
         K93Q==
X-Gm-Message-State: AJIora8sStNujR0cu9PJPYHf2MydDZ1/0ar7OItDcxXkAGnjjNpEyZen
        e2DN5GjMu4Mu6ufVYye4x8WXXcyTCVNuuA==
X-Google-Smtp-Source: AGRyM1vyeNBDBCLxl77d0cqo0XxUzuKi0mn8I9fSWYSyOYZDqlIxnY91+SWQ3NHzLnxUw1aVK0m9Dw==
X-Received: by 2002:a05:6402:94e:b0:437:8d58:4ece with SMTP id h14-20020a056402094e00b004378d584ecemr2361899edz.396.1656488185428;
        Wed, 29 Jun 2022 00:36:25 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640204d200b00435a08a3557sm10950502edw.27.2022.06.29.00.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 00:36:24 -0700 (PDT)
Message-ID: <b98cd4e9-28d8-53b8-2514-d6c63bacc12c@linaro.org>
Date:   Wed, 29 Jun 2022 09:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/8] watchdog: s3c2410_wdt: Remove #ifdef guards for PM
 related functions
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220628193449.160585-1-paul@crapouillou.net>
 <20220628193449.160585-5-paul@crapouillou.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628193449.160585-5-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28/06/2022 21:34, Paul Cercueil wrote:
> Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
> handle the .suspend/.resume callbacks.
> 
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use #ifdef guards. Not using #ifdef guards means that the code is
> always compiled independently of any Kconfig option, and thanks to that
> bugs and regressions are easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
