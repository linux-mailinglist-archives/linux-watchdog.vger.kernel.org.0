Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5127C5B53
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 20:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235146AbjJKS3i (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 14:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233213AbjJKS3h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 14:29:37 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE4893
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:29:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50433d8385cso281847e87.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697048974; x=1697653774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQZt3nBsHvMai6CSkKOoLdNKkrtgekAl8I8ZWb/n05E=;
        b=OtBMnYVC5FfF2Sbjva4B25PiScDVJf7YCZjVcxd/qb6NvkSK0SYblS+h1unNmiq2XB
         Ves/bcNRUrzusJ6MYtRxc13na+UdOxZOG7q2AZcgMEY4hAQvmZYyidLZ1SAJwn8sCci6
         cMMZChicUYDcpYjI2lM8dBV+++gbkuVs5GNcmmVc9p/ebVRlgmHAmkm4fKkdUnadfgKK
         +hMab/6Ul7DPaCyPmiF3EcqR7+PIVSVInsWikF+FEqb9pwaAMo3b1oMKLsYvpwZDOKNF
         0KpS491HiP89YZ2KcXeaoemKza8/GsG08cMHUs0weWo+eUZal1JF2QcPHLVDTm1o5i9J
         P8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697048974; x=1697653774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQZt3nBsHvMai6CSkKOoLdNKkrtgekAl8I8ZWb/n05E=;
        b=ByWqaUfJgxV654I0SO0w/RQTpJjeNY0Qxdb6xhx+6IJiGoI3emKl/S1RkqtQdfgtx0
         /7Xf9wDHiIIaA8WFw8AqR+iP+jS+Fpz4glwr+g7IuRehk7OOG9VktHTi9CYS9Hj2qYr1
         YhjTU3VM130RSN3LEPfCRivBzDZ693sBjSt4GUVJnFFagtHAY2xiePjEN287uPhmSOcR
         Ho8p6xio88PfnSjgBxqIbnRR/YIw5fxoLkuGamcNO36cPPm2lXmy1DUcqROcmRs50Mox
         Ceo2MAsso5pJ9L35LpUCYzV1mgRFZnPH8ngSgYfFjSIhQvOWUXxSh9G+5SR1oWvw48jM
         DSOg==
X-Gm-Message-State: AOJu0YyhprKfVb56E2RFXMZGbfYBMZc/r9Q+sBGaK5o6nfTWBkIJI8R+
        qF6D7H2QZMTl70iNu91zN8sFzA==
X-Google-Smtp-Source: AGHT+IGVF3bIjJ0SqAv0IX1U0Fq7FpjVDKwKxztmAqmMHlkthu9OkceDq+M9TNWwF/+27t9r8Lcb2Q==
X-Received: by 2002:a05:6512:3582:b0:500:99a9:bc40 with SMTP id m2-20020a056512358200b0050099a9bc40mr16474735lfr.69.1697048974036;
        Wed, 11 Oct 2023 11:29:34 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b21-20020ac25635000000b00503fe93fb56sm2368604lff.228.2023.10.11.11.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 11:29:33 -0700 (PDT)
Message-ID: <e4a47217-a61e-4eee-89b0-42843cafffed@linaro.org>
Date:   Wed, 11 Oct 2023 20:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: qcom: msm8974: Add watchdog node
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
References: <20231011-msm8226-msm8974-watchdog-v1-0-2c472818fbce@z3ntu.xyz>
 <20231011-msm8226-msm8974-watchdog-v1-3-2c472818fbce@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231011-msm8226-msm8974-watchdog-v1-3-2c472818fbce@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 10/11/23 18:33, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Add watchdog for MSM8974 platform.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
