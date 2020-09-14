Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E1D2691D6
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Sep 2020 18:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgINPOz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Sep 2020 11:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgINPOg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Sep 2020 11:14:36 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDDAC06174A;
        Mon, 14 Sep 2020 08:14:32 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id d189so191732oig.12;
        Mon, 14 Sep 2020 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qD8UOak9rcCgSS3n2z3fRwRhSVKqfGfQ7QFMsM1bLpY=;
        b=WHTD1OJHvqY/Mnvgbhb9QxzsATBhHEjkHOU7A4ZvjqJ1GJdJXPvGk41f3EdkMTqnEG
         Ro4mQJaqACiEbayqgnNIk+ju/FDcm54lN3Yqe1AkHZobEQvYYcXmP3RAc3J4lOMPctcw
         qQNN65Av0Mz7QxDLktRntYxpxoJwU4g2pytPnPFbpeutJUKkcDomt922X31R24HuFdhH
         4FgE1aT7czoeJhAuGMVyhKRQKJqNf1MYazndwA7WEkAtyUQuoU7fvkLqcd7EsU3zQARG
         FE6XfeIM4p+7VK5xDH+VMGZxIlnBSiB5Ddj8n3NbLNcP3Lu8VWXUUHSAaUjFYKy0GgRy
         2kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qD8UOak9rcCgSS3n2z3fRwRhSVKqfGfQ7QFMsM1bLpY=;
        b=C86ewxwyrmukuvyJ8QFK4Wm0i0W4W4nxCj4eNs3greSc1dxg5z5eHFJnlQAExitmiR
         X3h0CX90YOLGgwv9X256aGghl38pXen8sWIaFHrU3mVndL5kdQTHACcaIr8zXG7vfm8e
         t1ycDE1vTr23ct89LXFej0JWIOvfgHnDGU9PDzGTrCJW9CwlAxLux2nrjYBLCM8sl3zu
         xMLUHKSt5GiTmun46hF/LxxodjN42S+mLLectGjnbpt85DxdrmPdr8ukOIAYvDbdrqzp
         Y3YZxMauNuPw1cnOfxZyfkisVt4SziCmDEoMu2LsV0DPazen19hiYfuz4lUayyr7gTHx
         s3gw==
X-Gm-Message-State: AOAM533VyddbGeuzkobDK0Ul+4dAcuEg6jUeybZ/lperB1jC9IcpeNsQ
        YG6YzUkGQ2dRJCIgGyKMRHE=
X-Google-Smtp-Source: ABdhPJyu9UmM4FzHywSsK76o4er/josukRwvwNBlLN2jhwo+O1mjlNgZHu+kJIXr+z4owlFumgJpng==
X-Received: by 2002:aca:5b03:: with SMTP id p3mr8612480oib.41.1600096471724;
        Mon, 14 Sep 2020 08:14:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 126sm4287931oof.28.2020.09.14.08.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 08:14:31 -0700 (PDT)
Subject: Re: [v4,2/5] arm64: dts: mt8183: update watchdog device node
To:     Crystal Guo <crystal.guo@mediatek.com>, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
 <20200803071501.30634-3-crystal.guo@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <01ab02d8-0154-f151-42da-4b46d85b46ac@roeck-us.net>
Date:   Mon, 14 Sep 2020 08:14:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803071501.30634-3-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/3/20 12:14 AM, Crystal Guo wrote:
> The watchdog driver for MT8183 relies on DT data, so the fallback
> compatible MT6589 won't work, need to update watchdog device node
> to sync with watchdog dt-binding document.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 1e03c849dc5d..f8d835746ab8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -310,8 +310,7 @@
>  		};
>  
>  		watchdog: watchdog@10007000 {
> -			compatible = "mediatek,mt8183-wdt",
> -				     "mediatek,mt6589-wdt";
> +			compatible = "mediatek,mt8183-wdt";
>  			reg = <0 0x10007000 0 0x100>;
>  			#reset-cells = <1>;
>  		};
> 

