Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0F6280FD7
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Oct 2020 11:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgJBJ3D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Oct 2020 05:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgJBJ3D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Oct 2020 05:29:03 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3448BC0613D0;
        Fri,  2 Oct 2020 02:29:03 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o5so985627wrn.13;
        Fri, 02 Oct 2020 02:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gpPgURKkl9sngE8SAL1dImw4cT3GW8XwoppRxwXgCVE=;
        b=KmcthEJB3lQIF1fDM11/PN/eREoSJLIByB9r4WHtV00tw3hdxGknC5gCf+Ma4luzmH
         fq28mRe7UkOTSL10R27tHVWnIq1ImF2jIW2BhTT0r1csFqkKh9hohEJnhVzqFt/z/d6X
         PbtxKiMRYnkwUbSqKLNucZSgqrIAMHY+UgZT/bvtGuoZy7u+Q5pbAE6KTiz4jSO3kwSV
         8pTRe42xPz6EUKvYwO3rlry7i5uXkj9dUz4uiuDIlamcHN3HlRAh4QFHuaGwftnk3Lu8
         RRVWFyY5aeGkzZKY4aucDBQULQald04LlnZ+lOgoWESLinpoa5DmZDYA9Xvmf5Ref+kA
         +Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gpPgURKkl9sngE8SAL1dImw4cT3GW8XwoppRxwXgCVE=;
        b=EbIyT5tqi2V5VbqVlnSjdetUJIyfTUod/4gmIGLY8AYtXh9yaYYSSeLqGfNF/+jlGd
         a7l8A72vTvaUD7zFaY0rYSGoDSn5VF7w1YoBPlSgzF5XJiEuZXcqCqKUfTaePeIAqri1
         ZxnP0vS8oy8EDQ0rkN9wYbeG+3IFPwSeLQYgEA3idA4kQLRdn6sCRCMb30DCCgkurvE8
         8cE+wr2sBxe5/BwBfU4lS368ZozXhWyKI02wN+WDiisGjuof6IzNNlv+jYHzZlLGncOT
         8PhZDHfWmgpCiOm7DhvBCcOglizW1dqX9hN8kpSUmF9fhq8DBk/NB07UE3RYxtpBPglk
         X+Fw==
X-Gm-Message-State: AOAM5314nxYleB5pzShrb/ewB6KPW2GT5c+rxEsjjdyb1M027RC2OlNb
        RYYNIbS0L1D+xDsSXohK4lPRTczTNT1n7Q==
X-Google-Smtp-Source: ABdhPJygSCj+b9VSkRoorJhr1x1Mej4KEtMu4CCzpBb34Hasfx7Y1vL/rB63lJ+MhWIYgIxe2+wfKA==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr2050516wrn.2.1601630941865;
        Fri, 02 Oct 2020 02:29:01 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
        by smtp.gmail.com with ESMTPSA id b8sm1149218wmb.4.2020.10.02.02.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 02:29:00 -0700 (PDT)
Subject: Re: [v5,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
 <20200929032005.15169-3-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2199f623-ebfc-3585-2248-6698aef57d7b@gmail.com>
Date:   Fri, 2 Oct 2020 11:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929032005.15169-3-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 29/09/2020 05:20, Crystal Guo wrote:
> update mtk-wdt document for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

You added Guenters Reviewed-by in v4 of this series, but I don't see that on 
Guenter provided this tag. In the future please make sure that you don't add 
tags to your patches that were not provided. This creates great confusion.

Regards,
Matthias

> ---
>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 45eedc2c3141..e36ba60de829 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -12,6 +12,7 @@ Required properties:
>   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>   	"mediatek,mt8183-wdt": for MT8183
>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> +	"mediatek,mt8192-wdt": for MT8192
>   
>   - reg : Specifies base physical address and size of the registers.
>   
> 
