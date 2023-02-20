Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C07269CA1F
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Feb 2023 12:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbjBTLq7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Feb 2023 06:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbjBTLq6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Feb 2023 06:46:58 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFC01ABFD
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Feb 2023 03:46:53 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id i31so8913559eda.12
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Feb 2023 03:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Xtcw3cDdSwHWJsQr0w82blGJclKYlsVnzTEgCTc4ZU=;
        b=KMEEkRJDmcIgKA/eO/YzoO4mA/CdX3ncGdw8UBkQ5iyUeBsWnewXfYV3l+fosJCQMJ
         AcMJzyD0e0kE6vVLH5mP2hOBmwGv3shrzGY4ywEtsXdCd+Tt8s3X0FQGlVsVhSQ2S4v6
         srYM/S9Mx290t23KC8QJuMqzc0oYB+01OAO0wVhPamT3s8m3vWcKHICbfZhg5GLsiK49
         X65TLdCj2/jgZ9CxiKA2W9lJDbAFQHuk6iW3Rl1Fom5JxqoP5qvIX63vQhCvgh1OXauv
         eaD1KMRTQo/YC31AhlmypJ/ZhMrdJEzq5ULrxZfBikwLnasIGREm+Aet7Fe8gQ2hP8wp
         yERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Xtcw3cDdSwHWJsQr0w82blGJclKYlsVnzTEgCTc4ZU=;
        b=pRJJ6qydX6KEY82uTxQJq53+DVBtN4zFk4/5K5jO/3iLZN+jKdyTt4cR7TLurtmWi3
         Rnx1bpMCboMESALprF1HBeYuaHUxU1/DSwW5PvSEH2HxYkj/a2llM2BnUWNiyiHCxre6
         KW0wOd3TCkPUlv/oF/RLEGGcGnaGvhlZkklzlHSB1XYsayH1dc9glvvehnYhNETznBLV
         pHSqqW7YZXeEIeWsC+GtYJNHeJKyNYneZvv4MkpM0j+o9RDprxMxuRUBFr4G5EGdJJhP
         uP7iwJH1wqToBHKrhqaCe3NZ3wLlhx/iJpgzEVZ1KhRuMRE9WudGcdh/89XVFNZkDLAB
         zDDw==
X-Gm-Message-State: AO0yUKWt79bTVWe+c488q7vmf2iAoO8nifR9szOyVOOnDR3lxH8TUgX7
        xZnxx2R2AD7VHkD0yPUlDeyEcg==
X-Google-Smtp-Source: AK7set9OGjT1DLWk0N96S7ZehgjTcX/3x85oE+fS4eeSmIwvBB/N/82doxF58xBruvWA5sE1HVUQjA==
X-Received: by 2002:a17:906:13d7:b0:88d:f759:15ae with SMTP id g23-20020a17090613d700b0088df75915aemr9627155ejc.42.1676893611640;
        Mon, 20 Feb 2023 03:46:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id md1-20020a170906ae8100b008b174ef3cdesm5214062ejb.27.2023.02.20.03.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 03:46:50 -0800 (PST)
Message-ID: <817c2d94-12b9-b5e4-764b-d221811a7317@linaro.org>
Date:   Mon, 20 Feb 2023 12:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: Add watchdog for StarFive
 JH7110
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Samin Guo <samin.guo@starfivetech.com>,
        linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-2-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220081926.267695-2-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 20/02/2023 09:19, Xingyu Wu wrote:
> Add bindings to describe the watchdog for the StarFive JH7110 SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../watchdog/starfive,jh7110-wdt.yaml         | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

