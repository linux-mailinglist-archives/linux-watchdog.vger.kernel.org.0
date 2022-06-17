Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE45550037
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jun 2022 00:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349580AbiFQW4R (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jun 2022 18:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbiFQW4Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jun 2022 18:56:16 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F1953E0F;
        Fri, 17 Jun 2022 15:56:15 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id y79so5929705iof.2;
        Fri, 17 Jun 2022 15:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mPkJ5pCX4gO/JhkKRkEXqu/E189/n4trxcZatzVEu/A=;
        b=DzSFFx3dPVoE0zk/SLzJK206G6BRigKETHaNRjzljEGTA+luiHPjAc327CyNzpCsaQ
         X6Wcx7z9ELgno145MgR2IASAtx43V61UAv9viIhUupDiu3vYEdPE0ijCCa3p+1MINsoq
         2JFNZgIXehDbHrHLqNZwVCp6UvbrBaT8wC1CB2vZ20liM4Eh14SxdrX9jSAcxwkPVkNK
         n1LL9VwMT/8gP0W2BDZJO47qyHzj41yDCao5xr0fsP7ilJBFssQSyvoK2CxYBbGjK9KT
         dPkoYC8EtTA1RY+6Pm3C/AKWf+8gDTBM2PtlTeudHLUoxdyaGuoVEZCG3hIHNf19l4us
         gz+Q==
X-Gm-Message-State: AJIora+LnSYH5tLIziceSWxpmppTBAlTKkZS3h7iNu8ZqMJ+Gs+TB0c7
        w5+/nBnOp6K5/Q+gMBAL+A==
X-Google-Smtp-Source: AGRyM1uoGFPVR8miYCh3O2xSqC1jlbxlBs5ufE/ujmmgtE/pQivGqDWW0s3K4GDveEo7P60nhBSC2w==
X-Received: by 2002:a05:6602:2e8d:b0:64f:b683:c70d with SMTP id m13-20020a0566022e8d00b0064fb683c70dmr6123098iow.62.1655506575008;
        Fri, 17 Jun 2022 15:56:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id d3-20020a923603000000b002d6d8398e88sm2839069ila.70.2022.06.17.15.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 15:56:14 -0700 (PDT)
Received: (nullmailer pid 2591852 invoked by uid 1000);
        Fri, 17 Jun 2022 22:56:13 -0000
Date:   Fri, 17 Jun 2022 16:56:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
Message-ID: <20220617225613.GA2591769-robh@kernel.org>
References: <20220613150550.70334-1-phil.edworthy@renesas.com>
 <20220613150550.70334-2-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613150550.70334-2-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 13 Jun 2022 16:05:49 +0100, Phil Edworthy wrote:
> Add the documentation for the r9a09g011 SoC, but in doing so also
> reorganise the doc to make it easier to read.
> Additionally, make the binding require an interrupt to be specified.
> Whilst the driver does not need an interrupt, all of the SoCs that use
> this binding actually provide one.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  - Added minItems for interrupt-names and clock-names
> ---
>  .../bindings/watchdog/renesas,wdt.yaml        | 71 ++++++++++++-------
>  1 file changed, 47 insertions(+), 24 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
