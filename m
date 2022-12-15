Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F6764E268
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Dec 2022 21:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiLOUh7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Dec 2022 15:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiLOUh5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Dec 2022 15:37:57 -0500
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1ABB2D1C4;
        Thu, 15 Dec 2022 12:37:56 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-12c8312131fso837008fac.4;
        Thu, 15 Dec 2022 12:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VicmIqQkTqk9tnf41gZXpWqNPl9J5eXILwLP5mFOrI=;
        b=KKKHBFHEGHXHjax7dWT2qbKFjbb6fasPiVS62UDr64m09x+OKoN7bEupDyVskyQmt8
         ke4zEHwthG3ULSONIdAaR36zVzJRXIgV2QzHepQ0OyZjqU7XsxSDIPGwM6jTxolJjxt+
         Weo844hYeCvPN7WxAvz4SXNgVyROjh9SBHNmHMbiglMCkfJuebZDnpKfmC2zLV/m+yo2
         ZtVsoq7brHxrjhCDwH/yA73sOMCIWkZzde+3FsWmR2hwOvbaQAKubc1XIz+CF1kMA55e
         T6kmrjN1drwGeA+ti843rbyBBBcPPdwyLWH/jBUWOVBCuzD6J7XlPE+upESVyasR02Py
         hG3w==
X-Gm-Message-State: ANoB5pm5TcxwdxodWx7YQJNdajWQGESQiunfWwwopOLXDdMz1g8I/v2v
        LMfQT8K3vVNAlnnhhYenBw==
X-Google-Smtp-Source: AA0mqf5IpTWAdKEoHWKqGB9hLSO62/SIL4hHR5w7O5AA3t56M5i0ppUD/4G/yKlU8E4+f1rA0fynFw==
X-Received: by 2002:a05:6871:a688:b0:144:e56a:1a3a with SMTP id wh8-20020a056871a68800b00144e56a1a3amr13779971oab.4.1671136676077;
        Thu, 15 Dec 2022 12:37:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cm35-20020a056870b62300b001375188dae9sm159389oab.16.2022.12.15.12.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 12:37:55 -0800 (PST)
Received: (nullmailer pid 669242 invoked by uid 1000);
        Thu, 15 Dec 2022 20:37:54 -0000
Date:   Thu, 15 Dec 2022 14:37:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3] dt-bindings: watchdog: gpio: Convert bindings to YAML
Message-ID: <167113639595.663197.15426353278060761950.robh@kernel.org>
References: <20221107160338.27910-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107160338.27910-1-marex@denx.de>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On Mon, 07 Nov 2022 17:03:38 +0100, Marek Vasut wrote:
> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Add missing required: properties
>     - Drop quotes around ref: referenced schema file name
> V3: - Add Guenter as maintainer of the bindings
>     - Add RB from Rob
> ---
>  .../devicetree/bindings/watchdog/gpio-wdt.txt | 28 -----------
>  .../bindings/watchdog/linux,wdt-gpio.yaml     | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> 

Looks like this was missed. Applied, thanks! You missed 
'always-running', so I added it from the other conversion that was 
done[1].

Rob

[1] https://lore.kernel.org/all/20221125112904.48652-1-robert.marko@sartura.hr/
