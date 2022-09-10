Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36E25B44EE
	for <lists+linux-watchdog@lfdr.de>; Sat, 10 Sep 2022 09:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiIJHqa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 10 Sep 2022 03:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiIJHq2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 10 Sep 2022 03:46:28 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D420726A2
        for <linux-watchdog@vger.kernel.org>; Sat, 10 Sep 2022 00:46:25 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bq23so6492560lfb.7
        for <linux-watchdog@vger.kernel.org>; Sat, 10 Sep 2022 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xc325GZc+vxzGRAdvA0vChIvJkypnglJvofgNCbWMR4=;
        b=CPmvcoQIYyMAF4zt3FXqNSoDD7DiPiOGlYdVcymhCh+IKdlIs7rTLSuAVlx/fnmLcu
         96NZnumm1CF84Z+2pYGPbjiWAkif5ly3iN0Kwrq0KeWNsLda90xz+GV8V1yK9ItJ4vG2
         B1EJuY2n5/0kLF9US3rV3/w1AZwY4XPQxshrXFoNm8pI/hSdNgeek9/L11NVXvSYTWgU
         2fK6mTHrRrlrabBghWT0dudUvkei0lR0po0ax3jU4MditiLLlY72FydbDtgkVbMNSil7
         27Nm3kr9NLe4oefhueLn2QCXYfMY0dphxyDHblNj7RHUwh5Jd3gLvlwaOrkHot8uTUZQ
         Yt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xc325GZc+vxzGRAdvA0vChIvJkypnglJvofgNCbWMR4=;
        b=SUBFSv8JqIW2pzK5meJOGNxSjm9BdE4pbVAILluDyNJ16xkWZutvVQe1N5hqziag9q
         Rj4QUtKjStPpCGVqO43+/VHlcH39urOKX64LUPZb4GRIU17+SU13Vrr1AogaT1HHmv9m
         mRUFJrzb/2KGB11pQf1HfBwPk33Azv4hHl+5NdjOHWYotfJY9JRkJmIbvt1Dpgoqk3ZX
         QJEbex0/8aCUNfS2kwBAS1BkuTVnHFBYIMfu/lG39FLy6lC2J75d4ON92FX6Ti5VFqDa
         N6+KBU9s91qQTehdEaI1rrsgHZeULNi1iwqZIgxTPJ/bIlIMGIVxe1P6JIq3+38zY3mZ
         cVsA==
X-Gm-Message-State: ACgBeo1Mr6wXhFXb/xnEQwgaSm+Dn4r3lQGoeXro8ndHiAvyMZfj74uL
        vLD9zzVAQ8Nq/z6R0rAjQwa+ZQ==
X-Google-Smtp-Source: AA6agR75ZEPrL/yKL8ezMsVKnuKBIXSz81lwLCFZHWoLKO6Bsf7yB53ADVYs4VBVxujyrIqJgj0K/g==
X-Received: by 2002:ac2:4f03:0:b0:496:272:625d with SMTP id k3-20020ac24f03000000b004960272625dmr5369172lfr.303.1662795983686;
        Sat, 10 Sep 2022 00:46:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h12-20020a05651c124c00b0026bda31c10fsm201998ljh.61.2022.09.10.00.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 00:46:23 -0700 (PDT)
Message-ID: <e8b33710-db07-bde4-e1d1-d42c05b87d6b@linaro.org>
Date:   Sat, 10 Sep 2022 09:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 11/11] dt-bindings: mtd: rockchip: add
 rockchip,rk3128-nfc
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com
Cc:     sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        gregkh@linuxfoundation.org, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        zhangqing@rock-chips.com, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <f09665c1-9938-38c1-9a31-f196a3ef9cf0@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f09665c1-9938-38c1-9a31-f196a3ef9cf0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/09/2022 00:01, Johan Jonker wrote:
> Add rockchip,rk3128-nfc compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
