Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B36F57162D
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Jul 2022 11:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbiGLJx7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Jul 2022 05:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiGLJx6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Jul 2022 05:53:58 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9174C20F74
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Jul 2022 02:53:56 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id c15so9297822ljr.0
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Jul 2022 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=LMjElaEycr7SAx7h59JBZKxM3vi9DYxeY8Usf5KNPqA=;
        b=M79X/n3YtBxlMJx0CE/v58ek7eJ/4+aNYp72M7tUXpcGUajqpRjpqWDvzIfk0iDKaZ
         RBqy7cwj2XdbTfuZTg2g2RKKDn///7skzfv3cZpPIpd0ma8qBuX6zO/9CcEdT+LGPYp9
         mocZH4KtdzqtbMKmes2DKIjZRmoMQKCICJVEyjM9+tOb/tOTNZIjZmj3nyY0erFmK3Rv
         WQQtDREaTeHmisLSJ2kBHx5avl8u//N3xZyIhfN2v3n0e4N3CZ4uNp3nkSlgf2tOn5b/
         WxkW5FP3vbpO3C2Dx2hgQBqQSsndsCtpbpGvI07V9Sxf/OO2qXrUlfyfFzCEnlikGbgr
         YEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LMjElaEycr7SAx7h59JBZKxM3vi9DYxeY8Usf5KNPqA=;
        b=Gu425qofQwqCXFKF7CNrOAdsObeZBtk92aE04O0u62QlB+8kEeTGZPh9xQOGOes+uY
         2vRikWbFR8pPzSXXPUSiaJXF/c68wm7JiLDZ4rOFvDskbANiUBVLQ4p84IQlCsQL2Az6
         zWKfJ4sP5wr4/TxaztzwvOdS0GbMiuya+TnAyFwlKrx8F4Hy39d1QrR1zM1LuvN/U6nx
         s5qviYz4gvLlBJ/9CSBiwod/zsctulu67d+HO2i7K4kU1A0TpWeCGXPCDTcWWoA3rbCd
         lmYv1dyL9uEYF14LmE9mfxShc+lmQ5T3103TUH8NkNaqtz1rUP4uujkVZofaOTt8pwFO
         Mz1Q==
X-Gm-Message-State: AJIora89SVrKNTfPPduHLW1TDnH9lNRV02cjyBuT/U3TBNf+AT5ktWMP
        q0K0rF+F7b9xOLGVL8Pty4PO9g==
X-Google-Smtp-Source: AGRyM1vUyYI89x6KhM9BfxnYOCsnYfp6d4jaPd18IXEKS6Ap6dTYvp3qlHHbxDjKTmb0zSmt5WDAMQ==
X-Received: by 2002:a2e:96c2:0:b0:25d:7b22:f2dc with SMTP id d2-20020a2e96c2000000b0025d7b22f2dcmr1112264ljj.297.1657619634971;
        Tue, 12 Jul 2022 02:53:54 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id z2-20020a19f702000000b004794a78bfe7sm2103304lfe.6.2022.07.12.02.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:53:54 -0700 (PDT)
Message-ID: <16107992-a69f-9856-aa36-8596c7cdd4ce@linaro.org>
Date:   Tue, 12 Jul 2022 11:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 04/15] dt-bindings: nvmem: Add fsl,scu-ocotp yaml file
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
        Shijie Qin <shijie.qin@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220707125022.1156498-1-viorel.suman@oss.nxp.com>
 <20220707125022.1156498-5-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707125022.1156498-5-viorel.suman@oss.nxp.com>
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

On 07/07/2022 14:50, Viorel Suman (OSS) wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'ocotp' child node of the SCU main node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
