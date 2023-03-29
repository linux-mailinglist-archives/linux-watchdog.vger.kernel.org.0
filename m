Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35E7B6CD4BC
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Mar 2023 10:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjC2Ifa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Mar 2023 04:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjC2If3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Mar 2023 04:35:29 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B65610F8
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Mar 2023 01:35:26 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id o20so12327358ljp.3
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Mar 2023 01:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680078924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8n6H02kYmd8gwvoaq31SqGY+BRAc0v4qQoRYdY6sZnE=;
        b=VPMdksRMaakDYMc+JCTrhyek8dDo2DhMdiPf1p7ECaK5PYJLpj69nRPbl/N40FJgvj
         ZX7zujtuLD4QePT3VEOQBMeQQOgJk2A9ZE403xwdFUVMKmVqwNx9Bw8fm1jEw2aal14g
         1AsfdXeO+rI2Vo0zEEpvwfP4910kbKIB/PKcIpGIp00CYFx8AAR7BIVsNwzxV64MwwrV
         n4KRtr1GpNtuae5LRWyxFnJqnvP65i1sjRO33jeLPOjzLTUsnZccT0wDU+MnWsrkrKgE
         ZWTafX9FCdZ7TJNyElwOxJpf6v8p/lV9IQHNa7b9mNwVnhH1dnrRqKq1yTvSZonV9ian
         pd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8n6H02kYmd8gwvoaq31SqGY+BRAc0v4qQoRYdY6sZnE=;
        b=LZk4w8D9yJhHuFGyHT0Qoh7YqShKjLLIsRWPIhWKF35JknVNdg4mVKtfvfbFKqUgea
         kgFmx4GKX8TxzSi8pWtjVJps1vm/Xu/gPqUMDlFbmFTAID2NFZ6RjIUbgAe+bjUygQaf
         dx5tgWitrxPBZUqp9ycxeouZq8+5grFrK9a31mJsDPJ38VaQH2ZxmdQ+dBkBfu158go9
         c45k2WSey8NsZEspwK7pfGFkPWQPzbUS717W0q75afrwuYuCKOg7m96xQanRtQCS41HY
         S15QUR6UflEwsOGaJiBgUDx0Pp6ZGg1q2+x3JeLHv6UpN3EQCna6BAIv/0Cfbdiq3uBv
         6Vbw==
X-Gm-Message-State: AAQBX9cPFygn9Bm9HgrEcGiXENO6wuqntREqEtiKlpWzFtCCPwdb3f60
        w3gjnpTstT3y0gYhoaUvUevW/Q==
X-Google-Smtp-Source: AKy350YTSR8X1/RiTJ1meCrfQSilvlZ5ZdA39iG6PqjvRZxaJwRfrUJGIdyjXbE9qVKd8aeYas4npg==
X-Received: by 2002:a2e:884b:0:b0:2a6:13c:30c8 with SMTP id z11-20020a2e884b000000b002a6013c30c8mr1972059ljj.33.1680078924640;
        Wed, 29 Mar 2023 01:35:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id l18-20020a2e9092000000b002986d9bdecesm5427078ljg.129.2023.03.29.01.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:35:24 -0700 (PDT)
Message-ID: <80e926e1-28aa-eb9b-9ab4-9bc3b349a5e4@linaro.org>
Date:   Wed, 29 Mar 2023 10:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: rockchip: Add
 rockchip,rk3588-wdt string
Content-Language: en-US
To:     Shreeya Patel <shreeya.patel@collabora.com>,
        wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jamie@jamieiles.com,
        heiko@sntech.de
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20230328210048.195124-1-shreeya.patel@collabora.com>
 <20230328210048.195124-3-shreeya.patel@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328210048.195124-3-shreeya.patel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28/03/2023 23:00, Shreeya Patel wrote:
> Add rockchip,rk3588-wdt compatible string.
> 
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

