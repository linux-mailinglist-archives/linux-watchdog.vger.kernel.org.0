Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E782272F97
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Sep 2020 18:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgIUQ60 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Sep 2020 12:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbgIUQ6F (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Sep 2020 12:58:05 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC77C061755;
        Mon, 21 Sep 2020 09:58:04 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id c18so13562507wrm.9;
        Mon, 21 Sep 2020 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pwode9WuxR0NQny1g826zVRL54o0hpVVy92ZYMK8Dvw=;
        b=sqePeyhlvkDMq0UuJOosFLcsXj2NVMi0T9t825erutMdwMYePO3YQMyHztvv+S1Srj
         wkVr70iSteaGLlw7mDX/twUNDKPIhbw6XBW+b/L69MDnrin/dhAuHT/Rg8LQtAaFkzxX
         mguMEZDzJz76tly4LqvPvL1IP6fvei34A+HDuK1yPzz27CUPqlGNpy3lCSVu3CK8s109
         4kUaP5QXR9KQjqDiMOFDdvkJzaC73W4TFufIUzh8+oazfB425amqUx1A8WrssgUqSaU7
         wjiGZJV2PPbGvfDsUPmtm1j7UTMzisPYeBx0pKeelDWfvwOdxPeo3wPQDyZZcLauACxm
         FswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pwode9WuxR0NQny1g826zVRL54o0hpVVy92ZYMK8Dvw=;
        b=KOLjeGCWvqtJoqXUG/qoCRpg/ojIoH301ExOEU5eA5CE8hCit9KGD6ijRj20lK4vlZ
         tEbM7gJXn7M31d+WYoMN4vR+aEa0sJQzy3AKeGlkIhJQ3l8EAJJLw1JTbs7aW4LuBZ9P
         KVC5+J+l5u9QNIhTwGylXs9L2CntZukZqUzt9E7iTolYiy9JqnDqNs4u2ubCyo0LLBX9
         JwK1dohGMoB5eQkfPT4XTnTYyDSnTPpJqb5lOc64F6welcrQ13FrYTPYx/8yBlP4BTTj
         8iuuFEWHXI4QYVNVq/sCKmc0caV5MZ7Z0z61fnNDVlPy7Faq1uOxgVwxYwX9gnqBlud8
         +v4w==
X-Gm-Message-State: AOAM5325RzhzPgCc1PbV/TlDpfbNq97IFZA+3Lw85it/zNlvy5rf8cPV
        g7LiEbwV7MXqcvDy1F3GYpI=
X-Google-Smtp-Source: ABdhPJysuN26CjjKmkh684/LBj0YsHAp2r5E1WyzP+CrVHERk8Z/A+gg8P+I+kN1vdh511YnZzgQeA==
X-Received: by 2002:a5d:6049:: with SMTP id j9mr684578wrt.295.1600707483654;
        Mon, 21 Sep 2020 09:58:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
        by smtp.gmail.com with ESMTPSA id h2sm22648597wrp.69.2020.09.21.09.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 09:58:02 -0700 (PDT)
Subject: Re: [v4,2/5] arm64: dts: mt8183: update watchdog device node
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
 <20200803071501.30634-3-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8df5726d-2be4-48b8-145e-67539f5a23f5@gmail.com>
Date:   Mon, 21 Sep 2020 18:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200803071501.30634-3-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 03/08/2020 09:14, Crystal Guo wrote:
> The watchdog driver for MT8183 relies on DT data, so the fallback
> compatible MT6589 won't work, need to update watchdog device node
> to sync with watchdog dt-binding document.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Applied to v5.9-next/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 1e03c849dc5d..f8d835746ab8 100644
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
