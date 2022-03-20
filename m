Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2C84E1D83
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Mar 2022 20:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343573AbiCTTIQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 20 Mar 2022 15:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343575AbiCTTIQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 20 Mar 2022 15:08:16 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6263D197AE8;
        Sun, 20 Mar 2022 12:06:52 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id b189so10366965qkf.11;
        Sun, 20 Mar 2022 12:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lx1eZkma7iJzkfFGXDnVMbMm204ox+IUdPJ3sWGBz5k=;
        b=JuZJhy0bY2rv7u+h50iGIwlT0RzgOusNWcOcjUkumKAZB79gvWpGtzDPurqLbFNNhk
         98gowUefIlyiFUr5X8K1KrXcrR5FWlUWCAOwPtB/eyK9lalvk9aqSpXDTp5qj1zYa7ZE
         /aLyWyaUt1uJrWjN1K73tGjKMcmqJ6z6+IaHHmfejz9jckbUPaYu760UJxwhOToW4oKD
         b0u3ZeDjTDxjdLXH6M2nujQmmrmi8esv/YBiYUfqhXVcbPcCrhIuujgg+oj30cIUIlgQ
         30yXrpP0M2uruPQWcTTTbNls56wlO8zoVx5ZXBqV4gED7OmZMssma/5VqhviMyRiZPI6
         iP8Q==
X-Gm-Message-State: AOAM533gSEstGlVEaA85kVXFVNYxMA5mU76CNvlCpGF6uoSBOEf/xmK5
        xON9oBpktzOnjNURjchNp5ktDdl5og==
X-Google-Smtp-Source: ABdhPJzE8K1tfzEVyGgvcJEw/3JVMuvQuaGobkEXXxHttkinxifw7Ro8zMIelZkmYsuVP/hBKBZM8g==
X-Received: by 2002:a05:620a:1251:b0:67d:7739:7ff3 with SMTP id a17-20020a05620a125100b0067d77397ff3mr11034351qkl.199.1647803211441;
        Sun, 20 Mar 2022 12:06:51 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:c6d:21ec:c4f5:bb3:5269:3b0e])
        by smtp.gmail.com with ESMTPSA id o206-20020a37a5d7000000b0067d42fd49c3sm6868251qke.4.2022.03.20.12.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 12:06:49 -0700 (PDT)
Received: (nullmailer pid 3227299 invoked by uid 1000);
        Sun, 20 Mar 2022 19:06:46 -0000
Date:   Sun, 20 Mar 2022 15:06:46 -0400
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mesih Kilinc <mesihkilinc@gmail.com>,
        George Hilliard <thirtythreeforty@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        devicetree@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: watchdog: sunxi: fix F1C100s
 compatible
Message-ID: <Yjd7RkwFk4SbZds6@robh.at.kernel.org>
References: <20220317162349.739636-1-andre.przywara@arm.com>
 <20220317162349.739636-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317162349.739636-2-andre.przywara@arm.com>
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

On Thu, 17 Mar 2022 16:23:38 +0000, Andre Przywara wrote:
> The F1C100 series actually features a newer generation watchdog IP, so
> the compatible string was wrong.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
