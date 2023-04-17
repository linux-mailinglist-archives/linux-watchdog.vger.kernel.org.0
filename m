Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F5E6E4071
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Apr 2023 09:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjDQHOO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Apr 2023 03:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjDQHOK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Apr 2023 03:14:10 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510D240D5
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Apr 2023 00:13:54 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id r15so3694364wmo.1
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Apr 2023 00:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681715633; x=1684307633;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=syZbPEWLfzOhgdzjVf4hmjv0J9HBk5GQyc3y8S0TDc4=;
        b=ErwpGeDXQCLbGoJpUzuBlwXDGW4gHDKcKbcgLaP0EzlSVyPp50lO5ooqBdjE3mtkX2
         H2XzQq4AmdkQaQKCTJ5r06lgTJg1ByduAJ1tL3tMNtwbHfzDey2VbApJbGNaRFMz2jNp
         8s7kwtHw0z4SeVhSxT3zXFEtmcHueaD5kI+f3juqL4AFkRPA4gNlob1Pef6A93PMmq+D
         XgvW6g6j3AigR2RLokz0R/ncUngcqoEaXLeqSSyZgD8N9FLV+d9ZQZ2qEpdQV7F6Czns
         JIPuEKoZXl2LC8lq5BkZUE7Zs3N9b0ufy19M06r3imp3TU1r78GETkd+Zr9f3FjtByK/
         5RoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681715633; x=1684307633;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syZbPEWLfzOhgdzjVf4hmjv0J9HBk5GQyc3y8S0TDc4=;
        b=fXMoO1Pw3oLN9dfMqcGF5NbS7UUnWUcP9YmvQ+bgZbrPgc+AEfh83EXdEA7rFwTkPl
         7KI9z/O9IbDNGqYYyRDN9PhchQkFP2P+XiDwTrqWJqQlOrG3mN3+IrUJumLCPqloz60y
         AYGB+RjCGvT0f3tqsLaX3tRbl/+HyVLfKx7eszVQKM9tDmJNmxZ109PMlfSpPTcL1AZv
         3776Fif/m5mMy56Mle0M0UTxm23b+Q+xO0d+FloQQwKM81A3kXiBt9z3syRgX/0CU7T6
         ljIuSMVll2LlZXGKvevB7WqVueZT9Jn6beNzC8SL1QqiXBm4m0XRC541D9oxqUIF4nvj
         DcKg==
X-Gm-Message-State: AAQBX9cmxSXaqpa/jqAFEU0XSyTHe9WFRNxNlZ/v4LMhLuTWGeVt9Xa7
        txeskjkLvOaagz2Hn1DDiM55XQ==
X-Google-Smtp-Source: AKy350ZHevnEBLBB3tRQ66QQs/GmR4ej4PyHyYePKfXjn1BO5mfXXrncGDy2Oi214fEc1IZq/Eb4Bw==
X-Received: by 2002:a1c:cc07:0:b0:3f0:9c6c:54a0 with SMTP id h7-20020a1ccc07000000b003f09c6c54a0mr10416635wmb.2.1681715632706;
        Mon, 17 Apr 2023 00:13:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91? ([2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91])
        by smtp.gmail.com with ESMTPSA id iz19-20020a05600c555300b003f1733feb3dsm2772876wmb.0.2023.04.17.00.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:13:52 -0700 (PDT)
Message-ID: <e065768f-f9cf-9d8b-a7da-80557b7c9f6f@linaro.org>
Date:   Mon, 17 Apr 2023 09:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/6] dt-bindings: watchdog: indentation, quotes and
 white-space cleanup
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Julius Werner <jwerner@chromium.org>,
        Evan Benn <evanbenn@chromium.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sander Vanheule <sander@svanheule.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fu Wei <fu.wei@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Justin Chen <justinpopo6@gmail.com>,
        =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jamie Iles <jamie@jamieiles.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 15/04/2023 11:51, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 10 +++---

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

<snip>
