Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0300F64B20C
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Dec 2022 10:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235163AbiLMJOH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Dec 2022 04:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235129AbiLMJNF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Dec 2022 04:13:05 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A753A8
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Dec 2022 01:11:31 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id h8-20020a1c2108000000b003d1efd60b65so7377419wmh.0
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Dec 2022 01:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uw1voEWUp0+0v05jbG+NYaaxMpvPtik5wxTtm6xJtnc=;
        b=mmCPbBux9a5PQtx4gbSUNSg56ycUpi8ANwAZbb1Od/wJyAAsIqXhsPBDz7qK9Das2/
         1jUOy4JuW24JJ7ffMfxYaREfxU3cZQppmH60uP6TqfI5ziv81DyyHWDxyeKA61tO3M8a
         eGhmb2OJslJzwOP+4XURDoe3f0Ov20ZN/8q+Sw6xGmujQnqgJGTYCMuj4975w+ZvdVMI
         ylbfHJJ4n3LT+K/F6pMmhGAsJF/bMUMpQi5cKjMM1qe+oN1X/Kyzk1zFPIVfu1cYEmG1
         EdMlE/4nRk7o6ifyYlOPzKoFmA4eA1vJmwpKpw+ld6ALCYYaNoWz3Qsw380NGmfUBsAX
         4xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uw1voEWUp0+0v05jbG+NYaaxMpvPtik5wxTtm6xJtnc=;
        b=3JtDceKbDnzQ6U68WXSHjLhMb0dlcHPe3rI3kOvSVnCWsl9Z6++FJEUy3kBWyBSDj5
         c5v0scU44PMmmmdUasA3u2y9MWVEjCK7+xwR3bV0UCwGj4lH7DdSzkShJ6KL0DCRdEuw
         mDBHmBOpF7JJjLaFwnczlGINxm3YJn9zW2rQOncgNISBMIAqCgEJd2eRbXKtQjl4h1w5
         wlOZF1nNYYecbUrvfUnQy4TvHOw0BVKIw1rRNGTdki0DbmNGI9ZoaU447xNkGlECByBb
         D9ubo1E9q3t/zCFSnyjNx+eyXyEYcItX71C8YFnCUAvmqd13nHOWiaGhkV5iTZZ3tIdU
         y6zA==
X-Gm-Message-State: ANoB5plQC+qrMg89H7dYKqM4TaGerhX3w51INfeEh+Cq6XSOgtE9ki1n
        CN5xhxRa9D5ZoiH5YLWpQMqGhA==
X-Google-Smtp-Source: AA0mqf5qMOYPOTj8H5LDaHHrXGWetVbN10xSkU6EVkmeROZ/YDkQbYFFOw+e7zoZAzAGvlBsiLofVw==
X-Received: by 2002:a05:600c:5407:b0:3c6:e63e:89a6 with SMTP id he7-20020a05600c540700b003c6e63e89a6mr15269539wmb.2.1670922689669;
        Tue, 13 Dec 2022 01:11:29 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id f13-20020a05600c4e8d00b003c70191f267sm13320087wmq.39.2022.12.13.01.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 01:11:29 -0800 (PST)
Message-ID: <ffd36b9a-4d8f-3405-1926-668151e2ecbb@linaro.org>
Date:   Tue, 13 Dec 2022 10:11:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 06/12] dt-bindings: watchdog: qcom-wdt: merge MSM timer
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
 <20221212163532.142533-6-krzysztof.kozlowski@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221212163532.142533-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12/12/2022 17:35, Krzysztof Kozlowski wrote:
> Merge Qualcomm MSM timer bindings into watchdog, because the timer
> compatibles are already included here and the hardware is quite similar.
> 
> While converting the MSM timer bindings, adjust clock-frequency
> property to take only one frequency, instead of two, because:
> 1. DT schema does not allow to frequencies,
> 2. The Linux timer driver reads only first frequency.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

