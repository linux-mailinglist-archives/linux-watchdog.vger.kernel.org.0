Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25D31D797D
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 May 2020 15:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgERNR5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 May 2020 09:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgERNR4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 May 2020 09:17:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF40C05BD0F
        for <linux-watchdog@vger.kernel.org>; Mon, 18 May 2020 06:17:56 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f18so9791002lja.13
        for <linux-watchdog@vger.kernel.org>; Mon, 18 May 2020 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aaWFz8XM3lber/1QtUDkEYgUS7TEOfr3vPPMOdwLrk4=;
        b=xj1It/WGw6ho2gXyehxm6yxVpJNgYenYhtlgl5YhWyN5asWO9hvDGHw8rwukxDXrfX
         dXgMMo0ZAZFQ8mEccZQHf50PdHilbq4KXfNFMbIfNosARIoOPCtmETgBepVHiDoNsjuH
         A83hapb8pSHGKAN1sMZb8UMxb3PPZOzXEJWGAalWbF/RLzFuG97AwGFScLZAvWV2/z3m
         E/Vn9Ns9itIfGBr03TxabMBQ53aGb1nWX+LDlRj2KXVhwV6AGa+r/FR+aKeEIn1RKWYn
         7KyBPmyJIMzxnGy/lCHE9zMxdtRAgWMjgnpmyJBjZvPKtk4iu86WCuyUFTFHGnO06xBX
         pVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aaWFz8XM3lber/1QtUDkEYgUS7TEOfr3vPPMOdwLrk4=;
        b=pD3hRfNEuD8Naoc5p0SBVqUZ3xhp58EVSNspzsKWjnXe58esTLLvvG/0sVev0MEuLF
         N9eWyzD+fNBTG5jkA0vD/r4uHr6x+3hgB/bIQ/TgVSCPtyMB8akYUttr5u8+x1Cv/ruC
         OAj/pfYTV7vnSKeViAjHrMt+pxMHS6SoEdzjn4QsnqmzCV8/1Sbtx0d6KvHcQpq6xBQP
         d9j9DAjEKL4TwfUeNlgZdi4c0VoqLJYsa87sHqk0S0nZt15DGKRXKOB120jML7/BKbjq
         m2IXqGpP/F62lvIccAq+CpkuUjdFGN/yKb6zmzAEAyL1313JFvaUHR5yrEl5A4ZAhMV8
         LmxA==
X-Gm-Message-State: AOAM5334zxS4/4/j5FgfSZV8RFU0It15ql8YgBI0qWyty+/l4P94kLvR
        q+bzi1d+XcwIILH/ytysy3MNh1FDgAQ=
X-Google-Smtp-Source: ABdhPJw19UGyEwWJ5Mq/Mme9WNx4l0h6pfEFIGaCERwgxusIQHdpFrVvwJLlfLQPp5MqmCtmQRT2Bg==
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr10501360lji.279.1589807874514;
        Mon, 18 May 2020 06:17:54 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:484c:c9e:1c14:285d:1715:e170? ([2a00:1fa0:484c:c9e:1c14:285d:1715:e170])
        by smtp.gmail.com with ESMTPSA id v10sm5486890lja.23.2020.05.18.06.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 06:17:52 -0700 (PDT)
Subject: Re: [PATCH 17/17] ARM: dts: r8a7742: Add RWDT node
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-ide@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>
References: <1589555337-5498-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1589555337-5498-18-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVV+2HsgmBytCOFg4pri4XinT_SPWT_Ac6n7FMZN3dR3w@mail.gmail.com>
 <CA+V-a8tmG1LKYqbc7feGZQO2Tj5RCpNUHi9e19vPr+bED0KOyQ@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9ab946d2-1076-ed92-0a48-9a95d798d291@cogentembedded.com>
Date:   Mon, 18 May 2020 16:17:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CA+V-a8tmG1LKYqbc7feGZQO2Tj5RCpNUHi9e19vPr+bED0KOyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello!

On 18.05.2020 15:27, Lad, Prabhakar wrote:

>>> Add a device node for the Watchdog Timer (RWDT) controller on the Renesas
>>> RZ/G1H (r8a7742) SoC.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>>
>> Thanks for your patch!
>>
>>> --- a/arch/arm/boot/dts/r8a7742.dtsi
>>> +++ b/arch/arm/boot/dts/r8a7742.dtsi
>>> @@ -201,6 +201,16 @@
>>>                  #size-cells = <2>;
>>>                  ranges;
>>>
>>> +               rwdt: watchdog@e6020000 {
>>> +                       compatible = "renesas,r8a7742-wdt",
>>> +                                    "renesas,rcar-gen2-wdt";
>>> +                       reg = <0 0xe6020000 0 0x0c>;
>>> +                       clocks = <&cpg CPG_MOD 402>;
>>> +                       power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
>>> +                       resets = <&cpg 402>;
>>> +                       status = "disabled";
>>
>> Missing "interrupts" property.
>>
> "interrupts" property isn't used by rwdt driver  and can be dropped
> from bindings file.

    DT describes the hardware, not its driver's abilities.

> Cheers,
> --Prabhakar

MBR, Sergei
