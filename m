Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB3A4691E4C
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Feb 2023 12:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjBJLbt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Feb 2023 06:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbjBJLbo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Feb 2023 06:31:44 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9836CC65
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Feb 2023 03:31:43 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o36so3610419wms.1
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Feb 2023 03:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+fkGBGr95U+qrVIC9uAZjtOGVLAEHb6P+HpqT5os4ec=;
        b=C2Z685sdL3QNJbkbChCFUGy/wgUn4zWw3tnLrbJYbDypS0y0Q5iJORk1/IFHWd2mSZ
         4DPHq7DZHEjaL1m6gXsoZzuAnvkDFP+Gd2GjDavBFfePj41wU9WqMtRO6EqMyGtz/R+m
         dIS/qLWbY8EbVNeBPo/yoxuJl1psj629D4iT+1uV0bg0bwvLeWCz1nl1Voms9nEg+2Zw
         jGnYhk3GcxjX+R6jxy8W0lQCnpZzwsl8J+bxOZPyhi/2llo2AFk5JqS55/rwntHP3LdT
         9NZMN/lu6k+xsCGHQAFAtk+toem+1cdeX1RzjjUeemkZHinvtBtfQl+eAxNhM6Dv0d8V
         8njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fkGBGr95U+qrVIC9uAZjtOGVLAEHb6P+HpqT5os4ec=;
        b=KIBnO6MpLGk9s2H9bIZssgSZ0R992asLV4mfQ+Peo0GSU2McTqSgvx3/+7LAjpfreg
         t2jLrhl0dfDm9nEKtsnM0BxpYzQ95RzsyrHhf+v/iNsraGIII1F/HcRBtvwFUhYn/EFX
         J+MBz2eNVsheeZy9xX9f7YY7ux9ocnDg71htefM0X5VMFUfEROWmgig+t+IzO8AYdHhs
         JXfXntJl5O4Rf+h0qXJxF5JxKe26/4WhakNHeCmtckO4K/iGPHAOoU85qC7ti7qIwChc
         eLx9aahoOv3Vo7pAt9wUbpeQ9s+N2hd9WT1njDoSTm0glc2PWIEQW4GB9EM1eXUGB9N7
         xCew==
X-Gm-Message-State: AO0yUKU3zxeFgkjVG50GqQ80ZQ4ItVDyeZLNtapGPySPDiTgNuGMmo/z
        2mnSMyusS+qI0cKhNgRW+dtScw==
X-Google-Smtp-Source: AK7set8Ks+xOIu4NjxStV+AEAvbuyg368JTwQzaml5z21nUEgP5oAuUJDuSxL5cIEMWaihVm+0YOkQ==
X-Received: by 2002:a05:600c:45cf:b0:3df:9858:c03c with SMTP id s15-20020a05600c45cf00b003df9858c03cmr9537555wmo.17.1676028701638;
        Fri, 10 Feb 2023 03:31:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003dff870ce0esm8611529wmq.2.2023.02.10.03.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:31:41 -0800 (PST)
Message-ID: <cd94db40-32c1-6541-c1a7-bf937802e464@linaro.org>
Date:   Fri, 10 Feb 2023 12:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] mips: dts: ralink: mt7621: add phandle to system
 controller node for watchdog
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230210065621.598120-1-sergio.paracuellos@gmail.com>
 <20230210065621.598120-3-sergio.paracuellos@gmail.com>
 <23d2f23f-b063-c417-e85d-40f09b509d04@linaro.org>
 <CAMhs-H-rozEWNvRV0_CA1UeAZ9YJtg8PsHWjRnwBZp8ojqOcjQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H-rozEWNvRV0_CA1UeAZ9YJtg8PsHWjRnwBZp8ojqOcjQ@mail.gmail.com>
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

On 10/02/2023 12:29, Sergio Paracuellos wrote:
> Hi Krzysztof,
> 
> On Fri, Feb 10, 2023 at 12:00 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 10/02/2023 07:56, Sergio Paracuellos wrote:
>>> To allow to access system controller registers from watchdog driver code
>>> add a phandle in the watchdog 'wdt' node. This avoid using arch dependent
>>
>> ??? This does not make sense.
> 
> What do you mean? The commit message itself? I need the phandle to
> 'sysc' system controller node for accessing reset status registers
> inside the watchdog driver code.

The message makes sense. The message for the code does not make anymore.
I meant, you want to access system controller registers from watchdog,
so you add syscon to watchdog...

Best regards,
Krzysztof

