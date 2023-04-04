Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D984D6D582A
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Apr 2023 07:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbjDDFst (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Apr 2023 01:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbjDDFso (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Apr 2023 01:48:44 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90FF10E3
        for <linux-watchdog@vger.kernel.org>; Mon,  3 Apr 2023 22:48:42 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b20so125953035edd.1
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Apr 2023 22:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680587321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFT6IXN6PaGwozBWnj+vlreMrnoSTPvDNmEflqNWMF8=;
        b=za43rz5tmdMWbq49OjteZ33/ozPFMqpB/iR/ogfLLEIchWSl3vff+h+iR2Bt2mQqLq
         C7Ye32RwE8nV8Ueh5qMFY4jirg5WU58gUd+KJM6oqskADo+NQa/DQ5Xla7ZTr2p2jwyV
         k74XUrfAhIMeEIP6K/1aCf2pr+IuJ9XpJ9c3bqkD54jIh3PtF60ECVMEqDwnxqAZ8zbQ
         CTMLVqBDv/Xryi0NmDyDBwWKp/Cjp4FqLV9pwwuKQ1JXHNExvmB0Rf5tedfQsrPBr0xw
         GMn/md0LtJv3GGRSnYbdL78pIJSebqOF+fJOY6sUGOkR+QCBHoiyuQD/7zhoySzCNUpm
         GqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680587321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFT6IXN6PaGwozBWnj+vlreMrnoSTPvDNmEflqNWMF8=;
        b=tdUdM3SeqTQGiP3sB+6FgUOtEDcX3n2gsK1qC4ulLyVY5AhsL2sYpzdGBAwGDkOp9I
         WTZYjh+9WsAmNAPvPCG9B9lByCaJvrlBJ/xqkO5R/5xrHBs0RKOHjCusMUe2voHfkSen
         67hReAI55m9LzNaXI2oLDEkK9RNIo1ysRlFgt5nNlCb6djyHjTWwrlRGppSpWsTU/wiD
         7kdlHDXlHaoBU8n64hoszo/fzdXrpBhq+zf7XRhiWknAJh16IJgSuinqVqcz6yE2UqES
         4ylHE5AUidP+zx2k4XOWQl90w6U7Cshasc2uEQOUCwUdnGvCgbLGhsROtV0yedSpBMOP
         V15g==
X-Gm-Message-State: AAQBX9fJ/nbo2iOxTNaGoDxP0gTXQn200VMmS8f/g4YWErr/ufR3PnNS
        DVCpTBT2qfpR5dyZ3UYyFyVlSQ==
X-Google-Smtp-Source: AKy350aFspxX3/ClFdKBoL4Wf1Kvbgx+s9AkV8KoGPldaxLkkSqRcR6YiYY7WeviG/7/iD2jAR50cA==
X-Received: by 2002:aa7:c90d:0:b0:4fd:2363:16fa with SMTP id b13-20020aa7c90d000000b004fd236316famr1250104edt.41.1680587321395;
        Mon, 03 Apr 2023 22:48:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:233a:5c18:b527:381e? ([2a02:810d:15c0:828:233a:5c18:b527:381e])
        by smtp.gmail.com with ESMTPSA id b12-20020a50cccc000000b004fc01b0aa55sm5397192edj.4.2023.04.03.22.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 22:48:41 -0700 (PDT)
Message-ID: <07548c7b-fa71-032d-add1-559743f16d9d@linaro.org>
Date:   Tue, 4 Apr 2023 07:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: watchdog: alphascale-asm9260: convert to DT
 schema
Content-Language: en-US
To:     hack3r-0m <hack3r-0m@proton.me>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Olof Johansson <olof@lixom.net>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230403004138.326482-1-hack3r-0m@proton.me>
 <20230404022015.754177-1-hack3r-0m@proton.me>
 <WaJw8WW0_x3pP2NOWf11aNOJx0xB-gZuE9bMTmydhniI0kSNa5M2oJkCp5PNZR9O1ySeV7RRLRf8rkpfiqd_P2udBHGf58x9bHSUZ7Vl4vU=@proton.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <WaJw8WW0_x3pP2NOWf11aNOJx0xB-gZuE9bMTmydhniI0kSNa5M2oJkCp5PNZR9O1ySeV7RRLRf8rkpfiqd_P2udBHGf58x9bHSUZ7Vl4vU=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,PDS_TONAME_EQ_TOLOCAL_SHORT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 04/04/2023 04:32, hack3r-0m wrote:
> Thanks for the feedback, I have incorporated the fixes in the patch. Warnings generated from `checkpatch.pl` script seems to be false positive in this case.
> 

I don't know what do you refer to. You top posted and answered to
duplicated email?

Best regards,
Krzysztof

