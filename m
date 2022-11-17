Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A51462D8DC
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Nov 2022 12:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbiKQLGh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Nov 2022 06:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239662AbiKQLGA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Nov 2022 06:06:00 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE3031F9B
        for <linux-watchdog@vger.kernel.org>; Thu, 17 Nov 2022 03:05:57 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id be13so2238473lfb.4
        for <linux-watchdog@vger.kernel.org>; Thu, 17 Nov 2022 03:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9oKLSsvr/cBCGRCZY1wtjccFkiSFDqd+uWyVDFPmWA=;
        b=SKde+8lzjYgRX1VG6XJDWP5BMlwF1rBcE/hH+X3KnM0oGLWbiV2SN86uv+uMNS3SAm
         prGIUuc0ziSoDGcSJ/YTkj+8GGrEooz0nw5wKMxADB7ZyfFxWFzdnJGOKxb/vSTRjouV
         oA77m/3X7qSXCTshx7xgz+54N9HkNdb0rPHEnVECuzfkV2/2svpFzwtKHkGL4Fe+knHQ
         FVvCsJ84EL+GiYxbExNA9YSM2GCwH1ehhaTGmWGWuFNEMIyJatMevpFGPAOksLKo5HmI
         pirFlAC1i2kXTwOb3oCM+3FLFph2RuXaKqRRYlonFr2SFRt6cQukMx9fLWvon0/zi+TJ
         MJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9oKLSsvr/cBCGRCZY1wtjccFkiSFDqd+uWyVDFPmWA=;
        b=Orm2uixrruYJIcoE/qVXpgsIurMP9vyBKvaHG6ODRnARtiBs5vWa0VGURkhwaQ4n5q
         cIC25VEB5jPHGMFMwYv/8TTHiIlwLhLetNJhThKxujhulVKLmDdNGZrrrkV+7f+bURJI
         9O9EYCKo8Qxo3PkfOJGjxCUA0cPS/2Amlec5LqAC1opKhlyeOEbiWtCTKfbFFm2sKMG7
         PJHh4vu4nHgOH2iqByRY4qjWd2CpkoOnY0b9hPpJMMl7tvRBTNALDIrqzcKEBOUvZ81I
         JrDusqGvnPQ3FGrWSlp4QPSjaSH+PBPkn73TzNxonawd67+HtE3iiL3dfiuTPVqb7yh8
         y34Q==
X-Gm-Message-State: ANoB5plgeT2SQMph43oIwiUHtefTrqn7xpEjegQXH1cML9ej+8tmoqpT
        gnPSh9vP1ovK02nKWJM6zocYuA==
X-Google-Smtp-Source: AA0mqf6WTpOwMF6Abfkmcx3kqLoJYy2wVFgNiQUvEaxZ4V8k7FZqoI2Gw4lnbloLQr7Yzb22rWe2fg==
X-Received: by 2002:a05:6512:2008:b0:499:ce4:9bab with SMTP id a8-20020a056512200800b004990ce49babmr660825lfb.501.1668683155958;
        Thu, 17 Nov 2022 03:05:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c19-20020ac244b3000000b0049482adb3basm98441lfm.63.2022.11.17.03.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 03:05:55 -0800 (PST)
Message-ID: <1edeca8b-9c65-bb08-3868-9162e4a05002@linaro.org>
Date:   Thu, 17 Nov 2022 12:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: Add MSM8994 watchdog timer
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-watchdog@vger.kernel.org
References: <20221117105845.13644-1-konrad.dybcio@linaro.org>
 <20221117105845.13644-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117105845.13644-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 17/11/2022 11:58, Konrad Dybcio wrote:
> Document the MSM8994 watchdog timer which is already used in DT.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

