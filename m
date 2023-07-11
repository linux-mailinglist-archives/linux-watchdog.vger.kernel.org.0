Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B4374EA66
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Jul 2023 11:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbjGKJ1M (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 Jul 2023 05:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbjGKJ0q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 Jul 2023 05:26:46 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1802127
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Jul 2023 02:23:44 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b70404a5a0so85445501fa.2
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Jul 2023 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689067423; x=1691659423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MkNJHgAPws0bFEItNw2cu5t/katEcSSsqCNfTNtIEE=;
        b=rPk689IpJEdRwo5vg0MKZiajwgZvIvybtvGwpxdIZ1GMD2GASawYoWQS6anf+n0Tqk
         srzTaR13yOzCtQbcTxp2uaQPaWIs7X2qfCxdmr+Kh5smHOOyzk7xPVf5q1X/M4E8lrvx
         EDi0foQ7jTixvvogj5K2e4Wm/Wa0Fjx2FcM+pmOtTVXS5QW4bSFB6UfPMgj7LY2U4Csg
         lMKoZD12MP28KkxzixXJjqrNC5CNJXjJO1lYxqMgbjs8Rm7azm0xTo15f3sGvYdM4qvG
         G8nAtTM33X5qmqDtwxCHMiKDIgd5bEy7JkhgIrp4y+m0a3vaqDPaPX0kgAOmhKHxYzgf
         x9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689067423; x=1691659423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MkNJHgAPws0bFEItNw2cu5t/katEcSSsqCNfTNtIEE=;
        b=A5XbTR0LrFrttRoAgsV26IY8AHPyqTgU/v2zFGZnsHLvJTpyHw+fAk+zpftrqQlKiP
         kM7DETCd564JILSqs8MlLTnaqfHk0wHAG6OSbwEFLL+IPw2AeD+wjiN5/DVlXvmQhwhi
         VY7PD+1K8cTJBvNGNkZHqKFoCBuOQ82KfbaYjGS6kW4Xa8Vy2+kIa08a9qAOmUUKTQwY
         H3OTbfCf595h/I/3A/af6GrHWRl5Fukc3MwdAu6UXMIDGKdmyHi13ZoTvhRlyiRlLjg7
         iItjTzhjTlcJGHer+xSLCaRJhRlLx+L94Qzmpa7oMIyqpSLo9Dlgh8MFGxYW09ueNh2C
         B63w==
X-Gm-Message-State: ABy/qLbhrr+Rx7fTJLtH1oTT5XFAAIB4Gu6zmDwEBuFAXbLQTAOQ7pFK
        Lpj32gH+k0xmju2FHfMZISEjkg==
X-Google-Smtp-Source: APBJJlEw0DUDhK6ZC4TBUn1VdXA3pu2AdrU9K8FfyIOILdrL8ywyOGztPZgY7gAvu3XjjDWhXjQaqQ==
X-Received: by 2002:a2e:8748:0:b0:2b6:c2e4:a57a with SMTP id q8-20020a2e8748000000b002b6c2e4a57amr14619059ljj.38.1689067422839;
        Tue, 11 Jul 2023 02:23:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id cw13-20020a170906c78d00b0098748422178sm898553ejb.56.2023.07.11.02.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 02:23:42 -0700 (PDT)
Message-ID: <8d52eaa7-0934-97fd-0288-9e8ed2f82bee@linaro.org>
Date:   Tue, 11 Jul 2023 11:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: ti,rti-wdt: Add support for
 WDIOF_CARDRESET
Content-Language: en-US
To:     huaqian.li@siemens.com, wim@linux-watchdog.org, linux@roeck-us.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     huaqianlee@gmail.com, nm@ti.com, vigneshr@ti.com,
        kristo@kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jan.kiszka@siemens.com,
        baocheng.su@siemens.com
References: <20230711091713.1113010-1-huaqian.li@siemens.com>
 <20230711091713.1113010-2-huaqian.li@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230711091713.1113010-2-huaqian.li@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/07/2023 11:17, huaqian.li@siemens.com wrote:
> From: Li Hua Qian <huaqian.li@siemens.com>
> 
> TI RTI (Real Time Interrupt) Watchdog doesn't support to record the
> watchdog cause. Add a reserved memory to know the last reboot was caused
> by the watchdog card. In the reserved memory, some specific info will be
> saved to indicate whether the watchdog reset was triggered in last
> boot.
> 
> Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
> ---

Missing changelog.

>  .../devicetree/bindings/watchdog/ti,rti-wdt.yaml    | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> index fc553211e42d..f227db08dc70 100644
> --- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> @@ -26,7 +26,18 @@ properties:
>        - ti,j7-rti-wdt
>  
>    reg:
> -    maxItems: 1
> +    maxItems: 2

The expected syntax is in such case:
  items:
    - description: ...
    - description: ...

You will find plenty of examples for this.

> +      description:
> +	- Contains the address and the size of MCU RTI register.
> +	- Contains the address and the size of reserved memory, which

I don't think Conor suggested using reg of the device, but reg of
reserved memory. This is not device address space, but just some random
memory.

memory-region seems proper to me. We were just discussing totally
useless new property of size.

What's more - you did not test it... so usual template:

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof

