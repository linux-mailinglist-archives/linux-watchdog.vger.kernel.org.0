Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75B956D505F
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Apr 2023 20:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbjDCSac (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Apr 2023 14:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbjDCSaa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Apr 2023 14:30:30 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DDC2D40
        for <linux-watchdog@vger.kernel.org>; Mon,  3 Apr 2023 11:30:21 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i5so121218443eda.0
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Apr 2023 11:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680546619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFB10rxKhuSnr8G+D45g+FQ9NDBsDveWCcMjexIqOoQ=;
        b=Kaj1AMXaoU7F3KH6UVSShPDhgf9THNic7EhcuaPT3ZujyG7EvehDV246LeYUnL+qyI
         K/7fFdKmOgWDQRLZaTrks3l102LTG8YX7JoP4WbXdsKtOe8UU5WF8dMMd1NqPPVEkmGq
         AljMz56PV392UV+a5X6G04dFDGi3uM8IHqJBePgHcF2RhwegwsCsT27MnRX1M1cjf0V2
         rsM0DepOIMYQsex3QUowLDxMiw/A4ys5s64mVZ97GFNBcorAZgOapKB/35pHkoGu8MNr
         9/dCmlATdw06rQ8Zpw8HSBp50prrAhM/Kus4E4KUKmghlC8tPbkg+TStMALQbPqbVovK
         ugxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680546619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFB10rxKhuSnr8G+D45g+FQ9NDBsDveWCcMjexIqOoQ=;
        b=UC0k7rkXQb+lNMDBSDoU2VIYwiW6swSSgIPFovkUhUxOdaVia0jXN+YIq0wcHaFhF3
         ohfeLwpFFFWNMp/Szix65sUqr3kqqPFC+XouwIj5NDUs9KTLFB4Zoo6Fs3dPaV1xlGfY
         cS4uzwYe7/epOhVxqeVw9arpfaqEXlzyBVJWO1yASTkMfOlOZfVObtcHrWRZouh5Zt58
         XXfSF84+ZWfU0mOCOLfP9e9toemVvNvcSgsNETS2waTiCtkRDSUx/Ywq9dKjhDuyyLfI
         Ff42d/nJkvBubZ/YBoEC4vFZ8tMo9lnlTXxgbyHZxYxjzOs3snzRyayAFwaJ0TGYLXEv
         8Rgg==
X-Gm-Message-State: AAQBX9fQxbQZ26p7UdC5fPO1T0EjwJufvwjG81xNAqw+ZP56HdpUXo9x
        aeJ8ewYarfHn7pVCYhIRLnZiKA==
X-Google-Smtp-Source: AKy350ZXjZbzVWh7Vb801ZxzHCIBWyoTyi83AEpPBnF/1+m2w/AJzS242zLY0pfrMJRViuKuzJD5uQ==
X-Received: by 2002:a17:907:8a8e:b0:944:49ee:aea2 with SMTP id sf14-20020a1709078a8e00b0094449eeaea2mr32280742ejc.71.1680546619534;
        Mon, 03 Apr 2023 11:30:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id z12-20020a1709064e0c00b00882f9130eafsm4783674eju.26.2023.04.03.11.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 11:30:19 -0700 (PDT)
Message-ID: <d9aade73-1bce-c2a3-f9da-883a5388527f@linaro.org>
Date:   Mon, 3 Apr 2023 20:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V3 1/4] MAINTAINERS: Add fragment for Xilinx watchdog
 driver
Content-Language: en-US
To:     Srinivas Neeli <srinivas.neeli@amd.com>,
        shubhrajyoti.datta@amd.com, michal.simek@amd.com,
        srinivas.goud@amd.com, wim@linux-watchdog.org, linux@roeck-us.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        git@amd.com, git@xilinx.com, neelisrinivas18@gmail.com
References: <20230331074117.356339-1-srinivas.neeli@amd.com>
 <20230331074117.356339-2-srinivas.neeli@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331074117.356339-2-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 31/03/2023 09:41, Srinivas Neeli wrote:
> Added entry for Xilinx xps-timebase watchdog driver.
> 
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> ---
> Changes in V3:
> -None
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d8287eb2ab4a..4ed139d56913 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23071,6 +23071,14 @@ F:	Documentation/devicetree/bindings/media/xilinx/
>  F:	drivers/media/platform/xilinx/
>  F:	include/uapi/linux/xilinx-v4l2-controls.h
>  
> +XILINX WATCHDOG DRIVER
> +M:	Srinivas Neeli <srinivas.neeli@amd.com>
> +R:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> +R:	Michal Simek <michal.simek@amd.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml
> +F:	drivers/watchdog/of_xilinx_wdt.c

Your patchset is not bisectable. These files do not exist.

Best regards,
Krzysztof

