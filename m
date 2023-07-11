Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D9574EA6E
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Jul 2023 11:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbjGKJ1Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 Jul 2023 05:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjGKJ04 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 Jul 2023 05:26:56 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2B426AA
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Jul 2023 02:24:08 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9939fbb7191so1091781066b.0
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Jul 2023 02:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689067447; x=1691659447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9riTVmn98ravk1kf9VetpeEIooDv8EP6TYpPc0Gyq/4=;
        b=ZcsYx2KMegNgL5H5mwoVc6+Eki+YDCems49LqDyCRR0tMyDBD1BPXMZUqw2Ymw9Wmo
         T+2Ejoe2hdztpcifiEODCvxQ09KJt5tiL/EZN6KQRG5duEAenUBsxDQ3ebGfu+X//7T5
         fBS+fx0Jc7hz4MHBZtk5cCOePyIXmzjNjQ2s8ue+8zCgODXo+8NbC4vN7imsk+1Yvxs4
         t50rVJyeKd7cZuTGlyHQOsQa5RljNAlPsWDuwH69aB2E5bA2mB4ohcdDCxtvWhj+9VmI
         JLVk6YbDWCyZF0u5GI7BL4csQ3R+TzI/lysj3H0VQjt9fx9ACPXsDR6on05dEJ9br0b7
         VrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689067447; x=1691659447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9riTVmn98ravk1kf9VetpeEIooDv8EP6TYpPc0Gyq/4=;
        b=c955kYVLOG9CGzbrFLInv9S3KsiqKk602rq/WFoW483fdb4V/PnNB+qesGOFPuMgX5
         AZ6J/yVTLCqApci9WrWfbJHVdB5Coj6VR2wNqkDUM+9m6MKc1furvv+e7qgzvaFt+dBB
         gr7Qwg6GoiIDeby7aJS3VWqcEzoQixFkro9D3iAZoSVYiXsid6ZSXDuc65HsGCqxDv8v
         /LpuZq5x8g8F3Nl45e76U9nGPpt2y62WY2pzhwAV6ysKhnmS3so1W2JbzWtxS8iOI1bK
         OIzJN/I/ctyYUomCCWtl2JLXKXkkIvrwYuxDYLvW8QOt+ob82Viku4/4dqI2LtBFbdF5
         HDCA==
X-Gm-Message-State: ABy/qLbm5fA3QLnQA5Et3XAzGDPAg3QWbwgXo0Xh1CvqrBqUPkFZxxLs
        TKBZOdq8/qILGgR+8HsozMVtCQ==
X-Google-Smtp-Source: APBJJlH5jtjZoXkkXP8uicWU3SQdnDzJsT/tWEkbXi9ejkkaQwBXJriutjz87Tps4ySHGtEHnSQt+g==
X-Received: by 2002:a17:907:1b89:b0:988:15f4:fdba with SMTP id mz9-20020a1709071b8900b0098815f4fdbamr19505435ejc.14.1689067446981;
        Tue, 11 Jul 2023 02:24:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id p27-20020a170906141b00b00977eec7b7e8sm905603ejc.68.2023.07.11.02.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 02:24:06 -0700 (PDT)
Message-ID: <7e1332bc-0757-bbe8-e087-7a0e52d6b97b@linaro.org>
Date:   Tue, 11 Jul 2023 11:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] arm64: dts: ti: Add reserved memory for watchdog
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
 <20230711091713.1113010-3-huaqian.li@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230711091713.1113010-3-huaqian.li@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/07/2023 11:17, huaqian.li@siemens.com wrote:
> From: Li Hua Qian <huaqian.li@siemens.com>
> 
> This patch adds a reserved memory for the TI AM65X platform watchdog to
> reserve the specific info, triggering the watchdog reset in last boot,
> to know if the board reboot is due to a watchdog reset.
> 
> Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
> index e26bd988e522..77380e52a334 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
> @@ -63,6 +63,12 @@ rtos_ipc_memory_region: ipc-memories@a2000000 {
>  			alignment = <0x1000>;
>  			no-map;
>  		};
> +
> +		/* To reserve the power-on(PON) reason for watchdog reset */
> +		wdt_reset_memory_region: wdt-memory@a2200000 {
> +			reg = <0x00 0xa2200000 0x00 0x00001000>;
> +			no-map;
> +		};
>  	};
>  
>  	leds {
> @@ -718,3 +724,8 @@ &mcu_r5fss0_core1 {
>  			<&mcu_r5fss0_core1_memory_region>;
>  	mboxes = <&mailbox0_cluster1>, <&mbox_mcu_r5fss0_core1>;
>  };
> +
> +&mcu_rti1 {
> +	reg = <0x0 0x40610000 0x0 0x100>,
> +	      <0x0 0xa2200000 0x0 0x1000>;

That's a total mess. reserved memory and IO address space. Nope.



Best regards,
Krzysztof

