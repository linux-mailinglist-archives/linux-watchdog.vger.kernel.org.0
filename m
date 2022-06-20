Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA0985512AC
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jun 2022 10:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbiFTI0L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jun 2022 04:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiFTI0K (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jun 2022 04:26:10 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650592C2
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Jun 2022 01:26:09 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id fu3so19572447ejc.7
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Jun 2022 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=feqxyD++ZNyntOrZZnmNSSht705UCVtD7ApY5yH0Mvs=;
        b=gNxb44il+HQYrhBnShvzucZXX6Gwi4FVkDiqeRAqpYwudwpb5N5mV+m2h3Zm8v5mr2
         o9bBSO0oTZgdjnMekuBrSGxllkOicFAVUoFYplLcTQh9HbUL8b/oWfAMiXZYHx09+qa+
         xBdfnwQni1Q90PgBXwc1Xcr916eO5OTtLhdRBz3sU/sjAXw1Qb0Kg+mp8YzEJYhtDsA/
         FFQOcO2x/z6WjKFPywRuS3xAKttjDaPz6GH9cc2XSlqkg8JlGr4cvhRmdutVDbRN2kIB
         zmfFkZIxPlUpEROwZcnUMMWN0YqEmAEad/hF1PX33dWuE314Hkhs4skaPtGGXvGsufZ1
         PeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=feqxyD++ZNyntOrZZnmNSSht705UCVtD7ApY5yH0Mvs=;
        b=QQO29/1r1GAOYgsEOTkeljZdYHld5wwgq9wQut0WS2tqTrQfvTTatVwuHSTVO8A0vN
         QNKbwcrkW2JBwTr/JbXMWNO3U64O6BnvTnXN/2Ag1UBBpAliTvRdftdKgvWJQ7KrVkYI
         UDDZ51XYP0yNuhY3UdKsXKW+JTjzKSvQt8CnzJF4TOYd1R8DwxGP09sAqWzPx3Sr20qR
         Vl2YSHFdvC6laIBAsV7b4HCn8Z15U+qjMlerJstaEz4dp05PiEd/Zjvn2CW2oG/U5Ysv
         TH+51u+9U4sx0ZkHXOrbN78B5KVWQ925Jfrspu2EZoTZl8hnkYgfdiZ6YOUXAsASVU4S
         xbzA==
X-Gm-Message-State: AJIora9OUsMJCR6ENX36bWrlzRQfor4Fyg0IVU2Lodczxgl7FUIii8yL
        +GA2euT3nyN4mvcOeYHh13Yn2w==
X-Google-Smtp-Source: AGRyM1sjFzk8/oI1yQ/uy+RG3TYabiaCKsMY8TD99fc+s3KjWuVK4O2rvV5My5XgAjgX+UfNlgDSVw==
X-Received: by 2002:a17:906:a858:b0:70e:a4d8:1c45 with SMTP id dx24-20020a170906a85800b0070ea4d81c45mr19232866ejb.213.1655713567929;
        Mon, 20 Jun 2022 01:26:07 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709061da900b006fef557bb7asm5530127ejh.80.2022.06.20.01.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:26:07 -0700 (PDT)
Message-ID: <95249574-d12b-92ad-5e1f-89fa4e7e42b9@linaro.org>
Date:   Mon, 20 Jun 2022 10:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 16/18] arm64: dts: nuvoton: Add initial NPCM8XX device
 tree
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220619151225.209029-1-tmaimon77@gmail.com>
 <20220619151225.209029-17-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220619151225.209029-17-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 19/06/2022 17:12, Tomer Maimon wrote:
> This adds initial device tree support for the Nuvoton NPCM845 Board
> Management controller (BMC) SoC family.
> 
> The NPCM845 based quad-core Cortex-A35 ARMv8 architecture and have
> various peripheral IPs.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
