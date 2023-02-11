Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0C39693070
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Feb 2023 12:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjBKLm2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Feb 2023 06:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKLm0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Feb 2023 06:42:26 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8EA30B30
        for <linux-watchdog@vger.kernel.org>; Sat, 11 Feb 2023 03:42:22 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id n13so5619128wmr.4
        for <linux-watchdog@vger.kernel.org>; Sat, 11 Feb 2023 03:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2x/LsCBmfGTIjbc1yOM0Xju00iFpGl/hJPZfcuAHtts=;
        b=GrAEVvFqCHgBuS9TvZVol5Kj5DeduLYlY656wDpAATtS8l8tauhecDcWOf5Ey7I8Y4
         rn16YhtrH60peTWay0sJtFWONIifKMhCl9TOMJcfoOspskDp5CkuaEP5eOnYDNZuHNU2
         dJWP7H5bJeTuP8A4vexsEP3maU/gxOApM2Mwoi1DTXqWLev8nIvkOQYtyd3eJl32th6G
         zVhegVSdNjuXz2jPw0sdu1tBI8Xy8WIPZtWwIhADkxVoPIg5mRtjWuBGH9Ij07w3F604
         s3FHwtReRIf3FOAHLFBBko4EUHY5JW1/MFYnSor/1ZCh/4o4yVIzHpKX11RS5kfkj00P
         Pfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2x/LsCBmfGTIjbc1yOM0Xju00iFpGl/hJPZfcuAHtts=;
        b=h/AW0gftydbXk5+7wLj3+/uDZuo99E7JSVB7PVr1b1n1jVKKR8UIZmrPEE/oudgpiL
         DWRpwD8NcP3uqyweEq/lASXuA/HR+babbMrF7vud5qiH+VHf5AZIwG4p7PPHHa4Lptly
         XhI9KvtR2O/EY2Z4LBLoVRm9MirV71hr49LKpBhlVicsgqY56pUK6zSdNqws3UDLDC9p
         SVkoY3EfuWyJU1fqGfJXsZHJxukcvjXRNsekCgXZMQ7fPgfC9fYmdTE3xvUl9zttZitA
         KKEKLja7MMhWANcmsl8rF7Xmy6Dz+09dQrU1vCjcRPyuM2oLQXhPwlg5PJq4u5yF6OKw
         oz2A==
X-Gm-Message-State: AO0yUKVEor7u4bzak3dO3Ivqb0VcY79kX6Ch5EjG4+8WCnMst+9s0LGL
        ucVb2mbHx/9AY+Pi7ZbQr20gwg==
X-Google-Smtp-Source: AK7set/gI4wuceoQETSMpL/c/K84URPdsZxk4ck7FUVh3KRDpb2vrcitaud7hltK9fJRLuvHOYKDlw==
X-Received: by 2002:a05:600c:43d2:b0:3df:eedf:df32 with SMTP id f18-20020a05600c43d200b003dfeedfdf32mr16642733wmn.17.1676115741393;
        Sat, 11 Feb 2023 03:42:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q28-20020a05600c331c00b003de2fc8214esm7468458wmp.20.2023.02.11.03.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 03:42:21 -0800 (PST)
Message-ID: <65dc9dfc-8f0b-9c5d-8f02-2d23c4486efe@linaro.org>
Date:   Sat, 11 Feb 2023 12:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/5] dt-bindings: watchdog: mt7621-wdt: add phandle to
 access system controller registers
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230211073357.755893-1-sergio.paracuellos@gmail.com>
 <20230211073357.755893-2-sergio.paracuellos@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211073357.755893-2-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/02/2023 08:33, Sergio Paracuellos wrote:
> MT7621 SoC provides a system controller node for accessing to some registers.
> Add a phandle in this node to avoid using MIPS related arch operations and
> includes in watchdog driver code.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

