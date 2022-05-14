Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA54527171
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 May 2022 15:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbiENN5n (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 May 2022 09:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbiENN5m (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 May 2022 09:57:42 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A42E2603;
        Sat, 14 May 2022 06:57:41 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-ee1e7362caso13913405fac.10;
        Sat, 14 May 2022 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4Qm5cv18thUTYWWgXc1NDziQmWO3vUl0gRtWTsdHeOI=;
        b=aA50R7hnQ5ldr5jXvWGZrTFZHeN7m3xkZAJpAnsB0tlSqiW2eiM0R5t6m6jsfjuiX/
         6R9n+wBA2C3UZYeB9FseJywxyQkbY84LSwAlwrNwKtBsKS35X8wpvVNjZVLlLSWzM/93
         7+iL51YfWwtsX61MbxpT/FYxVixHciI4jL+fii0tJd6xUZ2Q9u9by+WQ2/aK4xV3ghQd
         7ABiN/DGvqcU+Jf/40TIqyAbB6i+Q9Ex32W6uyLk66JiiRvT01ghjeP6O5KkodqMVjCy
         42sc5SL907m1P46NlMUTN6cK1emNz9iDGJqysFsSywxwBxYouRTvaGOE/KqVlU7thb6M
         tqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4Qm5cv18thUTYWWgXc1NDziQmWO3vUl0gRtWTsdHeOI=;
        b=2Xk+Sf4Hy6xRtwtOHTGhAfSjr4Eoc3oEFZtKXlRe7UukB5nSn00FDswwmL7GawJCki
         iuM91husyZ2Mb0rsFKLPbAWUfypBR/hFzhXcNaTzfAEyl6NuYxfGavHKxC96Jz5uuXvp
         v9Ca9itWOKMVnlEyGrm/IDUDTmi6D9er4Jham7Ela+nxLoVwBVomsF0NzncXVtOHU1O1
         1ePCyfpvXMSVrPonbOoF5lpsvx7pRtCqQ4eiF+MKJNFfMDxr1iccq/75uJULk0LkNYof
         NtZXXPlk1lTlvFmlM5cz9pVwJOwR+4lHrRsGvhrlXyaDDQFBfv4wVSkvLB0FidXqZ1ui
         un9w==
X-Gm-Message-State: AOAM532nHPreeRuEQxS8zcqlE6fHu/pU7T6MNcZzfEvU0GHE6U0dDM+z
        AVWsWUkB4dQBdjkFlvlo4oY=
X-Google-Smtp-Source: ABdhPJzRwDB/Hzari+NfnE7XoUEGuEANA3lP+hVTx2+ZnyFc7KugMPfM+Uat3/j5uYflZxjFv+p27g==
X-Received: by 2002:a05:6870:d29e:b0:de:2438:7a04 with SMTP id d30-20020a056870d29e00b000de24387a04mr5075316oae.139.1652536660395;
        Sat, 14 May 2022 06:57:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d67-20020acab446000000b00325cda1ffbbsm2082245oif.58.2022.05.14.06.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 06:57:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 14 May 2022 06:57:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrej Picej <andrej.picej@norik.com>, upstream@phytec.de
Subject: Re: [PATCH 3/3] ARM: dts: imx6: phyFLEX: disable da9063 watchdog
 during suspend
Message-ID: <20220514135738.GA1243983@roeck-us.net>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
 <20220422072713.3172345-3-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422072713.3172345-3-primoz.fiser@norik.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 22, 2022 at 09:27:13AM +0200, Primoz Fiser wrote:
> If DA9063 PMIC is left enabled during suspend, PMIC's watchdog needs to
> be disabled before entering suspended state to allow board to sleep for
> longer period than the watchdog timeout period. Otherwise board will be
> reset by the watchdog. Thus disable watchdog on suspend and re-enable it
> upon resume.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
> index 1f2ba6f6254e..56b29c3294c6 100644
> --- a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
> @@ -212,6 +212,7 @@ da9063_rtc: rtc {
>  
>  		da9063_wdog: watchdog {
>  			compatible = "dlg,da9063-watchdog";
> +			dlg,use-sw-pm;
>  		};
>  
>  		onkey {
