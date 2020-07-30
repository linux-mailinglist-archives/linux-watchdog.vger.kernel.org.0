Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97392330C4
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 13:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgG3LMD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 07:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgG3LMC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 07:12:02 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3F1C061794;
        Thu, 30 Jul 2020 04:12:01 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id k20so5804496wmi.5;
        Thu, 30 Jul 2020 04:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ypTDchxzwbMJAsETKZdjxAeDtU6POm0sHHrOZVadiRk=;
        b=Qqy5ZKoteb2C55iM5DEQ+Nap7nCqIRbSH5jXdUAXF2bih6o7RNFkKfeVb3qt0wugaZ
         p5EYYmvGMKKdXY9031NbpEB1xhBKQdJz2ip4i6BjFIaiCNl5ykCxTUi2MFEyCc5WrSSd
         yFFhbWwX7gSd8p1YhXL2iXKvAUe+eEt/cula8qsW1bxwGzchkQfgKv5kyPA74RuBQlZB
         IdHIwJJsWSAvP0SQ9ihzs7vjr3RLt699FQQRpylUuQLH01Iqlmaf0rWuLw7X2NqvgY1W
         rVnDDzPEbD2PyWalepqqWb6ywoiV3WszujdId2PnOg1lGR3HxKuHN6MuA4cY3hLt7l/H
         qn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ypTDchxzwbMJAsETKZdjxAeDtU6POm0sHHrOZVadiRk=;
        b=SNz57nBLiIzrqLa1naKn2eMgg/qRHrGdI5lhaUlkQvFybR0XAwGva7kkM6rPJtEKdQ
         h1ENYd1A/vLMxzKoT4wbryWyPquMOerpu+QSoKpotDsxyUojVxTwiiFyGYe2lohI4j5E
         lTufLAks9278WYAhVZmuQ1nRe/vpUYMHED9VK0FWcTToR4J2GALmWL+AtHu2oXHsep/5
         k6zHnw89bAMgPFYEFzo73kZQ2EWmTeSPQlHAAmOjdZpCv1I2rKUAv9oa0mMWAi7o/kkH
         0VAZt3gNI/YKoxn9LEL7D0yFqYSH7IgbHuv0Rx3g5a2yWzHrMejf0p3iX0aS2TI9+q+s
         Uuwg==
X-Gm-Message-State: AOAM5336PsgwvLtgySxrsPHWs8BkoRF0BJp1+RJ+KNAWFobBSs2DQ6Y1
        VLHqgFP4jPloGf+U/yRYtkY=
X-Google-Smtp-Source: ABdhPJwDv5C04Qwfcy3UO08Fd+s1PAlDltCqZnOGlIVFNo5Coe5SeW7/nBhVtBcWXjPT4cZaz39/Zw==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr12580815wml.35.1596107519556;
        Thu, 30 Jul 2020 04:11:59 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
        by smtp.gmail.com with ESMTPSA id p22sm7854592wmc.38.2020.07.30.04.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 04:11:58 -0700 (PDT)
Subject: Re: [v3,2/5] arm64: dts: mt8183: update watchdog device node
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
References: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
 <1596104510-11113-3-git-send-email-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ace85d53-28a3-a277-b390-bbda9c4c0738@gmail.com>
Date:   Thu, 30 Jul 2020 13:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596104510-11113-3-git-send-email-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 30/07/2020 12:21, Crystal Guo wrote:
> update watchdog device node for MT8183

Explain why you update it.

> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 1e03c84..f8d8357 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -310,8 +310,7 @@
>   		};
>   
>   		watchdog: watchdog@10007000 {
> -			compatible = "mediatek,mt8183-wdt",
> -				     "mediatek,mt6589-wdt";
> +			compatible = "mediatek,mt8183-wdt";
>   			reg = <0 0x10007000 0 0x100>;
>   			#reset-cells = <1>;
>   		};
> 
