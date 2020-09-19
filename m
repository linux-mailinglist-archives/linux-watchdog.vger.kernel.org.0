Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A3F270D89
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Sep 2020 13:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgISLOG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 19 Sep 2020 07:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgISLN7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 19 Sep 2020 07:13:59 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB40C0613D6
        for <linux-watchdog@vger.kernel.org>; Sat, 19 Sep 2020 04:13:59 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e17so7614620wme.0
        for <linux-watchdog@vger.kernel.org>; Sat, 19 Sep 2020 04:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rdXsTgoGM0w1H/nnYlMehpdLdQB8fsaLuG+w+yCrM5Y=;
        b=oE1Ira58YScVwaWdnk8LgV/cmqXxiHNeIxxJxGh/47M2R9d91zsr8xnnO10hEg/rbV
         X/OkZoB+Ec6C3icy0bbdRVni1Zi24/ZEAoEejz/V2DtZpk5RIl2uqXZF0EuIc4ajTRTP
         stmClxW2sPQNFUxn8a5St2F18T9mfjkN/O0VMqoyDWgBFiz8MYdKiwWCffRt+7eYZW82
         KKQ60NKca7pjSMx9p9P1MNuJL8b2UE43042p8VdL1ET41Ho6kJPh0Ed3BIQB00lJ3DPD
         nMjGLYrTrM4RwItA7Kt243vXvwpkpoPOVcT/SuQ9cdFU5y0yWLxrjspRqE/v4y2onTNm
         RGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rdXsTgoGM0w1H/nnYlMehpdLdQB8fsaLuG+w+yCrM5Y=;
        b=YHKkwYK6oeCOMmlpliG4pj/dt+L5adhOoU93DZCt3QI83KwZNvBvP3W3CtL/a6A/YL
         qaw6Ijp9I4w7WW0l+jeM5tMWo9l0t2jeR0VFz8Iq46aMomsJ2qgoRWru0CpCvwQH7UyK
         1oLcMNF9pmoGD0tTgFffG4mgEkoxmRBx0aRaQB/AmCnKBZRAu9feWOf4R1zBsDHX9K28
         B7QO2Zkoyu0UhNAnyT56aPZNf8BHkQxCvW2gIfnZwzOl9X51xiSZKnAd6U7VF765CVfX
         kSKn4CdVL9cAMrEmI7OlYqoXSRLFDqNwLfG8gu3FgQOmJL6/ww2zjrJIzzN8FIFr8PzQ
         XsmQ==
X-Gm-Message-State: AOAM532lnDmSQXp25GMKGrlVlImlktyrZ2E7sCd1W0MWW+qhMDdeKPVG
        8stKt3oWw3Dh9jRKA4S1Oypl+/lyZXtdCA==
X-Google-Smtp-Source: ABdhPJxtvQBqLG15ElhXHTv/DA5n/A5hXVODsh0bX2dk1jWFMP3l4fnu0fcw+jZBZHKHnGGxUTbOHg==
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr19727844wmi.135.1600514037438;
        Sat, 19 Sep 2020 04:13:57 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9142:20e7:201d:cd11? ([2a01:e34:ed2f:f020:9142:20e7:201d:cd11])
        by smtp.googlemail.com with ESMTPSA id o129sm10277063wmb.27.2020.09.19.04.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2020 04:13:56 -0700 (PDT)
Subject: Re: [PATCH 05/20] dt-bindings: timer: renesas,cmt: Document r8a774e1
 CMT support
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-can@vger.kernel.org,
        netdev <netdev@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>
References: <1594811350-14066-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594811350-14066-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8sBF2ak+dYd9g=Tf_2Kwz_Om2mpK=z+KzGQQG4qJM-+zA@mail.gmail.com>
 <CA+V-a8tcuxiDBZ0WYgrMrPjnse7On1LWiJngznZMiSOQAqT9Ag@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <bce1bbc3-203c-aa9e-6c40-5a1eb82510e3@linaro.org>
Date:   Sat, 19 Sep 2020 13:13:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+V-a8tcuxiDBZ0WYgrMrPjnse7On1LWiJngznZMiSOQAqT9Ag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 19/09/2020 13:00, Lad, Prabhakar wrote:
> Hi Daniel and Thomas,
> 
> On Thu, Aug 27, 2020 at 6:00 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>>
>> Hi Daniel and Thomas,
>>
>> On Wed, Jul 15, 2020 at 12:09 PM Lad Prabhakar
>> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>>>
>>> Document SoC specific bindings for RZ/G2H (r8a774e1) SoC.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>>  Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>> Gentle ping.
>>
> Could you please pick this patch.

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
