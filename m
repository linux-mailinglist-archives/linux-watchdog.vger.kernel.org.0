Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F22A61A3BE
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Nov 2022 22:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiKDV5L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Nov 2022 17:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiKDV5I (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Nov 2022 17:57:08 -0400
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6278059FF9;
        Fri,  4 Nov 2022 14:57:07 -0700 (PDT)
Received: by mail-oo1-f53.google.com with SMTP id r10-20020a4aa2ca000000b0049dd7ad4128so851171ool.13;
        Fri, 04 Nov 2022 14:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvH9BG1oieugvWw1G/2KVt/OMXb9CCWNTOZdAeh+9lc=;
        b=aOrejdvanaZaALiKHY1yn90vqrCnLEB8lnfu6fJqSKGwDbJbsHwkZrLwzVvOJ8KHN0
         ZqBgDAMkNFWimu0uKr08qI26QVJRo85vMntPbISMg8XRrx+Dj94jsNyCWr0t+S0Dtits
         cW9OYbGJjzgaR9cwyoaXLAHEnQSQCdGYwcH+aGtE7FhhXBy/tXfuRZTp+5SWqgadQ3LA
         2d+uYDoLx2wx8xXQYxyKqPt3H7ZQh00kb5vw6pbaD2KG8aOWo7GeUDpcyJDO2Pn/5iBu
         1OX7kB8NE+7oJehRVBUJKLo6C+lLWCvAPHXsTAzge/Az96m9ElchrAEgWsZYGh+xUtp0
         hCng==
X-Gm-Message-State: ACrzQf0YZuM/QSCD3JVYRKWlqiDBDCqzaBr4kXy0GlISKtjlosFxsk2l
        myk65usS8+nux6eiu8euWAmHYj30Fg==
X-Google-Smtp-Source: AMsMyM6OdwFCpjt5I0WFH2zYyXUa0USLuHEna2OfccmS1kn6/ePIniK9MtLITJbmWCHmr4T4wCH5Gw==
X-Received: by 2002:a4a:e50e:0:b0:480:e33f:de43 with SMTP id r14-20020a4ae50e000000b00480e33fde43mr16085436oot.66.1667599026595;
        Fri, 04 Nov 2022 14:57:06 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h12-20020a9d61cc000000b00661a3f4113bsm196468otk.64.2022.11.04.14.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:57:06 -0700 (PDT)
Received: (nullmailer pid 2897106 invoked by uid 1000);
        Fri, 04 Nov 2022 21:57:08 -0000
Date:   Fri, 4 Nov 2022 16:57:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: gpio: Convert bindings to YAML
Message-ID: <166759902739.2897037.49149114982975908.robh@kernel.org>
References: <20221102220530.147997-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102220530.147997-1-marex@denx.de>
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


On Wed, 02 Nov 2022 23:05:30 +0100, Marek Vasut wrote:
> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Add missing required: properties
>     - Drop quotes around ref: referenced schema file name
> ---
> NOTE: The Maintainer entry should likely be changed, although it seems
>       like this driver and its matching bindings are now unmaintained.
> ---
>  .../devicetree/bindings/watchdog/gpio-wdt.txt | 28 -----------
>  .../bindings/watchdog/linux,wdt-gpio.yaml     | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
